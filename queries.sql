SELECT * FROM sachin_tendulkar.scores;

-- 1) Write a query to display a summary of Sachin Tendulkar’s ODI career, including various batting statistics such as Matches, Innings, Runs, Balls Faced, Not Outs, Highest Score, Average, Strike Rate, Hundreds, and Fifties.
SELECT 'Batting Statistic','Value'
UNION 
SELECT 'Total Matches',COUNT(Match_No) FROM Scores
UNION 
SELECT 'Total Innings',COUNT(Innings) FROM Scores 
UNION 
SELECT 'Total Runs',SUM(Runs) FROM Scores 
UNION 
SELECT 'Total Ball Faced',SUM(Balls_faced) FROM Scores 
UNION 
SELECT "Not Out's",COUNT(mode_of_dismissal) FROM Scores 
WHERE mode_of_dismissal='not out'or mode_of_dismissal='retired hurt'
UNION 
SELECT 'Highest Score',MAX(Runs) FROM Scores 
UNION 
SELECT 'Average',(SELECT ROUND((total_runs/(no_of_dismissal)), 2) AS Average
FROM (SELECT
(SELECT SUM(runs) FROM scores) AS total_runs,
(SELECT COUNT(*) FROM scores 
WHERE mode_of_dismissal Not IN ('not out','retired hurt')) AS no_of_dismissal
) AS subquery) from Scores
UNION 
SELECT 'Strike Rate',ROUND((SUM(Runs)/SUM(Balls_faced))*100,2) FROM Scores 
UNION 
SELECT "Total Hundered's",COUNT(Runs) FROM Scores 
WHERE Runs BETWEEN 100 AND 199 
UNION 
SELECT "Total Fifty's",COUNT(Runs) FROM Scores 
WHERE Runs BETWEEN 50 AND 99 ;

-- 2) Find the number of centuries and half-centuries scored by Sachin Tendulkar each year since his debut.
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(match_date, ' ', 1), '-', -1) AS 'YearWise',
SUM(CASE WHEN Runs BETWEEN 100 AND 199 THEN 1 ELSE 0 END ) AS 'Centuries',
SUM(CASE WHEN Runs BETWEEN 50 AND 99 THEN 1 ELSE 0 END) AS 'Half Centuries'
FROM Scores 
GROUP BY SUBSTRING_INDEX(SUBSTRING_INDEX(match_date,' ',1),'-',-1);

-- 3) Find the number of innings, total runs scored and average against each team Sachin Tendulkar played. Return result in ascending order of teams.
SELECT Versus,COUNT(Innings) AS 'Total Innings', SUM(Runs) AS 'Runs Scored', AVG(Runs) AS 'Avg Runs'
FROM Scores  
GROUP BY Versus
ORDER BY Versus;

-- 4) Write a query to display Sachin milestone matches ie matches in which Sachin completed 1000, 5000 and 10000 runs. Display the milestone number, milestone runs, the innings and the match_no in which the milestone was achieved.
WITH CTE AS (
SELECT Match_No,Innings,Runs,
SUM(Runs) OVER(ORDER BY Match_No ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Rolling_Sum'
FROM Scores),
CTE2 AS (
SELECT 1 AS 'Milestone_Number',1000 AS 'Milestone_Runs'
UNION ALL
SELECT 2 AS 'Milestone_Number',5000 AS 'Milestone_Runs'
UNION ALL
SELECT 3 AS 'Milestone_Number',10000 AS 'Milestone_Runs'
)
SELECT Milestone_Number,Milestone_Runs,MIN(Match_No) AS 'Matches', MIN(Innings) AS 'Innings' FROM CTE2 
INNER JOIN CTE
ON Rolling_Sum>Milestone_Runs
GROUP BY Milestone_Number,Milestone_Runs
ORDER BY Milestone_Number;

-- 5) Sachin Tendulkar holds the record for being in the nineties (90s) the most number of times. Determine the instances when Sachin Tendulkar was dismissed in his 90s, the number of times he remained not out, and the total number of times he scored in the 90s throughout his entire ODI career.

SELECT 
SUM(CASE WHEN (Runs BETWEEN 90 AND 99) AND (mode_of_dismissal='not out') THEN 1 ELSE 0 END) AS 'Remained Not Out',
SUM(CASE WHEN (Runs BETWEEN 90 AND 99) AND (mode_of_dismissal<>'not out') THEN 1 ELSE 0 END) AS 'Out in 90s',
SUM(CASE WHEN Runs BETWEEN 90 AND 99 THEN 1 ELSE 0 END) AS "90's Scores"
FROM Scores ;

-- 6) Determine the longest streak of consecutive innings in which Sachin Tendulkar scored 50 or more.
WITH CTE AS (SELECT Innings,Runs,
Innings-LAG(Innings,1,NULL) OVER(ORDER BY Innings) AS Diff FROM Scores 
WHERE Runs>=50),
CTE2 AS 
(SELECT *,
ROW_NUMBER() OVER(ORDER BY Innings),
ROW_NUMBER() OVER(PARTITION BY Diff ORDER BY Innings),
ROW_NUMBER() OVER(ORDER BY Innings)-ROW_NUMBER() OVER(PARTITION BY Diff ORDER BY Innings) AS 'Diff2'
FROM CTE)
SELECT MAX(Cnt)+1 AS 'Longest Streak' FROM 
(SELECT Diff2,COUNT(*) Cnt FROM CTE2 GROUP BY Diff2) Subquery ;















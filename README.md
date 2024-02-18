# SQL-Case-Study-On-Sachin-Tendulkar-s-ODI-Brilliance

Welcome to the SQL Case Study on Sachin Tendulkar’s ODI Brilliance repository! Delve into captivating insights from Sachin's legendary ODI career through SQL queries. 🏏📊

In the annals of cricket history, few names resonate with as much reverence as Sachin Tendulkar. Often hailed as the “God of Cricket,” Tendulkar’s monumental impact on the game is immortalized through his extraordinary records and unparalleled achievements. One facet of his illustrious career that stands as a testament to his cricketing genius is his performance in One Day Internationals (ODIs). From his debut in 1989 to his retirement in 2012, Tendulkar’s ODI journey spans over two decades, encapsulating an era of cricket marked by his unwavering dedication, remarkable consistency, and a thirst for records that seemed insatiable.

## Introduction 🏏

As we embark on a deep dive into Sachin Tendulkar’s ODI statistics, this case study explores the intricacies of his cricketing prowess using the lens of SQL (Structured Query Language). SQL, a powerful language for managing and manipulating relational databases, provides us with a unique toolset to unravel the nuances of Tendulkar’s performance. Through SQL queries and analysis, we aim to uncover patterns, milestones, and statistical insights that illuminate the unparalleled career of one of cricket’s greatest icons.

## Dataset Link 📊
[Dataset Link](https://docs.google.com/spreadsheets/d/1clhicKPjO08K1uRgwWvsAbDaGn8JaZl9xqtWmBc6hTE/edit?usp=sharing)

The dataset includes only a single table. The name of the table is `Scores` and it has the following attributes:

- `Match_No`: Integer Primary Key
- `Innings`: Integer
- `Match_Date`: Date
- `Versus`: Text
- `Mode_Of_Dismissal`: Text
- `Runs`: Integer
- `Balls_Faced`: Integer

The table documents Sachin Tendulkar’s One Day International (ODI) cricket career, encompassing crucial information for each match he participated in. The columns include `Match_No`, signifying the match sequence; `Innings`, indicating the specific inning played by Tendulkar; `Match_Date`, providing the date of the match; `Versus`, specifying the opposing team; `Mode_Of_Dismissal`, detailing how he was dismissed; `Runs`, enumerating the runs scored by Tendulkar in that particular match; and `Balls_Faced`, revealing the number of deliveries he faced. This comprehensive dataset offers a comprehensive overview of Tendulkar’s ODI performances, facilitating analysis and insights into his cricketing achievements.

Before attempting the questions, feel free to engage in exploratory data analysis on the dataset to enhance your understanding of the data.

## Basic Cricketing Terms 🏏
- **Innings**: In cricket, an ‘innings’ denotes the instance in which a team or batsman participates in batting. The distinction between ‘Match_No’ and ‘Innings’ lies in their sequential progression. While ‘Match_No’ increases consistently with each match a batsman plays, ‘Innings’ only increments when the batsman actively participates in batting during that match. Therefore, if a batsman is part of a match but doesn’t get the opportunity to bat, the ‘Match_No’ increases, but the ‘Innings’ value remains constant for that specific match.
- **Average**: The batting average in cricket is defined as the total runs scored divided by the total number of dismissals. For example: A Batsman scores 400 runs in 10 innings and is dismissed 8 times, his average will be 400/8 = 50 runs.
- **Strike Rate**: The strike rate in batting is a measure of a batsman’s scoring ability and is expressed as the number of runs scored per 100 balls faced.
- **Hundreds**: A batsman is considered to have achieved a century or hundred when he scores 100 or more runs.
- **Fifties**: A batsman is considered to have achieved a half-century or fifty when scoring between 50 and 99 runs. Please note that if a batsman scores a half-century and then converts it into a century, it won’t be counted as a separate half-century.

Note: Knowledge of window functions, with clause (CTE), subqueries, and union is recommended before attempting the below questions. While not mandatory, possessing some basic cricketing knowledge can be beneficial for attempting these questions.

# ApexFit-Marketing-SQL-Warehouse

This is a SQL project I built to track ads and sales for a fitness brand. I built this to solve a common business problem: identifying which marketing dollars are making money and which are being wasted on "low-quality" traffic.

How it works
I split the data into 5 tables:

* Advertisers: The companies paying for the ads.

* Campaigns: The big marketing goals (like a "New Year Sale").

* Ads: The specific pictures or text people see.

* Keywords: What people searched for to find the ads.

* Performance: The actual results (clicks, spend, and sales).

**What the code finds**
I wrote queries to find out which ads are actually making money. If an ad spends a lot but gets zero sales, my code flags it as a "Kill Phase" so the company knows to stop wasting money on it.

**How to use these files**
You should run the files in this order:

* 01_setup.sql – This creates the empty tables and the "skeleton" of the project.

* 02_data.sql – This adds 10 rows of sample gym data so the tables aren't empty.

* 03_queries.sql – This runs the reports to find the best ads and the total sales.

The Database Layout
I also made a diagram (the ER Diagram) to show how all the tables connect. You can see it in the files above.

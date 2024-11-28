Operational Databases:
- Excellent for operations as they have no redundancy and high integrity.

<br/>

Same data sources for operational & analytical processes?
- it will work, but it will be very slow for analytics because of the too many joins and to complex schema duo to normalization.

<br/>

A solution is to create two processing modes
- OLTP: online transactional processing for the operational part
- OLAP: online analytical processing for the analytical part

<br/>

Data Warehouse is a system including processes, technologies and data representation that enables us to support analytical processes.

<br/>

## Data Warehouse:
- Definition 1 -> a copy of transaction data specifically structured for query and analysis.
- Definition 2 -> a subject-orientated, integrated, nonvolatile and time variant collection of data in support of management decisions.
- Definition 3 -> a system that retrieves and consolidate data periodically from the source system into a dimensional or normalized data store (ETL), it usually keeps years of history and is queried for business inelegance or other analytical activities. It is typically updated in batches, not every time a transaction happens in the source system.

<br/>

The flow:
![](images/etl.png)

![](images/dim.png)
The technologies used in the source databases and in the dimensional model in the dwh are different, because one is optimized for inserting and one for read.

<br/>

![](images/report.png)

<br/>

DWH Goals:
- Simple to understand
- Performant
- Quality Assured 
- Handles new Questions well
- Secure

<br/>
<br/>

### Dimensional Modeling Goals
- Easy to understand 
- Fast analytical query performance

-> Star schema: joins with dimensions only, good for OLAP not OLTP
-> 3NF schema: lots of expensive joins, hard to explain to businesses users.

<br/>

### Facts and Dimensions
Facts tables:
- record business events, like an order, a phone call, a book review
- fact tales columns record events recorded in quantifiable metrics like quantity of an item, duration of a call, a book rating.

<br/>

- Facts are usually numeric and additive.
- a comment on an article represents an event, but it's not a good fact
- invoice number is numeric but adding it doesn't make scene, not a good fact
- total amount of an invoice could e added to compute total sales, a good fact

<br/>

Dimension tables:
- record the context of a business event, (who, what, where, why, ....)
- Dimension tables columns contain attributes like the store at wish an item was purchased, or the customer who made the call.

<br/>

- Date and Time are always a dims
- Physical locations and their attributes are good dims
- Human roles like customer and staff are good dims

<br/>

![](images/3nf2star.png)
We go from 3NF to Star with ETL
- query the 3NF DB (Extract)
- join tables together (Transform)
- change types (Transform)
- add new columns (Transform)
- inserting into facts and dimension tables (Load)
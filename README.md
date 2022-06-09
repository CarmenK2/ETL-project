# ETL-Project: Extract, Tranform, Load - A Tale of a Vineyard
This repository explores the concept of ETL's - Extract, Tranform, Load - by creating a database accessable through (SQL/Postgres?) to assess which locations in Western Australia are ideal to establish a vineyard. 

## Team Members:
* Michael Bett
* Carmen Sin
* Josh Thomas
* Aline Hornoff

## The Project
A good glass of wine to wind down after a day hectic and stress or celebrate a great achievment is a special treat. But where is the ideal location to turn a simple fruit like a grape into a glass of joy to celebrate a special occasion.

Making wine is a long, slow process. It can take a full three years to get from the initial planting of a brand-new grapevine through the first harvest, and the first vintage might not be bottled for another two years after that. Longterm investment is required and it is therefore vital to pick the right location to establish a vineyard.

The database created will give an insight into what locations are ideal for a particular variety based on weather conditions, soil constitution and grape varietel.

## Extract
... Why did we choose these data Sources

### Data Sources:
1. https://www.kaggle.com: WineData.csv 
2. Google API to determine lat and long for winery locations
3. Department Primary Industries and Regional Development WA: https://www.agric.wa.gov.au/soil-api-10 
4. Bureau of Meteorology: http://www.bom.gov.au/


### Steps:
#### Step 1 - Extract WineData.csv
* Reading in WineData.csv and display data

#### Step 2 - Extract winery latitudes and longitudes utilising Google API
* Read in Google API and build target url

### Challenges
* 
* 

## Transform
... why did we transform the data in this way

### Steps:
#### Step 1 - Transform WineData.csv
* Create new dataframe with the following columns: country, price, points, province, region_1, title, winery, variety
* Rename column headers
* Filter dataframe for 'Western Australia'
* Inspect dataframe for unique values
* Reset index for each of the wineries
* Drop column 'index'
* Find unique values for wineries
* Create a list of unique wineries to use for Google API to find location of wineries

#### Step 2 - Find winery latitudes and longitudes utilising Google API
* 
* Create a loop to extract latitude and longitude for each unique winerey

#### Step 3 - Find winery latitudes and longitudes utilising Google API

### Challenges
* 
* 

## Load
... why did we choose this method 

### Steps:
* 
* 
* 

### Challenges
* 
* 

** Insert schemata

## Summary
What can the database be used for? Is the database relational/non-relational? Why?



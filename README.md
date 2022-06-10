# ETL-Project: Extract, Tranform, Load - A Tale of a Vineyard
This repository explores the concept of ETL's - Extract, Tranform, Load - by creating a database accessabled through SQL/Postgres to assess which locations in Western Australia are ideal to establish a vineyard. 

## Team Members:
* Michael Bett
* Carmen Sin
* Josh Thomas
* Aline Hornoff

## The Project
A good glass of wine to wind down after a day hectic and stress or celebrate a great achievment is a special treat. But where is the ideal location to turn a simple fruit like a grape into a glass of joy to celebrate a special occasion.

Making wine is a long, slow process. It can take a full three years to get from the initial planting of a brand-new grapevine through the first harvest, and the first vintage might not be bottled for another two years after that. Longterm investment is required and it is therefore vital to pick the right location to establish a vineyard.

The database created will give an insight into what locations are ideal for a particular variety based on weather conditions, soil constitution, grape variety, prodcution yield and sales.


## Extract
Kaggle WineData.csv was choosen as it a comprehensive overview over the Western Australian Wine Region including winery names, price point and tasting scores. Google API's was choosen to match winery names to geographical location. The website of the Department Primary Industries and Regional Development WA was choosen as their soil API provides a comprehensive data set of soil conditions which can be linked to geographical location of the wineries using latitude and longitude of the wineries. The website of the Bureau of Meteorology was choosen for its extensive CSV data on historical weather recordings reaching back to the early 20th century. The Wine Australia website provided detailed CSV data on Western Australian wine region production and sales between 2015 and 2021 and was therefore ideal as data source.

### Data Sources:
1. https://www.kaggle.com: WineData.csv 
2. Google API to determine lat and long for winery locations
3. Department Primary Industries and Regional Development WA: https://www.agric.wa.gov.au/soil-api-10 
4. Bureau of Meteorology: https://www.bom.gov.au/
5. Wine Australia: https://wineaustralia.com

### Steps:
#### Step 1 - Extract WineData.csv
* Reading in WineData.csv and display data

#### Step 2 - Extract winery latitudes and longitudes utilising Google API
* Read in Google API and build target url

#### Step 3 - Extract soil data
* Read in Soil API and build target url

#### Step 4 - Extract weather data
* Reading in weather.csv and display data

#### Step 5 - Extract wine production data
* Reading in WineProductionSummary.csv and display

#### Step 6 - Extract wine sales data
* Reading in WineSales.csv

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
* Create a dataframe of unique wineries to use for Google API to find location of wineries

#### Step 2 - Find winery latitudes and longitudes utilising Google API
* Rename wineries that contain '&' to and to enable latitude and longitude search
* Create a loop with error exception to extract latitude and longitude for each unique winerey

#### Step 3 - Find soil composition data utilising Agric Soil API
* 
* 

#### Step 4 - Transform WaetherData.csv
* 
* 

#### Step 5 - Transform WineProductionSummary.csv
* 
* 

#### Step 6 - Transform WineSalesSummary.csv
* 
* 


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
This data base can be used to compare performance of Western Australian Wine regions over time and find the ideal location. The data can be used for further in depth analysis and visualisation to highlight statistical summaries and pattern recognition. The database is relational because the information is very structured. In addition anyone is able to access the database by using SQL.



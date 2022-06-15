# ETL-Project: Extract, Transform, Load - A Tale of a Vineyard
This repository explores the concept of ETL's - Extract, Transform, Load - by creating a database accessable through PostgresSQL to assess which locations in Western Australia are ideal to establish a vineyard. 

## Team Members:
* Michael Bett
* Carmen Sin
* Josh Thomas
* Aline Hornoff

## The Project
A good glass of wine to wind down after a day of hectic and stress or celebrate a great achievment is a special treat. But where is the ideal location to turn a simple fruit like a grape into a glass of joy to celebrate a special occasion.

Making wine is a long, slow process. It can take a full three years to get from the initial planting of a brand-new grapevine through the first harvest, and the first vintage might not be bottled for another two years after that. Longterm investment is required and it is therefore vital to pick the right location to establish a vineyard.

The database created will give an insight into what locations are ideal for a particular variety based on weather conditions, soil constitution, grape variety, prodcution yield and sales.


## Extract
Kaggle WineData.csv was choosen as it a comprehensive overview over the Western Australian Wine Region including winery names, price point and tasting scores. Google API's was choosen to match winery names to geographical location. The website of the Department Primary Industries and Regional Development WA was choosen as their soil API provides a comprehensive data set of soil conditions which can be linked to geographical location of the wineries using latitude and longitude of the wineries. The website of the Bureau of Meteorology was choosen for its extensive CSV data on historical weather recordings reaching back to the early 20th century. The Wine Australia website provided detailed CSV data on Western Australian wine region production and sales between 2012 and 2021 and was therefore ideal as data source.

### Data Sources:
1. https://www.kaggle.com: WineData.csv 
2. Google API to determine lat and long for winery locations
3. Department Primary Industries and Regional Development WA: https://www.agric.wa.gov.au/soil-api-10 
4. Bureau of Meteorology: https://www.bom.gov.au/
5. Wine Australia: https://wineaustralia.com

## How to use this database
1. Run WA Winery Data & Locations.ipynb to get all Western Australian Wineries and upload to PostgresSQL
2. Run Weather.ipynb to get all weather data and upload to PostgresSQL
3. Run soils.ipynb to get all soil data and upload to PostgresSQL
4. Run winery_data1.ipynb to get all production and sales data and upload to PostgresSQL

## Extract
### Steps:
#### Step 1 - Extract WineData.csv
* Read in WineData.csv and display data

#### Step 2 - Extract winery latitudes and longitudes utilising Google API
* Read in Google API and build target url

#### Step 3 - Extract soil data
* Read in Location_DF.csv
* Read in Soil API and build target url

#### Step 4 - Extract weather data
* Read in winery data with lats and longs and display data
* Loop through and read in consolidated master file of rainfall csv's
* Import os to interact with the underlying operating system/ returns the absolute path of the working directory

#### Step 5 - Extract Wine Sales by Geographical Location
* Read in GeoWineSales.csv and display

#### Step 6 - Extract Wine Volume by Region
* Read in GIVolumeProduction.csv and display

#### Step 7 - Extract Wine Sales by Grape Variety
* Read in SalesByVariety.csv and display

#### Step 8 - Extract Grape Variety Production
* Read in WineProductionSummary.csv and display

### Challenges
* Getting access to API keys
* Developing url's to access the API information
* reading in csv files that produced UnicodeDecodeError


## Transform
In step one the data from WineData.csv was transformed in the step outlined below to allow for quick and easy understanding of the data for further analysis and visualisation as well as being able to extract latitudes and longitudes for each winery by winery name.

The removing any '&" signs in step two needed to be performed to allow for optimisitaion of extraction of latitudes and longitudes. Looping through each of the wineries automated the process of extracting latitudes and longitudes from the Google API.

In step three the transformation of the soil data was performed to include relevant information.

As outlined in step four the data transformation to combine serval years of data and weather stations and allow to extract only relevant information.

Steps five to eight were applied to allow for quick and easy understanding of the data. To simplify merging these data frames with the rest of the dataframe which will allow for deeper analysis and visualisation.


### Steps:
#### Step 1 - Transform WineData.csv
* Create new dataframe with the following columns: country, price, points, province, region_1, title, winery, variety
* Rename column headers
* Filter dataframe for 'Western Australia'
* Inspect dataframe for unique values
* Reset index for each of the wineries
* Drop column 'index'
* Find unique values for wineries
* Drop Hope Estate as it is a winery in NSW
* Create a dataframe of unique wineries to use for Google API to find location of wineries

#### Step 2 - Find winery latitudes and longitudes utilising Google API
* Rename wineries that contain '&' to and to enable latitude and longitude search
* Create a loop with error exception to extract latitude and longitude for each unique winerey

#### Step 3 - Find soil composition data utilising Agric Soil API
* Loading Location csv
* Created soil dataframe
* Looped through soil API to retrieve soil data based on latitude and longitude of wineries
* Renamed column headers for better understanding

#### Step 4 - Transform Weather data
* Round down those Lat and lng statistic to only 2 digits to look up weather stations from BOM
* Fill all the NA value with Zero for rainfall csv
* Correct the sumation for the Annual column after filling all NA value with Zero
* Groupby the Station Number for the average rainfall since year 2000
* Looping the Resources_weather folder for each file name under rainfall.csv and join them together into a master file
* Fill up all the NA value with Zero value and correct the summation of "Annual" column 
* Selecting only year older than 2000, and column of station number and annual
* Drop off weather station 12280 as data are faulty
* Check how many station left
* Name change for "Annual Column" to "Annual Average Rainfall (mm)"
* Groupby the station number and calculate the mean for year older than 2000
* Round to 2 decimal place for better presentation
* Looping the Resources_weather folder for each file name under solar.csv and join them together into a master file
* Fill up all the NA value with Zero value and correct the summation of "Annual" column 
* Selecting only year older than 2000, and column of station number and annual
* Drop off weather station 12280 as data are faulty
* Check how many station left
* Name change for "Annual Column" to "Annual Average Solar Exposure (MJ m-2)"
* Groupby the station number and calculate the mean for years older than 2000
* Round to 2 decimal place for better presentation

#### Step 5 - Transform GeoWineSales.csv
* Rename column heads

#### Step 6 - Transform GIVolumeProduction.csv
* Drop 'Volume % change on previous period' and 'Average value % change on previous period' columns
* Rename columns

#### Step 7 - Transform SalesByVariety.csv
* Rename column
* Drop all rows with NaN value

#### Step 8 - Transform WineProductionSummary.csv
* Replace NaN with 0
* Drop '% change in average value' column
* Rename 'Variety' to 'Grape Variety', add 'Export Sales' to each year


### Challenges
* While transforming latitudes and longitudes for WeatherData it was found that index 6 is a winery in New South Wales which needed to removed 
* Working out how to structure the code to access latitudes and longitudes of the wineries
* Inconsistency of weather data, not all years have sufficient data


## Load
As the data is very structured and relational PostgresSQL was used to load the data into a database. This allows for easy access by multiple users. 

### Steps:
#### Step 1
* Created schemas with all tables and tables headers in https://quickdatabasediagrams.com
* Exported schemas to PostgresSQL

#### Step 2
* Imported schemas greated in quickdatadiagrams into PostgresSQL
* Run the code

#### Step 3
* In winery_data.ipnyp, Weather.ipnyp, soil.ipnyp, vineyard.ipynb created a connection to local database for each final dataframe
* Checked for table names
* Used pandas to load csv converted dataframes into database
* Used pandas to load API converted dataframes into database
* Confirmed data has been added querying data table names

#### Step 4
* Confirmed in PostgresSQL that data was loaded

### Challenges
* Spelling of table headers needed to match
* Uploading table to PostgresSQL

### Schemas
![ERD_Diagram](ERD%20Diagram.png)

## Summary
This data base can be used to compare performance of Western Australian Wine regions over time and find the ideal location. The data can be used for further in depth analysis and visualisation to highlight statistical summaries and pattern recognition. The database is relational because the information is very structured. In addition anyone is able to access the database by using PostgresSQL.



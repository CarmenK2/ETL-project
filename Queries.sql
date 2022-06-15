-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Winery_Location" (
    "Winery" varchar    ,
    "Latitude" float    ,
    "Longitude" float    ,
    "Closest_weather_station" int    ,
    "Name_of_weather_station" varchar    ,
    CONSTRAINT "pk_Winery_Location" PRIMARY KEY (
        "Winery"
     )
);

CREATE TABLE "Weather_Average_Rainfall" (
    "Closest_weather_station" int    ,
    "Average_yearly_rainfall" float    ,
    CONSTRAINT "pk_Weather_Average_Rainfall" PRIMARY KEY (
        "Closest_weather_station"
     )
);

CREATE TABLE "Weather_Average_Solar" (
    "Closest_weather_station" int    ,
    "Average_yearly_solar_exposure" float    ,
    CONSTRAINT "pk_Weather_Average_Solar" PRIMARY KEY (
        "Closest_weather_station"
     )
);

CREATE TABLE "Soil_data" (
    "Winery" varchar    ,
    "Latitude" float    ,
    "Longitude" float    ,
    "SubSoil_Condition" varchar    ,
    "Soil_Type" varchar    ,
    CONSTRAINT "pk_Soil_data" PRIMARY KEY (
        "Winery"
     )
);

CREATE TABLE "Winery_Export_Sales_by_Geolocation" (
    "Region" varchar    ,
    "2021_Export_Sales" varchar    ,
    "2020_Export_Sales" varchar    ,
    "2019_Export_Sales" varchar    ,
    "2018_Export_Sales" varchar    ,
    "2017_Export_Sales" varchar    ,
    "2016_Export_Sales" varchar    ,
    "2015_Export_Sales" varchar    ,
    "2014_Export_Sales" varchar    ,
    "2013_Export_Sales" varchar    ,
    CONSTRAINT "pk_Winery_Export_Sales_by_Geolocation" PRIMARY KEY (
        "Region"
     )
);

CREATE TABLE "Wine_Volume_by_region" (
    "Region" varchar    ,
    "Year" int    ,
    "Volume_per_Liter" float    ,
    "Average_Sales_Value_per_Liter" float    ,
    CONSTRAINT "pk_Wine_volume_by_region" PRIMARY KEY (
        "Region"
     )
);

CREATE TABLE "Wine_Grape_variety_Sales" (
    "Grape_Variety" varchar    ,
    "2021_Export_Sales" varchar    ,
    "2020_Export_Sales" varchar    ,
    "2019_Export_Sales" varchar    ,
    "2018_Export_Sales" varchar    ,
    "2017_Export_Sales" varchar    ,
    "2016_Export_Sales" varchar    ,
    "2015_Export_Sales" varchar    ,
    "2014_Export_Sales" varchar    ,
    "2013_Export_Sales" varchar    ,
    "2012_Export_Sales" varchar    ,
    CONSTRAINT "pk_Wine_Grape_variety_Sales" PRIMARY KEY (
        "Grape_Variety"
     )
);

CREATE TABLE "Wine_Grape_variety_Production" (
    "Region" varchar    ,
    "Year" int    ,
    "Wine_Colour" varchar    ,
    "Grape_Variety" varchar    ,
    "Tonnes_purchased" float    ,
    "Total_value_purchased" float    ,
    "Average_purchase_value_per_tonne" float    ,
    "Winery_grown_fruit_per_tonne" float    ,
    "Winery_grown_share_of_crush" float    ,
    "Total_crushed" float    ,
    "Total_value_all_grapes" float    ,
    CONSTRAINT "pk_Wine_Grape_varierty_Production" PRIMARY KEY (
        "Region"
     )
);

CREATE TABLE "Winery_Tasting_Price_data" (
    "Winery" varchar    ,
    "Region" varchar    ,
    "Wine_Name" varchar    ,
    "Grape_Variety" varchar    ,
    "Tasting_Score" int    ,
    "Price" int    ,
    "ID" serial primary key
     
);

ALTER TABLE "Winery_Location" ADD CONSTRAINT "fk_Winery_Location_Winery" FOREIGN KEY("Winery")
REFERENCES "Soil_data" ("Winery");

ALTER TABLE "Weather_Average_Rainfall" ADD CONSTRAINT "fk_Weather_Average_Rainfall_Closest_weather_station" FOREIGN KEY("Closest_weather_station")
REFERENCES "Winery_Location" ("Closest_weather_station");

ALTER TABLE "Weather_Average_Solar" ADD CONSTRAINT "fk_Weather_Average_Solar_Closest_weather_station" FOREIGN KEY("Closest_weather_station")
REFERENCES "Winery_Location" ("Closest_weather_station");

ALTER TABLE "Winery_Export_Sales_by_Geolocation" ADD CONSTRAINT "fk_Winery_Export_Sales_by_Geolocation_Region" FOREIGN KEY("Region")
REFERENCES "Wine_Grape_varierty_Production" ("Region");

ALTER TABLE "Wine_volume_by_region" ADD CONSTRAINT "fk_Wine_volume_by_region_Region" FOREIGN KEY("Region")
REFERENCES "Wine_Grape_varierty_Production" ("Region");

ALTER TABLE "Wine_Grape_variety_Sales" ADD CONSTRAINT "fk_Wine_Grape_variety_Sales_Grape_Variety" FOREIGN KEY("Grape_Variety")
REFERENCES "Wine_Grape_varierty_Production" ("Grape_Variety");

ALTER TABLE "Wine_Grape_varierty_Production" ADD CONSTRAINT "fk_Wine_Grape_varierty_Production_Grape_Variety" FOREIGN KEY("Grape_Variety")
REFERENCES "Winery_Tasting_Price_data" ("Grape_Variety");

ALTER TABLE "Winery_Tasting_Price_data" ADD CONSTRAINT "fk_Winery_Tasting_Price_data_Winery" FOREIGN KEY("Winery")
REFERENCES "Winery_Location" ("Winery");


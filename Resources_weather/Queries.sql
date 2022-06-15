-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Winery_Listing" (
    "Winery_Name" varchar   NOT NULL,
    "Region" varchar   NOT NULL,
    "Wine_title" varchar   NOT NULL,
    "Grape_variety" varchar   NOT NULL,
    CONSTRAINT "pk_Winery_Listing" PRIMARY KEY (
        "Winery_Name"
     )
);

CREATE TABLE "Winery_Location" (
    "Winery_Name" varchar   NOT NULL,
    "Latitude" float   NOT NULL,
    "Longitude" float   NOT NULL,
    "Weather_station_number" int   NOT NULL,
    CONSTRAINT "pk_Winery_Location" PRIMARY KEY (
        "Winery_Name"
     )
);

CREATE TABLE "Weather_data" (
    "Weather_station_number" int   NOT NULL,
    "Average_yearly_rainfall" float   NOT NULL,
    "Average_yearly_solar_exposure" float   NOT NULL,
    CONSTRAINT "pk_Weather_data" PRIMARY KEY (
        "Weather_station_number"
     )
);

CREATE TABLE "Soil_data" (
    "Winery_Name" varchar   NOT NULL,
    "Latitude" float   NOT NULL,
    "Longitude" float   NOT NULL,
    "SubSoil_Condition" varchar   NOT NULL,
    "Soil_Type" varchar   NOT NULL,
    CONSTRAINT "pk_Soil_data" PRIMARY KEY (
        "Winery_Name"
     )
);

CREATE TABLE "Winery_Export_Sales_by_Geolocation" (
    "Region" varchar   NOT NULL,
    "Year" int   NOT NULL,
    CONSTRAINT "pk_Winery_Export_Sales_by_Geolocation" PRIMARY KEY (
        "Region"
     )
);

CREATE TABLE "Wine_volume_by_region" (
    "Region" varchar   NOT NULL,
    "Year" int   NOT NULL,
    "Production_volume" float   NOT NULL,
    "Average_Sales_value_per_Liter" float   NOT NULL,
    CONSTRAINT "pk_Wine_volume_by_region" PRIMARY KEY (
        "Region"
     )
);

CREATE TABLE "Wine_Grape_variety_Sales" (
    "Grape_Variety" varchar   NOT NULL,
    "Export_Sales_by_year" varchar   NOT NULL,
    CONSTRAINT "pk_Wine_Grape_variety_Sales" PRIMARY KEY (
        "Grape_Variety"
     )
);

CREATE TABLE "Wine_Grape_varierty_Production" (
    "Region" varchar   NOT NULL,
    "Year" int   NOT NULL,
    "Wine_Color" varchar   NOT NULL,
    "Grape_Variety" varchar   NOT NULL,
    "Tonnes_Purchased" float   NOT NULL,
    "Total_Value_purchased" float   NOT NULL,
    "Average_purchase_value_per_tonne" float   NOT NULL,
    "Winery_grown_fruit_per_tonne" float   NOT NULL,
    "Winery_grown_share_of_crush" float   NOT NULL,
    "Total_crushed" float   NOT NULL,
    "Total_value_all_grapes" float   NOT NULL,
    CONSTRAINT "pk_Wine_Grape_varierty_Production" PRIMARY KEY (
        "Region"
     )
);

CREATE TABLE "Winery_Tasting_Price_data" (
    "Winery_Name" varchar   NOT NULL,
    "Region" varchar   NOT NULL,
    "Wine_title" varchar   NOT NULL,
    "Grape_variety" varchar   NOT NULL,
    "Tasting_score" int   NOT NULL,
    "Price" int   NOT NULL,
    CONSTRAINT "pk_Winery_Tasting_Price_data" PRIMARY KEY (
        "Winery_Name"
     )
);

ALTER TABLE "Winery_Listing" ADD CONSTRAINT "fk_Winery_Listing_Winery_Name" FOREIGN KEY("Winery_Name")
REFERENCES "Soil_data" ("Winery_Name");

ALTER TABLE "Winery_Listing" ADD CONSTRAINT "fk_Winery_Listing_Region" FOREIGN KEY("Region")
REFERENCES "Winery_Tasting_Price_data" ("Region");

ALTER TABLE "Winery_Location" ADD CONSTRAINT "fk_Winery_Location_Winery_Name" FOREIGN KEY("Winery_Name")
REFERENCES "Winery_Tasting_Price_data" ("Winery_Name");

ALTER TABLE "Weather_data" ADD CONSTRAINT "fk_Weather_data_Weather_station_number" FOREIGN KEY("Weather_station_number")
REFERENCES "Winery_Location" ("Weather_station_number");

ALTER TABLE "Winery_Export_Sales_by_Geolocation" ADD CONSTRAINT "fk_Winery_Export_Sales_by_Geolocation_Region" FOREIGN KEY("Region")
REFERENCES "Wine_Grape_varierty_Production" ("Region");

ALTER TABLE "Wine_volume_by_region" ADD CONSTRAINT "fk_Wine_volume_by_region_Region" FOREIGN KEY("Region")
REFERENCES "Wine_Grape_varierty_Production" ("Region");

ALTER TABLE "Wine_Grape_variety_Sales" ADD CONSTRAINT "fk_Wine_Grape_variety_Sales_Grape_Variety" FOREIGN KEY("Grape_Variety")
REFERENCES "Wine_Grape_varierty_Production" ("Grape_Variety");

ALTER TABLE "Wine_Grape_varierty_Production" ADD CONSTRAINT "fk_Wine_Grape_varierty_Production_Grape_Variety" FOREIGN KEY("Grape_Variety")
REFERENCES "Winery_Tasting_Price_data" ("Grape_variety");


/* ==============================================================================
PROJECT: Apex Fit Marketing Data Warehouse 
DESCRIPTION: Builds the core relational tables for tracking ad spend, 
             campaign pacing, and keyword efficiency. Includes view generation 
             for the Tableau marketing dashboard.
==============================================================================*/

CREATE DATABASE IF NOT EXISTS ApexFitMarketing;
USE ApexFitMarketing;

DROP VIEW IF EXISTS vw_WinningCreatives;
DROP TABLE IF EXISTS Performance;
DROP TABLE IF EXISTS Keyword;
DROP TABLE IF EXISTS Ad;
DROP TABLE IF EXISTS Campaign;
DROP TABLE IF EXISTS Advertiser;

-- ==============================================================================
-- TABLE CREATION
-- ==============================================================================
CREATE TABLE Advertiser (
    AdvertiserID INT AUTO_INCREMENT PRIMARY KEY,
    AdvertiserName VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    ContactEmail VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Campaign (
    CampaignID INT AUTO_INCREMENT PRIMARY KEY,
    AdvertiserID INT NOT NULL,
    CampaignName VARCHAR(100),
    StartDate DATE,
    Budget DECIMAL(10, 2),
    FOREIGN KEY (AdvertiserID) REFERENCES Advertiser(AdvertiserID) ON DELETE CASCADE
);

CREATE TABLE Ad (
    AdID INT AUTO_INCREMENT PRIMARY KEY,
    CampaignID INT NOT NULL,
    AdTitle VARCHAR(200),
    TargetURL VARCHAR(200),
    FOREIGN KEY (CampaignID) REFERENCES Campaign(CampaignID) ON DELETE CASCADE
);

CREATE TABLE Keyword (
    KeywordID INT AUTO_INCREMENT PRIMARY KEY,
    AdID INT NOT NULL,
    KeywordText VARCHAR(100),
    BidAmount DECIMAL(8, 2),
    QualityScore INT,
    FOREIGN KEY (AdID) REFERENCES Ad(AdID) ON DELETE CASCADE
);

CREATE TABLE Performance (
    PerformanceID INT AUTO_INCREMENT PRIMARY KEY,
    AdID INT NOT NULL,
    Date DATE,
    Impressions INT DEFAULT 0,
    Clicks INT DEFAULT 0,
    Conversions INT DEFAULT 0,
    FOREIGN KEY (AdID) REFERENCES Ad(AdID) ON DELETE CASCADE
);

-- Indexing for time-series and join optimisation
CREATE INDEX idx_perf_date ON Performance(Date);
CREATE INDEX idx_ad_camp ON Ad(CampaignID);
CREATE INDEX idx_perf_ad ON Performance(AdID);
CREATE INDEX idx_kw_ad ON Keyword(AdID);




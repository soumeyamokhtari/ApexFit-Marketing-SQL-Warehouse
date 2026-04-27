-- Campaign Pacing & Algorithm Action Status
SELECT 
    c.CampaignName, 
    c.Budget, 
    SUM(p.Impressions) AS TotalImpressions,
    SUM(p.Clicks) AS TotalClicks, 
    SUM(p.Conversions) AS TotalConversions,
    ROUND((SUM(p.Conversions) * 100.0) / NULLIF(SUM(p.Clicks), 0), 2) AS ConversionRate,
    CASE 
        WHEN SUM(p.Conversions) >= 100 THEN 'Scale Phase - Increase Budget'
        WHEN SUM(p.Conversions) BETWEEN 20 AND 99 THEN 'Optimization Phase - A/B Test Copy'
        ELSE 'Kill Phase - Pause Ads & Review Strategy'
    END AS AlgorithmStatus
FROM Campaign c
JOIN Ad a ON c.CampaignID = a.CampaignID
JOIN Performance p ON a.AdID = p.AdID
GROUP BY c.CampaignID, c.CampaignName, c.Budget
ORDER BY TotalConversions DESC;

-- Keyword Bid Efficiency Tracking
SELECT 
    k.KeywordText, 
    k.BidAmount, 
    k.QualityScore,
    SUM(p.Impressions) AS TotalImpressions,
    SUM(p.Clicks) AS TotalClicks,
    SUM(p.Conversions) AS TotalConversions
FROM Keyword k
JOIN Ad a ON k.AdID = a.AdID
JOIN Performance p ON a.AdID = p.AdID
WHERE k.QualityScore >= 7
GROUP BY k.KeywordID, k.KeywordText, k.BidAmount, k.QualityScore
ORDER BY TotalConversions DESC, k.BidAmount ASC;

-- Dashboard Data Source: Winning Creatives (CTR > 4%)
CREATE OR REPLACE VIEW vw_WinningCreatives AS
SELECT 
    a.AdTitle, 
    c.CampaignName,
    SUM(p.Impressions) AS TotalImpressions,
    SUM(p.Clicks) AS TotalClicks,
    ROUND((SUM(p.Clicks) * 100.0) / NULLIF(SUM(p.Impressions), 0), 2) AS ClickThroughRate_CTR
FROM Ad a
JOIN Campaign c ON a.CampaignID = c.CampaignID
JOIN Performance p ON a.AdID = p.AdID
GROUP BY a.AdID, a.AdTitle, c.CampaignName
HAVING ClickThroughRate_CTR > 4.0;
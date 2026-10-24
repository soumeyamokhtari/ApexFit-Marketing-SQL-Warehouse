-- Campaign Pacing & Algorithm Action Status
SELECT 
    c.CampaignName, 
    c.Budget, 
    SUM(p.Impressions) AS TotalImpressions,
    SUM(p.Clicks) AS TotalClicks, 
    SUM(p.Conversions) AS TotalConversions,
    ROUND((SUM(p.Conversions) * 100.0) / NULLIF(SUM(p.Clicks), 0), 2) AS ConversionRate,
    SUM(p.Spend) AS TotalSpend,
    SUM(p.Revenue) AS TotalRevenue,
    ROUND((SUM(p.Revenue) - SUM(p.Spend)) * 100.0 / NULLIF(SUM(p.Spend), 0), 1) AS ROI_Percent,
    CASE 
        WHEN SUM(p.Conversions) = 0 AND SUM(p.Spend) >= 50 THEN 'Kill Phase - Pause Ads & Review Strategy'
        WHEN SUM(p.Revenue) < SUM(p.Spend) THEN 'Optimization Phase - Losing Money, Review Spend'
        ELSE 'Scale Phase - Profitable, Consider More Budget'
    END AS ActionStatus
FROM Campaign c
JOIN Ad a ON c.CampaignID = a.CampaignID
JOIN Performance p ON a.AdID = p.AdID
GROUP BY c.CampaignID, c.CampaignName, c.Budget
ORDER BY ROI_Percent DESC;

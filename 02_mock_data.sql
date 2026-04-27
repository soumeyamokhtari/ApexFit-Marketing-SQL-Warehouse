-- =======================================================
-- Mocking 10 realistic records per table
-- =======================================================

-- Advertiser mix: Internal brands, external agencies, and solo influencers
INSERT INTO Advertiser (AdvertiserName, ContactPerson, ContactEmail, PhoneNumber) VALUES 
('Apex Supplements', 'Marcus Thorne', 'm.thorne@apexfit.com', '555-0101'),
('Apex Apparel', 'Sarah Jenkins', 's.jenkins@apexfit.com', '555-0102'),
('Apex Home Gym', 'David Chen', 'd.chen@apexfit.com', '555-0103'),
('GripGear Agency', 'Elena Rostova', 'elena@gripgear.io', '555-0104'),
('Lift Social Media', 'Tom Baker', 'tom.baker@liftsocial.net', '555-0105'),
('IronForge Gyms', 'Jackson Ward', 'jward@ironforge.com', '555-0106'),
('CardioTech Inc', 'Priya Patel', 'ppatel@cardiotech.co', '555-0107'),
('RecoveryPro Solutions', 'Dr. Aris Thorne', 'aris@recoverypro.med', '555-0108'),
('FitLife Influencers LLC', 'Chloe Vance', 'chloe.fitlife@gmail.com', '555-0109'), 
('Velocity Running', 'Samir Haq', 'shaq@velocityrun.com', '555-0110');

-- Campaigns featuring varied, non-uniform budgets
INSERT INTO Campaign (AdvertiserID, CampaignName, StartDate, Budget) VALUES 
(1, 'Q1 Resolution Push: Whey Protein', '2025-01-01', 15000.00),
(1, 'Pre-Workout Spring Launch', '2025-02-15', 8400.00),
(2, 'Squat-Proof Leggings Promo', '2025-01-10', 12500.00),
(3, 'Garage Gym Bundle', '2025-01-05', 25000.00),
(3, 'Yoga Mat Clearance', '2025-03-01', 1200.00), 
(6, 'Local Gym Membership Drive', '2025-01-15', 5000.00),
(7, 'Smart Treadmill Pre-Orders', '2025-04-01', 45000.00), 
(8, 'Massage Gun Father''s Day', '2025-05-15', 7500.00),
(9, 'TikTok Creator Fund - Protein', '2025-02-01', 3000.00),
(10, 'Marathon Training E-Book', '2025-03-10', 500.00); 

-- Target URLs aligning logically with campaign themes
INSERT INTO Ad (CampaignID, AdTitle, TargetURL) VALUES 
(1, 'Save 20% on Isolate Whey', 'apexfit.com/whey-sale'),
(2, 'Insane Energy Pre-Workout', 'apexfit.com/pre-ignite'),
(3, 'Zero Transparency Leggings', 'apexfit.com/womens/squat-proof'),
(4, 'Complete Power Rack Setup', 'apexfit.com/racks/garage-bundle'),
(5, 'Eco-Friendly Yoga Mats', 'apexfit.com/mats/clearance'),
(6, 'First Month Free - IronForge', 'ironforge.com/join-now'),
(7, 'The Future of Home Cardio', 'cardiotech.co/smart-tread'),
(8, 'Recover Faster. Lift Heavier.', 'recoverypro.med/massage-gun'),
(9, 'Chloe''s Favorite Protein Shake', 'apexfit.com/creators/chloe'),
(10, 'Sub-4 Hour Marathon Plan', 'velocityrun.com/ebook-download');

-- Realistic bidding anomalies (low bids for ebooks, high bids for equipment)
INSERT INTO Keyword (AdID, KeywordText, BidAmount, QualityScore) VALUES 
(1, 'best whey isolate', 3.50, 9),
(2, 'pre workout supplement', 4.00, 8),
(3, 'high waisted gym leggings', 2.80, 10), 
(4, 'home gym equipment', 5.50, 9),
(5, 'cheap yoga mats', 0.85, 4), 
(6, 'gyms near me', 6.00, 7),
(7, 'peloton alternatives', 4.50, 6),
(8, 'muscle recovery tools', 2.10, 8),
(9, 'fitness influencer diet', 1.15, 5),
(10, 'marathon training plan pdf', 0.50, 7);

-- Funnel metrics with intentional outliers (e.g., zero conversions on Ad 5)
INSERT INTO Performance (AdID, Date, Impressions, Clicks, Conversions) VALUES 
(1, '2025-01-01', 12500, 850, 65),
(2, '2025-02-15', 18000, 1200, 110),
(3, '2025-01-10', 22000, 1850, 215), 
(4, '2025-01-05', 45000, 2100, 85), 
(5, '2025-03-01', 5000, 120, 0), 
(6, '2025-01-15', 8500, 340, 12),
(7, '2025-04-01', 60000, 4500, 320), 
(8, '2025-05-15', 15000, 890, 45),
(9, '2025-02-01', 95000, 8500, 500), 
(10, '2025-03-10', 1200, 45, 3); 
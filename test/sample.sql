SELECT 'Teams' AS TableName, COUNT(*) AS RowCount FROM Teams
UNION ALL
SELECT 'Champions', COUNT(*) FROM Champions
UNION ALL
SELECT 'Players', COUNT(*) FROM Players
UNION ALL
SELECT 'Matches', COUNT(*) FROM Matches
UNION ALL
SELECT 'PlayerStats', COUNT(*) FROM PlayerStats
UNION ALL
SELECT 'TeamHistory', COUNT(*) FROM TeamHistory;

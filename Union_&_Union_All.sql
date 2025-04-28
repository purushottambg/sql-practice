-- ====================================================================
-- MySQL UNION Lecture - Complete SQL Script
-- ====================================================================

-- Introduction to UNION and UNION ALL
-- ====================================================================
-- UNION allows us to combine result sets from multiple SELECT queries into a single result set
-- Key points:
-- - Combines rows from multiple queries into a single result set
-- - Appends rows vertically (stacks them on top of each other)
-- - Requires that all queries have the same number of columns
-- - Column data types must be compatible across all queries
-- - Eliminates duplicate rows by default (use UNION ALL to keep duplicates)
-- - Uses the column names from the first SELECT statement for the final result set
-- - Ignores column names from subsequent queries

-- Database Setup
-- ====================================================================
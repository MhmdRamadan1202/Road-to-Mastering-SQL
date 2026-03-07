SELECT
	CASE WHEN (B + C) <= A OR (A + C) <= B OR (A + B) <= C THEN "Not A Triangle"
		 WHEN ((A = B) AND (A = C) AND (B = C)) THEN "Equilateral"
		 WHEN ((A = B) AND (A != C) AND (B != C))
				OR ((A = C) AND (A != B) AND (B != C))
			    OR ((B = C) AND (A != B) AND (A != C)) THEN "Isosceles"
	     ELSE "Scalene" END
FROM Triangles
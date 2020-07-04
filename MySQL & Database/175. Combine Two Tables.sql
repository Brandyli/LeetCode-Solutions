SELECT FirstName, LastName, City, State FROM Person P 
LEFT join Address A 
on P.PersonId = A.PersonId;

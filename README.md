# Assignement from a senior developper

Objectif : In a Lightning WEB Component, create a search screan with two creterias :
- Name
- Postal Code
This search will search through the reccords of the sObject Account.
The page will display a table of all the Accounts matching theese criterias.

# My observation wrighting this code

I made sure to have only one SOQL statement in order to limit access to database. For futur usage of my code it make sure no governor limits will be set. That was my main concern.

I had to use Lists as @AuraEnable statement doesn't support Sets. To ensure no double reccords made it to the final list diplayed to the users, I used the folowing technique. When a methode screens the list it pass it on to the next screening. The same list is shrunk, and passed on between different methodes.
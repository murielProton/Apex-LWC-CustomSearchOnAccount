# Assignement from a senior developper

Objectif : In a Lightning WEB Component, create a search screan with two creterias :
- Name
- Postal Code
This search will search through the reccords of the sObject Account.
The page will display a table of all the Accounts matching theese criterias.

# My observation wrighting this code

I made sure to have only one SOQL statement in order to limit access to database. For futur usage of my code it make sure no governor limits will be set. That was my main concern.

I had to use Lists as @AuraEnable statement doesn't support Sets.
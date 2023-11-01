# Costa Rica Backend

## Description 

Costa Rica sell the best pizza in the world. This is there system to manage menus. The system consist of a small react app connected to a rails API using GRAPHQL that fetches the menu and displays it into a list on the front end side

Features of backend:
- Returns Menu.
- Search menus by name.
- Sort menus by price.

## Steps to Run the project Locally

To run this project, you will need to install the following libraries to your system

`ruby: 3.0.0`

`rails: 7.0.6`

### Installing Dependencies
once you have them on your machine and you are in project folder, run `bundle install` and all of the project dependencies will be installed.


#### Database creation

Create make sure you have postgresql installed and provide details of database in file(if needed):

```bash
database.yml
```


After that you can create a database and run seed files by and install any dependencies by command

```bash
bin/setup
```
once all done you just need to run the project by starting the server for rails

```bash
  rails s
```
To run Tests you can use following commands: 
- TO run rspecs you can run command
```bash
  rspec
```
## Project Overview

Once the server is running you can redirect to the home address which in case of local will be  `http://localhost:3001/`.


## Possible Commands

The application accepts specific commands, the details of command is given below


| Command       | Purpose    | Params                       |
|--------------|---------|-------------------------------|
|   POST     |Get all menus  | sortByPrice                      |
| POST         | searchMenus by name  | name                   |
                    

- **Query Examples:**
Request type: POST, 
Request URL : http://localhost:3001/graphql

  - TO get all menus unsorted by price(defult)
    ```
    {
      menus(sortByPrice: false) {
        id
        name
        price
        category
      }
    }

  - Search Menu by name
    ```
    {
    searchMenus(name: "Pizza") {
        id
        name
        price
        category
    }
    }

---
## Author

- [github:@muhammad-ur-rehman](https://github.com/muhammad-ur-rehman)

- [linkedin:@m-ur-rehman](https://www.linkedin.com/in/m-ur-rehman/)

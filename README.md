## GraphQL / Rails 5 

```
bundle
rails db:migrate
rails db:seed
rails s

```
Open 
```
localhost:3000/gi
```

* This will load the GraphiQL GUI


Here are some sample queries
```
{
  testField(name: "<your_name>") 
}

```
```
{
  author(id: 199) {
    id
    birth_year
    full_name
    is_alive
    coordinates {
      latitude
      longitude
    }
    publication_years
  }
}

```  
#### Create
```
mutation createAuthor($author:AuthorInputType) {
  createAuthor(author:$author) {
    full_name
  }
} 

```
Query Varibles:
```
{
  "author": {
    "first_name": "Bill",
    "last_name": "Smith",
    "birth_year": 1965,
    "is_alive": false
  }
}

```
#### Update
```
mutation updateAuthor($author:AuthorInputType) {
  updateAuthor(id: 7, author: $author) {
    id
    full_name
  }
}
```
Query Varibles:
```
{
  "author": {
    "first_name": "Bill",
    "last_name": "Smith",
    "birth_year": 1965,
    "is_alive": false
  }
}

```
#### Delete
```
mutation {
  deleteAuthor(id:<any_id>) {}
}

```

#### Error Handling
* Gives front-end engineers the errors that occur in the back-end
* A validation for last_name presence true can be used in the next example

```

mutation createAuthor($author:AuthorInputType) {
  createAuthor(author:$author) {
    full_name
    errors
  }
} 

```
```
{
  "author": {
    "first_name": "<any>",
    "birth_year": 1965,
    "is_alive": false
  }
}

```
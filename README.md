## [GraphQL](http://graphql.org/) / [Rails 5](http://rubyonrails.org/) 


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

* This will load the [GraphiQL in-browser IDE](https://github.com/graphql/graphiql)


Here are some sample queries
```
{
  testField(name: "<your_name>") 
}

```

##### Get an author by id - returns data listed
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
### Create
```
mutation createAuthor($author:AuthorInputType) {
  createAuthor(author:$author) {
    full_name
  }
} 

```
Query Variables:
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
### Update
```
mutation updateAuthor($author:AuthorInputType) {
  updateAuthor(id: 7, author: $author) {
    id
    full_name
  }
}
```
Query Variables:
```
{
  "author": {
    "first_name": "John",
    "last_name": "Smith",
    "birth_year": 1963,
    "is_alive": true
  }
}

```
### Delete
```
mutation {
  deleteAuthor(id:<any_id>) {}
}

```

### Error Handling
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

### Login
* The password for users is '123456'
```
{
  login(email: "felicita_schulist@kling.com", password: "123456")
}
```

### Logout
```
  mutation {logout}
```
### Acknowledgments
Many thanks to [Alex Deva](https://github.com/alxx) for his Udemy Tutorial on Rails5 and GraphQL.
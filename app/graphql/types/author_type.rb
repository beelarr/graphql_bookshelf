Types::AuthorInputType = GraphQL::InputObjectType.define do
  name 'AuthorInputType'
  description 'Properties for creating or updating an Author'

  argument :first_name, types.String
  argument :last_name, types.String
  argument :birth_year, types.Int
  argument :is_alive, types.Boolean
end


Types::AuthorType = GraphQL::ObjectType.define do
  name 'AuthorType'
  description 'Authors that are in our db'

  # ! makes a field non-nullable
  field :first_name, !types.String
  field :last_name, types.String
  field :birth_year, types.Int
  field :is_alive, types.Boolean
  field :id, types.ID

  field :full_name, types.String do
    description 'The full name of the author'
    # underscore saves memory when the args aren't being used
    resolve -> (a, _, _) {[a.first_name, a.last_name].compact.join(' ')}
  end

  field :coordinates, Types::CoordinateType do
    description 'The current coordinates of the author'
  end

  field :publication_years, types[types.Int] do
    description 'The publication years for the author'
  end

  # gives the front end a way to see errors that occoured in the backend
  # can be currently tested with a validation error on last_name presence
  field :errors, types[types.String], "Reason this object couldn't be saved" do
    resolve ->(o, _, _) { o.errors.to_a }
  end
end
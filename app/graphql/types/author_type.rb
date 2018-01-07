Types::AuthorType = GraphQL::ObjectType.define do
  name 'AuthorType'
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

end
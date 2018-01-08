Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  description 'All items from our db that can be created, updated, and deleted.'

  # function is stored in the Mutations - create_author.rb
  field :createAuthor, function: Mutations::CreateAuthor.new
  field :updateAuthor, function: Mutations::UpdateAuthor.new
  field :deleteAuthor, function: Mutations::DeleteAuthor.new
  field :createUser, function: Mutations::CreateUser.new
  field :updateUser, function: Mutations::UpdateUser.new
  field :deleteUser, function: Mutations::DeleteUser.new
end

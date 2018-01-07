Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # function is stored in the Mutations - create_author.rb
  field :createAuthor, function: Mutations::CreateAuthor.new
  field :updateAuthor, function: Mutations::UpdateAuthor.new

end

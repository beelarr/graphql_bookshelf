Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # function is stored in the Mutations - create_author.rb
  field :create_author, function: Mutations::CreateAuthor.new
  field :update_author, function: Mutations::UpdateAuthor.new

end

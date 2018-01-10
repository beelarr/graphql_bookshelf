class Mutations::CreateAuthor < GraphQL::Function
  description 'Create a specific author.'

  argument :author, Types::AuthorInputType

  type Types::AuthorType

  def call(obj, args, ctx)
    is_public true

    Author.create args[:author].to_h
  end
end

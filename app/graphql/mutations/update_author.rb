class Mutations::UpdateAuthor < GraphQL::Function
  description 'Update a specific author by ID'

  argument :id, types.ID
  argument :author, Types::AuthorInputType

  type Types::AuthorType

  def call(obj, args, ctx)
    author = Author.find(args[:id])
    author.try :update, args[:author].to_h
    author
  end

end
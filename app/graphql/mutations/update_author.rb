class Mutations::UpdateAuthor < GraphQL::Function

  argument :id, types.ID
  argument :author, Types::AuthorInputType

  type Types::AuthorType

  def call(obj, args, ctx)
    is_public true

    author = Author.find(args[:id])
    author.try :update, args[:author].to_h
    author
  end

end
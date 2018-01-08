class Mutations::DeleteAuthor < GraphQL::Function

  argument :id, types.ID

  # What is returned
  type types.Boolean

  def call(obj, args, ctx)
    is_public true

    author = Author.find(args[:id])
    # !! converts nil to false
    !!author.destroy
  end

end
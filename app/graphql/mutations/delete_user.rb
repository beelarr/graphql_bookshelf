class Mutations::DeleteUser < GraphQL::Function

  argument :id, types.ID

  # What is returned
  type types.Boolean

  def call(obj, args, ctx)
    user = User.find(args[:id])
    # !! converts nil to false
    !!user.destroy
  end

end
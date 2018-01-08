class Mutations::UpdateUser < GraphQL::Function

  argument :id, types.ID
  argument :user, Types::UserInputType

  type Types::UserType

  def call(obj, args, ctx)
    user = User.find(args[:id])
    user.try :update, args[:user].to_h
    user
  end

end
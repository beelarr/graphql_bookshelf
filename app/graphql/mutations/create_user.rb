class Mutations::CreateUser < GraphQL::Function

  argument :user, Types::UserInputType

  type Types::UserType

  def call(obj, args, ctx)
    User.create args[:user].to_h
  end

end
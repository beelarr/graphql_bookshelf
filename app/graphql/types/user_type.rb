Types::UserInputType = GraphQL::InputObjectType.define do
  name 'UserInputType'
  description 'Properties for creating or updating a User'

  argument :first_name, types.String
  argument :last_name, types.String
  argument :street_number, types.Int
  argument :street, types.String
  argument :city, types.String
  argument :state, types.String
  argument :zip_code, types.String
  argument :phone_number, types.String
  argument :email, types.String
  argument :company, types.String
  argument :is_superadmin, types.Boolean
  argument :password, types.String
  argument :password_confirmation, types.String
end


Types::UserType = GraphQL::ObjectType.define do
  name 'UserType'

  field :first_name, types.String
  field :last_name, types.String
  field :street_number, types.Int
  field :street, types.String
  field :city, types.String
  field :state, types.String
  field :zip_code, types.String
  field :phone_number, types.String
  field :email, types.String
  field :company, types.String
  field :is_superadmin, types.Boolean
  field :id, types.ID


  field :full_name, types.String do
    description 'The full name of the user'
    # underscore saves memory when the args aren't being used
    resolve -> (o, _, _) {[o.first_name, o.last_name].compact.join(' ')}
  end

  field :address, types.String do
    description 'The full address of a user'
    resolve -> (o, _, _) {[o.street_number, o.street, o.city, o.state, o.zip_code].compact.join(' ')}
  end
end
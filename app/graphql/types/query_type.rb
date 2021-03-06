Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "Anything that is gettable from our db."
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :testField, types.String do
    # Arguments are passed from the front to the back.
    argument :name, types.String, "Enter your name here"
    description "An example field added by the generator"
    is_public true

    resolve ->(obj, args, ctx) {
      # A way to log into the server terminal
      # Rails.logger.info ctx.query
      # Rails.logger.info obj.inspect
      "Hello #{args.name}!"
    }
  end

  field :login, types.String do
    argument :email, types.String
    argument :password, types.String

    is_public true

    resolve -> (_, args, _) {
      user = User.where(email: args[:email]).first
      user.sessions.create.key if user.try(:authenticate, args[:password])
    }
  end

  field :author, Types::AuthorType do
    argument :id, types.ID
    description "One Author"
    is_public true


    must_be [:super_admin]
    resolve -> (obj, args, ctx) {
      Author.where(id: args.id).first
    }
  end

 #  a silly name, but a way for me to remember that queries can be given custom names
 field :all_authors_is_dope, types[Types::AuthorType] do
   description 'Retrieves all authors'
   is_public true

   resolve -> (_, _, _) { Author.all }
 end

  field :current_user, Types::UserType do
    is_public true

    resolve -> (_, _, c) { c[:current_user] }
  end

  field :user, Types::UserType do
    argument :id, types.ID
    description "One User"
    is_public true

    resolve -> (obj, args, ctx) {
      User.where(id: args.id).first
    }
  end

  field :all_users, types[Types::UserType] do
    is_public true

    description 'Retrieves all users'
    resolve -> (_, _, _) { User.all }
  end


  # doesnt work because data is actually in the db
  # field :specific_pub_year, types[Types::AuthorType] do
  #   argument :publication_years, types.Int, "Enter the desired publication year"
  #   description 'Retrieves authors by publication year'
  #   resolve -> (_, args, _) {
  #     Author.where(publication_years: args.publication_years)
  #   }
  # end
end

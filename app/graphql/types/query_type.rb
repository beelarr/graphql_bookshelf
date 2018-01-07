Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :testField, types.String do
    # Arguments are passed from the front to the back.
    argument :name, types.String, "Enter your name here"
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      # A way to log into the server terminal
      # Rails.logger.info ctx.query
      # Rails.logger.info obj.inspect
      "Hello #{args.name}!"
    }
  end

  field :author, Types::AuthorType do
    argument :id, types.ID
    description "One Author"
    resolve -> (obj, args, ctx) {
      Author.where(id: args.id).first
    }
  end

 #  a silly name, but a way for me to remember that queries can be given custom names
 field :all_authors_is_dope, types[Types::AuthorType] do
   description 'Retrieves all authors'
   resolve -> (_, _, _) { Author.all }
 end


  # doesnt work because data is actuall in the db
  # field :specific_pub_year, types[Types::AuthorType] do
  #   argument :publication_years, types.Int, "Enter the desired publication year"
  #   description 'Retrieves authors by publication year'
  #   resolve -> (_, args, _) {
  #     Author.where(publication_years: args.publication_years)
  #   }
  # end
end

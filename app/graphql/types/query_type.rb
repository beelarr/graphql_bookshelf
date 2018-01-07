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
    argument :first_name, types.String
    description "One Author"
    resolve -> (obj, args, ctx) {
      Author.where(first_name: args.first_name).first
    }
  end
end

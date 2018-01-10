Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # function is stored in the Mutations - create_author.rb
  field :createAuthor, Types::AuthorType do
    argument :author, Types::AuthorInputType
    resolve ->(_, args, _) do
      is_public true
      Author.create args[:author].to_h
    end
  end


  field :deleteAuthor, function: Mutations::DeleteAuthor.new

  field :logout, types.Boolean do
    is_public true

    resolve -> (_, _, c) { Session.where(key: c[:session_key]).destroy_all }
  end

end


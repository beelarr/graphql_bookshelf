Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  description 'All items from our db that can be created, updated, and deleted.'

  # function is stored in the Mutations - create_author.rb
  field :createAuthor, Types::AuthorType do
    argument :author, Types::AuthorInputType
    resolve ->(_, args, _) do
      is_public true
      Author.create args[:author].to_h
    end
  end

  field :updateAuthor, Types::AuthorType do
    argument :id, types.ID
    argument :author, Types::AuthorInputType
    resolve -> (_, args, _) do
      is_public true
      author = Author.find(args[:id])
      author.try :update, args[:author].to_h
      author
    end
  end

  field :deleteAuthor, Types::AuthorType do
    argument :id, types.ID
    type types.Boolean
    resolve -> (_, args, _) do
      is_public true

      author = Author.find(args[:id])
      # !! converts nil to false
      !!author.destroy
    end
  end

  field :logout, types.Boolean do
    is_public true
    resolve -> (_, _, c) { Session.where(key: c[:session_key]).destroy_all }
  end
end


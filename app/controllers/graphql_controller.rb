class GraphqlController < ApplicationController

  before_action :check_authentication






  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: @session.try(:user),
      session_key: @session.try(:key)
    }
    result = Bookshelf2Schema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def check_authentication
    # parses query
    parsed_query = GraphQL::Query.new Bookshelf2Schema, params[:query]
    # returns operation ie. author or user
    operation = parsed_query.selected_operation.selections.first.name

    # allow our schema / docs in graphiql to display even if a method isn't public
    return true if operation is "__schema"

    field = Bookshelf2Schema.query.fields[operation] || Bookshelf2Schema.mutation.fields[operation]
    return true if field.metadata[:is_public]


    unless @session = Session.where(key: request.headers["Authorizaton"]).first
      # returns http 401 error
      head(:unauthorized)
      # prevents execute
      false
    end
  end
end

class GraphqlController < ApplicationController

  before_action :check_authentication






  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: @session.user
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
    # checks to see if that field has a is_public metadata flag
    return true if Bookshelf2Schema.query.fields[operation].metadata[:is_public]


    unless @session = Session.where(key: request.headers["Authorizaton"]).first
      # returns http 401 error
      head(:unauthorized)
      # prevents execute
      false
    end
  end
end

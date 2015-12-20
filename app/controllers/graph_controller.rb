class GraphController < ApplicationController
  def index
    render json: ::GraphSchema.execute(query_params)
  end

  def query_params
    params.fetch(:query)
  end
end

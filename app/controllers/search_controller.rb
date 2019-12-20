class SearchController < ApplicationController
  def index
    render locals: {
      search: NrelSearch.new(params[:location])
    }
  end
end

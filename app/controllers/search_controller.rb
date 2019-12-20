class SearchController < ApplicationController
  def index
    render locals: {
      search: NrelSearch.new(params[:location]),
      google: GoogleSearch.new(params[:location], NrelSearch.new(params[:location]).station.address)
    }
  end
end

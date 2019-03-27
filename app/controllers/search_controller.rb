class SearchController < ApplicationController
  def index
    zip = params[:q]
    render locals: {
                    facade: SearchFacade.new(zip)
                    }
  end
end

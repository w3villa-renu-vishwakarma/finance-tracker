class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock && @stock.name
        flash.now[:notice] = "Stock found successfully"
      else
        flash.now[:alert] = "No stock found with the given symbol"
      end
    else
      flash.now[:alert] = "Please enter a valid symbol to search"
    end
    respond_to do |format|
      format.js
    end
  end
  
end

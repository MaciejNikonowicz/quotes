class QuotesController < ApplicationController
    # index method for listing all the quotes on main page
    def index 
        @quotes = Quote.all
    end

     # method for showing a single detailed quote
     def show
        @quote = Quote.find(params[:id])
    end

    # method for initializing new quote
    def new
        @quote = Quote.new
    end

    # method for handling quotes creation from data passed in new form
    def create
        @quote = Quote.new(quote_params)

        if(@quote.save)
            redirect_to @quote
        else
            render 'new' 
        end
    end

    # method for quote edition
    def edit
        @quote = Quote.find(params[:id])
    end

    # method for update from edition form
    def update
        @quote = Quote.find(params[:id])

        if(@quote.update(quote_params))
            redirect_to @quote
        else
            render 'edit'
        end
    end

    # method for deleting quotation
    def destroy 
        @quote = Quote.find(params[:id])
        @quote.destroy
        
        redirect_to quotes_path
    end

    # method for quote params to be passed
    private def quote_params
        params.require(:quote).permit(:title, :body)
    end
end

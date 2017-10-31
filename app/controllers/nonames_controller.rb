class NonamesController < ApplicationController
    def index
        @nonames = Noname.all
    end
    
    def new
        @noname = Noname.new
    end


    def create
        @noname= Noname.create(noname_params)
        if @noname.invalid?
            flash[:error] = 'The data you entered is invalid.Could not save.'
        end
        redirect_to root_path
    end
    
    
    private
    def noname_params
        params.require(:noname).permit(:firstname, :lastname)   
    end
end

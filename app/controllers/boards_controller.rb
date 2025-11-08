class BoardsController < ApplicationController
    def index
        @boards = Board.includes(:user)
    end

    def new
        @board = Board.new
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
            flash[:success] = "Board created successfully."
            redirect_to boards_path
        else
            @boards = Board.includes(:user)
            render 'index'
        end
    end
end

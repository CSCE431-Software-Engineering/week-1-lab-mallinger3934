class TasksController < ApplicationController
  def index
    @books = Book.order(:position)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @count = Book.count
    @book = Book.new(position: @count + 1)
  end

  def create
    @book = Book.new(task_params)
    if @book.save
      flash[:notice] = "Book successfully created!"
      redirect_to tasks_path
    else
      #The 'new' action is NOT being called here
      #assign any instance variabbles needed
      @count = Book.count
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(task_params)
      redirect_to task_path(@book)
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to tasks_path
  end

  private 

  def task_params
    params.require(:book).permit(
      :name, 
      :position, 
      :completed, 
      :description
    )
  end
end

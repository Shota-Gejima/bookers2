class UsersController < ApplicationController

  def show
    
    @book = Book.new
    
    @user =User.find(params[:id])
    
    @books = @user.books
    
    @book_new = Book.new 
    
  end
  
  def cleate
  end
  
  def index
    
    @user = current_user
    
    @users = User.all
    
    @book_new = Book.new 
    
  end
  
  def edit
    
    @user = User.find(params[:id])
    
  end
  
  def update
    
    @user = User.find(params[:id])
    
    if @user.update(user_params)
    
      flash[:notice] = "You have updated user successfully."
    
      redirect_to user_path(@user.id)
    
    else
      
      render :edit
    
    
    end
  
  end
  
  def destroy
    
  
    
  end
end

private

def user_params
  
  params.require(:user).permit(:name, :introduction, :profile_image)
  
end
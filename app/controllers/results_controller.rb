class ResultsController < ApplicationController
  def show
    @user = User.find_by(email: params_search[:email])
    if @user.nil?
      flash[:errors] = ["User not found"]
      redirect_to :back
    end
  end
  def create
    # user = User.find(params_file[:user_id])
    # file = user.results.new({params_file[:file]})

    # uploader = ResultUploader.new
    # puts params[:file]
    # uploader.store!(params_file[:file])
    # puts uploader.retrieve_from_store!('file.jpeg')

      # if file.store!
      #   flash[:notice]="File was uploaded successfully"
      #   redirect_to :back
      # else
      #   flash[:errors] = ["File was uploaded unsuccesfully"]
      # redirect_to :back
      # end
      # file = Result.new
      # file.file=params[:file]
      # file.save!
      @result = Result.new(params_file)
    
      if @result.save!
        p @result.file.url
        redirect_to results_path, notice: "The result #{@result.user_id}"
      else
        p @result
        render "new"
      end
  end
  private
    def params_search
      params.require(:user).permit(:email)
    end
    def params_file
      params.require(:result).permit(:user_id, :attachment)
    end
end

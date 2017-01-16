class ResultsController < ApplicationController
  def show
    @user = User.find_by(email: params_search[:email])
    if @user.nil?
      flash[:errors] = ["User not found"]
      redirect_to :back
    end
  end
  def create

      @result = Result.new(params_file)
    
      if @result.save!
        p @result.attachement.url
		  flash[:notice]= "File has been uploaded successfullys"
        redirect_to new_user_pat, notice: "The result #{@result.user_id}"
      else
        
        redirect_to new_user_path
      end
  end
	def download
		result = Result.find(params[:id])
		if result.user_id == current_user.id
			send_file("#{result.attachment}")
		else
			flash[:errors]=["File not found please contact your administrator"]
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

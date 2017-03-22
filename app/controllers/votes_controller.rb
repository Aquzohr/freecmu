class VotesController < ApplicationController
  def create
    if current_user && params[:sub_id]
      @subject = Subject.find_by_id(params[:sub_id])
      if @subject && !current_user.voted?(@subject)
        @subject.votes.create({user_id: current_user.id})
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'Subject was successfully Vote.' }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'Your vote cannot be saved. Have you already voted?' }
          format.json { head :no_content }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Your vote cannot be saved.' }
        format.json { head :no_content }
      end
    end
  end
end
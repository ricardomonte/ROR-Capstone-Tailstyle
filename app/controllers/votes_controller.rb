class VotesController < ApplicationController
  def create
    vote = current_user.votes.build(params.require(:votes).permit(:article_id))
    art = Article.find(vote.article_id)
    if art.received_votes.include?(current_user)
      flash[:notice] = "You already vote for this article"
      redirect_back(fallback_location: root_path)
    else
      vote.save
      flash[:notice] = "Thank you for your vote"
      redirect_to root_path
    end
  end
end
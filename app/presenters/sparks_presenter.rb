class SparksPresenter

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def user
    @user ||= User.find_by_slug(params[:user_slug])
  end

  def page_title
    if params[:user_slug]
      "SPARKS FOR #{user.display_name.upcase}"
    else
      "SPARKS TAGGED: #{params[:tag].upcase}"
    end
  end

  def sparks
    if params[:user_slug]
      user.sparks
    else
      Spark.tagged_with(params[:tag])
    end
  end

  def page_type
    "user" if params[:user_slug]
  end

end

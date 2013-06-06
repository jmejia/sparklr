module ApplicationHelper

  def link_to_actions(page_type, spark)
    if page_type == "user"
      link_to 'Edit', edit_spark_path(:user_slug => spark.user.slug, :id => spark.id), class: 'btn btn-small btn-success'
    else
      link_to 'Visit User Page', "/#{spark.user.slug}"
    end
  end

  def update_button(page_type)
    if page_type == "user"
      link_to "Update From Dropbox", update_from_dropbox_path, method: :put, class: 'btn btn-primary'
    end
  end

  def formatted_date(date)
    date.strftime("%D at %I:%M %p")
  end
end

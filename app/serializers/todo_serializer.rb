include Rails.application.routes.url_helpers
class TodoSerializer < ApplicationSerializer
  # Attributes to expose in the "attributes" json object
  attributes :id, :detail, :done

  # Links to expose in the links section of json object
  link :self do
    todo_url(object)
  end
  link :list do
    list_url(object[:list_id])
  end
end

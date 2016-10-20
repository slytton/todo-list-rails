include Rails.application.routes.url_helpers
class ListSerializer < ApplicationSerializer
  # Whitelist attributes for api
  attributes :id, :title, :description

  # Whitelist links for api
  link :self do
    list_path(object)
  end
  link :lists do
    lists_path()
  end
  link :todos do
    list_todos_path(object)
  end
end

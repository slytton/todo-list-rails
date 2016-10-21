include Rails.application.routes.url_helpers
class ListSerializer < ApplicationSerializer
  # Whitelist attributes for api
  attributes :id, :title, :description

  # Whitelist links for api
  link :self do
    list_url(object)
    list_url(object)
  end
  link :lists do
    lists_url()
  end
  link :todos do
    list_todos_url(object)
  end
end

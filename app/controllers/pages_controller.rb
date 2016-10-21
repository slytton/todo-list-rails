class PagesController < ApplicationController
  def root
    render json: {links: {api: root_url}}
  end

  def api
    render json: {links: {v1: root_url + "/v1"}}
  end

  def version_resources
    render json: {links: {lists: root_url() + "/v1/lists"}}
  end
end

# apis controller
module Apis
  class ApiController < ApplicationController
    skip_before_action :authenticate_user!
    protect_from_forgery with: :null_session
    before_action :set_params_hash, if: :request_is_get?

    def request_is_get?
      request.method == "GET" && !params["params"].nil?
    end

    def request_is_valid_post?
      request.method == "POST" && !except_params.nil?
    end

    def except_params
      params.except(:action,
                    :controller).empty?
    end

    def render_403(response)
      render json: {
        status: 403,
        message: response.errors.messages
      }
    end

    def mandatory_keys(method_name)
      diff = method_name - params.except(:action, :controller).keys
      [!(diff & method_name).empty?, diff]
    end

    private

    def set_params_hash
      splitted_params = params[:params].split("/")
      Hash[splitted_params.each_slice(2).to_a].each do |key, value|
        params[key.to_sym] = value
      end
      params.delete("params")
    end
  end
end
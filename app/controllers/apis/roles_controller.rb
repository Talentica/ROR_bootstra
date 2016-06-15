module Apis
  class RolesController < ApiController
    def add_roles
      response = ExistingRole.create(name: params[:name]) # if request_is_valid_post?
      if response.errors.any?
        render_403(response)
      else
        render json: {
          status: 200,
          message: "Role Created",
          created_role: response.name
        }
      end
    end

    def index
      response = ExistingRole.display_roles
      if response.count == 0
        existing_role = "No Roles found"
        status = 404
      else
        status = 200
        existing_role = response
      end
      render_index(status, existing_role)
    end

    def update
      unless params.key?("id") && params.key?("name")
        render_update("id = #{params[:id]} or name = #{params[:name]}are missing")
        return
      end
      response = ExistingRole.update_resource(params)
      render_update(response)
    end

    private

    def render_index(status, existing_role)
      render json: {
        status: status,
        roles_available: existing_role
      }
    end

    def render_update(response)
      render json: {
        response: response
      }
    end
  end
end
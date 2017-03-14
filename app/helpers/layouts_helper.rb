module LayoutsHelper
  # Use resource names instead of id's in the breadcrumb
  # path.
  # @param [String] path The uri path of the request to build
  #   the crumb for.
  # @return [String] A string formatted as a breadcrumb.
  def create_breadcrumbs(path)
    path_array = path.split('/')
    puts path

    root_controller = path_array[1]
    root_resource = path_array[2]
    child_controller = path_array[3]
    child_resource = path_array[4]

    crumb = []

    if root_controller
      crumb << root_controller.titleize
    end

    if root_resource
      crumb << get_resource(root_resource, root_controller)
    end

    if child_controller
      crumb << child_controller.titleize
    end

    if child_resource
      crumb << get_resource(child_resource, child_controller)
    end

    return '&nbsp;'.html_safe if crumb.empty?
    crumb.join(' / ')
  end

  private

  # Return the object described in the path given an
  # id and the record_type for instance /teams/10 would
  # be record_type=teams and id=10. Id is whatever is in
  # that space. It may be new, if so return 'New'
  # @param [String] id The id portion extracted from the uri
  # @param [String] record_type The record type extraced from the uri
  # @return [Ojbect,String] The object or a string 'New'
  def get_resource(id, record_type)
    return 'New' if id == 'new'
    instance_variable_get("@#{record_type.singularize}")
  end
end

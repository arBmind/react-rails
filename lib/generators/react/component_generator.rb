module React
  module Generators
    class ComponentGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path '../../templates', __FILE__
      desc 'Scaffold a react component in app/assets/javascripts/components'

      # TODO: Options: skip_jsx, javascript_engine, etc.
      def create_component_file
        extension = "js.jsx"
        file_path = File.join('app/assets/javascripts/components', "#{file_name}.#{extension}")
        template("component.#{extension}", file_path)
      end
    end
  end
end

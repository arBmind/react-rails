module React
  module Generators
    class ComponentGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path '../../templates', __FILE__
      desc 'Scaffold a react component in app/assets/javascripts/components'

      argument :attributes, :type => :array, :default => [], :banner => "field[:type] field[:type] ..."

      # TODO: Options: skip_jsx, javascript_engine, etc.
      def create_component_file
        extension = "js.jsx"
        file_path = File.join('app/assets/javascripts/components', "#{file_name}.#{extension}")
        template("component.#{extension}", file_path)
      end

      private
      # optionalArray: React.PropTypes.array
      # optionalBool: React.PropTypes.bool
      # optionalFunc: React.PropTypes.func
      # optionalNumber: React.PropTypes.number
      # optionalObject: React.PropTypes.object
      # optionalString: React.PropTypes.string

      # optionalrenderable: React.PropTypes.renderable

      # optionalComponent: React.PropTypes.component

      # optionalMessage: React.PropTypes.instanceOf(Message)

      # optionalEnum: React.PropTypes.oneOf(['A', 'B'])

      # optionalUnion: React.PropTypes.oneOfType([
      #   React.PropTypes.string
      #   React.PropTypes.number
      #   React.PropTypes.instanceOf(Message)
      # ])

      # optionalArrayOf: React.PropTypes.arrayOf(React.PropTypes.number)

      # optionalObjectOf: React.PropTypes.objectOf(React.PropTypes.number)

      # optionalObjectWithShape: React.PropTypes.shape({
      #   color: React.PropTypes.string
      #   fontSize: React.PropTypes.number
      # })

      # requiredFunc: React.PropTypes.func.isRequired

      # requiredAny: React.PropTypes.any.isRequired

      # customProp: function(props, propName, componentName) {
      #   if( !/matchme/.test(props[propName])) {
      #     return new Error('Validation Failed!');
      #   }
      # }
       REACT_PROP_TYPES = {
         nil => 'renderable',
         bool: 'bool',
         string: 'string',
         number: 'number',
         object: 'object',
         array: 'array',
         shape: 'shape',
         component: 'component',
         func: 'func'
       }

       def parse_attributes!
         self.attributes = (attributes || []).map do |attr|
           name, type = attr.split(':')
           key = type.try(:to_sym)
           react_prop_type = REACT_PROP_TYPES[key] || type
           { :name => name, :type => react_prop_type }
         end
       end
    end
  end
end

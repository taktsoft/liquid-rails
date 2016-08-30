# Class to be used as a Liquid File System for the `include` tag
# (so only for liquid partials)
module Liquid
  module Rails
    class ResolverSystem
      # Return a valid liquid template string for requested partial path
      def read_template_file(template_path, context)
        controller = context.registers[:controller]

        controller_path = controller.controller_path
        template_path   = "#{controller_path}/#{template_path}" unless template_path.include?('/')

        name = template_path.split('/').last
        prefix = template_path.split('/')[0...-1].join('/')

        result = controller.lookup_context.find_all(name, prefix, true)

        if result.present?
          result.first.source.force_encoding("UTF-8") # cast to utf8 as it was getting encoding errors
        else
          raise FileSystemError, "No such template '#{template_path}'"
        end
      end
    end
  end
end

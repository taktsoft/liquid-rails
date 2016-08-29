module Liquid
  module Rails
    module Rspec
      module ViewControllerContext
        extend ActiveSupport::Concern

        def setup_view_and_controller
          @view                 = ActionView::Base.new
          @controller           = ApplicationController.new
          @request              = build_request_for_liquid
          @response             = build_response_for_liquid
          @response.request     = @request
          @controller.request   = @request
          @controller.response  = @response
          @controller.params    = {}
          @view.assign_controller(@controller)
          @view.class.send(:include, @controller._helpers)
          @view.class.send(:include, ::Rails.application.routes.url_helpers)
        end

        def view
          @view
        end

        def controller
          @controller
        end

        def context(assigns={})
          @context ||= ::Liquid::Context.new(assigns, {}, { helper: @view, view: @view, controller: @controller })
        end

        def expect_template_result(template, expected, assigns={})
          # make assigns available inside context
          assigns.each do |key, value|
            context[key] = value
          end

          actual = Liquid::Template.parse(template).render!(context)
          expect(actual.to_s.strip).to eq(expected.to_s.strip)
        end

        private

        def build_request_for_liquid
          if ::Rails::VERSION::MAJOR < 5
            ActionController::TestRequest.new({'PATH_INFO' => '/'})
          else
            ActionController::TestRequest.new({'PATH_INFO' => '/'}, {})
          end
        end

        def build_response_for_liquid
          if ::Rails::VERSION::MAJOR < 5
            ActionController::TestResponse.new
          else
            ActionDispatch::TestResponse.new
          end
        end
      end
    end
  end
end
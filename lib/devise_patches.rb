# frozen_string_literal: true

# Patches to support Devise on Rails 7+
module DevisePatches
  ActiveSupport::Dependencies.instance_eval do
    def constantize(name)
      name.constantize
    end

    def reference(_); end
  end
end

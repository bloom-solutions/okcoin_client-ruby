module OkcoinClient
  if not Dry::Validation.const_defined?("Schema")
    class BaseRequestSchema < Dry::Validation::Contract

      params do
        required(:key).filled(:string)
        required(:secret).filled(:string)
      end

    end
  end
end

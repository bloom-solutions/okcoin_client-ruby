module OkcoinClient
  if not Dry::Validation.const_defined?("Schema")
    GetOrdersRequestSchema = BaseRequestSchema
  end
end

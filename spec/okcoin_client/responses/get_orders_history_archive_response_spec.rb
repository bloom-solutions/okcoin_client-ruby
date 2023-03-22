require "spec_helper"

module OkcoinClient
  RSpec.describe GetOrdersHistoryArchiveResponse do

    describe "#success" do
      context "empty data body" do
        let(:response) { described_class.new }
        let(:empty_response) { described_class.new }

        it "fails" do
          json = {
            data: { client_oid: "" }
          }.with_indifferent_access
          response.parsed_body = json
          response.raw_response = double(Typhoeus::Response, success?: true)
          expect(response).to be_success

          empty_response.parsed_body = {}
          empty_response.raw_response = double(Typhoeus::Response, {
            success?: true,
          })
          expect(empty_response).not_to be_success
        end
      end

      context "errors exist" do
        let(:response) { described_class.new(error_message: "something") }
        subject { response.success }

        it { is_expected.to be false }
      end
    end

    describe "#orders" do
      context "parsed body contains errors" do
        let(:response) { described_class.new(parsed_body: parsed_body) }
        let(:parsed_body) do
          [ ["error_message", "The currency pair does not exist"] ]
        end

        it "is empty" do
          expect(response.orders).to be_empty
        end
      end
    end

  end
end

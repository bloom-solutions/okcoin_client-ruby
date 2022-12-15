require 'spec_helper'

module OkcoinClient
  RSpec.describe BaseResponse do

    describe "#error_message" do
      subject { response.error_message }

      context "#parsed_body is nil" do
        let(:response) { described_class.new(parsed_body: nil) }

        it { is_expected.to eq "response empty; no error present" }
      end

      context "#parsed_body is empty" do
        let(:response) { described_class.new(parsed_body: []) }

        it { is_expected.to eq "response empty; no error present" }
      end

      context "error is in parsed body" do
        let(:response) do
          described_class.new(parsed_body: [
            ["error_message", "The currency pair does not exist"],
            # NOTE: only seen 1 error in the wild, but coding for multiple
            ["error_message", "some other error"],
          ])
        end

        it do
          is_expected.to eq "The currency pair does not exist; some other error"
        end
      end
    end

  end
end

module Contracts
	describe Response do
		describe '#instantiate' do
			let(:generated_body) { double('generated body') }
			let(:definition) do
				{
					'status' => 200,
					'headers' => {},
					'body' => double('definition body')
				}
			end

			it 'should instantiate a response with a body that matches the given definition' do
				JSON::Generator.should_receive(:generate).
					with(definition['body']).
					and_return(generated_body)

				response = described_class.new(definition).instantiate
				response.status.should == definition['status']
				response.headers.should == definition['headers']
				response.body.should == generated_body
			end
		end
	end
end
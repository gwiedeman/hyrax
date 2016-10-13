require 'spec_helper'

RSpec.describe CurationConcerns::Workflow::DeactivateObject do
  let(:work) { instance_double(GenericWork) }
  let(:entity) { instance_double(Sipity::Entity, id: 9999, proxy_for: work) }
  let(:user) { User.new }

  subject do
    described_class.call(entity: entity,
                         comment: "A pleasant read",
                         user: user)
  end

  describe "#call a real service" do
    it "makes it active" do
      expect(work).to receive(:state=).with(Vocab::FedoraResourceStatus.inactive)
      subject
    end
  end
end

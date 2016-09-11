require 'rails_helper'

RSpec.describe PaymentsController do
  let(:user) { create :user }

  before { sign_in user }

  #describe 'GET #show' do
  #  let(:student) { create :student }
  #  subject { get :show, id: student.id }

  #  it_behaves_like 'template rendering action', :show
  #end

  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end
end

require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { question = create(:question) }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves a new answer in the DB' do
        expect { post :create, params: { answer: attributes_for(:answer), question_id: question } }.to change(question.answers, :count).by(1)
      end
      it 'redirects to show view' do
         post :create, params: { answer: attributes_for(:answer), question_id: question }
         expect(response).to redirect_to assigns(:question)
      end
    end

    context 'with invalid attributes' do
      it 'does not save a new answer in the DB' do
        expect { post :create, params: { answer: attributes_for(:answer, :invalid), question_id: question } }.to_not change(question.answers, :count)
      end
      it 're-renders new view' do
        post :create, params: { answer: attributes_for(:answer, :invalid), question_id: question }
        expect(response).to render_template :new
      end
    end
  end
end

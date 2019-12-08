shared_examples 'allows showing AdverTypes' do
  before { get :index }

  it_behaves_like 'action via GET'

  it 'renders index template' do
    expect(response).to render_template(:index)
  end

  it 'assigns @adver_types' do
    expect(assigns(:adver_types)).to eq(adver_types)
  end
end

shared_examples 'allows rendering new form for AdverType' do
  before { get :new }

  it_behaves_like 'action via GET'

  it 'renders new template' do
    expect(response).to render_template(:new)
  end
end

shared_examples 'allows creating AdverType' do
  context 'with valid data' do
    it 'creates new AdverType' do
      expect{
        post :create, params: valid_adver_type_data
      }.to change(AdverType, :count).by(1)
    end
  end

  context 'with invalid data' do
    it "doesn't create new AdverType" do
      expect{
        post :create, params: invalid_adver_type_data
      }.not_to change(AdverType, :count)
    end

    it 'renders new template' do
      post :create, params: invalid_adver_type_data

      expect(response).to render_template(:new)
    end 
  end
end

shared_examples 'allows editing AdverType' do
  before { get :edit, params: { id: adver_type.id } }

  it 'assigns @adver_type' do
    expect(assigns(:adver_type)).to eq(adver_type)
  end

  it 'renders edit template' do
    expect(response).to render_template(:edit)
  end
end

shared_examples 'allows updating AdverType' do
  context 'with valid_data' do
    it 'updates AdverType' do
      patch :update, params: { id: adver_type.id, adver_type: { name: 'GungoJungo' } }
  
      expect(AdverType.find(adver_type.id).name).to eq('GungoJungo')
    end
  end

  context 'with invalid data' do
    before {  patch :update, params: { id: adver_type.id, adver_type: { name: nil } } }

    it "doesn't update AdverType" do
      expect(AdverType.find(adver_type.id).name).not_to eq(nil)
    end

    it 'assigns @adver_type' do
      expect(assigns(:adver_type)).to eq(adver_type)
    end

    it 'renders edit template' do
      expect(response).to render_template(:edit)
    end
  end
end

shared_examples 'allows destroying when there are no advertisements of this type' do
  it 'destroys AdverType' do
    expect{
      delete :destroy, params: { id: adver_type.id }
    }.to change(AdverType, :count).by(-1)
  end
end

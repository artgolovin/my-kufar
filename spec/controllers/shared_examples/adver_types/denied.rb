shared_examples 'denies destroying AdverType when there are advertisements of that' do
  it "doesn't destroy adver_type" do
    expect{
      delete :destroy, params: { id: denied_to_destroy_adver_type.id }
    }.to_not change(AdverType, :count)
  end
end

shared_examples 'denies access to controller' do

  describe 'denies showing AdverTypes' do
    before { get :index }

    it "doesn't render index template" do
      expect(response).not_to render_template(:index)
    end

    it "doesn't assigns @adver_types" do
      expect(assigns(:adver_types)).to eq(nil)
    end
  end

  describe 'denies rendering new form for AdverType' do
    it "doesn't render new template" do
      get :new
      expect(response).not_to render_template(:new)
    end
  end

  describe 'denies creating AdverType' do
    it "doesn't create new AdverType" do
      expect{
        post :create, params: valid_adver_type_data
      }.not_to change(AdverType, :count)
    end
  end

  describe 'denies editing AdverType' do
    it "doesn't render edit template" do
      get :edit, params: { id: adver_type.id }
      expect(response).not_to render_template(:edit)
    end

    it "doesn't assigns @adver_type" do
      expect(assigns(:adver_type)).to eq(nil)
    end
  end

  describe 'denies updating AdverType' do
    it "doesn't change adver_type" do
      expect{
        patch :update, params: { id: adver_type.id, advertisement: { name: :GugoBungo } }
      }.to_not change{adver_type.name}.from(adver_type.name)
    end
  end

  describe 'denies destroying AdverType' do
    it "doesn't destroy adver_type" do
      expect{
        delete :destroy, params: { id: adver_type.id }
      }.to_not change(AdverType, :count)
    end
  end
end

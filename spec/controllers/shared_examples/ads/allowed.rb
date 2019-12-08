shared_examples 'allows GET index' do
  before { get :index }

  it_behaves_like 'action via GET'

  it 'assigns published advertisements' do
    expect(assigns(:ads)).to eq([published_advertisement])
  end

  it { is_expected.to render_template(:index) }
end

shared_examples 'allows GET show' do
  before { get :show, params: { id: published_advertisement.id } }

  it_behaves_like 'action via GET'

  it 'assigns published advertisement' do
    expect(assigns(:adver)).to eq(published_advertisement)
  end

  it { is_expected.to render_template(:show) }
end

shared_examples 'allows GET new' do
  before { get :new }

  it_behaves_like 'action via GET'

  it { is_expected.to render_template(:new) }
end

shared_examples 'allows GET edit' do
  context 'when advertisement exists' do
    before { get :edit, params: { id: draft_advertisement.id } }

    it_behaves_like 'action via GET'

    it { is_expected.to render_template(:edit) }

    it 'assigns advertisement' do
      expect(assigns(:adver)).to eq(draft_advertisement)
    end
  end

  context "when advertisement doesn't exist" do
    it "redirects to home page" do
      get :edit, params: { id: (Advertisement.all.size + 1) }
      expect(response).to redirect_to(:root)
    end
  end
end

shared_examples 'allows POST create' do
  context 'with valid data' do
    it 'redirects to dashboard' do
      post :create, params: valid_advertisement_data
      expect(response).to redirect_to(dashboard_ads_path(adver_status: :draft))
    end

    it 'creates new advertisement' do
      expect{
        post :create, params: valid_advertisement_data
      }.to change(Advertisement, :count).by(1)  
    end
  end

  context 'with invalid data' do
    it 'redirects to new' do
      post :create, params: invalid_advertisement_data
      expect(response).to render_template(:new)
    end

    it "doesn't create new advertisement" do
      expect{
        post :create, params: invalid_advertisement_data
      }.not_to change(Advertisement, :count)
    end
  end
end

shared_examples 'allows PATCH update' do
  context 'when advertisement exists' do
    context 'with valid data' do
      it "changes advertisement" do
        patch :update, params: { id: draft_advertisement.id,
                                 advertisement: { title: 'Updated Title' }
                               }
        expect(Advertisement.find(draft_advertisement.id).title).to eq('Updated Title')
      end

      it 'redirects to dashboard' do
        patch :update, params: { id: draft_advertisement.id,
                                advertisement: { title: 'Updated Title' }
                              }
        expect(response).to redirect_to(dashboard_ads_path(adver_status: :draft))
      end
    end

    context 'with invalid data' do
      it 'renders edit form' do
        patch :update, params: { id: draft_advertisement.id,
                                advertisement: { title: nil }
                              }
        expect(response).to render_template('edit')
      end

      it 'assigns advertisement to edit' do
        patch :update, params: { id: draft_advertisement.id,
                                 advertisement: { title: nil }
                               }
        expect(assigns(:adver)).to eq(draft_advertisement)
      end
    end
  end

  context "when advertisement doesn't exist" do
    it "redirects to home page" do
      patch :update, params: { id: (Advertisement.all.size + 1),
                              advertisement: { title: 'Updated Title' }
                            }
      expect(response).to redirect_to(:root)
    end
  end
end

shared_examples 'allows DELETE destroy' do
  context 'when advertisement exists' do
    it 'destroyes advertisement' do
      expect{
        delete :destroy, params: { id: published_advertisement.id }
      }.to change(Advertisement, :count).by(-1)
    end
  end

  context "when advertisement doesn't exist" do
    it "doesn't destroyes any advertisement" do
      expect{
        delete :destroy, params: { id: (Advertisement.all.size + 100) }
      }.not_to change(Advertisement, :count)
    end

    it 'redirects to home page' do
      delete :destroy, params: { id: (Advertisement.all.size + 100) }
      expect(response).to redirect_to(:root)
    end
  end
end

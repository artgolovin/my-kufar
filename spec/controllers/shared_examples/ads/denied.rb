shared_examples 'denies GET new' do
  it "doesn't render new view" do
    get :new
    expect(response).not_to render_template(:new)
  end
end

shared_examples 'denies POST create' do
  it "doesn't create new advertisement" do
    expect{
      post :create, params: valid_advertisement_data
    }.not_to change(Advertisement, :count)
  end
end

shared_examples 'denies GET edit' do
  it "doesn't render edit view" do
    get :edit, params: { id: draft_advertisement.id }
    expect(response).not_to render_template(:edit)
  end
end

shared_examples 'denies PATCH update' do
  it "doesn't change advertisement" do
    patch :update, params: { id: draft_advertisement.id,
                             advertisement: { title: 'Updated Title' }
                            }
    expect(draft_advertisement.title).not_to eq('Updated Title')
  end
end

shared_examples 'denies DELETE destroy' do
  it "doesn't delete any advertisement" do
    expect{
      delete :destroy, params: { id: draft_advertisement.id }
    }.not_to change(Advertisement, :count)
  end
end

shared_examples 'action via GET' do
  it { is_expected.to respond_with :ok }

  it 'responds with html' do
    expect(response.content_type).to eq 'text/html'
  end

  it { is_expected.to render_with_layout(:application) }
end

RSpec.describe AllController do
  it "allows :html format on all actions" do
    get all_html_1_path
    expect(response).to have_http_status(:ok)
    get all_html_2_path
    expect(response).to have_http_status(:ok)
  end

  it "blocks :json format on all actions" do
    get all_html_1_path(format: :json)
    expect(response).to have_http_status(:not_acceptable)
    get all_html_2_path(format: :json)
    expect(response).to have_http_status(:not_acceptable)
  end
end

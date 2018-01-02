RSpec.describe OnlyController do
  it "allows :html format on single html_1 method" do
    get only_html_1_path
    expect(response).to have_http_status(:ok)
  end

  it "blocks :json format on single html_1 method" do
    get only_html_1_path(format: :json)
    expect(response).to have_http_status(:not_acceptable)
  end

  it "allows :html format on html_2 and html_3 methods" do
    get only_html_multi_2_path
    expect(response).to have_http_status(:ok)
    get only_html_multi_3_path
    expect(response).to have_http_status(:ok)
  end

  it "blocks :json format on html_2 and html_3 methods" do
    get only_html_multi_2_path(format: :json)
    expect(response).to have_http_status(:not_acceptable)
    get only_html_multi_3_path(format: :json)
    expect(response).to have_http_status(:not_acceptable)
  end

  it "allows :html and :json on not_restricted method" do
    get only_not_restricted_path
    expect(response).to have_http_status(:ok)
    get only_not_restricted_path(format: :json)
    expect(response).to have_http_status(:ok)
  end
end

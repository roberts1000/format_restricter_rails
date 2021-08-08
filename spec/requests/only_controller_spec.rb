RSpec.describe OnlyController do
  it "allows :html format on single html1 method" do
    get only_html1_path
    expect(response).to have_http_status(:ok)
  end

  it "blocks :json format on single html1 method" do
    get only_html1_path(format: :json)
    expect(response).to have_http_status(:not_acceptable)
  end

  it "allows :html format on html2 and html3 methods" do
    get only_html_multi2_path
    expect(response).to have_http_status(:ok)
    get only_html_multi3_path
    expect(response).to have_http_status(:ok)
  end

  it "blocks :json format on html2 and html3 methods" do
    get only_html_multi2_path(format: :json)
    expect(response).to have_http_status(:not_acceptable)
    get only_html_multi3_path(format: :json)
    expect(response).to have_http_status(:not_acceptable)
  end

  it "allows :html and :json on not_restricted method" do
    get only_not_restricted_path
    expect(response).to have_http_status(:ok)
    get only_not_restricted_path(format: :json)
    expect(response).to have_http_status(:ok)
  end
end

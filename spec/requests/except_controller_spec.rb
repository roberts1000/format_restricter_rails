RSpec.describe ExceptController do
  it "allows :json and :xml on json_xml method" do
    get except_json_xml_path(format: :json)
    expect(response).to have_http_status(:ok)
    get except_json_xml_path(format: :xml)
    expect(response).to have_http_status(:ok)
    get except_json_xml_path(format: :html)
    expect(response).to have_http_status(:not_acceptable)
  end

  it "doesn't allow any formats when two expects overlap" do
    get except_no_allowed_formats_path(format: :json)
    expect(response).to have_http_status(:not_acceptable)
    get except_no_allowed_formats_path(format: :xml)
    expect(response).to have_http_status(:not_acceptable)
    get except_no_allowed_formats_path(format: :html)
    expect(response).to have_http_status(:not_acceptable)
  end

  it "allows :html format on html_1 method" do
    get except_html_1_path(format: :json)
    expect(response).to have_http_status(:not_acceptable)
    get except_html_1_path(format: :xml)
    expect(response).to have_http_status(:not_acceptable)
    get except_html_1_path(format: :html)
    expect(response).to have_http_status(:ok)
  end

  it "allows :html format on html_2 method" do
    get except_html_2_path(format: :json)
    expect(response).to have_http_status(:not_acceptable)
    get except_html_2_path(format: :xml)
    expect(response).to have_http_status(:not_acceptable)
    get except_html_2_path(format: :html)
    expect(response).to have_http_status(:ok)
  end
end

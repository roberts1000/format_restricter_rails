class ExceptController < ApplicationController
  restrict_formats_to :html, except: :json_xml
  restrict_formats_to :json, :xml, except: [:html1, :html2]

  def json_xml
  end

  def no_allowed_formats
  end

  def html1
  end

  def html2
  end
end

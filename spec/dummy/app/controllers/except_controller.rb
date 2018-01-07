class ExceptController < ApplicationController
  restrict_formats_to :html, except: :json_xml
  restrict_formats_to :json, :xml, except: [:html_1, :html_2]

  def json_xml
  end

  def no_allowed_formats
  end

  def html_1
  end

  def html_2
  end
end

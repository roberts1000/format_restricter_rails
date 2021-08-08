class OnlyController < ApplicationController
  restrict_formats_to :html, only: [:html1]
  restrict_formats_to :html, only: [:html_multi2, :html_multi3]

  def html1
  end

  def html_multi2
  end

  def html_multi3
  end

  def not_restricted
  end
end

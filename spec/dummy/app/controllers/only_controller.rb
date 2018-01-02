class OnlyController < ApplicationController
  restrict_formats_to :html, only: [:html_1]
  restrict_formats_to :html, only: [:html_multi_2, :html_multi_3]

  def html_1
  end

  def html_multi_2
  end

  def html_multi_3
  end

  def not_restricted
  end
end

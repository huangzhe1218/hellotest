# encoding: utf-8
class WeeksController < ApplicationController
  def data
    @weeks = Week.all
  end
end

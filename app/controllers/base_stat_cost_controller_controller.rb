class BaseStatCostControllerController < ApplicationController
  def index
    @stat = 'AD'
    @champions = [ {
      name: 'foo',
      stat: '50',
      cost: '123'
      } ]


  end

  def calculate
  end
end

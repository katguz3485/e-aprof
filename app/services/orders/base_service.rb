# frozen_string_literal: true

module Orders
  class BaseService
    attr_accessor :params

    def initialize(params = {})
      @params = params
    end
  end
end

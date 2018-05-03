# frozen_string_literal: true

class HealthChecksController < ApplicationController
	def readiness
		render plain: 'OK'
	end

	def liveness
		render plain: 'OK'
	end
end

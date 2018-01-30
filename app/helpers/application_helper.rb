module ApplicationHelper

	def decorate_revenue(value)
		number_to_currency(value, unit: "R$ ", locale: :br)
	end
end

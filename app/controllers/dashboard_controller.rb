class DashboardController < ApplicationController
  def index
    @sales_group_by_month = Sale.group_by_month(:created_at).sum(:amount)
    @sales_group_by_month_count = Sale.group_by_month(:created_at).count
    @sales_group_by_month_average = Sale.group_by_month(:created_at).average(:amount)
    @sales_group_by_origin = Coffe.joins(:sales).where('sales.created_at > ? ', 1.year.ago).group(:origin).count
    @sales_group_by_origin_two = Coffe.joins(:sales).where('sales.created_at > ? ', 6.month.ago).group(:origin).count
    @sales_group_by_origin_three = Coffe.joins(:sales).where('sales.created_at > ? ', 3.month.ago).group(:origin).count
    @sales_group_by_origin_last = Coffe.joins(:sales).where('sales.created_at > ? ', 1.month.ago).group(:origin).count
    @sales_group_by_blend = Coffe.left_outer_joins(:sales).where('sales.created_at > ? ', 1.year.ago).group(:blend).count
    @sales_group_by_blend_two = Coffe.left_outer_joins(:sales).where('sales.created_at > ? ', 6.month.ago).group(:blend).count
    @sales_group_by_blend_three = Coffe.left_outer_joins(:sales).where('sales.created_at > ? ', 3.month.ago).group(:blend).count
    @sales_group_by_blend_last = Coffe.left_outer_joins(:sales).where('sales.created_at > ? ', 1.month.ago).group(:blend).count
  end
end

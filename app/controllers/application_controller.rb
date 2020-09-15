class ApplicationController < ActionController::Base
  def current_visitor
    unless instance_variable_defined?(:@current_visitor)
      @current_visitor = existing_visitor || create_visitor!
    end
    Rails.logger.info @current_visitor
    Rails.logger.info session[:visitor_id]
    @current_visitor
  end

  private

  def existing_visitor
    return nil unless session[:visitor_id].present?
    Visitor.find_by(id: session[:visitor_id])
  end

  def create_visitor!
    Visitor.create!.tap do |visitor|
      session[:visitor_id] = visitor.id
    end
  end
end

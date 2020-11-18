module ApplicationHelper
  def model_attributes(klass)
    @model_attributes ||= klass.column_names.reject{|col| col.include?("_id") || col.include?("created_at") || col.include?("updated_at")}
  end
end

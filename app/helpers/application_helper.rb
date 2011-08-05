module ApplicationHelper
  def t_meta_interpolation(name, hash)
    instance_variable_set("@#{name}_interpolation", hash)
  end

  def t_meta(name)
    interpolation_data = instance_variable_get("@#{name}_interpolation") || {}

    t("meta.#{controller_path.gsub("/", ".")}.#{action_name}.#{name}",
      interpolation_data.merge({ :default => t("meta.defaults.#{name}") }))
  end
end


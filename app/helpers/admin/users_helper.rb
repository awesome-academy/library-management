module Admin::UsersHelper
  def select_option
    select = [{role: true, name: t("admin.admin")},
      {role: false, name: t("admin.user")}]
    options_for_select(select.collect{|s| [s[:name],s[:role]]})
  end
end

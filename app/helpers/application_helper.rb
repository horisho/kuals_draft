module ApplicationHelper
  def titling(title = "")
    title = "Kuals draft" if title.empty?
    return title
  end
end

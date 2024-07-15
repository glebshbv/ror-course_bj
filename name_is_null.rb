class NameIsNull < StandardError
  def initialize(msg = "Name cannot be empty.")
    super
  end
end

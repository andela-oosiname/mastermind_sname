class Integer
  def time_format
    mins = self / 60
    secs = self % 60
    "#{mins}m#{secs}s"
  end
end

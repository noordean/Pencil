class Array
  def pencil_sum(start = 0)
    inject(start, &:+)
  end
end

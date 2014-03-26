class Request < Sequel::Model(Sequel.lit('vRequestProcess'))
  def year
    DateTime.parse(date_created.to_s).year
  end

  def date_created_human
    date_created.strftime("%b %d %y")
  end

  def file_number
    num = @values[:requestnumber].to_s.rjust(3, '0')
    "#{year}-#{num}"
  end

  def to_hash
  end

  def to_liquid
    {
      "file_number" => file_number,
      "date_created" => date_created_human
    }
  end

  private

  def date_created
    DateTime.parse(@values[:datecompletereceived].to_s)
  end
end



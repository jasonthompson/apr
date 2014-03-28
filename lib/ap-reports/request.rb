require 'to_latex'

class Request < Sequel::Model(Sequel.lit('vRequestProcess'))
  DATE_FORMAT = ("%b %d, %Y")
  def year
    DateTime.parse(date_created.to_s).year
  end

  def date_created_human
    date_created.strftime(DATE_FORMAT)
  end

  def date_closed_human
    closed? ? date_closed.strftime(DATE_FORMAT) : "Ongoing"
  end

  def date_due_human
    date_due.strftime(DATE_FORMAT)
  end

  def file_number
    num = @values[:requestnumber].to_s.rjust(3, '0')
    "#{year}-#{num}"
  end

  def summary
    @values[:summary].to_latex
  end

  def date_due
    @values[:processdatedue]
  end

  def date_closed
    @values[:processdateclosed]
  end

  def closed?
    date_closed != nil
  end

  def to_liquid
    {
      "file_number" => file_number,
      "date_created" => date_created_human,
      "date_due" => date_due_human,
      "date_closed" => date_closed_human,
      "closed?" => closed?,
      "summary" => summary
    }
  end

  private

  def date_created
    DateTime.parse(@values[:datecompletereceived].to_s)
  end
end



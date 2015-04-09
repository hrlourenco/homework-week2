class Email
  #contrutor
  def initialize(subject, date, from)
    @subject = subject
    @date = date
    @from = from
  end

  #propriedade subject
  def subject
    @subject
  end

  #propriedade date
  def date
    @date
  end

  #propriedade from
  def from
    @from
  end
end

email = Email.new("teste","01-01-2000", "hugo@sdsd.pt")

puts "Date:   #{email.date}"
puts "From:   #{email.from}"
puts "Subject #{email.subject}"


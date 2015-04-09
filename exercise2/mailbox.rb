class Email
  #definir o contrutor da classe
  def initialize(subject, headers)
    @subject = subject
    @headers = headers
  end

  #propriedade subject
  def subject
    @subject
  end

  #propriedade date
  def date
    @headers[:date]
  end

  #propriedade from
  def from
    @headers[:from]
  end

end

class Mailbox
  def initialize(name, emails)
    @name = name
    @email = emails
  end

  def email
    @email
  end
end

email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"
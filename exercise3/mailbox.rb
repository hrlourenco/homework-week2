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

class MailboxTextFormatter
  # fill in this class body
  def initialize(mailbox)
    @mailbox = mailbox
  end

  def mailbox
    @mailbox
  end

  #format
  def format
    lines = [
        header,
        rows,
        printlastrow
    ]
  end

  #cabecalho a apresentar
  def header
    puts "+" + '-' * 11 + "+" + '-' * (maxsizefrom_subject[0].to_i + 2) + "+" + '-' * (maxsizefrom_subject[1].to_i + 2) + '+'
    puts "| DATE " + ' ' * 5 + "| FROM " + ' ' * (maxsizefrom_subject[0].to_i - 4) + "| SUBJECT" + ' ' * (maxsizefrom_subject[1]-6) + '|'
    puts "+" + '-' * 11 + "+" + '-' * (maxsizefrom_subject[0].to_i + 2) + "+" + '-' * (maxsizefrom_subject[1].to_i + 2) + '+'
  end

  def printlastrow
    puts "+" + '-' * 11 + "+" + '-' * (maxsizefrom_subject[0].to_i + 2) + "+" + '-' * (maxsizefrom_subject[1].to_i + 2) + '+'
  end

  #definir o tamanho maximo do from
  def maxsizefrom_subject
    f = 0
    s = 0
    mailbox.email.each do |email|
      if(email.from.bytesize > f)
        f=email.from.bytesize
      end
      if(email.subject.bytesize > s)
        s=email.subject.bytesize
      end
    end
    return f, s
  end

  def rows
    mailbox.email.each do |email|
      puts "|#{email.date} | #{email.from.ljust(maxsizefrom_subject[0])} | #{email.subject.ljust(maxsizefrom_subject[1])}" + ' |'
    end
  end
end

emails = [
    Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
    Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
    Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format
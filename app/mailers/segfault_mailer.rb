class SegfaultMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_segfault
    mail(to: '%01.999999f', subject: 'weeeee')
  end
end

class SendmailController < ApplicationController
  def index
    SegfaultMailer.send_segfault.deliver
    render text: "wat"
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end
end

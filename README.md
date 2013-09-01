#Ruby Segfault Sample

This is just a sample Rails app to demonstrate a ruby bug. Ruby will
segmentation fault when you specify too high of a precision with string float
interpolation. For example, this code will cause a segfault:

```ruby
puts "%01.99999f" % 10
```

This can be caused by a user in cases where you mix both types of string
interpolation. For example, see this code using user input:

```ruby
x = gets
puts "#{x} world %f" % 10
```

In normal cases, this would print something like "hello world 10". But the
user can enter %01.99999f as the input, and cause a segmentation fault.

There is one similar such case in the action_mailer source. See the method
`ActionMailer::LogSubscriber.deliver`, which will be called in any application
with the `config.logger` set.

```ruby
def deliver(event)
  recipients = Array.wrap(event.payload[:to]).join(', ')
  info("\nSent mail to #{recipients} (%1.fms)" % event.duration)
  debug(event.payload[:mail])
end
```

In this case, if the user could have the system send an email to them, they
could enter their email as something containing '%01.99999f', and cause the
application to segfault.

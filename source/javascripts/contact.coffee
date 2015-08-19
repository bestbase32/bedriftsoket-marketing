$ ->
  $('#contact-form').submit (e) ->
    e.preventDefault()
    name = $('#name').val()
    email = $('#email').val()
    message = $('#message').val()
    data = 
      To: 'kundeservice@bedriftsoket.no'
      Subject: "New contact from Customer: #{name}"
      TextBody: message
      email: email
      TrackOpens: true

    console.log name
    console.log email
    console.log message

    $.ajax
      url: '/mailer/send'
      dataType: 'json'
      type: 'POST'
      data: data

      beforeSend: (xhr, settings) =>
        $(this).find('input, textarea').attr('disabled', true)
        $(this).find('button').text('Sending...')

      complete: (data, textStatus, xhr) =>
        $(this).find('input, textarea').val('')
        $(this).find('button').text("Message Sent!").delay(1000)
        $(this).find('input, textarea').attr('disabled', false)
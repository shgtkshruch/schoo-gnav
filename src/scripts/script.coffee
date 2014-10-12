$ ->
  themeNow = 'biz'
  themeNext = ''

  $select = $ '#js-theme'
  $body = $ 'body'
  $header = $ '#js-change'

  $select.change (e) ->
    themeNext = e.target.value
    $body.toggleClass theme for theme in [themeNow, themeNext]
    replaceImg img for img in $ 'img'
    themeNow = themeNext
    removeEl()

  replaceImg = (img) ->
    src = img.src
    if src.indexOf(themeNow) isnt -1
      img.src = src.replace themeNow, themeNext

  removeEl = ->
    $header
      .children()
      .remove()

    insertEl()

  insertEl = ->
    switch themeNow
      when 'biz' then biz()
      when 'dog' then dog()
      when 'htl' then htl()

  biz = ->

  dog = ->

  htl = ->

  handle = ->
    source = $('.handle').html()
    console.log source
    template = Handlebars.compile source
    context = {test: 'from javascript'}
    html = template context

  handle()

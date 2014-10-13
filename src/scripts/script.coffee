$ ->
  themeNow = themeNext = 'biz'

  $select = $ '#js-theme'
  $body = $ 'body'
  $header = $ '#js-change'

  $select.change (e) ->
    themeNext = e.target.value
    $body.toggleClass theme for theme in [themeNow, themeNext]
    remove()
    replaceImg img for img in $ 'img'
    importHeader()
    themeNow = themeNext

  replaceImg = (img) ->
    img.src = img.src.replace themeNow, themeNext

  remove = ->
    $header.children().remove()

  importHeader = ->
    theme = 'link[rel="import"][href*="' + themeNext + '"]'
    content = $('html').find(theme)[0].import
    $el = $(content).find '.line'
    $header.append  $el.clone()

  importHeader()

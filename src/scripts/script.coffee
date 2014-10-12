$ ->
  themeNow = themeNext = 'biz'
  htmlCache = {}

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
    src = img.src
    if src.indexOf(themeNow) isnt -1
      img.src = src.replace themeNow, themeNext

  remove = ->
    $header
      .children()
      .remove()

  importHeader = ->
    if not htmlCache.hasOwnProperty themeNext
      theme = 'link[rel="import"][href*="' + themeNext + '"]'
      link = document.querySelector theme
      content = link.import

      el = content.querySelectorAll '.line'
      htmlCache[themeNext] = el
    else 
      el = htmlCache[themeNext]

    $header.append el

  importHeader()

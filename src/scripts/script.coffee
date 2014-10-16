themeNow = themeNext = 'biz'
select = document.querySelector '#js-theme'
body   = document.querySelector 'body'
header = document.querySelector '#js-change'

window.onload = ->
  select.addEventListener 'change', (e) -> 
    themeNext = e.target.value
    changeTheme themeNext

  changeTheme themeNext
  tutorial()

changeTheme = (themeNext) ->
  body.classList.toggle theme for theme in [themeNow, themeNext]
  header.removeChild node for node in document.querySelectorAll '#js-change > *'
  replaceImg img for img in document.querySelectorAll 'img'
  importHeader()
  themeNow = themeNext

replaceImg = (img) ->
  img.src = img.src.replace themeNow, themeNext

importHeader = ->
  id = '#temp-' + themeNext
  t = document.querySelector id
  clone = document.importNode t.content, true
  header.appendChild clone

tutorial = ->
  bg = document.createElement 'div'
  bg.classList.add 't-bg'
  el = body.appendChild bg
  select.parentElement.classList.add 'tutorial'

  remove = ->
    if body.querySelector '.t-bg'
      body.removeChild el
      select.parentElement.classList.remove 'tutorial'
      window.removeEventListener 'click', remove

  window.addEventListener 'click', remove

  setTimeout(-> 
    remove()
  , 5000)

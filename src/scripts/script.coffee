themeNow = themeNext = 'biz'
select = document.querySelector '#js-theme'
body   = document.querySelector 'body'
header = document.querySelector '#js-change'

window.onload = ->
  select.addEventListener 'change', (e) -> 
    themeNext = e.target.value
    changeTheme themeNext

  changeTheme themeNext

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

(function() {
  var body, changeTheme, header, importHeader, replaceImg, select, themeNext, themeNow, tutorial;

  themeNow = themeNext = 'biz';

  select = document.querySelector('#js-theme');

  body = document.querySelector('body');

  header = document.querySelector('#js-change');

  window.onload = function() {
    select.addEventListener('change', function(e) {
      themeNext = e.target.value;
      return changeTheme(themeNext);
    });
    changeTheme(themeNext);
    return tutorial();
  };

  changeTheme = function(themeNext) {
    var i, img, j, k, len, len1, len2, node, ref, ref1, ref2, theme;
    ref = [themeNow, themeNext];
    for (i = 0, len = ref.length; i < len; i++) {
      theme = ref[i];
      body.classList.toggle(theme);
    }
    ref1 = document.querySelectorAll('#js-change > *');
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      node = ref1[j];
      header.removeChild(node);
    }
    ref2 = document.querySelectorAll('img');
    for (k = 0, len2 = ref2.length; k < len2; k++) {
      img = ref2[k];
      replaceImg(img);
    }
    importHeader();
    return themeNow = themeNext;
  };

  replaceImg = function(img) {
    return img.src = img.src.replace(themeNow, themeNext);
  };

  importHeader = function() {
    var clone, id, t;
    id = '#temp-' + themeNext;
    t = document.querySelector(id);
    clone = document.importNode(t.content, true);
    return header.appendChild(clone);
  };

  tutorial = function() {
    var bg, el, remove;
    bg = document.createElement('div');
    bg.classList.add('t-bg');
    el = body.appendChild(bg);
    select.parentElement.classList.add('tutorial');
    remove = function() {
      if (body.querySelector('.t-bg')) {
        body.removeChild(el);
        select.parentElement.classList.remove('tutorial');
        return window.removeEventListener('click', remove);
      }
    };
    window.addEventListener('click', remove);
    return setTimeout(function() {
      return remove();
    }, 5000);
  };

}).call(this);

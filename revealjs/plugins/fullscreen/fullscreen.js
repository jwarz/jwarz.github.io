/*****************************************************************
** Author: Joschka Schwarz, joschka.schwarz@gmail.com
**
** A plugin for reveal.js adding a Fullscreen Button to the Chalkboard Buttons.
**
**
** License: MIT license (see LICENSE.md)
**
** Credits:
** Chalkboard effect by Mohamed Moustafa https://github.com/mmoustafa/Chalkboard
** Compatibility with reveal.js v4 by Hakim El Hattab https://github.com/hakimel
******************************************************************/
/*!
* screenfull
* v4.2.0 - 2019-04-01
* (c) Sindre Sorhus; MIT License
*/
!function(){"use strict";var u="undefined"!=typeof window&&void 0!==window.document?window.document:{},e="undefined"!=typeof module&&module.exports,t="undefined"!=typeof Element&&"ALLOW_KEYBOARD_INPUT"in Element,c=function(){for(var e,n=[["requestFullscreen","exitFullscreen","fullscreenElement","fullscreenEnabled","fullscreenchange","fullscreenerror"],["webkitRequestFullscreen","webkitExitFullscreen","webkitFullscreenElement","webkitFullscreenEnabled","webkitfullscreenchange","webkitfullscreenerror"],["webkitRequestFullScreen","webkitCancelFullScreen","webkitCurrentFullScreenElement","webkitCancelFullScreen","webkitfullscreenchange","webkitfullscreenerror"],["mozRequestFullScreen","mozCancelFullScreen","mozFullScreenElement","mozFullScreenEnabled","mozfullscreenchange","mozfullscreenerror"],["msRequestFullscreen","msExitFullscreen","msFullscreenElement","msFullscreenEnabled","MSFullscreenChange","MSFullscreenError"]],l=0,r=n.length,t={};l<r;l++)if((e=n[l])&&e[1]in u){for(l=0;l<e.length;l++)t[n[0][l]]=e[l];return t}return!1}(),r={change:c.fullscreenchange,error:c.fullscreenerror},n={request:function(r){return new Promise(function(e){var n=c.requestFullscreen,l=function(){this.off("change",l),e()}.bind(this);r=r||u.documentElement,/ Version\/5\.1(?:\.\d+)? Safari\//.test(navigator.userAgent)?r[n]():r[n](t?Element.ALLOW_KEYBOARD_INPUT:{}),this.on("change",l)}.bind(this))},exit:function(){return new Promise(function(e){if(this.isFullscreen){var n=function(){this.off("change",n),e()}.bind(this);u[c.exitFullscreen](),this.on("change",n)}else e()}.bind(this))},toggle:function(e){return this.isFullscreen?this.exit():this.request(e)},onchange:function(e){this.on("change",e)},onerror:function(e){this.on("error",e)},on:function(e,n){var l=r[e];l&&u.addEventListener(l,n,!1)},off:function(e,n){var l=r[e];l&&u.removeEventListener(l,n,!1)},raw:c};c?(Object.defineProperties(n,{isFullscreen:{get:function(){return Boolean(u[c.fullscreenElement])}},element:{enumerable:!0,get:function(){return u[c.fullscreenElement]}},enabled:{enumerable:!0,get:function(){return Boolean(u[c.fullscreenEnabled])}}}),e?(module.exports=n,module.exports.default=n):window.screenfull=n):e?module.exports=!1:window.screenfull=!1}();

window.Fullscreen = window.Fullscreen || {
    id: 'Fullscreen',
    init: function(deck) {
        addFullScreenButton(deck);
    }
};

const addFullScreenButton = function(Reveal) {

  Reveal.addEventListener( 'ready', function( event ) {

  // Create Button
  const span = document.createElement("span");
  span.title = "Toggle Fullscreen";
  span.id = "fs-tooltip"
  const icon = document.createElement("i");
  icon.classList.add("fas");
  icon.classList.add("fa-expand");
  span.appendChild(icon);
  span.onclick = function (event) {
    event.preventDefault();

    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
     
     // Imitate fullscreen by openeing it in a new window
     var url = window.location.href
     window.open(url, "_blank");

    } else {

      if (screenfull.enabled) {
        screenfull.toggle(document.documentElement);
      }

    }
  };
  
  // Set Color
  // 1. Get R, G, B Values as objects
  function hexToRgb(hex) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
      r: parseInt(result[1], 16),
      g: parseInt(result[2], 16),
      b: parseInt(result[3], 16)
    } : null;
  }
  var lc_obj = hexToRgb(getComputedStyle(document.documentElement).getPropertyValue('--r-link-color'));
  // 2. Create css value
  var fullscreencolor = "rgb(" + lc_obj.r + "," + lc_obj.g + "," + lc_obj.b + ")"
  
  // Create stylesheet
    var styles = `
.reveal .slide-chalkboard-buttons .fa-expand::before {
  background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="` + fullscreencolor + `" class="bi bi-fullscreen" viewBox="0 0 16 16"><path d="M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z"/></svg>');
}
.reveal .slide-chalkboard-buttons .fa-compress::before {
  background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="` + fullscreencolor + `" class="bi bi-fullscreen-exit" viewBox="0 0 16 16"><path d="M5.5 0a.5.5 0 0 1 .5.5v4A1.5 1.5 0 0 1 4.5 6h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5zm5 0a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 10 4.5v-4a.5.5 0 0 1 .5-.5zM0 10.5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 6 11.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zm10 1a1.5 1.5 0 0 1 1.5-1.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4z"/></svg>');
}
`
  var styleSheet = document.createElement("style")
  styleSheet.innerText = styles

  // Create Tooltip 
  const tooltip = document.createElement("script");
  tooltip.innerHTML = "tippy('#fs-tooltip', {content: 'Toggle Fullscreen', offset: [0, 20], delay: 100, duration: 1000, inertia: true, interactiveDebounce: 75, showOnCreate: true,  onShow(instance) {setTimeout(() => {instance.hide();}, 5000);}});"

  // set fullscreen button icon to match fullscreen state
  if (screenfull.enabled) {

    screenfull.on('change', function() {
      var icon = span.querySelector('i');
      icon.classList.remove(
        screenfull.isFullscreen ? 'fa-expand' : 'fa-compress'
      );
      icon.classList.add(
        screenfull.isFullscreen ? 'fa-compress' : 'fa-expand'
      );
    });
  }

  // Add Stylesheet, Button and tooltip script to DOM
  var dom = {};
  document.head.appendChild(styleSheet)
  dom.reveal = document.querySelector('.slide-chalkboard-buttons');
  dom.reveal.appendChild(span);
  dom.reveal.appendChild(tooltip);

  })
}
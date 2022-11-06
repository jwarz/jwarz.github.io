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
     
     window.open("https://jwarz.github.io/revealjs/slides/2022/first/first.html", "_blank");

    } else {

      if (screenfull.enabled) {
        screenfull.toggle(document.documentElement);
      }

    }
  };

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

  // Add Button and tooltip script to DOM
  var dom = {};
  dom.reveal = document.querySelector('.slide-chalkboard-buttons');
  dom.reveal.appendChild(span);
  dom.reveal.appendChild(tooltip);

  })
}
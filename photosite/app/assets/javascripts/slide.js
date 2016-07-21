function() {
  fabric.Object.prototype.transparentCorners = false;
  var $ = function(id){return document.getElementById(id)};


  var canvas = new fabric.Canvas('c');	


  canvas.on({
    'object:selected': function() {
      fabric.util.toArray(document.getElementsByTagName('input'))
                          .forEach(function(el){ el.disabled = false; })

      var filters = ['grayscale', 'invert', 'remove-white', 'sepia', 'sepia2',
                      'brightness', 'noise', 'gradient-transparency', 'pixelate',
                      'blur', 'sharpen', 'emboss', 'tint', 'multiply', 'blend'];

      for (var i = 0; i < filters.length; i++) {
        $(filters[i]).checked = !!canvas.getActiveObject().filters[i];
      }
    },
    'selection:cleared': function() {
      fabric.util.toArray(document.getElementsByTagName('input'))
                          .forEach(function(el){ el.disabled = true; })
    }
  });
})();
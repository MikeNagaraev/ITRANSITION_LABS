$(document).ready(function(){
  $('.bxslider').bxSlider({
  mode: 'horizontal',
  adaptiveHeight: true,
  minSlides: 1,
  slideWidth: 800,
  slideMargin: 10,
  speed: 1000,
  pause: 500,
  auto: true,
  autoControls: true
  });

   function applyFilter(index, filter) {
    var obj = canvas.getActiveObject();
    obj.filters[index] = filter;
    obj.applyFilters(canvas.renderAll.bind(canvas));
  }



  
});


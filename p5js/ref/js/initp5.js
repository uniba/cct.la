/**
 * Logo of uniba.jp
 * 
 * @dependency jQuery 1.6.2+
 * @dependency Processing.js 1.3.0+
 */

!function(window, document, $, undefined) {

  var p5;
    
  /**
   * Expose callback function for Processing.js
   */
  
  window.processingInitComplete = function() {
    p5 = Processing.getInstanceById('p5stage');
    $(window).resize();
  };
  
  $(function() {
  	$(window).bind("resize orientationchange", function(event) {  		
  		if (p5 && p5.setStageSize) {
  			p5.setStageSize(windowWidth, windowHeight);
  		}
  	}).trigger("resize");
  });
  
}(window, document, jQuery);

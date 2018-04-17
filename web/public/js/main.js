/*price range*/

 $('#sl2').slider();

	var RGBChange = function() {
	  $('#RGB').css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')
	};	
		
/*scroll to top*/

function validarEmailDB() {

            var url = "emailValido";
            var email_check = $( "#email" ).val();
            var resultado;
            
            $.ajax({
			    url: url,
			    type: "POST",
                            async: false,
			    data: {"email": email_check},
			    success: function (data) {
                                if (data == "0") {
                                    resultado = false;
                                }
                                else {
                                    resultado = true;
                                }
			    },
			    error: function(jqXHR,error, errorThrown) {  
			    	BootstrapDialog.show({
                                title: 'Error',
                                message: 'Error de servicio.',
                                type: BootstrapDialog.TYPE_WARNING, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
                                closable: true, // <-- Default value is false
                                draggable: true, // <-- Default value is false
                            });
			    }
		  });
                  
                  return resultado;
        }
        
        function filtrar() {
            var url = "filtro";
            

            var categoria = $( "#categoria" ).val();
            var cp = $( "#cp" ).val();
            var pmenor = $( "#pmenor" ).val();
            var pmayor = $( "#pmayor" ).val();
            
            $.ajax({
			    url: url,
			    type: "POST",
                            async: false,
			    data: {"categoria": categoria, "cp": cp, "pmenor": pmenor, "pmayor": pmayor},
			    success: function (data) {
                                $("#productos_tienda").html(data);
			    }
                        });
        }

$(document).ready(function(){
	$(function () {
		$.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        scrollDistance: 300, // Distance from top/bottom before showing element (px)
	        scrollFrom: 'top', // 'top' or 'bottom'
	        scrollSpeed: 300, // Speed back to top (ms)
	        easingType: 'linear', // Scroll to top easing (see http://easings.net/)
	        animation: 'fade', // Fade, slide, none
	        animationSpeed: 200, // Animation in speed (ms)
	        scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
					//scrollTarget: false, // Set a custom target element for scrolling to the top
	        scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
	        scrollTitle: false, // Set a custom <a> title if required.
	        scrollImg: false, // Set true to use image
	        activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	        zIndex: 2147483647 // Z-Index for the overlay
		});
	});
});

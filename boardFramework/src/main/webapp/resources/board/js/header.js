$(document).ready(function() {
				

				$(function() {
					$('li.dropdown-submenu').on('click', function(event) {
						event.stopPropagation();
						if ($(this).hasClass('open')) {
							$(this).removeClass('open');
						} else {
							$('li.dropdown-submenu').removeClass('open');
							$(this).addClass('open');
						}
					});
				});

			});
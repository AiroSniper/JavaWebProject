

let id = -1;


function hasClass(el, className) {
	if (el.classList)
		return el.classList.contains(className);
	return !!el.className.match(new RegExp('(\\s|^)' + className + '(\\s|$)'))
}

function addClass(el, className) {
	if (el.classList)
		el.classList.add(className)
	else if (!hasClass(el, className))
		el.className += " " + className
}

function removeClass(el, className) {
	if (el.classList)
		el.classList.remove(className);
	else if (hasClass(el, className)) {
		var reg = new RegExp('(\\s|^)' + className + '(\\s|$)')
		el.className = el.className.replace(reg, ' ')
	}
}

function injectSalles(data){
	let lines = ""
	data.forEach(function(line){
		lines += ` <tr>
	                   
	                    <td>`+line.code+`</td>
	                    <td>`+line.label+`</td>
	                    <td>`+line.type+`</td>
	                   
	               </tr>`
	})
	
	$("#tabS").html(lines)
}

function injectMachines(data){
	let lines = ""
	data.forEach(function(line){
		lines += ` <tr>
	                   
	                    <td>`+line.reference+`</td>
	                    <td>`+line.marque+`</td>
	                    <td>`+line.prix+`</td>
	                   
	               </tr>`
	})
	
	$("#tabM").html(lines)
}

$(window).on('load', function() {
	'use strict';

$.ajax({
		url: "../../MachineController",
		type: "POST",
		data: { op: "GetCount" },
		success: function(data) {

			$("#machinesCount").html(data)	
		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			console.log("Details0: " + desc + "\nError:" + err)
		}

	})
	
	$.ajax({
		url: "../../MachineController",
		type: "POST",
		data: { op: "LoadMachines" },
		success: function(data) {

			injectMachines(data)
		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			console.log("Details0: " + desc + "\nError:" + err)
		}

	})
	
	$.ajax({
		url: "../../SalleController",
		type: "POST",
		data: { op: "GetCount" },
		success: function(data) {

			$("#sallesCount").html(data)		
		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			console.log("Details0: " + desc + "\nError:" + err)
		}

	})
	
	$.ajax({
		url: "../../SalleController",
		type: "POST",
		data: { op: "LoadSalles" },
		success: function(data) {

			injectSalles(data)	
		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			console.log("Details0: " + desc + "\nError:" + err)
		}

	})




	let home = document.querySelector("#home_page")
	let salles = document.querySelector("#salles_page")
	let machines = document.querySelector("#machines_page")
	let machines_salle = document.querySelector("#machines_salle_page")
	let achats = document.querySelector("#machines_dates_page")
	let profile = document.querySelector("#profile_page")
	let comptes = document.querySelector("#comptes_page")

	let activate = "active"


	addClass(home, activate)
	removeClass(profile, activate)
	removeClass(machines, activate)
	removeClass(machines_salle, activate)
	removeClass(achats, activate)
	removeClass(salles, activate)
	if(comptes)
	removeClass(comptes, activate)
	/*hghghghghghghghg*/
	var chartWrapper = $('.chartjs'),
		flatPicker = $('.flat-picker'),
		barChartEx = $('.bar-chart-ex'),
		horizontalBarChartEx = $('.horizontal-bar-chart-ex'),
		lineChartEx = $('.line-chart-ex')


	// Color Variables
	var primaryColorShade = '#836AF9',
		yellowColor = '#ffe800',
		successColorShade = '#7367F0',
		warningColorShade = '#ffe802',
		warningLightColor = '#FDAC34',
		infoColorShade = '#299AFF',
		greyColor = '#4F5D70',
		blueColor = '#2c9aff',
		blueLightColor = '#84D0FF',
		greyLightColor = '#EDF1F4',
		tooltipShadow = 'rgba(0, 0, 0, 0.25)',
		lineChartPrimary = '#666ee8',
		lineChartDanger = '#ff4961',
		labelColor = '#6e6b7b',
		grid_line_color = 'rgba(200, 200, 200, 0.2)'; // RGBA color helps in dark layout

	// Detect Dark Layout
	if ($('html').hasClass('dark-layout')) {
		labelColor = '#b4b7bd';
	}

	// Wrap charts with div of height according to their data-height
	if (chartWrapper.length) {
		chartWrapper.each(function() {
			$(this).wrap($('<div style="height:' + this.getAttribute('data-height') + 'px"></div>'));
		});
	}

	// Init flatpicker
	if (flatPicker.length) {
		var date = new Date();
		flatPicker.each(function() {
			$(this).flatpickr({
				mode: 'range',
				defaultDate: ['2019-05-01', '2019-05-10']
			});
		});
	}

	$.ajax({
		url: "../../MachineController",
		type: "POST",
		data: { op: "MachineBySalle" },
		success: function(data) {


			let labels1 = data.map(function(item) {

				return item.salle.label

			})
			let data1 = data.map(function(item) {

				return item.nbrMachines

			})


			if (barChartEx.length) {
				var barChartExample = new Chart(barChartEx, {
					type: 'bar',
					options: {
						elements: {
							rectangle: {
								borderWidth: 2,
								borderSkipped: 'bottom'
							}
						},
						responsive: true,
						maintainAspectRatio: false,
						responsiveAnimationDuration: 500,
						legend: {
							display: false
						},
						tooltips: {
							// Updated default tooltip UI
							shadowOffsetX: 1,
							shadowOffsetY: 1,
							shadowBlur: 8,
							shadowColor: tooltipShadow,
							backgroundColor: window.colors.solid.white,
							titleFontColor: window.colors.solid.black,
							bodyFontColor: window.colors.solid.black
						},
						scales: {
							xAxes: [
								{
									display: true,
									gridLines: {
										display: true,
										color: grid_line_color,
										zeroLineColor: grid_line_color
									},
									scaleLabel: {
										display: false
									},
									ticks: {
										fontColor: labelColor
									}
								}
							],
							yAxes: [
								{
									display: true,
									gridLines: {
										color: grid_line_color,
										zeroLineColor: grid_line_color
									},
									ticks: {
										stepSize: 5,
										min: 0,
										max: 25,
										fontColor: labelColor
									}
								}
							]
						}
					},
					data: {
						labels: labels1,
						datasets: [
							{
								barThickness: 15,
								data: data1,
								backgroundColor: successColorShade,
								borderColor: 'transparent'
							}
						]
					}
				});
			}

			//Draw rectangle Bar charts with rounded border
			Chart.elements.Rectangle.prototype.draw = function() {
				var ctx = this._chart.ctx;
				var viewVar = this._view;
				var left, right, top, bottom, signX, signY, borderSkipped, radius;
				var borderWidth = viewVar.borderWidth;
				var cornerRadius = 20;
				if (!viewVar.horizontal) {
					left = viewVar.x - viewVar.width / 2;
					right = viewVar.x + viewVar.width / 2;
					top = viewVar.y;
					bottom = viewVar.base;
					signX = 1;
					signY = top > bottom ? 1 : -1;
					borderSkipped = viewVar.borderSkipped || 'bottom';
				} else {
					left = viewVar.base;
					right = viewVar.x;
					top = viewVar.y - viewVar.height / 2;
					bottom = viewVar.y + viewVar.height / 2;
					signX = right > left ? 1 : -1;
					signY = 1;
					borderSkipped = viewVar.borderSkipped || 'left';
				}

				if (borderWidth) {
					var barSize = Math.min(Math.abs(left - right), Math.abs(top - bottom));
					borderWidth = borderWidth > barSize ? barSize : borderWidth;
					var halfStroke = borderWidth / 2;
					var borderLeft = left + (borderSkipped !== 'left' ? halfStroke * signX : 0);
					var borderRight = right + (borderSkipped !== 'right' ? -halfStroke * signX : 0);
					var borderTop = top + (borderSkipped !== 'top' ? halfStroke * signY : 0);
					var borderBottom = bottom + (borderSkipped !== 'bottom' ? -halfStroke * signY : 0);
					if (borderLeft !== borderRight) {
						top = borderTop;
						bottom = borderBottom;
					}
					if (borderTop !== borderBottom) {
						left = borderLeft;
						right = borderRight;
					}
				}

				ctx.beginPath();
				ctx.fillStyle = viewVar.backgroundColor;
				ctx.strokeStyle = viewVar.borderColor;
				ctx.lineWidth = borderWidth;
				var corners = [
					[left, bottom],
					[left, top],
					[right, top],
					[right, bottom]
				];

				var borders = ['bottom', 'left', 'top', 'right'];
				var startCorner = borders.indexOf(borderSkipped, 0);
				if (startCorner === -1) {
					startCorner = 0;
				}

				function cornerAt(index) {
					return corners[(startCorner + index) % 4];
				}

				var corner = cornerAt(0);
				ctx.moveTo(corner[0], corner[1]);

				for (var i = 1; i < 4; i++) {
					corner = cornerAt(i);
					var nextCornerId = i + 1;
					if (nextCornerId == 4) {
						nextCornerId = 0;
					}

					var nextCorner = cornerAt(nextCornerId);

					var width = corners[2][0] - corners[1][0],
						height = corners[0][1] - corners[1][1],
						x = corners[1][0],
						y = corners[1][1];

					var radius = cornerRadius;

					if (radius > height / 2) {
						radius = height / 2;
					}
					if (radius > width / 2) {
						radius = width / 2;
					}

					if (!viewVar.horizontal) {
						ctx.moveTo(x + radius, y);
						ctx.lineTo(x + width - radius, y);
						ctx.quadraticCurveTo(x + width, y, x + width, y + radius);
						ctx.lineTo(x + width, y + height - radius);
						ctx.quadraticCurveTo(x + width, y + height, x + width, y + height);
						ctx.lineTo(x + radius, y + height);
						ctx.quadraticCurveTo(x, y + height, x, y + height);
						ctx.lineTo(x, y + radius);
						ctx.quadraticCurveTo(x, y, x + radius, y);
					} else {
						ctx.moveTo(x + radius, y);
						ctx.lineTo(x + width - radius, y);
						ctx.quadraticCurveTo(x + width, y, x + width, y + radius);
						ctx.lineTo(x + width, y + height - radius);
						ctx.quadraticCurveTo(x + width, y + height, x + width - radius, y + height);
						ctx.lineTo(x + radius, y + height);
						ctx.quadraticCurveTo(x, y + height, x, y + height);
						ctx.lineTo(x, y + radius);
						ctx.quadraticCurveTo(x, y, x, y);
					}
				}

				ctx.fill();
				if (borderWidth) {
					ctx.stroke();
				}
			};


		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			console.log("Details0: " + desc + "\nError:" + err)
		}

	})
	
	
	
	$.ajax({
		url: "../../MachineController",
		type: "POST",
		data: { op: "MachineByMarque" },
		success: function(data) {


			let labels1 = data.map(function(item) {

				return item.marque

			})
			let data1 = data.map(function(item) {

				return item.nbrMachines

			})

			if (horizontalBarChartEx.length) {
		new Chart(horizontalBarChartEx, {
			type: 'horizontalBar',
			options: {
				elements: {
					rectangle: {
						borderWidth: 2,
						borderSkipped: 'right'
					}
				},
				tooltips: {
					// Updated default tooltip UI
					shadowOffsetX: 1,
					shadowOffsetY: 1,
					shadowBlur: 8,
					shadowColor: tooltipShadow,
					backgroundColor: window.colors.solid.white,
					titleFontColor: window.colors.solid.black,
					bodyFontColor: window.colors.solid.black
				},
				responsive: true,
				maintainAspectRatio: false,
				responsiveAnimationDuration: 500,
				legend: {
					display: false
				},
				layout: {
					padding: {
						bottom: -30,
						left: -25
					}
				},
				scales: {
					xAxes: [
						{
							display: true,
							gridLines: {
								zeroLineColor: grid_line_color,
								borderColor: 'transparent',
								color: grid_line_color
							},
							scaleLabel: {
								display: true
							},
							ticks: {
								min: 0,
								fontColor: labelColor
							}
						}
					],
					yAxes: [
						{
							display: true,
							gridLines: {
								display: false
							},
							scaleLabel: {
								display: true
							},
							ticks: {
								fontColor: labelColor
							}
						}
					]
				}
			},
			data: {
				labels: labels1,
				datasets: [
					{
						data: data1,
						barThickness: 15,
						backgroundColor: successColorShade,
						borderColor: 'transparent'
					}
				]
			}
		});
	}
			


		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			console.log("Details0: " + desc + "\nError:" + err)
		}

	})
	
	
	$.ajax({
		url: "../../MachineController",
		type: "POST",
		data: { op: "MachineByType" },
		success: function(data) {


			let labels1 = data.map(function(item) {

				return item.type

			})
			let data1 = data.map(function(item) {

				return item.nbrMachines

			})

	
			if (lineChartEx.length) {
		var lineExample = new Chart(lineChartEx, {
			type: 'bar',
			plugins: [
				// to add spacing between legends and chart
				{
					beforeInit: function(chart) {
						chart.legend.afterFit = function() {
							this.height += 20;
						};
					}
				}
			],
			options: {
				responsive: true,
				maintainAspectRatio: false,
				backgroundColor: false,
				hover: {
					mode: 'label'
				},
				tooltips: {
					// Updated default tooltip UI
					shadowOffsetX: 1,
					shadowOffsetY: 1,
					shadowBlur: 8,
					shadowColor: tooltipShadow,
					backgroundColor: window.colors.solid.white,
					titleFontColor: window.colors.solid.black,
					bodyFontColor: window.colors.solid.black
				},
				layout: {
					padding: {
						top: -15,
						bottom: -25,
						left: -15
					}
				},
				scales: {
					xAxes: [
						{
							display: true,
							scaleLabel: {
								display: true
							},
							gridLines: {
								display: true,
								color: grid_line_color,
								zeroLineColor: grid_line_color
							},
							ticks: {
								fontColor: labelColor
							}
						}
					],
					yAxes: [
						{
							display: true,
							scaleLabel: {
								display: true
							},
							ticks: {
								stepSize: 10,
								min: 0,
								max: 100,
								fontColor: labelColor
							},
							gridLines: {
								display: true,
								color: grid_line_color,
								zeroLineColor: grid_line_color
							}
						}
					]
				},
				legend: {
					position: 'top',
					align: 'start',
					labels: {
						usePointStyle: true,
						padding: 25,
						boxWidth: 9
					}
				}
			},
			data: {
				labels: labels1,
				datasets: [
					{
						data: data1,
						label: 'Nombre de machines',
						borderColor: successColorShade,
						lineTension: 0.5,
						pointStyle: 'circle',
						backgroundColor: successColorShade,
						fill: false,
						pointRadius: 1,
						pointHoverRadius: 5,
						pointHoverBorderWidth: 5,
						pointBorderColor: 'transparent',
						pointHoverBorderColor: window.colors.solid.white,
						pointHoverBackgroundColor: successColorShade,
						pointShadowOffsetX: 1,
						pointShadowOffsetY: 1,
						pointShadowBlur: 5,
						pointShadowColor: tooltipShadow
					}
					
				]
			}
		});
	}


		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			console.log("Details0: " + desc + "\nError:" + err)
		}

	})

	
	


});





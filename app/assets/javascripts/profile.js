$(function(){
	console.log("profile.js");
	var revenue = [];
	var cost = [];

	revenuecostdata();

	function revenuecostdata() {
		$.ajax({
			type: "GET",
			url: '/revenuecost',
			success: function (data) {
				console.log(data);
				revenue = data.revenue;
				cost = data.cost;
				profit = data.profit;
				$('#totalprofit').append(data.total_profit);
				buildGraph();
		    },
		    error: function (error) {
		      console.log("Error: ");
		      console.error(error);
		    }
		});

	}

	function buildGraph() {
		var data = {
		    labels: ["January", "February", "March", "April", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"],
		    datasets: [
		        {
		            label: "Revenue",
		            fillColor: "blue",
		            strokeColor: "blue",
		            pointColor: "blue",
		            pointStrokeColor: "blue",
		            pointHighlightFill: "blue",
		            pointHighlightStroke: "blue",
		            data: revenue
		        },
		        {
		            label: "Cost",
		            fillColor: "red",
		            strokeColor: "red",
		            pointColor: "red",
		            pointStrokeColor: "red",
		            pointHighlightFill: "red",
		            pointHighlightStroke: "red",
		            data: cost
		        },
		        {
		            label: "Profit",
		            fillColor: "green",
		            strokeColor: "green",
		            pointColor: "green",
		            pointStrokeColor: "green",
		            pointHighlightFill: "green",
		            pointHighlightStroke: "green",
		            data: profit
		        }
		    ]
		};
		var options = {};
		var canvas = document.getElementById("chart-0");
	    var ctx = canvas.getContext('2d');
	    console.log("now");
		new Chart(ctx).Bar(data, options);
	}


});
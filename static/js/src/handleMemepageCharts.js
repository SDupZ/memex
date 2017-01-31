function generateDaysAndData() {
    for(var i=0;i<40;i++){
      days[i] = i+1;
      data[i] = number;
      var rand = getRandomInt(0,3);
      if(rand == 1) {
          number = number + 1;
      } else if(rand == 2) {
          number = number - 1;
      }
    }
}


function getScaleHeight(data) {
    var total = 0;
    for(var i = 0; i < data.length; i++) {
        total += data[i];
    }
    var avg = total / data.length;
    var scaleHeight = 0;
    if (Math.max(data) > 2 * avg) {
        scaleHeight = Math.max(data);
    } else {
        scaleHeight = 2 * avg;
    }
    return Math.ceil(scaleHeight);
}


function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min;
}


var days = [];
var data = [];
var number = 20;

generateDaysAndData();
var scaleHeight = getScaleHeight(data);

var ctx = document.getElementById("myChart");
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: days,
        datasets: [{
            label: 'Popularity of X',
            data: data,
            backgroundColor: 'rgba(63,81,181,0.2)',
            borderColor: 'rgba(63,81,181,1)',

            borderJoinStyle: 'miter',
            pointBorderColor: "rgba(63,81,181,1)",
            pointBackgroundColor: "rgba(63,81,181,0.2)",
            pointHoverRadius: 7,
            pointHoverBackgroundColor: "rgba(63,81,181,0.8)",
            pointRadius: 3,
            borderWidth: 3,
            pointHitRadius: 20,
        }]
    },
    options: {
        maintainAspectRatio: false,
        legend: {
            display: false
        },
        scales: {
            xAxes: [{
                gridLines: {
                    display: false
                }
            }],
            yAxes: [{
                gridLines: {
                    display: false
                },
                ticks: {
                    beginAtZero: true,
                    max: scaleHeight,
                }
            }]
        }
    }
});

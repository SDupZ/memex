var days = [];
var data = [];

for(var i=0;i<40;i++){
  days[i] = i;
  data[i] = getRandomInt(0,50);
}

var ctx = document.getElementById("myChart");
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: days,
        datasets: [{
            label: 'Popularity of X',
            data: data,
            backgroundColor: 'rgba(63,81,181,0.2)',
            borderColor: ['rgba(63,81,181,1)',],
            borderWidth: 2
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}

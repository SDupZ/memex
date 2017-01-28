var days = [];
var data = [];

for(var i=0;i<10;i++){
  days[i] = i;
  data[i] = getRandomInt(0,50);
}

var ctx = document.getElementById("myChart");
var myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: days,
        datasets: [{
            label: 'Popularity of X',
            data: data,
            backgroundColor: [
              'rgba(244, 67, 54, 1)',
              'rgba(233, 30, 99, 1)',
              'rgba(156, 39, 176, 1)',
              'rgba(103, 58, 183, 1)',
              'rgba(63, 81, 181, 1)',
              'rgba(33, 150, 243, 1)',
              'rgba(0, 150, 136, 1)',
              'rgba(139, 195, 74, 1)',
              'rgba(255, 235, 59, 1)',
              'rgba(255, 235, 59, 1)',
            ],
            borderColor: [
              'rgba(244, 67, 54, 1)',
              'rgba(233, 30, 99, 1)',
              'rgba(156, 39, 176, 1)',
              'rgba(103, 58, 183, 1)',
              'rgba(63, 81, 181, 1)',
              'rgba(33, 150, 243, 1)',
              'rgba(0, 150, 136, 1)',
              'rgba(139, 195, 74, 1)',
              'rgba(255, 235, 59, 1)',
              'rgba(255, 235, 59, 1)',
            ],
            borderWidth: 2
        }]
    },
    options: {
        title: {
            display: true,
            text: "Top Ten Memes Daily",
        },
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});

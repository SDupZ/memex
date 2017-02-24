var days = [];
var data = [];

for(var i=0;i<10;i++){
  days[i] = i;
  data[i] = getRandomInt(0,50);
}

var memeDict = {}
memeDict["Pepe"] = getRandomInt(0,50);
memeDict["Roll Safe"] = getRandomInt(0,50);
memeDict["Darth Vadar"] = getRandomInt(0,50);
memeDict["Jackie Chan"] = getRandomInt(0,50);
memeDict["Obama"] = getRandomInt(0,50);
memeDict["Rick Roll"] = getRandomInt(0,50);
memeDict["Matrix guy"] = getRandomInt(0,50);
memeDict["That russian duck"] = getRandomInt(0,50);
memeDict["Black Pepe"] = getRandomInt(0,50);
memeDict["White Pepe"] = getRandomInt(0,50);

var sortedKeys = Object.keys(memeDict).sort(function (a, b) {
  return memeDict[a] - memeDict[b]
});

var sortedValues = [];
for (x in sortedKeys) {
    sortedValues.push(memeDict[sortedKeys[x]]);
}
console.log(memeDict);
console.log(sortedKeys);
console.log(sortedValues);







//
//
// data.sort(function(a, b){return a-b});
// console.log(data);

var ctx = document.getElementById("myChart");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: sortedKeys,
        datasets: [{
            label: 'Score of meme',
            data: sortedValues,
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
            borderWidth: 2,
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

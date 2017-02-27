// var memeDict = {}
// memeDict["Pepe"] = getRandomInt(0,50);
// memeDict["Roll Safe"] = getRandomInt(0,50);
// memeDict["Darth Vadar"] = getRandomInt(0,50);
// memeDict["Jackie Chan"] = getRandomInt(0,50);
// memeDict["Obama"] = getRandomInt(0,50);
// memeDict["Rick Roll"] = getRandomInt(0,50);
// memeDict["Matrix guy"] = getRandomInt(0,50);
// memeDict["That russian duck"] = getRandomInt(0,50);
// memeDict["Black Pepe"] = getRandomInt(0,50);
// memeDict["White Pepe"] = getRandomInt(0,50);

// SORTING FUNCTIONS
//

// Sort the keys based on their
function getSortedKeys(dictionary) {
    var sortedKeys = Object.keys(dictionary).sort(function (a, b) {
        return dictionary[b] - dictionary[a];
    });
    return sortedKeys;
}


function getSortedValues(dictionary, sortedKeys) {
    var sortedValues = [];
    for (x in sortedKeys) {
        sortedValues.push(dictionary[sortedKeys[x]]);
    }
    return sortedValues;
}


function initChart(labels, data) {
  var ctx = document.getElementById("myChart");
  var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: labels,
          datasets: [{
              label: 'Score of meme',
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
}

function initChartFromJSONString(jsonString) {
    var memeDict = JSON.parse(jsonString);

    var sortedKeys = getSortedKeys(memeDict);
    var sortedValues = getSortedValues(memeDict, sortedKeys);

    initChart(sortedKeys, sortedValues);
}

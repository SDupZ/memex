var sass = require('node-sass');
var fs = require('fs');

sass.render({
    file: 'static/sass/main.scss',
  }, function(error, result) { // node-style callback from v3.0.0 onwards
    if(!error){
      // No errors during the compilation, write this result on the disk
      fs.writeFile('static/css/main.css', result.css, function(err){
        if(!err){
          //file written on disk
          console.log("Done");
        } else {
          console.log(err);
        }
      });
  } else {
      console.log(error);
  }
  });

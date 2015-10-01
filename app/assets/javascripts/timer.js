// var timer;
// var timerOn = false;
// var time = 0;
// var hours;
// var minutes;
// var seconds;
// var difference = 0;
// var startTime;
// var lastTime = 0;
// $( document ).ready(function() {
//   $( '#start-stop' ).click(function() {
//     timerOn = !timerOn;
//     if (timerOn) {
//       $(this).text('Stop');
//       startTimer();
//     } else {
//       $(this).text('Start');
//       stopTimer();
//     }
//   });

//   function startTimer() {
//     startTime = new Date();
//     timer = setInterval(addTime, 1000)

//   }
//   function stopTimer() {
//     clearInterval(timer);
//     lastTime = time;
//   }
//   function addTime() {
//     currentTime = new Date();
//     difference = Math.floor(((currentTime.getTime() - startTime.getTime())));
//     time = lastTime + difference;
//     updateTimerText(time);
    
//   }
//   function updateTimerText(time) {
//     seconds = (Math.floor(time/1000))%60;
//     minutes = (Math.floor(time/(1000*60)))%60;
//     hours = (Math.floor(time/(1000*60*60)))%24;

//     $('#timer-seconds').text(seconds < 10 ? "0" + seconds: seconds)
//     $('#timer-minutes').text(minutes < 10 ? "0" + minutes: minutes)
//     $('#timer-hours').text(hours < 10 ? "0" + hours: hours)
//   }


// });
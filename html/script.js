let max_timer_notif = 5000 //This will let the notif display for like 5 seconds.

function Notify(event)
{
    (() => {
        let n = document.createElement("div");
        let id = Math.random().toString(36).substr(2,10);

        
        n.setAttribute("id", id);
        n.classList.add("notification", event.data.data_type);
        n.innerText = event.data.data_text;
        
        let notificationArea = document.getElementById("notification-area");
        notificationArea.appendChild(n);

        setTimeout(()=>
        {
            var notifications = notificationArea.getElementsByClassName("notification")
            for(let i=0; i<notifications.length; i++)
            {
                if(notifications[i].getAttribute("id") == id)
                {
                    notifications[i].remove();
                    break;
                }
            }
        }, max_timer_notif);
    })();
}


window.addEventListener('message', function(event) 
{
  var audioPlayer = null;

  // Check for playSound
  if (event.data.transactionType == "playSound") {
  
      if (audioPlayer != null) 
      {
          audioPlayer.pause();
      }

      audioPlayer = new Howl({src: ["./sounds/" + event.data.transactionFile + ".ogg"]});
      audioPlayer.volume(event.data.transactionVolume);
      audioPlayer.play();
  }

  if (event.data.type == "notification_main")
  {
    if(event.data.activate == true)
    {

      //Check if the data_type is not a correct value from the table then we return an error : 
      if (!event.data.data_type.match(/^(warning|success|error)$/)) {
        fetch('http://GTA_Notif/error')
        return
      }

      //Allow player to have a sound when the notif pop pup :
      fetch('http://GTA_Notif/main')

      //Start the notification :
      Notify(event);
    }
  }
})
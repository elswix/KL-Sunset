

## Welcome to KL-Sunset!

---

I am delighted to have you here. This repository houses a powerful automation script designed to streamline the customization of your Linux environment. Whether you're an i3 enthusiast, picom aficionado, or simply seeking a more personalized Linux setup, KL-Sunset has got you covered.

My script encompasses various tools, including rofi, kitty, and more, to enhance your workflow and elevate your experience. With a focus on efficiency and ease of use, KL-Sunset aims to make your customization process seamless and enjoyable.

Feel free to explore the repository, download the script, and unleash the potential of your Linux environment. We value your feedback and contributions, so don't hesitate to reach out with any suggestions or improvements you may have in mind.

Inspired by https://github.com/xct/kali-clean

### KL-Sunset

![](https://github.com/ElSwix/KL-Sunset/blob/main/IMG/1.png?raw=true)



### Non-Privileged user:

![](https://github.com/ElSwix/KL-Sunset/blob/main/IMG/2.png?raw=true)


### Root user

![](https://github.com/ElSwix/KL-Sunset/blob/main/IMG/3.png?raw=true)

---

### Instalation


The installation is very simple, you just need to run the "install.sh" script as a NON-PRIVILEGED user. I recommend paying attention during the installation process as there may be points where you are prompted for your password or confirmation to install certain packages.


#### For Parrot users

Please ensure you carefully read and follow the instructions provided by the script. If you are using Parrot OS, kindly make the necessary modification on line 50 as follows:

```
sudo apt update && parrot-upgrade
```


I recommend using a freshly installed Kali Linux to install this environment.

Please use a terminal other than Kitty to execute this script.


Installation commands:

```
git clone https://github.com/elswix/kl-sunset kl-sunset
cd kl-sunset
chmod +x ./install.sh
./install.sh 
```

---


### After installation

After completing the installation, it is necessary to reboot your system. Once you reach the Login Screen, you need to change the Window Manager to i3 by selecting it from the top-right corner of the screen.

![](https://github.com/ElSwix/KL-Sunset/blob/main/IMG/4.png?raw=true)


### Most important keyboard shortcuts

Press `Windows+Return` to open a Terminal.

Press `Windows+D` to open Rofi.

Press `Windows+Shift+F` to open Firefox Browser.

Press `Windows+Shift+B` to open BurpSuite (It must be installed).

Press `Windows+Shift+R` to restart i3 configuration.


### Ethernet Status Bar

If the Ethernet status bar is not functioning properly, as shown in the following image:

![](https://github.com/ElSwix/KL-Sunset/blob/main/IMG/5.png?raw=true)


To resolve the issue with the Ethernet status bar, you should modify the "/usr/share/i3blocks/ethernet_status" script and update the default network interface name "eth0" to match the configuration of your system. 

If modifying the script does not resolve the issue, it is recommended to check your network adapter. Ensure that the network adapter is properly connected and configured. You may also consider checking for any driver updates or troubleshooting network settings to address the problem.

### Target Status Bar

You can modify the target status bar by using "settarget".

For example:

```
settarget "10.10.10.10"
```

![](https://github.com/ElSwix/KL-Sunset/blob/main/IMG/6.png?raw=true)

---

### Thank you for reading:

+  [Instagram](https://www.instagram.com/elswix_/)
+  [YouTube](https://www.youtube.com/@ElSwix)
+  [Twitter](https://twitter.com/elswix_)
+  [HackTheBox](https://app.hackthebox.com/profile/935172)


#### My Blog: 

+ [WebHackology - Pentesting & Web Development](https://webhackology.vercel.app/)

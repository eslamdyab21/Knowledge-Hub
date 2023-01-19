Gstreamer is a pipeline-based multimedia framework that links together a wide variety of media processing systems to complete complex workflows.

### Installation
it varies from system to system, for example the following is for debian based systems
```bash
sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
```

Gstreamer is a multimedia framework that works with Audio and Video, next we will experiment with some pipelines for both 

## Audio
```bash
gst-launch-1.0 audiotestsrc ! audioconvert ! autoaudiosink
```
-   `audiotestsrc` is the sin wave sound, `audioconvert` converts audio to different formats to one that `autoaudiosink` understand
-   `autoaudiosink` sinks (play) the audio file in the terminal
-   `gst-inspect-1.0 audioconvert`

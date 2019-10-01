# Command line arguments
PROGRAM_TO_LAUNCH=$1
PROGRAM_NAME=${2-$1}

# Start vnc server
tigervncserver -SecurityTypes none -xstartup $1

# Start the vnc client
/opt/noVNC/utils/launch.sh --listen 8080 &

# Make the program window fullscreen
DISPLAY=:1 /cloud-computer/fullscreen-always.sh $PROGRAM_NAME &

# Wait on running programs to handle exit codes
wait

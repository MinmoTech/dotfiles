function stream-up --wraps='cd ~/Projects/Project-Lightspeed/ && docker-compose up' --description 'alias stream-up cd ~/Projects/Project-Lightspeed/ && docker-compose up'
  pactl list short sinks | grep null-sink || pactl load-module module-null-sink;
  pactl list short sinks | grep combined || pactl load-module module-combine-sink sink_name=combined slaves=(pactl list short sinks | grep null-sink | fex \t1),(pactl list short sinks | grep RUNNING | fex \t2);
end

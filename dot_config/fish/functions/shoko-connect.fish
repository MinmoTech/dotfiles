# Defined via `source`
function shoko-connect --wraps='ssh -g -L 8111:localhost:8111 root@plexiglas.xyz' --description 'alias shoko-connect ssh -g -L 8111:localhost:8111 root@plexiglas.xyz'
  ssh -g -L 8111:localhost:8111 root@plexiglas.xyz $argv; 
end

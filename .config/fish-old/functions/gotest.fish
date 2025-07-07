function gotest --wraps=clear --wraps='clear && go test' --wraps='clear && go test -v --bench . --benchmem' --description 'alias gotest clear && go test -v --bench . --benchmem'
  clear && go test -v --bench . --benchmem $argv; 
end

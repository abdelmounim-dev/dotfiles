function exsub --wraps='exercism submit' --wraps='exercism submit && ~/scripts/gitAddCommitPush.sh' --description 'alias exsub exercism submit && ~/scripts/gitAddCommitPush.sh'
  exercism submit && ~/scripts/gitAddCommitPush.sh $argv; 
end

///Settle PR and reset
global.total_gold += pr_dedicated.value;
pr_dedicated.alarm[1] = 1; //change sprites
pr_dedicated = -1;
pr_generated = false;
global.last_appeal = required_appeal;
updateLast10(required_appeal);
required_appeal = 0;
alarm[0] = 1;
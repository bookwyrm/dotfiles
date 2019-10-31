alias rake='noglob rake'
alias reload!='. ~/.zshrc'
# For disk usage - from comment on https://brettterpstra.com/2019/04/15/sizes-better-disk-usage-reporting-in-terminal/
alias duf='du -sk * | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done'



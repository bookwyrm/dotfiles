# Commands to do things...
 
# Open man pages in preview
# from: https://talk.macpowerusers.com/t/terminal-commands/7050/21
psman() {
	man -t "${1}" | open -f -a /Applications/Preview.app/
}

setxkbmap -layout pl
xset r rate 200 30
hsetroot -fill $(find -L ~/prj/ricing/wallpapers -type f | shuf -n1)

_openbox() {
	/home/ricer/prj/ricing/desktop-environment/panel &
	compton &
	exec openbox-session
}

_2bwm() {
	/home/ricer/prj/ricing/desktop-environment/panel &
	compton &
	sxhkd &
	exec 2bwm
}

_windowchef() {
	sxhkd ~/prj/dotfiles/sxhkd/.config/sxhkd/windowchef &
	exec windowchef -c ~/.config/windowchef/windowchefrc
}

_dwm() {
	while sleep 1s
	do
		case $(date +'%u') in
			1) day="Monday" ;;
			2) day="Tuesday" ;;
			3) day="Wednesday" ;;
			4) day="Thursday" ;;
			5) day="Friday" ;;
			6) day="Saturday" ;;
			7) day="Sunday" ;;
		esac
		xsetroot -name "$(printf " %s %s %s " $day $(date +'%d') $(date +'%R'))"
	done &
	exec dwm
}

_dwm

# vim: set ft=sh

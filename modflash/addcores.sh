#!/bin/bash -e
GENROM=./GenRom
ADDITEM=./AddItem
i=2

Error() {
	echo "ERROR: Exit status $1. Stopped." >&2
	exit $1
}

AddCore() {
	local f=${3%.*}.tap
	echo "Adding core $i: \"$2\" ($3)..."
	$GENROM $1 "$2" $3 $f || Error $?
	$ADDITEM CORE$i $f || Error $?
	rm -f $f
	let i+=1
}

AddCore 0 "Apple 2"              cores/Apple2.ZX1
AddCore 0 "Atari 2600"           cores/Atari2600.ZX1
AddCore 0 "Atari 800 XL"         cores/Atari800XL.ZX1
AddCore 0 "Acorn Atom"           cores/Atom.ZX1
AddCore 0 "BBC Micro"            cores/BBCMicro.ZX1
AddCore 0 "C16"                  cores/C16.ZX1
AddCore 0 "C64"                  cores/C64.ZX1
AddCore 0 "Test"                 cores/Test.ZX1
AddCore 0 "ColecoVision"         cores/Coleco.ZX1
AddCore 0 "CPC464"               cores/CPC464.ZX1
AddCore 0 "CPC6128"              cores/CPC6128.ZX1
AddCore 0 "Acorn Electron"       cores/Electron.ZX1
AddCore 0 "Galaksija"            cores/Galaksija.zx1
AddCore 0 "Jupiter Ace"          cores/JupAce.ZX1
AddCore 0 "Spectrum Kyp"         cores/Kyp.ZX1
AddCore 0 "MSX"                  cores/MSX.ZX1
AddCore 0 "Nintendo NES"         cores/NES.ZX1
AddCore 0 "Oric"                 cores/Oric.ZX1
AddCore 0 "PC"                   cores/PC.ZX1
AddCore 0 "PC2M"                 cores/PC2M.ZX1
AddCore 0 "Sam Coupe"            cores/SamCoupe.ZX1
AddCore 0 "Sega Master System"   cores/SMS.ZX1
AddCore 0 "TBBlue"               cores/TBBlue.ZX1
AddCore 0 "Vectrex"              cores/Vectrex.ZX1
AddCore 0 "VIC-20"               cores/VIC20.ZX1
AddCore 0 "Arcade Pacman"        cores/Arcades/pacman.ZX1
AddCore 0 "Arcade Galaxian"      cores/Arcades/galaxian.ZX1
AddCore 0 "Arcade Phoenix"       cores/Arcades/phoenix.ZX1
AddCore 0 "Arcade The Glob"      cores/Arcades/theblob.ZX1
AddCore 0 "Arcade Scramble"      cores/Arcades/scramble.ZX1
AddCore 0 "Arcade Frogger"       cores/Arcades/frogger.ZX1
AddCore 0 "Arcade Moon Cresta"   cores/Arcades/mooncresta.ZX1
AddCore 0 "Arcade Jump Shot"     cores/Arcades/jumpshot.ZX1
AddCore 0 "Arcade Amidar"        cores/Arcades/amidar.ZX1
AddCore 0 "Arcade Black Hole"    cores/Arcades/blackhole.ZX1
AddCore 0 "Arcade Crush Roller"  cores/Arcades/crush2.ZX1
AddCore 0 "Arcade Galaga"        cores/Arcades/galaga.ZX1
AddCore 0 "Arcade Gorkans"       cores/Arcades/gorkans.ZX1
AddCore 0 "Arcade Lizard Wizard" cores/Arcades/lizwiz.ZX1
AddCore 0 "Arcade Mr. Do"        cores/Arcades/mrdo.ZX1
AddCore 0 "Arcade Ms. Pacman"    cores/Arcades/mspacman.ZX1
AddCore 0 "Arcade Orbitron"      cores/Arcades/orbitron.ZX1
AddCore 0 "Arcade Pac Miner"     cores/Arcades/pacminer.ZX1
AddCore 0 "Arcade Pacman Plus"   cores/Arcades/pacplus.ZX1

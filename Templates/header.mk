RULE := $(filter all re clean fclean norm header asan anclarma debug,$(MAKECMDGOALS))

AUTHOR	:= Theo ZERIBI
DATE	:= $(shell date +%F)
SPACE	:= -30
VERSION	:= 1.0.0

define print_header
	printf "%b" "$(INFO_COLOR)";
	echo "╔══════════════════════════════════════════════════════════════════════════════╗"
	echo "║ $(OBJ_COLOR)██████╗  ██████╗  ██████╗██╗  ██╗███████╗██████╗    $(OK_COLOR)     ██████╗██╗     ██╗$(INFO_COLOR)  ║";
	echo "║ $(OBJ_COLOR)██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗   $(OK_COLOR)    ██╔════╝██║     ██║$(INFO_COLOR)  ║";
	echo "║ $(OBJ_COLOR)██║  ██║██║   ██║██║     █████╔╝ █████╗  ██████╔╝███$(OK_COLOR)███╗██║     ██║     ██║$(INFO_COLOR)  ║";
	echo "║ $(OBJ_COLOR)██║  ██║██║   ██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗╚═══$(OK_COLOR)══╝██║     ██║     ██║$(INFO_COLOR)  ║";
	echo "║ $(OBJ_COLOR)██████╔╝╚██████╔╝╚██████╗██║  ██╗███████╗██║  ██║   $(OK_COLOR)    ╚██████╗███████╗██║$(INFO_COLOR)  ║";
	echo "║ $(OBJ_COLOR)╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   $(OK_COLOR)     ╚═════╝╚══════╝╚═╝$(INFO_COLOR)  ║";
	echo "║                                                                              ║";
	printf "$(INFO_COLOR)║ $(OK_COLOR)\t\t\t\tMade by:	$(OBJ_COLOR)%$(SPACE)s %b\033[m" "$(AUTHOR)" "$(INFO_COLOR)║\n"
	printf "$(INFO_COLOR)║ $(OK_COLOR)\t\t\t\tDate:		$(OBJ_COLOR)%$(SPACE)s %b\033[m" "$(DATE)" "$(INFO_COLOR)║\n"
	printf "$(INFO_COLOR)║ $(OK_COLOR)\t\t\t\tVersion: 	$(OBJ_COLOR)%-$(SPACE)s %b\033[m" "$(VERSION)" "$(INFO_COLOR)║\n"
	[ "${RULE}" ] && printf "$(INFO_COLOR)║ $(OK_COLOR)\t\t\t\tRule:$(OBJ_COLOR)		%-$(SPACE)s %b\033[m" "$(RULE)" "$(INFO_COLOR)║\n"; \
	echo "$(INFO_COLOR)║                                                                              ║";
	echo "╚══════════════════════════════════════════════════════════════════════════════╝"
endef

header:
ifdef TERM
	clear
endif
	$(call print_header)

import {
	ConsoleManager, 
	ConsoleGuiOptions, 
	ConfirmPopup, 
	PageBuilder, 
	KeyListenerArgs,
	SimplifiedStyledElement,
	InPageWidgetBuilder,
	Box,
	EOL
} from "console-gui-tools"
import _ from "lodash"
import psList, { ProcessDescriptor } from "ps-list"
import { exec } from "child_process";
import  dockerstats from 'dockerstats';


// const opt = {
// 	title: "Progress Bar Test",
// 	layoutOptions: {
// 		type: "single"
// 	},
// 	logLocation: "popup",
// 	enableMouse: true
// } as ConsoleGuiOptions

// const tableData = {
// 	selectedRow: 0,
// 	psTab: [] as ProcessDescriptor[],
// 	header: [] as string[],
// 	table: new InPageWidgetBuilder(100),
// 	maxSizes: [] as number[],
// 	spacing: 2,
// 	sortBy: "name",
// }

// const GUI = new ConsoleManager(opt)

// GUI.on("exit", () => {
// 	closeApp()
// })

// GUI.on("keypressed", (key: KeyListenerArgs) => {
// 	switch (key.name) {
// 	case "q":
// 		new ConfirmPopup({
// 			id: "popupQuit", 
// 			title: "Are you sure you want to quit?"
// 		}).show().on("confirm", () => closeApp())
// 		break
// 	case "f1":
// 			// Help
// 			new ConfirmPopup({
// 				id: "popupHelp", 
// 				title: "Help", 
// 				message: `Use the mouse wheel to scroll the table.${EOL}Press F6 to sort the table.${EOL}Press F1 to show this help.${EOL}Press Q to quit.`
// 			}).show()
// 			break
// 	default:
// 		break
// 	}
// })

// const closeApp = () => {
// 	console.clear()
// 	process.exit()
// }

// GUI.refresh()

// const Table = new Box({ 
// 	id: "table",
// 	x: 0,
// 	y: 0,
// 	width: GUI.Screen.width,
// 	height: GUI.Screen.height,
// })

// Table.focus();

// const drawGui = (p: PageBuilder) => {
// 	GUI.setPage(p)
// 	GUI.refresh()
// }

// const footer = new Box({
// 	id: "footer",
// 	x: 0,
// 	y: GUI.Screen.height - 1,
// 	width: GUI.Screen.width,
// 	height: 1,
// })
// const row = new InPageWidgetBuilder(1)

// row.addRow(
// 	{ text: "F1:", color: "white", bold: true },
// 	{ text: "Help  ", color: "black", bg: "bgCyan", bold: false },
// 	{ text: "Q:", color: "white", bold: true },
// 	{ text: "Quit  ", color: "black", bg: "bgCyan", bold: false },
// )
// footer.setContent(row)

// GUI.on("resize", () => {
// 	footer.absoluteValues = {
// 		x: 0,
// 		y: GUI.Screen.height - 2,
// 		width: GUI.Screen.width,
// 		height: 1,
// 	}
// 	GUI.refresh()
// })

// async function getData() {
// 	const psTable = await psList({all: true})

// 	exec("docker ps", (error, stdout, stderr) => {
// 		if (error) {
// 			console.log(`error: ${error.message}`);
// 			return;
// 		}
// 		if (stderr) {
// 			console.log(`stderr: ${stderr}`);
// 			return;
// 		}
// 		if (psTable.length === 0) return
// 		const p = new PageBuilder()
// 		const header = Object.keys(psTable[0]).map((h) => h.toUpperCase())
// 		const maxSizes = header.map((h) => h.length)
// 		const spacing = 2
// 		p.addSpacer()
//     	p.addRow({text: `${" ".repeat(58)}Uptime: `, color: "#3d96da", bold: true}, {text: `test`, color: "cyan", bold: true})
// 		p.addRow(
// 			...header.map((h, i) => {
// 				return {text: `${h}${" ".repeat((maxSizes[i] - h.length > 0 ? maxSizes[i] - h.length : 0) + spacing)}`, color: "black", bg: "bgGreen", bold: false} as SimplifiedStyledElement
// 			})
// 		)
// 		drawGui(p)
// 		console.log(`stdout: ${stdout}`);
// 		Table.setContent(p);
// 	});
// }

// const drawTable = () => {

// }

// getData()


dockerstats.dockerContainers()
	.then(data => console.log(data))
	.catch(error => console.error(error));

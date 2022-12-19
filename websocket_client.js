const WebSocket = require('ws');
const childProcess = require('child_process');

const wsUrl = process.argv[2];

const ws = new WebSocket(wsUrl, {
	headers: {
		'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0'
	}
});

ws.on('message', message => {
	console.log(message.toString());

	if (!message.toString().startsWith("https://youtube.com") && !message.toString().startsWith("https://youtu.be")) {
		const streamlinkProcess = childProcess.spawn('./bin/streamlink', ['--stream-url', message.toString(), '480p, 360p, worst']);
		let streamlinkOutput = '';
		streamlinkProcess.stdout.on('data', data => {
			streamlinkOutput += data.toString();
		});
		streamlinkProcess.on('close', code => {
			console.log(streamlinkOutput);
			if (streamlinkOutput.startsWith('error')) {
				childProcess.spawn('./control_mplayer', [process.cwd() + "/error.png"]);
				let start = Date.now(),
					now = start;
				while (now - start < 4000) {
					now = Date.now();
				}
				childProcess.spawn('./control_mplayer', [message.toString()]);
			} else {
				childProcess.spawn('./control_mplayer', [streamlinkOutput.slice(0, -1)]);
			}
		});
	} else {
		const youtubeDlProcess = childProcess.spawn('./bin/youtube-dl', ['--get-url', "-f", "best[height<=480]", message.toString()]);
		let youtubeDlOutput = '';
		let youtubeDlOutputError = '';
		youtubeDlProcess.stdout.on('data', data => {
			youtubeDlOutput += data.toString();
		});
		youtubeDlProcess.stderr.on('data', data => {
			youtubeDlOutputError += data.toString();
		});
		youtubeDlProcess.on('close', code => {
			console.log(youtubeDlOutput);
			console.log(youtubeDlOutputError);
			if (!youtubeDlOutputError.startsWith('WARNING') || !youtubeDlOutputError.startsWith('ERROR')) {
				childProcess.spawn('./control_mplayer', [youtubeDlOutput.slice(0, -1)]);
			}
		});
	}
});

function exitHandler(options, exitCode) {
	childProcess.spawn('pkill', ['mplayer']);
	process.exit();
}

process.on('SIGINT', exitHandler.bind(null, {exit:true}));

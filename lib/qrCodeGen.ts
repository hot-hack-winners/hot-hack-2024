import * as QRCode from "qrcode";

const URL: string = process.env.HOST_NAME;

export function generateQR(venueId: string) {
    const scanURL = URL.concat("/scan/").concat(venueId);

    return QRCode.toDataURL(scanURL, {
	color: {
	    dark: "#000",
	    light: "#0000"
	}
    }, function (err: any) {
	if (err) throw err
	console.log('done')
    });
}

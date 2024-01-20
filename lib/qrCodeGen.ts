import * as QRCode from "qrcode";

const URL = process.env.NEXT_PUBLIC_HOST_NAME;

export function generateQR(venueId: string) {
    if (URL) {
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
    } else {
	console.log("The Host Name environment variable is undefined.");
	return null;
    }
}

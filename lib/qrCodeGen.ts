import * as QRCode from "qrcode";

const URL = process.env.NEXT_PUBLIC_HOST_NAME;

export async function generateQR(venueId: string) {
    if (URL) {
        const scanURL = URL.concat("/scan/").concat(venueId);

        try {
            const qrcode = await QRCode.toDataURL(scanURL, {
                color: {
                    dark: "#000",
                    light: "#ffff"  // This should be "#ffffff" or "transparent"
                }
            });
            console.log('QR Code Generated:', qrcode);
            return qrcode;
        } catch (err) {
            console.error('Error generating QR Code:', err);
            throw err;
        }
    } else {
        console.log("The Host Name environment variable is undefined.");
        return null;
    }
}

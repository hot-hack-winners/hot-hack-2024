import * as QRCode from "qrcode";

const URL = process.env.NEXT_PUBLIC_HOST_NAME;

export async function generateQR(venueId: string): Promise<string | null> {
    if (URL) {
        const scanURL = URL.concat("/scan/").concat(venueId);

        try {
            const qrcode = await QRCode.toDataURL(scanURL, {
                color: {
                    dark: "#000000",  // For black color
                    light: "#ffffff"  // For white background, or "transparent"
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

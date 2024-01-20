import React, { useState, ChangeEvent } from 'react';
import { generateQR } from '@/lib/qrCodeGen';

// Define the styles as a TypeScript type
type Styles = {
    [key: string]: React.CSSProperties;
};

const styles: Styles = {
    qrCodeGenerator: {
        // Add styling for the QR code generator container
    },
    input: {
        // Style the input field
    },
    button: {
        // Style the generate button
    },
    error: {
        // Style the error message
        color: 'red',
    },
    qrCodeImage: {
        // Style the displayed QR code image
        marginTop: '20px',
        border: '1px solid #ddd',
        padding: '10px',
    },
};

export function CreateQrCode() {
    const [venueId, setVenueId] = useState<string>('');
    const [qrCodeUrl, setQrCodeUrl] = useState<string | null>(null);
    const [isLoading, setIsLoading] = useState<boolean>(false);
    const [error, setError] = useState<string | null>(null);

    const handleGenerateQR = async () => {
        if (!venueId) {
            alert('Please enter a venue ID');
            return;
        }

        setIsLoading(true);
        setError(null);

        try {
            const qrCodeDataUrl: string | null = await generateQR(venueId);
            setQrCodeUrl(qrCodeDataUrl);
        } catch (err) {
            setError('Error generating QR Code');
            console.error(err);
        } finally {
            setIsLoading(false);
        }
    };

    const handleChange = (e: ChangeEvent<HTMLInputElement>) => {
        setVenueId(e.target.value);
    };

    return (
        <div style={styles.qrCodeGenerator}>
            <input 
                type="text"
                placeholder="Enter venue ID"
                value={venueId}
                onChange={handleChange}
                style={styles.input}
            />
            <button onClick={handleGenerateQR} disabled={isLoading} style={styles.button}>
                {isLoading ? 'Generating...' : 'Generate QR Code'}
            </button>
            {error && <div style={styles.error}>{error}</div>}
            {qrCodeUrl && <img src={qrCodeUrl} alt="QR Code" style={styles.qrCodeImage} />}
        </div>
    );
}

import React, { useState } from 'react';
import { generateQR } from '@/lib/qrCodeGen';








const styles = {
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
    const [venueId, setVenueId] = useState('');
    const [qrCodeUrl, setQrCodeUrl] = useState(null);
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState(null);

    const handleGenerateQR = async () => {
        if (!venueId) {
            alert('Please enter a venue ID');
            return;
        }

        setIsLoading(true);
        setError(null);

        try {
            const qrCodeDataUrl = await generateQR(venueId);
            setQrCodeUrl(qrCodeDataUrl);
        } catch (err) {
            setError('Error generating QR Code');
            console.error(err);
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <div className={styles.qrCodeGenerator}>
            <input 
                type="text"
                placeholder="Enter venue ID"
                value={venueId}
                onChange={(e) => setVenueId(e.target.value)}
                className={styles.input}
            />
            <button onClick={handleGenerateQR} disabled={isLoading} className={styles.button}>
                {isLoading ? 'Generating...' : 'Generate QR Code'}
            </button>
            {error && <div className={styles.error}>{error}</div>}
            {qrCodeUrl && <img src={qrCodeUrl} alt="QR Code" className={styles.qrCodeImage} />}
        </div>
    );
}

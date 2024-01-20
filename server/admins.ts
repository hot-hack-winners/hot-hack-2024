import executeQuery from "@/lib/db";
import { z } from 'zod';
import bcrypt from 'bcrypt';

const adminSchema = z.object(
    {
        uuid: z.string(),
        organisations_uuid: z.string(),
        name: z.string(),
        email: z.string(),
        password: z.string()
    }
)

export type Admin = z.infer<typeof adminSchema>

export function getAllAdmins() {
    return executeQuery<Admin[]>(
        'SELECT * FROM admins',
        []
    )
}

export function getAdminByID(adminId: string) {
    const data = executeQuery<Admin>(
        'SELECT * FROM admins where uuid = ?;',
        [adminId]
    )
    return data
}

export function registerAdmin(adminUser: Saveable<Admin>) {
    const saltRounds: number = 10;
    bcrypt.genSalt(saltRounds, function (err, salt) {
        bcrypt.hash(adminUser.password, salt, function (err, hash) {
            return executeQuery(
                'INSERT INTO admins (uuid, organisations_uuid, name, email, password) VALUES(uuid(), ?, ?, ?, ?)',
                [adminUser.organisations_uuid, adminUser.name, adminUser.email, hash]
            )
        });
    });
}
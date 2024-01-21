'use server'
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

export async function getAllAdmins() {
    return await executeQuery<Admin[]>(
        'SELECT * FROM admins',
        []
    )
}

export async function getAdminByID(adminId: string) {
    const data = await executeQuery<Admin>(
        'SELECT * FROM admins where uuid = ?;',
        [adminId]
    )
    return data
}

export async function registerAdmin(adminUser: Saveable<Admin>) {
    const saltRounds: number = 10;
    bcrypt.genSalt(saltRounds, async function (err, salt) {
        bcrypt.hash(adminUser.password, salt, async function (err, hash) {
            return await executeQuery(
                'INSERT INTO admins (uuid, organisations_uuid, name, email, password) VALUES(uuid(), ?, ?, ?, ?)',
                [adminUser.organisations_uuid, adminUser.name, adminUser.email, hash]
            )
        });
    });
}

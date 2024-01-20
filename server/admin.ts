import executeQuery from "@/lib/db";
import { z } from 'zod';
import bcrypt from 'bcrypt';

const adminSchema = z.object(
    {
        admin_uuid: z.string().optional(),
        organisation_uuid: z.string().optional(),
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

export function registerAdmin(adminUser: Admin) {

    const saltRounds: number = 10;
    console.log("Entered registerFunction")
    bcrypt.genSalt(saltRounds, function (err, salt) {
        console.log("salt")
        console.log(salt)
        bcrypt.hash(adminUser.password, salt, function (err, hash) {
            console.log(hash)
            return executeQuery(
                'INSERT INTO admins (admin_uuid, organisation_uuid, name, email, password) VALUES(uuid(), ?, ?, ?, ?)',
                [adminUser.organisation_uuid, adminUser.name, adminUser.email, hash]
            )
        });
    });

}
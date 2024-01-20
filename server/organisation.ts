import executeQuery from "@/lib/db";
import { z } from 'zod';
import bcrypt from 'bcrypt';

const organisationSchema = z.object(
    {
        organisation_uuid: z.string().optional(),
        name: z.string(),
        ABN: z.string(),
    }
)

export type Organisation = z.infer<typeof organisationSchema>

export function getAllOrganisations() {
    return executeQuery<Organisation[]>(
        'SELECT * FROM organisation',
        []
    )
}

export function addOrgnisation(organisation: Organisation) {

    return executeQuery(
        'INSERT INTO organisation (organisation_uuid, name, ABN) VALUES(uuid(), ?, ?)',
        [organisation.name, organisation.ABN]
    )
}
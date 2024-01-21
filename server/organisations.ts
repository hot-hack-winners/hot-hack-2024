import executeQuery from "@/lib/db";
import { z } from 'zod';

const organisationSchema = z.object(
    {
        uuid: z.string().optional(),
        name: z.string(),
        ABN: z.string(),
    }
)

export type Organisation = z.infer<typeof organisationSchema>

export async function getAllOrganisations() {
    return await executeQuery<Organisation[]>(
        'SELECT * FROM organisations',
        []
    )
}

export async function getOrganisationByID(organisationId: string) {
    const data = executeQuery<Organisation>(
        'SELECT * FROM organisations where uuid = ?;',
        [organisationId]
    )
    return await data
}

export async function addOrgnisation(organisation: Organisation) {

    return await executeQuery(
        'INSERT INTO organisations (uuid, name, ABN) VALUES(uuid(), ?, ?)',
        [organisation.name, organisation.ABN]
    )
}
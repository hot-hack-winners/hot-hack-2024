'use server'
import executeQuery from "@/lib/db";
import { z } from 'zod';

const organisationSchema = z.object(
    {
        uuid: z.string(),
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
    return await executeQuery<Organisation>(
        'SELECT * FROM organisations where uuid = ?;',
        [organisationId]
    )
}

export async function addOrgnisation(organisation: Saveable<Organisation>) {
    return await executeQuery(
        'INSERT INTO organisations (uuid, name, ABN) VALUES(uuid(), ?, ?)',
        [organisation.name, organisation.ABN]
    )
}

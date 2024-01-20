import executeQuery from "@/lib/db";
import { z } from 'zod';

const organisationSchema = z.object(
    {
        organisations_uuid: z.string().optional(),
        name: z.string(),
        ABN: z.string(),
    }
)

export type Organisation = z.infer<typeof organisationSchema>

export function getAllOrganisations() {
    return executeQuery<Organisation[]>(
        'SELECT * FROM organisations',
        []
    )
}

export function addOrgnisation(organisation: Organisation) {

    return executeQuery(
        'INSERT INTO organisations (organisations_uuid, name, ABN) VALUES(uuid(), ?, ?)',
        [organisation.name, organisation.ABN]
    )
}
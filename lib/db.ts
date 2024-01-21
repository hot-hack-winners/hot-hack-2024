import mysql from 'serverless-mysql';

const db = mysql({
    config: {
        host: 'ls-80cd1b8fb0252fde234d565db024b9593fd96ff4.ckxs1fhmtwsl.ap-southeast-2.rds.amazonaws.com',
        port: 3306,
        database: 'hot-hack-2024',
        user: 'dbmasteruser',
        password: 'KV>-uYWN:hkC}ge]|Gac&Q`1{A7k>HVa'
    }
});

// Example:
export default async function executeQuery<T>(query: string, values: any[]) {
    try {
        const results = await db.query(query, values);

        await db.end();

        return JSON.parse(JSON.stringify(results)) as T;
    } catch (error) {
        return { error };
    }

}

type User = {
    name: string;
}

const output = executeQuery<User>('test', [6])
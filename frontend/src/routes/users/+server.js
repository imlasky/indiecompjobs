import { error } from '@sveltejs/kit';
import { db } from '$lib/db';


/** @type {import('./$types').RequestHandler} */
export async function POST({ request }) {
    const {email} = await request.json()
    const emailExists = await db.User.findMany({
        where: {
            email: email,
        },
    })
    if (emailExists.length > 0) {
        throw error(409, "User exists")
    } else {
        const user = await db.User.create({
            data: {
                email: email
            }
        });
        return new Response({status: "ok", user})    
    }
    
}
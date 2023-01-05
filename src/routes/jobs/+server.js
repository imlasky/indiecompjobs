import { db } from '$lib/db';
import { json } from '@sveltejs/kit';


export async function GET(){

    const allJobs = await db.Job.findMany({
        include: {
            locs: true,
            tags: true,
        }
    });
    return json(allJobs)
}
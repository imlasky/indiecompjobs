import { error } from '@sveltejs/kit';
import { db } from '$lib/db';


/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {

    const allJobs = await db.Job.findMany({
        include: {
            locs: true,
            tags: true,
        }
    });
    
    return {allJobs};

}
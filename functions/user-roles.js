/*
This serverless function handles the CRUD event triggers by extracting key data from the 
request payload and save it to the logs table.
*/

export default async (req, res) => {
    try {
      // Input validation
      const newData = req.body?.event?.data?.new;
      if (!newData || (!newData.role  || !newData.user_id) ) {
        throw new Error('Invalid request data');
      }
  
      const userId = newData.user_id;
      const role = newData.role;
  
      // Check if the role is "member"
      if (role === "member") {
        console.log('Role is "member", skipping insertion into user_roles table');
        return res.status(200).send('Role is "member", skipping insertion into user_roles table');
      }
  
      const urlString = process.env.NHOST_HASURA_URL;
  
      // Parse the URL
      const url = new URL(urlString);
  
      // Extract the base URL
      const baseURL = `${url.protocol}//${url.host}`;
  
      // add endpoint to extraxted base url;
      const apiUrl = baseURL + '/api/rest/insert-user-role';
      
      const response = await fetch(apiUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'x-hasura-admin-secret': process.env.NHOST_ADMIN_SECRET
        },
        body: JSON.stringify({
          userId, role
        }),
      });
  
      // Check if the request was successful (status code 2xx)
      if (response.ok) {
        const responseBody = await response.json();
        console.log('Response from the server:', responseBody);
        return res.status(200).send('Data inserted successfully');
      } else {
        console.error('Error sending data to the server:', response.statusText);
        return res.status(response.status).send('Failed to insert data');
      }
    } catch (error) {
      console.error('An error occurred:', error);
      return res.status(500).send('Internal Server Error');
    }
  };
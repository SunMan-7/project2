/*
This serverless function handles the CRUD event triggers by extracting key data from the 
request payload and save it to the logs table.
*/

export default async (req, res) => {
    try {
      const user_id = req.body.event.session_variables['x-hasura-user-id'];
      const created_at = req.body.created_at;
      const action_type = req.body.event.op;
      const affected_table= req.body.table.name; 
      const details = JSON.stringify(req.body.event.data);
  
      const urlString = process.env.NHOST_HASURA_URL;
  
      // Parse the URL
      const url = new URL(urlString);
  
      // Extract the base URL
      const baseURL = `${url.protocol}//${url.host}`;
  
      // add endpoint to extraxted base url;
      const apiUrl = baseURL + '/api/rest/log';
      
      const response = await fetch(apiUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'x-hasura-admin-secret': process.env.NHOST_ADMIN_SECRET
        },
        body: JSON.stringify({
          values: {
            user_id,
            created_at,
            action_type,
            affected_table,
            details
          }
        }),
      });
  
      // Check if the request was successful (status code 2xx)
      if (response.ok) {
        const responseBody = await response.json();
        console.log('Response from the server:', responseBody);
        res.status(200).send('OK');
      } else {
        console.error('Error sending data to the server:', response.statusText);
        res.status(response.status).send('Error');
      }
    } catch (error) {
      console.error('An error occurred:', error);
      res.status(500).send('Internal Server Error');
    }
  };
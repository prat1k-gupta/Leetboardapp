const { default: axios } = require("axios");
require('dotenv').config();

const getQuestions = async (user)=>{
    const URL = process.env.URL; 
    try{
        const endpoint = URL;
        const headers = {
            "content-type": "application/json",
        };
        const graphqlQuery = {
            "operationName": "userProfile",
            "query": `query userProfile($username: String!,$limit: Int!) {
              recentAcSubmissionList(username: $username, limit: $limit) {
                id
                title
                titleSlug
                timestamp
              }
            }`,
            "variables" : {"username": user ,"limit": 200}
        };

        const response = await axios({
        url: endpoint,
        method: 'post',
        headers: headers,
        data: graphqlQuery
        });
        const data = await response.data;
        if(data.data.recentAcSubmissionList){
            const questionList = data.data.recentAcSubmissionList; 
            return questionList; 
        }else{
            return null; 
        }
    }catch(err){
        throw err; 
    }
}

module.exports = getQuestions;
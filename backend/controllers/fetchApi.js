const { default: axios } = require("axios");

const fetchApi = async (req,res)=>{
      const user = req.params.user; 
      const year = new Date().getFullYear();
      const URL = process.env.URL; 
      try{
          const endpoint = URL;
          const headers = {
              "content-type": "application/json",
          };
          const graphqlQuery = {
              "operationName": "userProfile",
              "query": `query userProfile($username: String!,$year: Int!,$limit: Int!) {
                  matchedUser(username: $username) {
                    username
                    githubUrl
                    linkedinUrl
                    profile {
                      ranking
                      userAvatar
                      realName
                      school
                    }
                    languageProblemCount {
                      languageName
                      problemsSolved
                    }
                    userCalendar(year: $year) {
                      streak
                      totalActiveDays
                    }
                    submitStatsGlobal {
                      acSubmissionNum {
                        difficulty
                        count
                      }
                    }
                  }
                  recentAcSubmissionList(username: $username, limit: $limit) {
                    id
                    title
                    titleSlug
                    timestamp
                  }
                }`,
              "variables" : {"username": user , "year": year , "limit": 10}
          };
  
          const response = await axios({
          url: endpoint,
          method: 'post',
          headers: headers,
          data: graphqlQuery
          });
          const data = await response.data;
          if(data.errors){
              return res.status(404).json({error: data.errors[0].message})
          }
          res.status(200).json(data.data);  
  
      }catch(err){
          throw err; 
      }
}

module.exports = fetchApi; 
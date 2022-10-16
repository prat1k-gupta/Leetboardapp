const { default: axios } = require("axios");

const userCheck = async (user) => {
  const year = new Date().getFullYear();
  const URL = process.env.URL;
  try {
    const endpoint = URL;
    const headers = {
      "content-type": "application/json",
    };
    const graphqlQuery = {
      operationName: "userProfile",
      query: `query userProfile($username: String!,$year: Int!,$limit: Int!) {
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
      variables: { username: user, year: year, limit: 10 },
    };
    try{
        const response = await axios({
          url: endpoint,
          method: "post",
          headers: headers,
          data: graphqlQuery,
        });
        const data = await response.data;
        if (data.errors) {
          return data.errors[0].message;
        }
        return data; 
    }catch(err){
        console.log(err);
    }
  } catch (err) {
    throw err;
  }
};

module.exports = userCheck;

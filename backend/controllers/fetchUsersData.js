const { default: axios } = require("axios");
require("dotenv").config();



const fetchData = async (currentUser) => {
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
      variables: { username: currentUser, year: year, limit: 10 },
    };

    const response = await axios({
      url: endpoint,
      method: "post",
      headers: headers,
      data: graphqlQuery,
    });
    const data = await response.data;
    return data;

    // return data;
    // if(data.errors){
    //     return "not found"
    // }
  } catch (err) {
    throw err;
  }
};

const fetchUsersData = async (users) => {
  // const user = users[0];
  // const userData = await fetchData(user);
  // return res.status(200).json(userData)

  const allData = await Promise.all(
    users
      .map(async (currentUser) => {
        const response = await fetchData(currentUser);
        console.log(response.toString())
        if(!response.errors){
          return response
        }
      })
  );
  try {
    const descData = allData.sort((a, b) => {
      if (b !== undefined && a !== undefined) {
        return (
          b.data.matchedUser.submitStatsGlobal.acSubmissionNum[0].count -
          a.data.matchedUser.submitStatsGlobal.acSubmissionNum[0].count
        );
      }
    });
    return descData; 
  } catch (err) {
    throw err;
  }
};

module.exports = fetchUsersData;

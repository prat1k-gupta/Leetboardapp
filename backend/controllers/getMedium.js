const { default: axios } = require("axios");
const getQuestions = require("./getQuestions");

require('dotenv').config();

const questionDetails = async (titleSlug)=>{
    const URL = process.env.URL; 
    try{
        const endpoint = URL;
        const headers = {
            "content-type": "application/json",
        };
        const graphqlQuery = {
            "operationName": "questionData",
            "query": `query questionData($titleSlug: String!) {
                question(titleSlug: $titleSlug) {
                  title
                  titleSlug
                  difficulty
                  likes
                  dislikes
                  categoryTitle
                }
              }`,
            "variables" : {"titleSlug": titleSlug}
        };

        const response = await axios({
        url: endpoint,
        method: 'post',
        headers: headers,
        data: graphqlQuery
        });
        const data = await response.data;
        return data; 
    }catch(err){
        throw err; 
    }
}
const getMedium = async (req,res)=>{
    const questionList = await getQuestions(req.params.user); 
    if(questionList==null){
        return res.json({error: "invalid user"}); 
    }
    const allData =  await Promise.all(
        questionList.map(async (question)=>{
            const response = await questionDetails(question.titleSlug);
            return {
                titleSlug: response.data.question.titleSlug,
                difficulty: response.data.question.difficulty,
                url: new URL("https:leetcode.com/problems/"+response.data.question.titleSlug)
            };      
        })
    )
    const filterData = allData.filter(data => data.difficulty==="Medium")
    res.json(filterData)
}

module.exports = getMedium;
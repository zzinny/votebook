/**
 * create new voter with token valid
 * @param {org.sample.votebook.CreateVoterToken} createInfo
 * @transaction
*/
async function createVoterToken(createInfo) {
  var factory = getFactory();
  let uniqueStringId = '_' + Math.random().toString(36).substr(2, 9);
  let uniqueDigitStringId = (Math.floor(900000 * Math.random()) + 100000).toString();
     
  let voterRegistry = await getParticipantRegistry('org.sample.votebook.Voter');
  let voter = await factory.newResource('org.sample.votebook', 'Voter', uniqueStringId);
     
  let tokenRegistry = await getAssetRegistry('org.sample.votebook.Token');
  let token = await factory.newResource('org.sample.votebook', 'Token', uniqueDigitStringId);
  
  token.tokenType = createInfo.voterInfo.department;
  voter.voterInfo = createInfo.voterInfo;
  voter.token = token;   
     
  await tokenRegistry.add(token);
  await voterRegistry.add(voter);
}
 
/**
 * create new voter with token valid
 * @param {org.sample.votebook.CreateElection} electionInfo
 * @transaction
*/
async function createElection(electionInfo) {
  var factory = getFactory();
     
  let electionRegistry = await getAssetRegistry('org.sample.votebook.Election');
  let election = await factory.newResource('org.sample.votebook', 'Election', electionInfo.electionName);
     
  let resultRegistry = await getAssetRegistry('org.sample.votebook.ElectionResult');
  let result = await factory.newResource('org.sample.votebook', 'ElectionResult', electionInfo.electionName + '_Result');
  
  election.electionType = electionInfo.electionType;
  election.candidateList = electionInfo.candidateList;
  election.startDate = electionInfo.startDate;
  election.endDate = electionInfo.endDate;
  
  var tmpArr2 = new Array();
  for(var i=0; i<10; i++) {
    tmpArr2[i] = 0;
  }
  election.departmentVoteNum = tmpArr2;
  
  var tmpArr = new Array();
  for(var i=0; i<electionInfo.candidateList.length; i++) {
    tmpArr[i] = 0;
  }
  result.candidateVoteNum = tmpArr;
  
  election.electionResult = result;   
     
  await resultRegistry.add(result);
  await electionRegistry.add(election);
}

/**
 * create new voter with token valid
 * @param {org.sample.votebook.Vote} voting
 * @transaction
*/
async function vote(voting) { 
  var factory = getFactory();
  let event = factory.newEvent('org.sample.votebook', 'ErrorReport');
  
  let tokenRegistry = await getAssetRegistry('org.sample.votebook.Token');
  let token = await tokenRegistry.get(voting.tokenId);
  
  let electionRegistry = await getAssetRegistry('org.sample.votebook.Election');
  let election = await electionRegistry.get(voting.electionId);
  
  var now = new Date();
  if(now > election.endDate){
    event.errorType = "ERROR: The election is expired";
    emit(event);
    return;
  }
  
  if(election.electionType == "GENERAL"){
    if(token.general_isValid <= 0){
      event.errorType = "ERROR: Already vote in General Election";
      emit(event);
      return;
    }
    token.general_isValid -= 1;
  } else {
    if(token.depart_isValid <= 0){
      event.errorType = "ERROR: Already vote in Department Election";
      emit(event);
      return;
    }
    if(election.electionType != token.tokenType){
      event.errorType = "ERROR: Not valid voter";
      emit(event);
      return;
    }
    token.depart_isValid -= 1;
  }
  
  let resultRegistry = await getAssetRegistry('org.sample.votebook.ElectionResult');
  let result = await resultRegistry.get(election.electionId+'_Result');
  
  result.candidateVoteNum[voting.select] += 1;
  
  election.departmentVoteNum[0] += 1; // total # of votes
  switch(token.tokenType){
    case "CSE": election.departmentVoteNum[1] += 1;
      break;
    case "SECURITY" : election.departmentVoteNum[2] += 1;
      break;
    case "FOODENG": election.departmentVoteNum[3] += 1;
      break;
    case "CHEMS" : election.departmentVoteNum[4] += 1;
      break;
    case "ARCHI" : election.departmentVoteNum[5] += 1;
      break;
    case "URBAN" : election.departmentVoteNum[6] += 1;
      break;
    case "ENV" : election.departmentVoteNum[7] += 1;
      break;
    case "CLIM": election.departmentVoteNum[8] += 1;
      break;
    case "MBE" : election.departmentVoteNum[9] += 1;
      break;
  }
  
  await tokenRegistry.update(token);
  await electionRegistry.update(election);
  await resultRegistry.update(result);
}
 
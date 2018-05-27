pragma solidity ^0.4.23;

import "./QuestCards.sol";
import "./MerkleProof.sol";

contract QuestManager is QuestCards {

    uint256 QuestCount = 0;
    mapping (uint=>Quest) Quests;
    uint256[] QuestList;

    struct Quest {
        address Creator;
        uint256 ID;
        string name;
        string hint;
        bytes32 merkleRoot;
        string CardName;
        uint numTokens;
    }

    function createQuest(string _name, string _hint, uint _numTokens, bytes32 _merkleRoot, string _cardName) public returns (uint256) {
        Quest memory newQuest;
        uint256 QuestID = QuestCount++;
        newQuest.name = _name;
        newQuest.hint = _hint;
        newQuest.merkleRoot = _merkleRoot;
        newQuest.ID = QuestID;
        newQuest.Creator = msg.sender;
        newQuest.CardName = _cardName;
        newQuest.numTokens = _numTokens;
        Quests[QuestID] = newQuest;
        QuestList.push(QuestID);
        return QuestID;
    }

    function proveLocation(uint _questID, bytes32[] _proof, bytes32 _leaf) returns (bool){

        if(MerkleProof.verifyProof(_proof,Quests[_questID].merkleRoot,_leaf)){
            mintTo(msg.sender,"",Quests[_questID].CardName);
            return true;
        }
        else{
            return false;
        }

    }

    //return list of Quests
    function getQuestList() returns (uint256[]) {
        return QuestList;
    }

    function getQuest(uint256 _ID) returns (string, string, bytes32, address, string, uint) {
        Quest temp = Quests[_ID];
        return (temp.name, temp.hint, temp.merkleRoot, temp.Creator, temp.CardName, temp.numTokens);
    }

}

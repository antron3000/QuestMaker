pragma solidity ^0.4.21;

import "./ERC721Token.sol";
import "./Ownable.sol";


/**
 * @title CryptoPuff
 * CryptoPuff - a contract for my non-fungible crypto puffs.
 */
contract QuestCards is ERC721Token, Ownable {
    function QuestCards() ERC721Token("QuestCards", "QUEST") public { }

    /**
    * @dev Mints a token to an address with a tokenURI.
    * @param _to address of the future owner of the token
    * @param _tokenURI token URI for the token
    */

    struct QuestCard{
        string Name;
    }

    mapping (uint=>QuestCard) QuestCardList;


    function mintTo(address _to, string _tokenURI,string _name) public onlyOwner {
        uint256 newTokenId = _getNextTokenId();
        _mint(_to, newTokenId);
        _setTokenURI(newTokenId, _tokenURI);

        QuestCardList[newTokenId].Name = _name;
    }

    /**
    * @dev calculates the next token ID based on totalSupply
    * @return uint256 for the next token ID
    */
    function _getNextTokenId() private view returns (uint256) {
        return totalSupply().add(1);
    }


}pragma solidity ^0.4.21;

import "./ERC721Token.sol";
import "./Ownable.sol";


/**
 * @title CryptoPuff
 * CryptoPuff - a contract for my non-fungible crypto puffs.
 */
contract QuestCards is ERC721Token, Ownable {
    function QuestCards() ERC721Token("QuestCards", "QUEST") public { }

    /**
    * @dev Mints a token to an address with a tokenURI.
    * @param _to address of the future owner of the token
    * @param _tokenURI token URI for the token
    */

    struct QuestCard{
        string Name;
    }

    mapping (uint=>QuestCard) QuestCardList;


    function mintTo(address _to, string _tokenURI,string _name) public onlyOwner {
        uint256 newTokenId = _getNextTokenId();
        _mint(_to, newTokenId);
        _setTokenURI(newTokenId, _tokenURI);

        QuestCardList[newTokenId].Name = _name;
    }

    /**
    * @dev calculates the next token ID based on totalSupply
    * @return uint256 for the next token ID
    */
    function _getNextTokenId() private view returns (uint256) {
        return totalSupply().add(1);
    }


}

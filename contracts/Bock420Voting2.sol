pragma solidity ^0.4.21;

import "./Block420Token.sol";

contract Block420Vote is Block420Token {
    Block420Token public token; //
    bytes32[] public postIds;
    mapping(bytes32 => Post) public posts;
    Vote[] internal recentVotes;
    event Posting(bytes32 indexed id, address indexed author, string message);
    event Voting(address indexed voter, bytes32 indexed postId, uint votes);

    struct Post {
        bytes32 id;
        address author;
        string message;
        uint votes;
        bool exists;
    }
    struct Vote {
        address voter;
        bytes32 postId;
    }

    function Block420Vote() public {
        token = new Block420Token();
    }

    function getPost(bytes32 postId) public view returns (bytes32 id, address author,string message, uint votes) {
        Post storage post = posts[postId];
        return (post.id, post.author, post.message, post.votes);
    }

    function create(string message) public {
        bytes32 id = keccak256(block.number, msg.sender, message);
        Post storage post = posts[id];
        post.id = id;
        post.author = msg.sender;
        post.message = message;
        post.exists = true;
        posts[id] = post;

        

        emit Posting(post.id, post.author, post.message);
    }

   

    function vote(bytes32 postId) public {
        Post storage post = posts[postId];
        require(post.exists);
        
        
        post.votes += 1;
        token.mint(post.author, );
        token.mint(msg.sender, );
       
        emit Voting(msg.sender, post.id, post.votes);

    }
}
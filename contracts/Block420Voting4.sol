pragma solidity ^0.4.21;

import "./Block420Token.sol";

contract Block420Voting {
    Block420Token public token;
    mapping(bytes32 => Post) public posts;
    uint8 decimals = 18;

    event Posting(bytes32 indexed id, address indexed author, string message);
    event Voting(address indexed voter, bytes32 indexed postId, uint voteCount);

    struct Post {
        bytes32 id;
        address author;
        string message;
        uint voteCount;
        bool exists;
    }

    function Block420() public {
        token = new Block420Token();
    }

    function getPost(bytes32 postId) public view returns (bytes32 id, address author, string message, uint voteCount) {
        Post storage post = posts[postId];
        return (post.id, post.author, post.message, post.voteCount);
    }

    function create(string message) public {
        bytes32 id = keccak256(block.number, msg.sender, message);
        Post storage post = posts[id];
        post.id = id;
        post.author = msg.sender;
        post.message = message;
        post.exists = true;
        posts[id] = post;

        token.mint(msg.sender, 10**uint256(decimals));

        emit Posting(post.id, post.author, post.message);
    }

    function vote(bytes32 postId) public { //보트함수는 포스트아이디를 받아옴
        Post storage post = posts[postId];
        require(post.exists); // 포스트가 존재하는지 여부 검사

        post.voteCount += 1; //보팅수를 1증가시켜준다

        token.mint(msg.sender, 10**uint256(decimals)/2);
        token.mint(post.author, 10**uint256(decimals)/2);

        emit Voting(msg.sender, post.id, post.voteCount); // 보팅이벤트를 발생해서 로그에 기록

    }
}
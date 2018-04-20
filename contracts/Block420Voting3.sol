pragma solidity ^0.4.21;

import "./Block420Token.sol";

contract Block420Voting {
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

    function Block420Voting() public {
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

        proofOfPost();

        emit Posting(post.id, post.author, post.message);
    }

    function proofOfPost() private {
        uint totalTokens = 0;
        for (uint i = 0; i < recentVotes.length; i++) { //반복문 i는 리센트보츠 길이까지 반복
            Vote memory vote = recentVotes[i]; //리센트보츠 i 의 
            Post memory post = posts[vote.postId]; //포스트아이디를 가져와서 포스트에 저장
            uint tokens = 10 ** uint(token.decimals()); //분배할 토큰의 수를 결정
            totalTokens += tokens; // 토탈토큰에 세이트 토큰 갯수를 더한다
            
            token.mint(post.author, tokens); //작성자에게 세이트토큰 갯수만큼 발행해준다
            delete recentVotes[i]; // 리센트보트의 
        }
        recentVotes.length = 0; //리센트보츠의 길이를 0으로 초기화 시켜준다
        token.mint(msg.sender, totalTokens / 10); //작성자에게 전체 토큰의 1/10만큼 발행해줌
    }

    function vote(bytes32 postId) public { //보트함수는 포스트아이디를 받아옴
        Post storage post = posts[postId];
        require(post.exists); // 포스트가 존재하는지 여부 검사

        post.votes += 1; //보팅수를 1증가시켜준다

        recentVotes.push(Vote(msg.sender, post.id)); //

        emit Voting(msg.sender, post.id, post.votes); // 보팅이벤트를 발생해서 로그에 기록

    }
}

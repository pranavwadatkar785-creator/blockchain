//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// contract SimpleStorage{
//     // Basic Types
//     bool true0rfalse = true;
//     uint num = 255; //uint can specified from 8 to 256 in bits if not specified default is 256
//     int256 num2 = -16; // int can be negative, int can specified from 8 to 256 in bits if not specified default is 256
//     string name = "Pranav";
//     address myadd = 0xda7126890BcEeb5fCbC2cC77Dc4B685831ce9C67;
//     bytes32 Byytes = "Wadatkar";
// }

contract SimpleStorageMain{
    uint public myfavnum = 0; // if not specified default is zero

    uint256[] listoffav;

    struct Person{
        uint256 favnum;
        string name;
    }
    // Person public me = Person(19,"Pranav");

    //if size is specified in [] then it is a static array if not it is dynamic array(size can grow or shrink)
    Person[] public listofnum;

    mapping(string => uint256) public nameToFavnum;

    function store(uint _favnum) public {
        myfavnum = _favnum;
    }

    function retrieve() public view returns(uint256){
        return myfavnum; // view in function call only allows to retrieve data, not store, pure doesn't allow anthing
    }

    function addperson(string memory name,uint256 _favnum) public {
        listofnum.push(Person(_favnum, name));
        nameToFavnum[name] = _favnum;
    }
}
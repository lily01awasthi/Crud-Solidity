pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;
contract CarApp{
    struct car{
        uint id;
        string name;
        string owner;
        uint256 price;
        string parameter;
    }
    car[] public cars;
    uint256 public totalCars;
    uint public nextId;
    constructor() public {
        totalCars=0;
    }
    
    function Create (string memory CarName,string memory CarOwner, uint256 CarPrice,string memory CarParameter) public returns(uint256){
        cars.push(car(nextId,CarName,CarOwner,CarPrice,CarParameter));
        totalCars++;
        nextId++;
        return totalCars;

    } 
    function getCar(uint _id) internal view returns(uint){
        for(uint i=0;i<cars.length;i++){
            if(cars[i].id==_id){
                return i;
            }
        }
        revert("car model does not exit");
        
    }
    
    function Delete (uint CarId) public returns(bool){
        require(totalCars > 0);
        uint i= CarId;
        delete cars[i];
   }
   function SelectById(uint CarId) public view returns (uint,string memory,string memory, uint256,string memory){
       require(totalCars>0);
       uint i=getCar(CarId);
       return (cars[i].id,cars[i].name,cars[i].owner,cars[i].price,cars[i].parameter);
       }

function SelectAll() public view returns (uint[] memory,string[] memory,string[] memory, uint256[] memory,string[] memory){
       uint[] memory carId = new uint[](totalCars);
       string[] memory carName = new string[](totalCars);
       string[] memory carOwner = new string[](totalCars);
       uint256[] memory carPrice = new uint256[](totalCars);
       string[] memory carParameter = new string[](totalCars);
        for (uint i = 0; i < totalCars; i++) {
            car storage Car = cars[i];
            carId[i] = Car.id;
            carName[i] =Car.name;
            carOwner[i]=Car.owner;
            carPrice[i]=Car.price;
            carParameter[i]=Car.parameter;
        }
        return (carId,carName,carOwner,carPrice,carParameter);
   }
     function Update(uint CarId, string memory CarName, string memory CarOwner, uint256 CarPrice, string memory CarParameter) public returns (bool){
       require(totalCars>0);
       uint i=getCar(CarId);
       cars[i].name=CarName;
       cars[i].owner=CarOwner;
       cars[i].price=CarPrice;
       cars[i].parameter=CarParameter;
       return true; 
       
       }
} 
    
   

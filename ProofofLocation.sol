pragma solidity 0.5.1;

contract ProofofLocation {

    struct ItemStruct {
        uint long;
        uint lat;
    }

    mapping(uint => ItemStruct) public itemStructs;
    uint [] public itemList;

    event LogItemLoc(uint item, uint itemLong, uint itemLat);

// location is stored in uint, needs to be put into decimal when read back 
    function appendItemLoc(uint item, uint itemLong, uint itemLat) public {
        itemList.push(item);
        itemStructs[item].long = itemLong;
        itemStructs[item].lat = itemLat;
    }

    function getItemCount() public view returns(uint count) {
        return itemList.length;
    }

    function itemLoop() public {

        for (uint i=0; i<itemList.length; i++) {
            emit LogItemLoc(itemList[i], itemStructs[itemList[i]].long, itemStructs[itemList[i]].lat);
        }
    }
}
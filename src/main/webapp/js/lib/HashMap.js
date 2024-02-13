HashMap = function(){
	this.map = new Object();
};   
HashMap.prototype = {   
	put : function(K, V){   
		this.map[K] = V;
    },   
    get : function(K){   
        return this.map[K];
    },
    containsKey : function(K){    
    	return K in this.map;
    },
    containsValue : function(V){    
    	for(var P in this.map){
    		if(this.map[P] == V) return true;
    	}
    	return false;
    },
    isEmpty : function(K){    
    	return (this.size() == 0);
    },
    clear : function(){   
    	for(var P in this.map){
    		delete this.map[P];
    	}
    },
    remove : function(K){    
    	delete this.map[K];
    },
    keys : function(){   
    	var Ks = new Array(); //keys   
        for(var P in this.map){   
        	Ks.push(P);
        }   
        return Ks;
    },
    values : function(){   
    	var Vs = new Array(); //values   
        for(var P in this.map){   
        	Vs.push(this.map[P]);
        }   
        return Vs;
    },
    size : function(){
    	var C = 0;
    	for (var prop in this.map) {
    		C++;
    	}
    	return C;
    }
 };

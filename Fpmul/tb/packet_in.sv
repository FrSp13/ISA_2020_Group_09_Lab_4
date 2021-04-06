class packet_in extends uvm_sequence_item;
    rand bit [31:0] A;
    rand bit [31:0] B;
	
	constraint A_exp_distribution {
		A[30:23] inside {[64:190]};
	}

	constraint B_exp_distribution {
		B[30:23] inside {[64:190]};
	}


	constraint A_mantissa_distribution {
		A[22:0] > 2**22;
	}

	constraint B_mantissa_distribution {
		B[22:0] > 2**22;
	}

    `uvm_object_utils_begin(packet_in)
        `uvm_field_int(A, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(B, UVM_ALL_ON|UVM_HEX)
    `uvm_object_utils_end

    function new(string name="packet_in");
        super.new(name);
    endfunction: new
endclass: packet_in

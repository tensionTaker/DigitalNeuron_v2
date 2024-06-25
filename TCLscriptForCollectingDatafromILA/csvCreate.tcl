for {set i 0} {$i < 1000} {incr i} {
    # Run the ILA command
    run_hw_ila [get_hw_ilas -of_objects [get_hw_devices xc7s50_0] -filter {CELL_NAME=~"design_2_i/ila_0"}]
    wait_on_hw_ila [get_hw_ilas -of_objects [get_hw_devices xc7s50_0] -filter {CELL_NAME=~"design_2_i/ila_0"}]
    display_hw_ila_data [upload_hw_ila_data [get_hw_ilas -of_objects [get_hw_devices xc7s50_0] -filter {CELL_NAME=~"design_2_i/ila_0"}]]

    # Construct the file name with a zero-padded index
    set filename [format "C:/SNNPlot2/iladataNew1_%04d.csv" $i]
    
    # Write the ILA data to the file
    write_hw_ila_data -csv_file -force $filename hw_ila_data_1
}

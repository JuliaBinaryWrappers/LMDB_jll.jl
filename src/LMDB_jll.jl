# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule LMDB_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("LMDB")
JLLWrappers.@generate_main_file("LMDB", UUID("6206cf0b-f360-5984-af49-5437264c140e"))
end  # module LMDB_jll

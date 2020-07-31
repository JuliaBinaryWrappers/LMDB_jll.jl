# Autogenerated wrapper script for LMDB_jll for x86_64-linux-musl
export liblmdb, mdb_copy, mdb_dump, mdb_load, mdb_stat

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `liblmdb`
const liblmdb_splitpath = ["lib", "liblmdb.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
liblmdb_path = ""

# liblmdb-specific global declaration
# This will be filled out by __init__()
liblmdb_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const liblmdb = "liblmdb.so"


# Relative path to `mdb_copy`
const mdb_copy_splitpath = ["bin", "mdb_copy"]

# This will be filled out by __init__() for all products, as it must be done at runtime
mdb_copy_path = ""

# mdb_copy-specific global declaration
function mdb_copy(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(mdb_copy_path)
    end
end


# Relative path to `mdb_dump`
const mdb_dump_splitpath = ["bin", "mdb_dump"]

# This will be filled out by __init__() for all products, as it must be done at runtime
mdb_dump_path = ""

# mdb_dump-specific global declaration
function mdb_dump(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(mdb_dump_path)
    end
end


# Relative path to `mdb_load`
const mdb_load_splitpath = ["bin", "mdb_load"]

# This will be filled out by __init__() for all products, as it must be done at runtime
mdb_load_path = ""

# mdb_load-specific global declaration
function mdb_load(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(mdb_load_path)
    end
end


# Relative path to `mdb_stat`
const mdb_stat_splitpath = ["bin", "mdb_stat"]

# This will be filled out by __init__() for all products, as it must be done at runtime
mdb_stat_path = ""

# mdb_stat-specific global declaration
function mdb_stat(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(mdb_stat_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"LMDB")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global liblmdb_path = normpath(joinpath(artifact_dir, liblmdb_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global liblmdb_handle = dlopen(liblmdb_path)
    push!(LIBPATH_list, dirname(liblmdb_path))

    global mdb_copy_path = normpath(joinpath(artifact_dir, mdb_copy_splitpath...))

    push!(PATH_list, dirname(mdb_copy_path))
    global mdb_dump_path = normpath(joinpath(artifact_dir, mdb_dump_splitpath...))

    push!(PATH_list, dirname(mdb_dump_path))
    global mdb_load_path = normpath(joinpath(artifact_dir, mdb_load_splitpath...))

    push!(PATH_list, dirname(mdb_load_path))
    global mdb_stat_path = normpath(joinpath(artifact_dir, mdb_stat_splitpath...))

    push!(PATH_list, dirname(mdb_stat_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()


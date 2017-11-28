#!/dataportal01/software/python-3.5.1/bin/python3

# more info at the link below
# http://stackoverflow.com/questions/33135038/how-do-i-use-os-scandir-to-return-direntry-objects-recursively-on-a-directory
try:
    from os import scandir
except ImportError:
    from scandir import scandir  # use scandir PyPI module on Python < 3.5

#file_counts = { '1024': 0,          # 1k
#                '10240': 0,         # 10k
#                '102400': 0,        # 100k
#                '1048576': 0,       # 1M
#                '10485760': 0,      # 10M
#                '104857600': 0,     # 100M
#                '1073741824': 0,    # 1G
#                '10737418240': 0,   # 10G
#                '107374182400': 0,  # 100G
#                '1099511627776': 0 } # 1T

file_counts = { '1k':   0,
                '10k':  0,
                '100k': 0,
                '1M':   0,
                '10M':  0,
                '100M': 0,
                '1G':   0,
                '10G':  0,
                '100G': 0,
                '1T':   0,
                'T+':   0 }

dir_count = 0

def scantree(path):
    """Recursively yield DirEntry objects for given directory."""
    global dir_count, file_counts
    for entry in scandir(path):
        if entry.is_dir(follow_symlinks=False):
            if dir_count % 100 == 0:
                print('Last dir:', entry.path)
                print(file_counts)
            dir_count += 1
            yield from scantree(entry.path)  # see below for Python 2.x
        else:
            yield entry

if __name__ == '__main__':
    import sys
    for entry in scantree(sys.argv[1] if len(sys.argv) > 1 else '.'):
        #print(entry.path) # prints full path filename
        #print(entry.name) # prints filename only
        if entry.is_file():
            if entry.stat().st_size < 1024:
                file_counts['1k'] += 1
                continue
            if entry.stat().st_size < 10240:
                file_counts['10k'] += 1
                continue
            if entry.stat().st_size < 102400:
                file_counts['100k'] += 1
                continue
            if entry.stat().st_size < 1048576:
                file_counts['1M'] += 1
                continue
            if entry.stat().st_size < 10485760:
                file_counts['10M'] += 1
                continue
            if entry.stat().st_size < 104857600:
                file_counts['100M'] += 1
                continue
            if entry.stat().st_size < 1073741824:
                file_counts['1G'] += 1
                continue
            if entry.stat().st_size < 10737418240:
                file_counts['10G'] += 1
                continue
            if entry.stat().st_size < 107374182400:
                file_counts['100G'] += 1
                continue
            if entry.stat().st_size < 1099511627776:
                file_counts['1T'] += 1
                continue
            if entry.stat().st_size >= 1099511627776:
                file_counts['T+'] += 1
                continue
            #print(entry.stat().st_size, entry.path)
        #print(entry.stat())  # prints filename only
    print( "------- File counts by size -------" )
    print( "  < 1k:  ",file_counts['1k'])
    print( "  < 10k: ",file_counts['10k'])
    print( "  < 100k:",file_counts['100k'])
    print( "  < 1M:  ",file_counts['1M'])
    print( "  < 10M: ",file_counts['10M'])
    print( "  < 100M:",file_counts['100M'])
    print( "  < 1G:  ",file_counts['1G'])
    print( "  < 10G: ",file_counts['10G'])
    print( "  < 100G:",file_counts['100G'])
    print( "  < 1T:  ",file_counts['1T'])
    print( "  > 1T:  ",file_counts['T+'])

module Beatnode
  Storage = Struct.new(:connection) do
    def store!(file)
      sha1       = Digest::SHA1.file(file).hexdigest
      dir, fname = split_sha1(sha1)

      directory = find_or_create(dir)
      directory.files.create(key: fname, body: file)
      sha1
    end

    def fetch(sha1)
      dir, fname = split_sha1(sha1)

      directory = find_or_create(dir)
      directory.files.get(fname)
    end

    private

    def split_sha1(sha1)
      [sha1[0..1]] << sha1[2..-1]
    end

    def find_or_create(dir)
      connection.directories.get(dir) ||
        connection.directories.create(key: dir)
    end
  end
end

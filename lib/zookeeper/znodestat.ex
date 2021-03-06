defmodule Zookeeper.ZnodeStat do
  defstruct creation_transaction_id: nil, # czxid: The transaction id of the change that caused this znode to be created.
            last_modified_transaction_id: nil, # mzxid: The transaction id of the change that last modified this znode.
            created: nil, # ctime: The time in seconds from epoch when this node was created. (ctime is in milliseconds)
            last_modified: nil, # mtime: The time in seconds from epoch when this znode was last modified. (mtime is in milliseconds)
            version: nil, # The number of changes to the data of this znode.
            children_version: nil, # cversion: The number of changes to the children of this znode.
            acl_version: nil, # aversion: The number of changes to the ACL of this znode.
            owner_session_id: nil, # ephemeralOwner: The session id of the owner of this znode if the znode is an ephemeral node. 
                                  # If it is not an ephemeral node, it will be None. (ephemeralOwner will be 0 if it is not ephemeral)
            data_length: nil, # The length of the data field of this znode.
            num_children: nil # The number of children of this znode.

  def new({:stat, czxid, mzxid, ctime, mtime, version, cversion, aversion, owner_session_id, data_length, num_children, _pzxid}) do
    %__MODULE__{
      creation_transaction_id: czxid,
      last_modified_transaction_id: mzxid,
      created: ctime,
      last_modified: mtime,
      version: version,
      children_version: cversion,
      acl_version: aversion,
      owner_session_id: owner_session_id,
      data_length: data_length,
      num_children: num_children,
    }
  end
end
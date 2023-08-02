#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY����  J߀@����=ڪ���@�mf԰��i��h�h � h� i�4�S�6���2F�a d ��	���dɓ#	�i�F& �)54b�M6��6�F��� h'��1N����M�$�O̵��%�\�4j^d�����nP��0_��5�
��/N�$�:uY�A�7~�>؝��tdZ?��f槇�3T��ZMg�LB#;8�(�VlU���YY�!��;���!���S�2m�@3���Цu�SI�E��K���SϠ,��B �t�����+o#9��I`H����Y��q�
�D>�m R����Dǡ�j��yV�&�|w���Wp*`f���.#E0�X�AԌoS?�fV�J;�#��M�"<��y��ա$w�7aX��ڰ��0ܩO���C�Q�_�(�;�u	��:�9�R��ڋ����PZEr'�S²�L�0����n�-��X;TK#k1Z����P�H%D�|\$�.Y�����<X_BjÇ�
�,n��ܑN$8#�t�
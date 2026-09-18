Vimium Config
=======================================================================

[Vimium](https://github.com/philc/vimium) is a Chrome extension that
gives the browser Vim keys. It is not a Stow package: Vimium keeps its
settings in the extension's own storage, not in a file under the home
directory. So this directory is just the source of truth for the
settings I have to type into the options page by hand.

Structure
-----------------------------------------------------------------------

```
key-mappings.txt
```

Installing
-----------------------------------------------------------------------

Open the Vimium options page (click the extension icon, then
"Options", or right click it and choose "Options"), find the "Custom
key mappings" box, and paste in the contents of `key-mappings.txt`.
Click "Save changes". There is nothing to `stow`.

Tab Switching
-----------------------------------------------------------------------

- H: switch to the tab on the left
- L: switch to the tab on the right
- J: go back in history
- K: go forward in history

By default Vimium has this the other way around: H and L go back and
forward in history, and J and K switch tabs. Switching tabs is the
thing I do constantly, and H and L are the horizontal keys, so they
should be the ones that move sideways through tabs.

That means the history commands need somewhere to go, and J and K are
free once tab switching moves off them, so the two pairs simply trade
places. Nothing is lost. Vimium also binds gT and gt to left tab and
right tab, and those still work, so if the swap ever feels wrong the J
and K lines can be dropped and tabs are still reachable.

Reference
-----------------------------------------------------------------------

`map <key> <command>` binds a key, `unmap <key>` restores Chrome's
default behavior for it, and `unmapAll` wipes every Vimium binding so
you can start from scratch. The options page lists every command name;
the wiki has more examples:
<https://github.com/philc/vimium/wiki/Key-Mappings>.

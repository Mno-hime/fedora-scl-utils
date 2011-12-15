# Dynamic Software Collections RPM macros
#
# Copyright (C) 2012 Red Hat, Inc.
#   Written by Jindrich Novy <jnovy@redhat.com>.

# "scl" prefixed macros are kept for compatibility please use "dsc"
# prefixed ones for production

%dsc_package() %{expand:%{!?_root_prefix:
%global pkg_name		%1
%global dsc_short_prefix	dsc
%global dsc_name		%{dsc_short_prefix}_%{dsc}
%global dsc_runtime		%{dsc_name}-runtime
%global dsc_prefix		%{dsc_name}_
%{!?_dsc_prefix:		%global _dsc_prefix /opt/rh}
%global _dsc_scripts		%{_dsc_prefix}/%{dsc}
%global _dsc_root		%{_dsc_prefix}/%{dsc}/root
%global _root_prefix		%{_prefix}
%global _root_exec_prefix	%{_root_prefix}
%global _root_bindir		%{_exec_prefix}/bin
%global _root_sbindir		%{_exec_prefix}/sbin
%global _root_libexecdir	%{_exec_prefix}/libexec
%global _root_datadir		%{_prefix}/share
%global _root_sysconfdir	%{_sysconfdir}
%global _root_sharedstatedir	%{_prefix}/com
%global _root_localstatedir	%{_prefix}/var
%global _root_libdir		%{_exec_prefix}/%{_lib}
%global _root_includedir	%{_prefix}/include
%global _root_infodir		%{_datadir}/info
%global _root_mandir		%{_datadir}/man
%global _root_initddir		%{_sysconfdir}/rc.d/init.d
%global _prefix			%{_dsc_root}/usr
%global _exec_prefix		%{_prefix}
%global _bindir			%{_exec_prefix}/bin
%global _sbindir		%{_exec_prefix}/sbin
%global _libexecdir		%{_exec_prefix}/libexec
%global _datadir		%{_prefix}/share
%global _sysconfdir		%{_dsc_root}/etc
%global _sharedstatedir		%{_prefix}/com
%global _localstatedir		%{_prefix}/var
%global _libdir			%{_exec_prefix}/%{_lib}
%global _includedir		%{_prefix}/include
%global _infodir		%{_datadir}/info
%global _mandir			%{_datadir}/man
%global _docdir			%{_datadir}/doc
%global _defaultdocdir		%{_docdir}
%global dsc_pkg_name		%{dsc_short_prefix}_%{dsc}_%{pkg_name}
}}

%dsc_require()	%{_dsc_prefix}/%1/enable

%dsc_files %{expand:
%{_dsc_root}
%{_dsc_scripts}
%{_dsc_scripts}/enable
%{_root_sysconfdir}/scl/prefixes/%dsc
}

%dsc_install %{expand:
mkdir -p %{buildroot}%{_root_sysconfdir}/{rpm,scl/prefixes}
echo -n '%' > %{buildroot}%{_root_sysconfdir}/rpm/macros.%{dsc}-config
cat >> %{buildroot}%{_root_sysconfdir}/rpm/macros.%{dsc}-config << EOF
scl %dsc
EOF
cat >> %{buildroot}%{_root_sysconfdir}/scl/prefixes/%{dsc} << EOF
%_dsc_prefix
EOF
}

# compatibility macros follow

%scl_package() %{expand:%{!?_root_prefix:
%global pkg_name		%1
%global scl_short_prefix	dsc
%global scl_name		%{scl_short_prefix}_%{scl}
%global scl_runtime		%{scl_name}-runtime
%global scl_prefix		%{scl_name}_
%{!?_scl_prefix:		%global _scl_prefix /opt/rh}
%global _scl_scripts		%{_scl_prefix}/%{scl}
%global _scl_root		%{_scl_prefix}/%{scl}/root
%global _root_prefix		%{_prefix}
%global _root_exec_prefix	%{_root_prefix}
%global _root_bindir		%{_exec_prefix}/bin
%global _root_sbindir		%{_exec_prefix}/sbin
%global _root_libexecdir	%{_exec_prefix}/libexec
%global _root_datadir		%{_prefix}/share
%global _root_sysconfdir	%{_sysconfdir}
%global _root_sharedstatedir	%{_prefix}/com
%global _root_localstatedir	%{_prefix}/var
%global _root_libdir		%{_exec_prefix}/%{_lib}
%global _root_includedir	%{_prefix}/include
%global _root_infodir		%{_datadir}/info
%global _root_mandir		%{_datadir}/man
%global _root_initddir		%{_sysconfdir}/rc.d/init.d
%global _prefix			%{_scl_root}/usr
%global _exec_prefix		%{_prefix}
%global _bindir			%{_exec_prefix}/bin
%global _sbindir		%{_exec_prefix}/sbin
%global _libexecdir		%{_exec_prefix}/libexec
%global _datadir		%{_prefix}/share
%global _sysconfdir		%{_scl_root}/etc
%global _sharedstatedir		%{_prefix}/com
%global _localstatedir		%{_prefix}/var
%global _libdir			%{_exec_prefix}/%{_lib}
%global _includedir		%{_prefix}/include
%global _infodir		%{_datadir}/info
%global _mandir			%{_datadir}/man
%global _docdir			%{_datadir}/doc
%global _defaultdocdir		%{_docdir}
%global scl_pkg_name		%{scl_short_prefix}_%{scl}_%{pkg_name}
}}

%scl_require()	%{_scl_prefix}/%1/enable

%scl_files %{expand:
%{_scl_root}
%{_scl_scripts}
%{_scl_scripts}/enable
%{_root_sysconfdir}/scl/prefixes/%scl
}

%scl_install %{expand:
mkdir -p %{buildroot}%{_root_sysconfdir}/{rpm,scl/prefixes}
echo -n '%' > %{buildroot}%{_root_sysconfdir}/rpm/macros.%{scl}-config
cat >> %{buildroot}%{_root_sysconfdir}/rpm/macros.%{scl}-config << EOF
scl %scl
EOF
cat >> %{buildroot}%{_root_sysconfdir}/scl/prefixes/%{scl} << EOF
%_scl_prefix
EOF
}

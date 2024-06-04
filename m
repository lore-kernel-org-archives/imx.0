Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D54BEEC0
	for <imx@lists.linux.dev>; Tue,  4 Jun 2024 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717510584; cv=none; b=Bdwd33HkNBWUaYFDXmogn5FVB7r6SEp8rlF2dvJ/NrYJ/4urOytnIhkjBlzoQgG+1RZ1IC6BCDmW7HRSX2x7Lrzbtd0wsFF71rBSNQ6LAiz1rkOARt8cl7ngjrHfPI2ePQyUIBAul0P4mkY0vVWwrGUvKUzflxbdmfvFe2+Ft74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717510584; c=relaxed/simple;
	bh=VmEGZ/3EFB9nRufslgnWEJvIdNV97Z5XMCJWjR3Oz64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHg3P74Div9ykvvMnAK5cnR3oaq605QUfFnn14g87siARhcZWOVMQknG5VnSFGhod2ReIVXFthqEPqazaypnl959k8mWYL+RNHRpQyTy1pUMRdN/fniYsLst4k2b6LFc9YW/ahSJ/VjkeNeR6lWTZMVmx0fcNhRw2DEa9fIcEv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wf/VMm7c; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wf/VMm7c"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2c24106684eso152119a91.3
        for <imx@lists.linux.dev>; Tue, 04 Jun 2024 07:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717510582; x=1718115382; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ue4k7rRHwrO1R0O1WtR2whXVTlop4NjpUu8PIDo/YQo=;
        b=Wf/VMm7cGbkxVxFXWxSDLiMkKFgSifvhY2WzzZ8A4AOL+TfKwkiivvnL7+pQ1UMXUj
         BIfpARGBLQy0cdr4g1G10use4xy2gKtY/nXfdcit2OlvkI/V2hcnLpE44ERqDiuRr5vD
         4S+3aWBLa3SOeRe1TWRtgosd5H/6bzArhub1wyBGHVJTKe7m3Ujjyl7Zd+xFhElYBpef
         exNs+l5l7qowPm7/5sy4ghZ59vrRTD0DfZh7vcmcTUwwehzYSUA4SrbumNiMI5xWq2YJ
         mlHWOrQzLOOkQy1cpaxeSPNKtOTDC+S2Li3vU16IQBnfGlAIwTmkP0ccRoxv9Az5zQP7
         fofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717510582; x=1718115382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ue4k7rRHwrO1R0O1WtR2whXVTlop4NjpUu8PIDo/YQo=;
        b=q7adxToZz+qKn0KUUonQi0gWs46A0jViedztL7HPYoauw6iyAWlgYnAd+xGtFpY2U9
         RmJsUzWDKoooRzoT9ywR9WJG2GpEq1zDmLR+sQdzU17jduTeJ/rRCr9gcZIC4SDv5f5L
         Hf7H8t/q5uWvwLQme4SKzbqc0xMdPU+Wnmb28F8NID4+tejnRe5cyUfLVGdGMWkOOe9p
         9qKh3QhBwt/bC2AL3Vx46a8Y1jRVxll3jAu280z0Fp6CjB2XtXAoisAL1VfypQHm9urp
         sYMNqoPigzZoU6rDEkwMI+7YbA81z+d4OFX4QgB3ubOxNzuft1NqvAMLS5nfR7S5VhDk
         m/og==
X-Gm-Message-State: AOJu0Yznke6ueMWBml5Khzlb0h0iU7zeqlHCTzBN3EH6cleUiby6FjoA
	xbVbq3sSR4JTK9LXYWAQbJevpZUR1Oe/3z9+u6qliIMZY1c1S7JSVx1bqB/h0dZ3uzp9ri5+NQu
	bvacpu+x+wFBfmdWckD9LMhWhaY0=
X-Google-Smtp-Source: AGHT+IHQBxo9f9x5JPuRgU3rqNYh3MwkIojaL+b6KSZvSSnhXvflk0L1qdbFtozYocBlphFP910qInqd1weEnpWEQGc=
X-Received: by 2002:a17:90a:3d46:b0:2bd:feb6:b09b with SMTP id
 98e67ed59e1d1-2c1dc56c446mr11112367a91.1.1717510581115; Tue, 04 Jun 2024
 07:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5B0+jkaPo_6VKXVGb6SMAa78jLVQU3xUt92BpkAzc5AnQ@mail.gmail.com>
 <DU0PR04MB949617775A095B8DE513D97690F22@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <CAOMZO5B7Zm1RXRLXs=_Re_onUam=RCy_QYUkEtGz+qvKmz=7Ow@mail.gmail.com>
In-Reply-To: <CAOMZO5B7Zm1RXRLXs=_Re_onUam=RCy_QYUkEtGz+qvKmz=7Ow@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 4 Jun 2024 11:16:09 -0300
Message-ID: <CAOMZO5B4cuE5QMkjdWnTJFCs8kY_cK0q5O3xujnetfCfmJQHSg@mail.gmail.com>
Subject: Re: imx93-11x11-evk: SD card is not detected on 6.6
To: Bough Chen <haibo.chen@nxp.com>
Cc: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bough,

On Wed, May 29, 2024 at 3:08=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> Interesting. I tried 6.6 and the SD card was detected.
>
> Then I tested with 6.6.32 and the SD card was also detected.
>
> Some intermediate 6.6 was probably broken.
>
> Thanks for testing and sorry for the noise.

Today I built 6.6.32 again and could reproduce the problem:

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x412fd050]
[    0.000000] Linux version 6.6.32 (fabio@fabio-Precision-3551)
(aarch64-linux-gnu-gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0, GNU ld
(GNU Binutils for Ubuntu) 2.38) #401 SMP PREEMPT Tue Jun  4 11:08:20
-03 2024
[    0.000000] KASLR disabled due to lack of seed
[    0.000000] Machine model: NXP i.MX93 11X11 EVK board
[    0.000000] efi: UEFI not found.
[    0.000000] Reserved memory: created CMA memory pool at
0x00000000b0000000, size 256 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma,
compatible id shared-dma-pool
[    0.000000] OF: reserved mem:
0x00000000b0000000..0x00000000bfffffff (262144 KiB) map reusable
linux,cma
[    0.000000] OF: reserved mem:
0x000000002021f000..0x000000002021ffff (4 KiB) nomap non-reusable
rsc-table@2021f000
[    0.000000] OF: reserved mem:
0x0000000096000000..0x0000000097dfffff (30720 KiB) nomap non-reusable
optee_core@96000000
[    0.000000] OF: reserved mem:
0x0000000097e00000..0x0000000097ffffff (2048 KiB) nomap non-reusable
optee_shm@97e00000
[    0.000000] OF: reserved mem:
0x00000000a4000000..0x00000000a4007fff (32 KiB) nomap non-reusable
vdev0vring0@a4000000
[    0.000000] OF: reserved mem:
0x00000000a4008000..0x00000000a400ffff (32 KiB) nomap non-reusable
vdev0vring1@a4008000
[    0.000000] OF: reserved mem:
0x00000000a4010000..0x00000000a4017fff (32 KiB) nomap non-reusable
vdev1vring0@a4000000
[    0.000000] OF: reserved mem:
0x00000000a4018000..0x00000000a401ffff (32 KiB) nomap non-reusable
vdev1vring1@a4018000
[    0.000000] Reserved memory: created DMA memory pool at
0x00000000a4020000, size 1 MiB
[    0.000000] OF: reserved mem: initialized node vdevbuffer@a4020000,
compatible id shared-dma-pool
[    0.000000] OF: reserved mem:
0x00000000a4020000..0x00000000a411ffff (1024 KiB) nomap non-reusable
vdevbuffer@a4020000
[    0.000000] earlycon: lpuart32 at MMIO32 0x0000000044380000 (options '')
[    0.000000] printk: bootconsole [lpuart32] enabled
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem
0x0000000080000000-0x00000000ffffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xffbf09c0-0xffbf2fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x0000000095ffffff]
[    0.000000]   node   0: [mem 0x0000000098000000-0x00000000a3ffffff]
[    0.000000]   node   0: [mem 0x00000000a4000000-0x00000000a411ffff]
[    0.000000]   node   0: [mem 0x00000000a4120000-0x00000000ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000fffff=
fff]
[    0.000000] On node 0, zone DMA: 8192 pages in unavailable ranges
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.2
[    0.000000] percpu: Embedded 22 pages/cpu s50792 r8192 d31128 u90112
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: detected: Virtualization Host Extensions
[    0.000000] CPU features: detected: Qualcomm erratum 1009, or ARM
erratum 1286807, 2441009
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530=
923
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: console=3DttyLP0,115200 earlycon
root=3D/dev/mmcblk1p2 rootwait rw
[    0.000000] Dentry cache hash table entries: 262144 (order: 9,
2097152 bytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8,
1048576 bytes, linear)
[    0.000000] Fallback order for Node 0: 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 50790=
4
[    0.000000] Policy zone: DMA
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] software IO TLB: area num 2.
[    0.000000] software IO TLB: mapped [mem
0x00000000f9800000-0x00000000fd800000] (64MB)
[    0.000000] Memory: 1653184K/2064384K available (16576K kernel
code, 4276K rwdata, 10568K rodata, 9152K init, 605K bss, 149056K
reserved, 262144K cma-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, N=
odes=3D1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: RCU event tracing is enabled.
[    0.000000] rcu: RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=
=3D2.
[    0.000000] Trampoline variant of Tasks RCU enabled.
[    0.000000] Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D2
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: 960 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GICv3: GICv3 features: 16 PPIs
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x00000000480400=
00
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000000] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps
every 4398046511097ns
[    0.008559] Console: colour dummy device 80x25
[    0.012790] Calibrating delay loop (skipped), value calculated
using timer frequency.. 48.00 BogoMIPS (lpj=3D96000)
[    0.022963] pid_max: default: 32768 minimum: 301
[    0.027598] LSM: initializing lsm=3Dcapability,integrity
[    0.032737] Mount-cache hash table entries: 4096 (order: 3, 32768
bytes, linear)
[    0.040039] Mountpoint-cache hash table entries: 4096 (order: 3,
32768 bytes, linear)
[    0.048479] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    0.054864] RCU Tasks: Setting shift to 1 and lim to 1 rcu_task_cb_adjus=
t=3D1.
[    0.061716] RCU Tasks Trace: Setting shift to 1 and lim to 1
rcu_task_cb_adjust=3D1.
[    0.069339] rcu: Hierarchical SRCU implementation.
[    0.073960] rcu: Max phase no-delay instances is 1000.
[    0.080098] EFI services will not be available.
[    0.084517] smp: Bringing up secondary CPUs ...
[    0.089247] Detected VIPT I-cache on CPU1
[    0.089295] GICv3: CPU1: found redistributor 100 region 0:0x000000004806=
0000
[    0.089329] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[    0.089428] smp: Brought up 1 node, 2 CPUs
[    0.110781] SMP: Total of 2 processors activated.
[    0.115454] CPU features: detected: 32-bit EL0 Support
[    0.120578] CPU features: detected: 32-bit EL1 Support
[    0.125683] CPU features: detected: Data cache clean to the PoU not
required for I/D coherence
[    0.134265] CPU features: detected: Common not Private translations
[    0.140498] CPU features: detected: CRC32 instructions
[    0.145622] CPU features: detected: RCpc load-acquire (LDAPR)
[    0.151332] CPU features: detected: LSE atomic instructions
[    0.156878] CPU features: detected: Privileged Access Never
[    0.162423] CPU features: detected: RAS Extension Support
[    0.167799] CPU features: detected: Speculative Store Bypassing Safe (SS=
BS)
[    0.174781] CPU: All CPU(s) started at EL2
[    0.178805] alternatives: applying system-wide alternatives
[    0.187734] devtmpfs: initialized
[    0.194034] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.203540] futex hash table entries: 512 (order: 3, 32768 bytes, linear=
)
[    0.214227] pinctrl core: initialized pinctrl subsystem
[    0.220731] DMI not present or invalid.
[    0.224852] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.231135] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic allocat=
ions
[    0.238036] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for
atomic allocations
[    0.245732] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for
atomic allocations
[    0.253571] audit: initializing netlink subsys (disabled)
[    0.259045] audit: type=3D2000 audit(0.164:1): state=3Dinitialized
audit_enabled=3D0 res=3D1
[    0.259806] thermal_sys: Registered thermal governor 'step_wise'
[    0.266616] thermal_sys: Registered thermal governor 'power_allocator'
[    0.272638] cpuidle: using governor menu
[    0.283166] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
.
[    0.289792] ASID allocator initialised with 65536 entries
[    0.296468] Serial: AMBA PL011 UART driver
[    0.304539] imx93-pinctrl 443c0000.pinctrl: initialized IMX pinctrl driv=
er
[    0.318114] Modules: 22416 pages in range for non-PLT usage
[    0.318125] Modules: 513936 pages in range for PLT usage
[    0.324026] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 page=
s
[    0.335845] HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
[    0.342077] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 page=
s
[    0.348835] HugeTLB: 0 KiB vmemmap can be freed for a 32.0 MiB page
[    0.355075] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 page=
s
[    0.361834] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
[    0.368076] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 page=
s
[    0.374834] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
[    0.382403] ACPI: Interpreter disabled.
[    0.387670] iommu: Default domain type: Translated
[    0.392225] iommu: DMA domain TLB invalidation policy: strict mode
[    0.398555] SCSI subsystem initialized
[    0.402397] usbcore: registered new interface driver usbfs
[    0.407639] usbcore: registered new interface driver hub
[    0.412918] usbcore: registered new device driver usb
[    0.418565] pps_core: LinuxPPS API ver. 1 registered
[    0.423270] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.432372] PTP clock support registered
[    0.436347] EDAC MC: Ver: 3.0.0
[    0.439965] scmi_core: SCMI protocol bus registered
[    0.445184] FPGA manager framework
[    0.448386] Advanced Linux Sound Architecture Driver Initialized.
[    0.455191] vgaarb: loaded
[    0.458026] clocksource: Switched to clocksource arch_sys_counter
[    0.464067] VFS: Disk quotas dquot_6.6.0
[    0.467784] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.474731] pnp: PnP ACPI: disabled
[    0.482833] NET: Registered PF_INET protocol family
[    0.487627] IP idents hash table entries: 32768 (order: 6, 262144
bytes, linear)
[    0.495970] tcp_listen_portaddr_hash hash table entries: 1024
(order: 2, 16384 bytes, linear)
[    0.504294] Table-perturb hash table entries: 65536 (order: 6,
262144 bytes, linear)
[    0.511957] TCP established hash table entries: 16384 (order: 5,
131072 bytes, linear)
[    0.519897] TCP bind hash table entries: 16384 (order: 7, 524288
bytes, linear)
[    0.527514] TCP: Hash tables configured (established 16384 bind 16384)
[    0.533874] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    0.540478] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, li=
near)
[    0.547671] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.553566] RPC: Registered named UNIX socket transport module.
[    0.559236] RPC: Registered udp transport module.
[    0.563900] RPC: Registered tcp transport module.
[    0.568579] RPC: Registered tcp-with-tls transport module.
[    0.574055] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.580463] PCI: CLS 0 bytes, default 64
[    0.584677] kvm [1]: IPA Size Limit: 40 bits
[    0.588715] kvm [1]: GICv3: no GICV resource entry
[    0.593457] kvm [1]: disabling GICv2 emulation
[    0.597884] kvm [1]: GIC system register CPU interface enabled
[    0.603701] kvm [1]: vgic interrupt IRQ9
[    0.607601] kvm [1]: VHE mode initialized successfully
[    0.613601] Initialise system trusted keyrings
[    0.617978] workingset: timestamp_bits=3D42 max_order=3D19 bucket_order=
=3D0
[    0.624470] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.630297] NFS: Registering the id_resolver key type
[    0.635111] Key type id_resolver registered
[    0.639240] Key type id_legacy registered
[    0.643240] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.649901] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
Registering...
[    0.657414] 9p: Installing v9fs 9p2000 file system support
[    0.684736] Key type asymmetric registered
[    0.688571] Asymmetric key parser 'x509' registered
[    0.693473] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 245)
[    0.700792] io scheduler mq-deadline registered
[    0.705297] io scheduler kyber registered
[    0.709316] io scheduler bfq registered
[    0.720768] EINJ: ACPI disabled.
[    0.746342] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.755373] SuperH (H)SCI(F) driver initialized
[    0.760119] msm_serial: driver initialized
[    0.774215] printk: console [ttyLP0] enabled0x44380010 (irq =3D 15,
base_baud =3D 1500000) is a FSL_LPUART
[    0.774215] printk: console [ttyLP0] enabled
[    0.782646] printk: bootconsole [lpuart32] disabled
[    0.782646] printk: bootconsole [lpuart32] disabled
[    0.794703] STM32 USART driver initialized
[    0.804295] loop: module loaded
[    0.808690] megasas: 07.725.01.00-rc1
[    0.817947] tun: Universal TUN/TAP device driver, 1.6
[    0.823926] thunder_xcv, ver 1.0
[    0.827217] thunder_bgx, ver 1.0
[    0.830463] nicpf, ver 1.0
[    0.834084] pps pps0: new PPS source ptp0
[    0.841379] fec 42890000.ethernet eth0: registered PHC device 0
[    0.848805] hns3: Hisilicon Ethernet Network Driver for Hip08
Family - version
[    0.856045] hns3: Copyright (c) 2017 Huawei Corporation.
[    0.861397] hclge is initializing
[    0.864755] e1000: Intel(R) PRO/1000 Network Driver
[    0.869626] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    0.875381] e1000e: Intel(R) PRO/1000 Network Driver
[    0.880337] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.886262] igb: Intel(R) Gigabit Ethernet Network Driver
[    0.891655] igb: Copyright (c) 2007-2014 Intel Corporation.
[    0.897239] igbvf: Intel(R) Gigabit Virtual Function Network Driver
[    0.903494] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    0.909787] sky2: driver version 1.30
[    0.914782] VFIO - User Level meta-driver version: 0.3
[    0.922727] usbcore: registered new interface driver usb-storage
[    0.931486] i2c_dev: i2c /dev entries driver
[    0.942901] sdhci: Secure Digital Host Controller Interface driver
[    0.949100] sdhci: Copyright(c) Pierre Ossman
[    0.954337] Synopsys Designware Multimedia Card Interface Driver
[    0.961356] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.969211] ledtrig-cpu: registered to indicate activity on CPUs
[    0.976918] SMCCC: SOC_ID: ARCH_SOC_ID not implemented, skipping ....
[    0.984320] usbcore: registered new interface driver usbhid
[    0.989903] usbhid: USB HID core driver
[    0.996524] remoteproc remoteproc0: imx-rproc is available
[    1.002080] mmc0: SDHCI controller on 42850000.mmc [42850000.mmc] using =
ADMA
[    1.009349] hw perfevents: enabled with armv8_cortex_a55 PMU
driver, 7 counters available
[    1.020533] optee: probing for conduit method.
[    1.025069] optee: revision 4.0 (e0a3e777)
[    1.025333] optee: dynamic shared memory is enabled
[    1.034687] optee: initialized driver
[    1.042454] NET: Registered PF_PACKET protocol family
[    1.047617] 9pnet: Installing 9P2000 support
[    1.051956] Key type dns_resolver registered
[    1.062926] registered taskstats version 1
[    1.067128] Loading compiled-in X.509 certificates
[    1.090850] clk: Disabling unused clocks
[    1.095596] ALSA device list:
[    1.098593]   No soundcards found.
[    1.102303] Waiting for root device /dev/mmcblk1p2...
[    1.112804] mmc0: new HS400 Enhanced strobe MMC card at address 0001
[    1.119730] mmcblk0: mmc0:0001 DA6016 14.7 GiB
[    1.125583]  mmcblk0: p1 p2
[    1.128878] mmcblk0boot0: mmc0:0001 DA6016 4.00 MiB
[    1.134835] mmcblk0boot1: mmc0:0001 DA6016 4.00 MiB
[    1.140594] mmcblk0rpmb: mmc0:0001 DA6016 4.00 MiB, chardev (234:0)
[   11.141672] platform 42860000.mmc: deferred probe pending

Only the eMMC is probed.

usdhc2 (SD card) does not probe. It complains of a deferred probe.

Any ideas?

Thanks

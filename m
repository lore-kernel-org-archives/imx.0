Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229EE15C3
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421651; cv=none; b=nx7hjiInvxQiWRU85mYhO0ULq2wM+dPs0Oe41STyCWmsKzrzgrnlsQqn+I2OcgScHgEOxbINbS9kLrqKWCMTigAJ7IZqluK2rzDTlZtsVoCH/4Td+/FMgcAHFdklwsYMszYBwriPYIuE7Xl0RPw52o7YEB55LDiicYpPqSq7/Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421651; c=relaxed/simple;
	bh=VBMNomoX3yPGmFm229+S0tev9fMufpykBLNMNLP3QEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoBq9t6bzK2EBNHTX2bhqa151Z4UqoZ/tHWSYCNrkQDvPQ6pCFb0G96C0OA4GwFE1/bd9rthjT7gVRKX+y2jl6Zx6BdG1/CW670VlTH64LI+C17qyvkrAgJM3mXZXj/CJyQ5KRDusswnuS49jE3lfHdLHxJ/YdqVTK8hCVkwSD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjkkWjg8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjkkWjg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7E3C2BD10;
	Mon,  3 Jun 2024 13:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717421650;
	bh=VBMNomoX3yPGmFm229+S0tev9fMufpykBLNMNLP3QEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bjkkWjg88bWTJUVfTl2h2H/P/FkEqubZuOv0CNsmP0FyBqJU00s+yp77ErlmCXzx8
	 3KF890uNqRK9bB7VzNq5H8o4rTssukDpQbLTKf/udUKfxlaPRTAfznsXZprReMZOez
	 6Bj7N2S618IvDMdFpmdsUSm0NasNqL6HZnB0Csvp0nat5F8tZs63o6abje9XRq2XU7
	 KsdcwSX7/N6T9nmm+oqj/p74QWaVpbqlYv0jJ689agjxbcIM/6m48LYYhRXDqIPRkC
	 kySE9bhy3u4R3g6On3RqQsWg6QqdSwlB/FUV8l7ZzUt+MvS7dbKP0PJmuVyTTw3PCj
	 YJcNB+c6yf33A==
Date: Mon, 3 Jun 2024 14:34:06 +0100
From: Will Deacon <will@kernel.org>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>, shawnguo@kernel.org,
	festevam@gmail.com, s.hauer@pengutronix.de
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: arm64: kernel panic on 4G RAM platform
Message-ID: <20240603133405.GA19098@willie-the-truck>
References: <Zk77eJe4KwUqxMUk@FUE-ALEWI-WINX>
 <20240529154740.GB13782@willie-the-truck>
 <Zl1gi0tUOI4cNGws@FUE-ALEWI-WINX>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl1gi0tUOI4cNGws@FUE-ALEWI-WINX>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Jun 03, 2024 at 08:19:55AM +0200, Alexander Wilhelm wrote:
> Am Wed, May 29, 2024 at 04:47:40PM +0100 schrieb Will Deacon:
> > On Thu, May 23, 2024 at 10:16:56AM +0200, Alexander Wilhelm wrote:
> > > Hello ARM64 developers,
> > > 
> > > I have a kernel panic problem on my ARM64 architecture board but I'm not sure if
> > > it's a problem in kernel or otherwise. Maybe one could help me.
> > > 
> > > My problem is the following: I'm using the NXP TQ board with ARM64 architecture
> > > to run OpenWRT operating system with linux kernel v5.15. The current
> > > revision of the board (TQMLS1046A-CB.0203) has now a 4GiB RAM instead of 2GiB.
> > > Therefore I adapted the U-Boot to use the entire memory. But now it leads to
> > > kernel crash. Interesting is that if I only use 2GiB the problem doesn't occur.
> > > The memory is splitted up in two different banks.
> > > 
> > > While analyzing my problem I tried to narrow down the source of my problem. But
> > > with each new "print message" that should me help to trace the problem I get
> > > another one. It seems like the error happens unpredictable like due to race
> > > condition or memory access. Then I tried different RAM sizes something
> > > in-between like 3GiB. I could boot successfully but then I got errors from
> > > "swiotlb" if my wireless driver tried to allocate memory from my CMA pool. I
> > > understand that the error description is vary vague but I give my best to
> > > explain my problem. Please refer to my log of the current kernel panic state:
> > > 
> > > Starting kernel ...
> > > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd082]
> > > [    0.000000] Linux version 5.15.158 (########@##############) (aarch64-openwrt-linux-gnu-gcc (OpenWrt GCC 12.3.0 r23630-842932a63d) 12.3.0, GNU ld (GNU Binutils) 2.37) #0 SMP Wed May 22 13:15:09 2024
> > > [    0.000000] Machine model: #########
> > > [    0.000000] earlycon: uart8250 at MMIO 0x00000000021c0500 (options '')
> > > [    0.000000] printk: bootconsole [uart8250] enabled
> > > [    0.000000] Reserved memory: created DMA memory pool at 0x00000008ff800000, size 8 MiB
> > > [    0.000000] OF: reserved mem: initialized node qman-fqd, compatible id shared-dma-pool
> > > [    0.000000] Reserved memory: created DMA memory pool at 0x00000008fc000000, size 32 MiB
> > > [    0.000000] OF: reserved mem: initialized node qman-pfdr, compatible id shared-dma-pool
> > > [    0.000000] Reserved memory: created DMA memory pool at 0x00000008fe000000, size 16 MiB
> > > [    0.000000] OF: reserved mem: initialized node bman-fbpr, compatible id shared-dma-pool
> > > [    0.000000] Zone ranges:
> > > [    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
> > > [    0.000000]   DMA32    empty
> > > [    0.000000]   Normal   [mem 0x0000000100000000-0x00000008ffffffff]
> > > [    0.000000] Movable zone start for each node
> > > [    0.000000] Early memory node ranges
> > > [    0.000000]   node   0: [mem 0x0000000080000000-0x00000000fbdfffff]
> > > [    0.000000]   node   0: [mem 0x0000000880000000-0x00000008fbffffff]
> > > [    0.000000]   node   0: [mem 0x00000008fc000000-0x00000008feffffff]
> > > [    0.000000]   node   0: [mem 0x00000008ff000000-0x00000008ff7fffff]
> > > [    0.000000]   node   0: [mem 0x00000008ff800000-0x00000008ffffffff]
> > > [    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000008ffffffff]
> > > [    0.000000] On node 0, zone Normal: 16896 pages in unavailable ranges
> > > [    0.000000] cma: Reserved 192 MiB at 0x00000000ee800000
> > > [    0.000000] Failed to find device node for boot cpu
> > > [    0.000000] /cpus/cpu@0: missing reg property
> > > [    0.000000] /cpus/cpu@1: missing reg property
> > > [    0.000000] /cpus/cpu@2: missing reg property
> > > [    0.000000] /cpus/cpu@3: missing reg property
> > > [    0.000000] Number of cores (5) exceeds configured maximum of 2 - clipping
> > > [    0.000000] missing boot CPU MPIDR, not enabling secondaries
> > 
> > I'd start by fixing this bit ^^^ If the secondary CPUs are spinning
> > somewhere in memory, maybe that gets allocated by Linux and you end up
> > with them executing random instructions?
> > 
> 
> It sounds very much like it. I already suspected that the CPUs were getting in
> each other's way. Unfortunately I could not reduce the CPUs to 1 in my kernel
> configuration. For some reason, 2 is the minimum number. If you could give me
> some tips on how to narrow down the problem, I would appreciate it.

I'm not really familiar with the FSL SoCs, so adding a bunch of folks
who are in case they have any ideas of things you could try next.

Will

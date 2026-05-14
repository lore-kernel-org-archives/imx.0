Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452EB39A075
	for <imx@lists.linux.dev>; Thu, 14 May 2026 19:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778785514; cv=none; b=CN+r4707I4CE8ipioxJQFyQyNX3Rgt+zpLnjeYHT9ICUo+vTVEc0rXokJPEXnyWV2VZf+RNqJLQV0G1iqvvza9fRH9wRcGwOMMUswEH8MmjyUseheg9BvH+1NJOj+PCWAkYzHhAitfbB1GjdgtcbIuQGOyFlskMxQC6Sg7rSoUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778785514; c=relaxed/simple;
	bh=IxufPOthI6kZEFAyqbsNWe925bkT6BdlzfAludx4V2g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iB4tSQ1UzPeTjq6IHugs8rsGwfcf7Z1rfGkO4WlV0ibRk3wXXIwN517ZzNhwyOuErb5hQruAgSNBTnrtpLtJ9yEUgYMlEJcG82NpoKD+DHm6z19UB+drWX12oRQw7AE9l7Fz4ZqFj0sx9tEnSPVs8diTbSa3CzKEpZjyvfrtUNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+H6aoyc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+H6aoyc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63B0C2BCB3;
	Thu, 14 May 2026 19:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778785513;
	bh=IxufPOthI6kZEFAyqbsNWe925bkT6BdlzfAludx4V2g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=B+H6aoycESA5mCD8vs1YMzejb5tmMiqpZRvtUP2QjR38sjh1qdooNb7RQoglCcStO
	 wfhiD4XiLLFbPWPECUaVUQb8v1MxDUto58QSoaUwRoY2dRkT5Y5vpZomCJgNcsv7Iz
	 FR+daum3HqoN3KXJTzowZH1aQ/Wi1R9YJuANLzuo0SUc4IKPHsDU962Tktce/m0xWO
	 SOLpcPoyuMCJEAYuom2XPruY34MBlTOwVmH7XNnS8XCjb3lXTpuwRXMOqy8xBiq5Cb
	 +rQMDiUEFS56ym1E96zuXB2xmB/3libAjLdI6wZ3D+YzcL+RQtxGfWsq+hzOH5qcHX
	 CBA0wHYIhQ1dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] clocksource: move NXP timer selection to
 drivers/clocksource
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enric Balletbo i Serra" <eballetbo@kernel.org>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com>
References: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:05:13 +0000
Message-Id: <20260514190513.B63B0C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Shoehorning ARCH_S32 (ARM64) into the Vybrid scheduler clock choic=
e block risks replacing the native ARM Architected Timer with a slower 32-b=
it MMIO timer.
--

commit 37ddcc4eb82e3bfe1a0ebf5e407f22b4f2b1bef7
Author: Enric Balletbo i Serra <eballetb@redhat.com>

clocksource: move NXP timer selection to drivers/clocksource

This commit relocates the NXP clocksource Kconfig logic from
arch/arm/mach-imx/Kconfig to drivers/clocksource/Kconfig. It updates
the selection to include support for the 64-bit ARCH_S32 platform,
adding a "None" option to fallback to the standard ARM Architected Timer.

[ ... ]

> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index d1a33a231a44c..d9c76dd443f8a 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -793,4 +793,35 @@ config RTK_SYSTIMER
>  	  this option only when building for a Realtek platform or for compilat=
ion
>  	  testing.
> =20
> +choice
> +	prompt "NXP clocksource for scheduler clock"
> +	depends on SOC_VF610 || ARCH_S32
> +	# Default to Global Timer for Vybrid (32-bit)
> +	default VF_USE_ARM_GLOBAL_TIMER if SOC_VF610
> +	# Default to None for S32 (64-bit)
> +	default VF_TIMER_NONE if ARCH_S32
> +
> +	config VF_USE_ARM_GLOBAL_TIMER
> +		bool "Use NXP Vybrid Global Timer"
> +		depends on ARCH_MULTI_V7 && SOC_VF610
> +		select ARM_GLOBAL_TIMER
> +		select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> +		help
> +		  Use the NXP Vybrid Global Timer as clocksource.
> +
> +	config VF_USE_PIT_TIMER
> +		bool "Use NXP PIT timer"
> +		select NXP_PIT_TIMER
> +		help
> +		  Use NXP Periodic Interrupt Timer (PIT) as clocksource.

Could this replace the native ARM Architected Timer with a slower 32-bit MM=
IO
timer on S32 systems?

Since NXP_PIT_TIMER has no prompt of its own, an S32 user needing the PIT
timer for other valid purposes (like clock events) is forced to select
VF_USE_PIT_TIMER from this choice block.

If selected, the timer-nxp-pit.c driver unconditionally calls
sched_clock_register() during initialization. This automatically overrides =
the
existing scheduler clock if the new clock's rate is higher than or equal to
the current one.

Because the PIT timer is typically driven by a high-speed system bus, its
frequency will likely exceed the ARM Architected Timer's standard 25-50 MHz
rate. Overriding the heavily optimized 64-bit system-register Architected
Timer with a 32-bit memory-mapped PIT timer introduces massive read latency
for every sched_clock() call.

Would it be better to expose NXP_PIT_TIMER as a standalone option for S32,
and modify the driver to avoid registering as sched_clock on ARM64
architectures?

> +
> +	config VF_TIMER_NONE
> +		bool "None (Use standard Arch Timer)"
> +		depends on ARCH_S32
> +		help
> +		  Do not use any specific NXP timer driver. Use the standard
> +		  ARM Architected Timer instead.
> +
> +endchoice
> +
>  endmenu

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-fix-nxp-ti=
mer-v3-1-a3e68fdb505e@redhat.com?part=3D1

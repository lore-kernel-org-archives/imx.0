Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466946;
	b=GXvMhz7pyvd+ICp4UWA4B63rJqfKvUWJEWiNQ6Amp2BzsrphLIwnGDafF0e6wX95IXl7
	 1DdsE65MS9an72+Z5jllzlY/b7YINXRI+oAgDJV0RnqpkQrveHENS8KUGFAJ380Mjwl75
	 XShnWP+Hp2LHaLAaAvrVdzsNkitUCxk/YdUwvljPVjJaRjFCthj4b5CAKYhzpr1hq91q+
	 BVOcG/QRWu8dfcg1n4KVVYZcE98jgYeZnegw5UVD3MEnPG2c0LyhVq5evjDw6LZ5CBiiB
	 Roczx6fxj928NlUQQG9RZgw8hoybtb/OqPtFKYJD3YRWuSEpX8wVldacOHe+i5SZsWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466946;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LvP42X/Qe4jT8jeTYD/+pZqe6epAAoJWGuni2RHft04=;
	b=GvBJ/3Iz7HxZ6xf5xkl4DiwHztkR7YtvIFmNOB/LMayGRKC9e1i19Cr8OZ/cLBC30R2C
	 SxytHRfvkWD6PudgAohp6JkrXf486o0MmCtgScc/UaHQg4p4UX5NEz0ISpef5vfQTQBDZ
	 dnrUbe3P7n3LshK3d0FpblJ7XPD5/SbQNSH0qwTik3Aep823FDxscMHPRAi5sUrZPfIxA
	 J7B9kk6Oc69rNDG1Jq+JK/w1Qgux1SKin0TztueCMlTVdY6neZ/KjDBORANXRZDC6e2js
	 T1kNpMvauJ+ijymtxPVzAHP9Hns2xhSNXR9l0f6LNgpn2rzoYnNe7pMBeOnKXYaWXtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TCaiHo+0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAEA606A32A;
	Mon, 23 Nov 2026 20:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TCaiHo+0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9AD1F000D8;
	Mon, 23 Nov 2026 20:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795466945;
	bh=LvP42X/Qe4jT8jeTYD/+pZqe6epAAoJWGuni2RHft04=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TCaiHo+0a7VCl1zCwpcmrR2ru+Dr3UNtzrnaDZbcGqnHKAbfJKQYnNJxLbMVtwkQV
	 eq99EBFHBjCeerWdCL1G60DW4/0LCRC3LjZVUGQ9NuOs9w6PBkBKxvz68HS9MUL28R
	 G6e7XV7zqNIqdKWw6XROQteBUtPBs5sCaBFa5nIJuaAVcqFAX5PdvWw6EVg7DSukhC
	 cOGKZTUrfpWjM8z/tMoY7OODqJGNUIw5o5kpS4WtPEGA3K13HKmal4cnFX3B37CspL
	 rT5ekbbRrM6ZxAxiPzgbLClxk+6G5JNNL8mYzyjwUnr5LQPmGtAQn7cnHL/XO2SqLE
	 mU7F/zgNCc9Ew==
Message-ID: <sashiko-outbox-230024@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/3] ARM: imx: enable STOP-ON mode in idle if wakeup
 requirements permit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123-imx6-idlestop-v1-1-e32f1f44e46f@kemnade.info>
References: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
 <20261123-imx6-idlestop-v1-1-e32f1f44e46f@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 20:49:04 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] ARM: imx: i.MX6SLL-only STOP ON idle state registered on all
  i.MX6SX/UL SoCs
- [Medium] ARM: imx: imx6sll_check_pll_are_used() omits DCP DMA clock in
  CCGR0 check
- [Low] ARM: imx: duplicate BIT(21) term in CCGR5 mask in
  imx6sll_check_pll_are_used()
- [Low] ARM: imx: imx6sx_enter_pll_off() duplicates state 2 power-off
  sequence
--

commit faf6510335563388f22705edc72db8052152fc32
Author: Andreas Kemnade <andreas@kemnade.info>

ARM: imx: enable STOP-ON mode in idle if wakeup requirements permit

This commit adds a fourth cpuidle state ("STOP ON") to imx6sx_cpuidle_driver
that enters STOP_POWER_ON mode on i.MX6SLL when CCGR0..CCGR6 indicate that
PLLs are not in use.

> diff --git a/arch/arm/mach-imx/cpuidle-imx6sx.c b/arch/arm/mach-imx/cpuid=
le-imx6sx.c
> index 83c5cbd3748e1..4537cb7b3a637 100644
> --- a/arch/arm/mach-imx/cpuidle-imx6sx.c
> +++ b/arch/arm/mach-imx/cpuidle-imx6sx.c
> @@ -65,6 +65,36 @@ static __cpuidle int imx6sx_enter_wait(struct cpuidle_=
device *dev,
>  	return index;
>  }
> =20
> +static __cpuidle int imx6sx_enter_pll_off(struct cpuidle_device *dev,
> +				       struct cpuidle_driver *drv, int index)
> +{
> +	if (!cpu_is_imx6sll() || imx6sll_check_pll_are_used())
> +		return imx6sx_enter_wait(dev, drv, 2);
> +
> +	imx6_set_lpm(STOP_POWER_ON);
> +	imx6_enable_rbc(true);
> +	imx_gpc_set_arm_power_in_lpm(true);
> +	imx_set_cpu_jump(0, v7_cpu_resume);
> +	imx6_set_int_mem_clk_lpm(true);
> +	/* Need to notify there is a cpu pm operation. */
> +	cpu_pm_enter();
> +	cpu_cluster_pm_enter();
> +
> +	ct_cpuidle_enter();
> +
> +	cpu_suspend(0, imx6sx_idle_finish);
> +
> +	ct_cpuidle_exit();
> +
> +	cpu_cluster_pm_exit();
> +	cpu_pm_exit();
> +	imx6_enable_rbc(false);
> +	imx_gpc_set_arm_power_in_lpm(false);
> +
> +	imx6_set_lpm(WAIT_CLOCKED);
> +	return index;
> +}

[Severity: Low]
This isn't a bug, but imx6sx_enter_pll_off() duplicates the state 2
power-off sequence from imx6sx_enter_wait(), differing only in passing
STOP_POWER_ON instead of WAIT_UNCLOCKED to imx6_set_lpm().  Calling
imx6_set_int_mem_clk_lpm(true) on every entry is also redundant, since
imx6sx_cpuidle_init() sets it at init and imx6q_pm_enter() restores it on
resume from suspend.

> @@ -95,8 +125,18 @@ static struct cpuidle_driver imx6sx_cpuidle_driver =
=3D {
>  			.name =3D "LOW-POWER-IDLE",
>  			.desc =3D "ARM power off",
>  		},
> +		/* STOP ON */
> +		{
> +			.exit_latency =3D 500,
> +			.target_residency =3D 800,
> +			.flags =3D CPUIDLE_FLAG_TIMER_STOP |
> +				 CPUIDLE_FLAG_RCU_IDLE,
> +			.enter =3D imx6sx_enter_pll_off,
> +			.name =3D "STOP ON",
> +			.desc =3D "ARM power off + PLL off",
> +		},
>  	},
> -	.state_count =3D 3,
> +	.state_count =3D 4,
>  	.safe_state_index =3D 0,
>  };

[Severity: Medium]
Should state 3 only be exposed on i.MX6SLL, and should falling back to
state 2 respect dev->states_usage[2].disable?

imx6sx_cpuidle_init() registers imx6sx_cpuidle_driver on i.MX6SX, i.MX6UL,
i.MX6ULL and i.MX6ULZ as well as i.MX6SLL.  Unconditionally setting
state_count =3D 4 advertises an enabled state 3 on those other SoCs that
always demotes to state 2, causing cpuidle_enter_state() to record false
state 2 "below" misses whenever actual idle time reaches 800 us and
skewing governor residency bins.  In addition, calling
imx6sx_enter_wait(dev, drv, 2) directly bypasses sysfs if state 2 has been
disabled by userspace.

> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index 3c73e2cdb8ceb..65a5268d31614 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
[ ... ]
> @@ -287,6 +295,21 @@ void imx6_enable_rbc(bool enable)
>  	imx_gpc_restore_all();
>  }
> =20
> +bool imx6sll_check_pll_are_used(void)
> +{
> +	/* check for any clock active which provides more than register access =
*/
> +	return readl_relaxed(ccm_base + CCGR0) & BIT(29)  ||

[Severity: Medium]
Does the CCGR0 mask also need BIT(11) for IMX6SLL_CLK_DCP?

In drivers/clk/imx/clk-imx6sll.c, IMX6SLL_CLK_DCP ("dcp", parented to
"ahb") is gated by CCGR0 bits 11:10.  When mxs_dcp_start_dma() starts a
crypto DMA transfer and sleeps in wait_for_completion_timeout(), the
single CPU on i.MX6SLL can enter cpuidle; without BIT(11) in the CCGR0
check, entering STOP_POWER_ON stops AHB and PLL clocks mid-transfer and
stalls DCP DMA until it times out.

> +		readl_relaxed(ccm_base + CCGR1) & (BIT(25) | BIT(23) | BIT(15) | BIT(1=
3) |
> +						   BIT(11) | BIT(7) | BIT(5) | BIT(3) | BIT(1)) ||
> +		readl_relaxed(ccm_base + CCGR2) & (BIT(31) | BIT(29) | BIT(11) | BIT(9=
) |
> +						   BIT(7) | BIT(3)) ||
> +		readl_relaxed(ccm_base + CCGR3) & (BIT(11) | BIT(5) | BIT(3)) ||
> +		readl_relaxed(ccm_base + CCGR4) & (BIT(23) | BIT(21) | BIT(19) | BIT(1=
7)) ||
> +		readl_relaxed(ccm_base + CCGR5) & (BIT(25) | BIT(23) | BIT(21) | BIT(2=
1) |
> +						   BIT(19) | BIT(15) | BIT(7)) ||

[Severity: Low]
BIT(21) is listed twice in the CCGR5 mask; is one of them redundant or
meant to be another bit?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-imx6-idles=
top-v1-0-e32f1f44e46f@kemnade.info?part=3D1

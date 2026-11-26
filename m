Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691631;
	b=KdWKfGWq6sY4eFcG6N8CyOSpNFaJ7+0BiyXC3qD+Hi89VpMKo1vy+j159nVXbdntl7u8
	 8r1CT46YvPojkj4x52ocqA0WBNRmXgmPZrMMq2EkbOsOr0aHtDL2Bc/WhDqttFsef0UQN
	 gxOvGRTDLhRMNruWeJAZFesXT9huPaYMCXW226NVI6hUOxwWOEkknSEJWWkwHqdpo+CVj
	 CkTBSSMk3ToD9+LrwH7R4Ern697sJdlZ6fCDDNk6jref8QfslVDs+OJundDkAHt3oAhbG
	 PkUl+RT4o8tpyFivDn/TMoZyBMxVQ5+uiE93uGH4N+svuqYavxBv0z2+NUYnIR38x8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691631;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5yes+atJQS0D3nRYnQMVb52mM8aZbG7m6W3LL5KHhuo=;
	b=DKFVDdBpKcPLwUqr4C2OOf87dKuw0698O8Ih1EEbKNoex9gzV4kNxsfTkAsOx51IaxzJ
	 QazTGLA6HdMCl7v+DAGamDSNkf7J4P1zAlIP/1ba8l8z9JXh9pDDgWeQn9KV51FYoGYLL
	 AgGftJXum+3okGlMmSGrr9D2521zLyt1vhcbyxUKSzUljm1IwT1qEtM2QB4wZ5/kAFCix
	 36BY/OT4PZPQjZb4ztCLi8MvZESqz7lbhrl04Bv3nO2aguEidIQA7H5PsGAqSfjR/rano
	 thVPC732FYbdcOTj5wSC3Ykv365ykO2q9p3m/00XvegTrSURJu/D6EooMzIT9aA91ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ILf3dbFe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A367C606A31C;
	Thu, 26 Nov 2026 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ILf3dbFe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9281F000CA;
	Thu, 26 Nov 2026 11:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691630;
	bh=5yes+atJQS0D3nRYnQMVb52mM8aZbG7m6W3LL5KHhuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ILf3dbFe9V38ZmrlrP0TT9xBcuA1GKNz53LnG4z9Aalcdmvds6bGwY5994V5ICvdU
	 bSjP8u6E5WNR+OvufcWSf8CLudM/z503WT4wfTov9R406dLfCdrJkHfo18t/P/6C9T
	 kx60qYV0StVOcREApv9qlwvN06zw8ddAatmPcOyXE4tJEUOIuEK7ltazQ0ORWxi0TQ
	 zTPjXpk90FhVKndWTmVqE9vTnIUpOcppVZCbfzh5s5y7raAUoAQFib1ytYEa8XDVk8
	 JHNXxvRurG/XitROR+kZ1D0GAMK9s2ZTWvSmw0qM1dh8svBlM6cbnz/c6YJ+yBWPcV
	 aawFJYP8cegQA==
Message-ID: <sashiko-outbox-235350@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] ARM: imx: enable STOP-ON mode in idle if wakeup
 requirements permit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261126-imx6-idlestop-v2-1-c6987e7a392f@kemnade.info>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
 <20261126-imx6-idlestop-v2-1-c6987e7a392f@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 11:13:50 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ARM: imx: broken fallback to states 0 and 1 in
  imx6sx_enter_pll_off()
- [Low] ARM: imx: wrong clock names in imx6sll_check_pll_are_used()
  comments
--

commit 6724bea26c43aa799d88abd3c3139a314f0fea52
Author: Andreas Kemnade <andreas@kemnade.info>

ARM: imx: enable STOP-ON mode in idle if wakeup requirements permit

This commit adds a STOP ON cpuidle state on i.MX6SLL that powers off the
ARM core and PLLs when no peripheral clocks requiring PLLs are active.

> diff --git a/arch/arm/mach-imx/cpuidle-imx6sx.c b/arch/arm/mach-imx/cpuid=
le-imx6sx.c
> index 83c5cbd3748e1..d2e8a98cc6ebb 100644
> --- a/arch/arm/mach-imx/cpuidle-imx6sx.c
> +++ b/arch/arm/mach-imx/cpuidle-imx6sx.c
> @@ -65,6 +65,40 @@ static __cpuidle int imx6sx_enter_wait(struct cpuidle_=
device *dev,
>  	return index;
>  }
> =20
> +static __cpuidle int imx6sx_enter_pll_off(struct cpuidle_device *dev,
> +				       struct cpuidle_driver *drv, int index)
> +{
> +	if (imx6sll_check_pll_are_used()) {
> +		for (index--; index >=3D 0; index--)
> +			if (!dev->states_usage[index].disable)
> +				return imx6sx_enter_wait(dev, drv, index);
> +
> +		return -EBUSY;
> +	}

[Severity: Medium]
Can this fallback call imx6sx_enter_wait() with index 1 or 0?

State 3 sets CPUIDLE_FLAG_RCU_IDLE, so cpuidle_enter_state() skips
ct_cpuidle_enter() and ct_cpuidle_exit() around target_state->enter().
If state 2 is disabled in sysfs and imx6sll_check_pll_are_used() returns
true, falling back to index 1 runs case 1 in imx6sx_enter_wait(), which
calls cpu_do_idle() without ct_cpuidle_enter() / ct_cpuidle_exit() and
leaves RCU non-idle while the CPU sleeps with its local timer stopped.

If states 2 and 1 are both disabled, falling back to index 0 hits
default: break in imx6sx_enter_wait() and returns 0 without calling
cpu_do_idle() at all, causing the idle loop to busy-spin while counting
entries into state 0.

Calling drv->states[index].enter(dev, drv, index) wrapped in
ct_cpuidle_enter() and ct_cpuidle_exit() when the fallback state does not
have CPUIDLE_FLAG_RCU_IDLE set would handle all shallower states.

> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index 3c73e2cdb8ceb..2494ee4d20c3a 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
[ ... ]
> @@ -287,6 +295,29 @@ void imx6_enable_rbc(bool enable)
>  	imx_gpc_restore_all();
>  }
> =20
> +bool imx6sll_check_pll_are_used(void)
> +{
> +	/* check for any clock active which provides more than register access =
*/
> +
> +				/* uart2 | dcp */
> +	return readl_relaxed(ccm_base + CCGR0) & (BIT(29) | BIT(11)) ||
> +				/* uart | gpt_serial | epit | ecspi */
> +		readl_relaxed(ccm_base + CCGR1) & (BIT(25) | BIT(23) | BIT(15) | BIT(1=
3) |
> +						   BIT(11) | BIT(7) | BIT(5) | BIT(3) | BIT(1)) ||
> +				/* pxp | lcd | i2c */
> +		readl_relaxed(ccm_base + CCGR2) & (BIT(31) | BIT(29) | BIT(11) | BIT(9=
) |
> +						   BIT(7) | BIT(3)) ||
> +				/* lcdif | epdc | pxp */
> +		readl_relaxed(ccm_base + CCGR3) & (BIT(11) | BIT(5) | BIT(3)) ||

[Severity: Low]
This isn't a bug, but in drivers/clk/imx/clk-imx6sll.c, BIT(3) of CCGR2
(0x70) gates csi (omitted from the CCGR2 comment) and BIT(3) of CCGR3
(0x74) gates uart5_ipg / uart5_serial rather than pxp.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-imx6-idles=
top-v2-0-c6987e7a392f@kemnade.info?part=3D1

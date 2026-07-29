Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF2B445ADB
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321807; cv=none; b=I76e1Sp9Vwj6cMq+USuzGKiaXbRLn71PZ+c1F9DzRgJOFgNLN19c2E/drZBbYjkd4Ffo/wVQ1jpgeg+1rCQLLR74FMoH8YAm31hGanVQIeBHpWYnPAVeb/STzUTTeHF88E9ruW15Z89A77Nzu5MKx+z/lEOYScwBam032L/fWg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321807; c=relaxed/simple;
	bh=CelEy+zebNVQmdWBG1x2f5HkYzvxC0I075cFENgaH+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OAWoYqaqfyiSqOqjf49J+y0UHqhqSk1Dx4TfULuuT3G/2YvY5QjwlO8jGICnH0NtL5h5T8IrneLK1Y1p62asF5oKotPqEBrW6fiYzz+r2klGHS0ukMlPaqLlVHYMf3bCxrqT+ds8/Z2nVO3NEwLDKCnN1RAQp4Yc++7S2q6Dda4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1nuOjCE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1nuOjCE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB451F00A3D;
	Wed, 29 Jul 2026 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321795;
	bh=3xdGB8ZiJM/keLiNRF3nUff5ZjsJP39s6+N/eSMt2DA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j1nuOjCEk1X7xhVjou2L4Ic0bcGdqNOvbTA2EfAunUxoqlkR89LIhxMMwVQWzaLxA
	 pWvzxt9OgE01XTIvTm2TNdv4yMyIdqDwObcish/+TRg9n+3Zfz+MM+O39n04TPEJ0t
	 hG2yVN9SsyjrOlKUO5InnhkyFMgye/aQwrQPt02EPmWO3nCKVYx0eGrm0GnzVhh3FX
	 KtzAKZBcJjADz2Qw+rkkk+O9rl5At17dqfM3EhDuBxsIc6L/706tzHyPavujLmOuoO
	 kTbSBgdhpj3UKC0j3KRUdHQY1MZqZG6Pj9Ok3/xfEqCxeX/Rt309fsJub+HqoxS+or
	 PzxD0rdYb1tfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/7] ptp: netc: export
 netc_timer_get_current_time() for cross-driver use
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260728104548.3301214-4-wei.fang@oss.nxp.com>
References: <20260728104548.3301214-1-wei.fang@oss.nxp.com>
 <20260728104548.3301214-4-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:43:14 +0000
Message-Id: <20260729104314.BEB451F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Time-of-Check to Time-of-Use (TOCTOU) race condition in netc_t=
imer_get_current_time() leads to Use-After-Free and invalid MMIO access dur=
ing concurrent unbind.
- [High] Premature publishing of driver data in netc_timer_pci_probe() caus=
es netc_timer_get_current_time() to access uninitialized locks and hardware=
 registers.
- [Low] Build/linker error due to using IS_ENABLED() instead of IS_REACHABL=
E() for an exported cross-driver symbol.
--

--- Patch [3]: [PATCH net-next 3/7] ptp: netc: export netc_timer_get_curren=
t_time() for cross-driver use ---
commit 397844577b2034cd8a6a870bc6609d9217d7fc38
Author: Wei Fang <wei.fang@nxp.com>

ptp: netc: export netc_timer_get_current_time() for cross-driver use

This commit adds and exports netc_timer_get_current_time() to allow the NETC
Switch driver to read the current PTP time from the NETC Timer. It also
provides a stub declaration when the timer configuration is disabled.

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> index 072809ea7922c..60e64542314b1 100644
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c

[ ... ]

> @@ -165,6 +165,23 @@ static u64 netc_timer_cur_time_read(struct netc_time=
r *priv)
>  	return netc_timer_rd64(priv, NETC_TMR_CUR_TIME_L);
>  }
> =20
> +u64 netc_timer_get_current_time(struct pci_dev *pdev)
> +{
> +	struct netc_timer *priv =3D pci_get_drvdata(pdev);

[Severity: High]
Does this function assume the driver data is fully initialized if priv is
not NULL?

In netc_timer_pci_probe(), pci_set_drvdata() is called before the spinlock
is initialized in netc_timer_probe(). If a concurrent caller fetches the
driver data here while the timer is still probing, could it attempt to
acquire an uninitialized spinlock or read from unconfigured hardware?

> +	unsigned long flags;
> +	u64 cur_time;
> +
> +	if (!priv)
> +		return 0;
> +

[Severity: Critical]
Is this lockless check sufficient to prevent a use-after-free if the timer
driver is unbound concurrently?

If a concurrent thread unbinds the timer driver via sysfs right after this
check passes, the driver's remove() callback could execute and unmap the
MMIO region. The device core's devres cleanup would then free the priv
pointer before clearing the driver data.

Does this mean the caller could then attempt to acquire a freed spinlock
and read from unmapped MMIO memory?

> +	spin_lock_irqsave(&priv->lock, flags);
> +	cur_time =3D netc_timer_cur_time_read(priv);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return cur_time;
> +}
> +EXPORT_SYMBOL_GPL(netc_timer_get_current_time);

[ ... ]

> diff --git a/include/linux/fsl/netc_global.h b/include/linux/fsl/netc_glo=
bal.h
> index 5b8ff528d3699..91441cb35bc28 100644
> --- a/include/linux/fsl/netc_global.h
> +++ b/include/linux/fsl/netc_global.h
> @@ -22,4 +22,13 @@ static inline u64 netc_read64(void __iomem *reg)
>  	return ioread64(reg);
>  }
> =20
> +#if IS_ENABLED(CONFIG_PTP_NETC_V4_TIMER)

[Severity: Low]
Will this cause a linker error if the calling driver is built-in (=3Dy) but
the timer driver is built as a module (=3Dm)?

Since IS_ENABLED() evaluates to true when the config is a module, the
fallback stub won't be provided. The built-in caller would then be unable
to resolve the modular symbol during linking.

Should this use IS_REACHABLE() instead?

> +u64 netc_timer_get_current_time(struct pci_dev *timer_dev);
> +#else
> +static inline u64 netc_timer_get_current_time(struct pci_dev *timer_dev)
> +{
> +	return 0;
> +}
> +#endif
> +
>  #endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728104548.3301=
214-1-wei.fang@oss.nxp.com?part=3D3

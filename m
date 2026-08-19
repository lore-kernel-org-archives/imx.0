Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F441F8723
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 03:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787110198; cv=none; b=Y1bBIy1Jw9gkJkh0Gp9i0WuT/eeJY97V/FIxIbmQo69yatn0t5CyHyo2qNrKSSl8whDwJI11ZYPrgC7Dkln+fHRyLKmFDUypzRFTl/HoxhMYin+RDNt/XN3s9OWS9BHhLhb22O+5B/ySV0M7gLp7lFtxmO6guY/AXrd2FLa0gmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787110198; c=relaxed/simple;
	bh=XvVBUx3MOivJJEuwfgtXzN+M+/p3NrtIw6xe+IGfcc8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a7AQcrjNe6wrqg2ZAZBO3mcRq7/we3HYRG4IuJiiw2ECS/a44kIOuFva+6J6TLzWuOoGrJh7Y2DUuuN8HHX/jJ6mOKzzN7IWGoUvKWbu8GKd587kNfYP2KY8Iiy0P4EiNAUxHAhXG+Tje5uU83dJYIS6r7uhKNfGifEi+oPLROc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jceoBebX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jceoBebX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1965C1F000E9;
	Wed, 19 Aug 2026 03:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787110197;
	bh=ldtoO5ONN+rSembVpEUfxvGI8p6KxE5B2B+BcHyG2Ik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jceoBebXdbaN1kqngvn5YGZxMubQBqsPeHoji5j6wyAw6chFnGWDqym3kabJfDaIn
	 opXNdcCyGOsSjN+hxUtZJ8bZ8NmCRQDwJsaTqF7LYlEnnjJ0AzL5GMSpqiKEk3Zvdp
	 4FJX4XLh7gAVz2MRQXyNOx/1QdFe9XZvjJOeuXpA/5GT9pq63OexsZ4pFYlaIcBDr3
	 bQHoIu7hVk7x9oaWJ7ijGubxxKiNolXd7ZP8HudUB+Ry3F5yzKZeB+zf4uwOLMObqL
	 Wg+lJPINAGB+tdw6UrGLymmw0wVWX32dPlNf7vg/ZPISLmoRJWUEFVPiuLUUusIqc6
	 sfZQPXlT++YEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] ptp: netc: fix period truncation and potential
 divide-by-zero in PEROUT
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260818033342.3154990-1-wei.fang@oss.nxp.com>
References: <20260818033342.3154990-1-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 03:29:56 +0000
Message-Id: <20260819032957.1965C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Division by zero in `roundup_u64()` when `integral_period` evaluat=
es to 0 due to clock frequency adjustments.
- [Medium] Missing validation of `clk_get_rate()` allows a division by zero=
 if the reference clock rate is 0.
--

--- Patch [1]: [PATCH net] ptp: netc: fix period truncation and potential d=
ivide-by-zero in PEROUT ---
commit 29d635c27b8bca8b216f11e24d3881ee5aec72c6
Author: Wei Fang <wei.fang@nxp.com>

ptp: netc: fix period truncation and potential divide-by-zero in PEROUT

This commit caps max_period at NETC_TMR_DEFAULT_FIPER to prevent a period
truncation bug in net_timer_enable_perout() that causes silent truncation
and potential divide-by-zero issues in PEROUT.

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> index 59db08e189e6e..05d606e636b1a 100644
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c
> @@ -450,7 +450,7 @@ static int net_timer_enable_perout(struct netc_timer =
*priv,
>  		period_ns =3D timespec64_to_ns(&period);
> =20
>  		integral_period =3D netc_timer_get_integral_period(priv);
> -		max_period =3D (u64)NETC_TMR_DEFAULT_FIPER + integral_period;
> +		max_period =3D NETC_TMR_DEFAULT_FIPER;
>  		gclk_period =3D netc_timer_get_gclk_period(priv);
>  		min_period =3D gclk_period * 4 + integral_period;
>  		if (period_ns > max_period || period_ns < min_period) {

[Severity: High]
This isn't a bug introduced by this patch, but can a zero integral_period
trigger a divide-by-zero panic in roundup_u64()?

Looking at netc_timer_set_pps_alarm() and netc_timer_set_perout_alarm():

drivers/ptp/ptp_netc.c:netc_timer_set_pps_alarm() {
	...
	alarm =3D netc_timer_cur_time_read(priv) +  NSEC_PER_MSEC;
	alarm =3D roundup_u64(alarm, NSEC_PER_SEC);
	alarm =3D roundup_u64(alarm, integral_period);
	...
}

drivers/ptp/ptp_netc.c:netc_timer_set_perout_alarm() {
	...
	alarm =3D roundup_u64(stime - period, integral_period);
	netc_timer_alarm_write(priv, alarm, pp->alarm_id);
}

If the hardware clock frequency is fast enough (e.g., 600 MHz, giving a base
period of 1.666 ns), a large negative adjustment (e.g., -40% or -400,000,000
ppb) during a PTP adjfine ioctl will reduce the new_period below 1.0 ns.

When this happens, upper_32_bits(new_period) evaluates to 0, setting the
integral_period to 0.

netc_timer_adjust_period() then disables and re-enables the FIPER hardware,
invoking netc_timer_enable_fiper(), which sequentially calls
netc_timer_set_pps_alarm() and netc_timer_set_perout_alarm().

Since roundup_u64() performs a division via DIV_U64_ROUND_UP, passing 0
causes an immediate kernel panic. This path is reachable via the standard
PTP adjfine ioctl by userspace processes with CAP_SYS_TIME.

[Severity: Medium]
This is a pre-existing issue, but does this code validate the return value
from clk_get_rate()?

drivers/ptp/ptp_netc.c:netc_timer_get_reference_clk_source() {
	...
		if (clk) {
			priv->clk_freq =3D clk_get_rate(clk);
			priv->clk_select =3D i ? NETC_TMR_EXT_OSC :
					       NETC_TMR_CCM_TIMER1;
			break;
		}
	}

	/* The period is a 64-bit number, the high 32-bit is the integer
	 * part of the period, the low 32-bit is the fractional part of
	 * the period. In order to get the desired 32-bit fixed-point
	 * format, multiply the numerator of the fraction by 2^32.
	 */
	priv->period =3D div_u64((u64)NSEC_PER_SEC << 32, priv->clk_freq);
	...
}

If the clock is misconfigured or specified as a dummy clock in the device t=
ree,
clk_get_rate() returns 0.

Passing 0 as the divisor to div_u64() will trigger an unhandled divide-by-z=
ero
exception during the driver's probe sequence.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818033342.3154=
990-1-wei.fang@oss.nxp.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFEC3F7865
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 01:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596913; cv=none; b=khfHjYUes3XHO4bp0y1Uh3xBJ6LqAWQ334aXL76cU3mmrRDgNBhlIK98kKnm35T4Slgm1dEEFsk7IBPs1URM/qxFMJ0rha82bMfmkBLmLE8z+YYHq9JJbWPlOTUUJXbSU3MAhdoGjip0BdpuC1m9s6Xz5o1eCk/jPe9XP/zzq50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596913; c=relaxed/simple;
	bh=gQ3q5opyDN4bP2Y8lwTzWh6xhNhVXs+/MnJlIgYWH8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G0IQObd87psPG6Cush2K9usFNf/uatONMKyk3zm6qL0kiJNwHu2FOk65D5SgDXWCkHHJKMO1cSDHsPRwotVaamgQXlm0iUZJ46c2z11WhDmdct5/+QTtojZfx8+bhr3pRntEcBIYifo362K37LIxyUPEegYryB9pphBuUfF8ThI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAnRt4Hs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAnRt4Hs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3E21F000E9;
	Tue, 21 Jul 2026 01:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784596911;
	bh=4L6cTODh+5Xn+/JHX/QdZUFGKhHZO8kMW2taOIc30G8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZAnRt4HsMmDl/7+Q9bPd4h6eCYpAqBcsSq/5im1nm9immOtgrCIop5mW/J5abWUuf
	 6nHZxwMz8PH4hUEXs/z5zSS1w2Z5Bt5a5w2sQ6gA8uMxoANHOhqcoL4lh8sOjvZruN
	 g8PmiEykV4TDvY/n+T3y0dPgGu3eYsIk0aRnDPYtDggX/CjaLPaY49Q0iMkIns9hhV
	 fZ978OYZJjQQ1TRawAO1ATc8IBUIFx1VOvpfxtvzzaWTXFGQEOE/iBesK5pp58tad1
	 GfJJZTU4Hg446ePpg/Lmlbv6qNvmKwfSXxoF7sOOFPlWRkAGCFXFJK4hJ8jjJvjCbh
	 fTv6E/yA6Iy/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v1 net] ptp: netc: explicitly clear TMR_OFF
 during initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260720012508.23227-1-wei.fang@oss.nxp.com>
References: <20260720012508.23227-1-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 01:21:50 +0000
Message-Id: <20260721012151.5A3E21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver requests the MSI-X interrupt during probe before saniti=
zing hardware interrupt state. Combined with a logic error in the ISR, this=
 causes an uninterruptible interrupt storm (CPU lockup).
- [High] Race condition in `netc_timer_remove` allows user-space ioctls to =
leave hardware interrupts active after driver unbind.
--

--- Patch [1]: [PATCH RESEND v1 net] ptp: netc: explicitly clear TMR_OFF du=
ring initialization ---
commit f3b81ecce462c4ab69c0789be51860d8eb8b3d21
Author: Clark Wang <xiaoning.wang@nxp.com>

ptp: netc: explicitly clear TMR_OFF during initialization

The NETC timer does not support function level reset, so TMR_OFF_L/H
registers are not cleared by pcie_flr(). If TMR_OFF was set to a
non-zero value in a previous binding, it will persist across driver
rebind and cause inaccurate PTP time.

Link: https://lore.kernel.org/imx/20260706081232.3661826-1-wei.fang@oss.nxp=
.com/

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> index 94e952ee69902..5e381c354d746 100644
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c
> @@ -779,6 +779,7 @@ static void netc_timer_init(struct netc_timer *priv)
>  	netc_timer_wr(priv, NETC_TMR_FIPER_CTRL, fiper_ctrl);
>  	netc_timer_wr(priv, NETC_TMR_ECTRL, NETC_TMR_DEFAULT_ETTF_THR);
> =20
> +	netc_timer_offset_write(priv, 0);

[Severity: High]
This is a pre-existing issue, but since netc_timer_init() is called during
netc_timer_probe(), does the driver risk an interrupt storm?

In netc_timer_probe(), the driver calls request_irq() via
netc_timer_init_msix_irq() before calling netc_timer_init():

drivers/ptp/ptp_netc.c:netc_timer_probe() {
    ...
	err =3D netc_timer_init_msix_irq(priv);
	if (err)
		goto timer_pci_remove;

	netc_timer_init(priv);
    ...
}

If hardware has a pending interrupt from a previous driver session, it could
fire immediately. Furthermore, the ISR appears to mask out unhandled events
before writing back to clear them, and unconditionally returns IRQ_HANDLED:

drivers/ptp/ptp_netc.c:netc_timer_isr() {
    ...
	tmr_event =3D netc_timer_rd(priv, NETC_TMR_TEVENT);
	tmr_event &=3D priv->tmr_emask;
	/* Clear interrupts status */
	netc_timer_wr(priv, NETC_TMR_TEVENT, tmr_event);
    ...
	return IRQ_HANDLED;
}

Since priv->tmr_emask is 0 during probe, tmr_event becomes 0, so the hardwa=
re
interrupt is never cleared. Because IRQ_HANDLED is returned unconditionally,
will this lead to an uninterruptible infinite interrupt storm?


[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
during driver unbind that could leave hardware interrupts active?

In netc_timer_remove(), the driver writes to hardware registers to disable
interrupts before unregistering the PTP clock:

drivers/ptp/ptp_netc.c:netc_timer_remove() {
    ...
	netc_timer_wr(priv, NETC_TMR_TEMASK, 0);
	netc_timer_wr(priv, NETC_TMR_CTRL, 0);
	ptp_clock_unregister(priv->clock);
    ...
}

Since ptp_clock_unregister() is the barrier that waits for ongoing ioctls a=
nd
blocks new ones, can a concurrent ioctl execute after the mask is cleared b=
ut
before unregistration finishes?

For example, a concurrent PTP_CLK_REQ_EXTTS ioctl calling
netc_timer_enable_extts():

drivers/ptp/ptp_netc.c:netc_timer_enable_extts() {
    ...
	netc_timer_wr(priv, NETC_TMR_TEMASK, priv->tmr_emask);

	spin_unlock_irqrestore(&priv->lock, flags);
    ...
}

Could this re-enable interrupts while the driver unbinds, leading to a
use-after-free or system instability on the next probe?

>  	ktime_get_real_ts64(&now);
>  	ns =3D timespec64_to_ns(&now);
>  	netc_timer_cnt_write(priv, ns);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012508.2322=
7-1-wei.fang@oss.nxp.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2828E446848
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 10:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321804; cv=none; b=X+tADa+gFKIQl4XQXLX0vWqCMVrHYPup8nnaZKdO9W/RDT5cQX/QLy4aKzZZ4HcUM64D85/7mMMTguiDOBN5aeDq0aI9zO29FQwh8ZZywOHUkN6DlCyHjz3JtKCbT8JwCAwBsZQ7JAZA5Lx84iYjz+LRrymzdndNXx4h0+xbjv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321804; c=relaxed/simple;
	bh=Ql3ZuouDW+4y0mAMj/Tu39fdqvM8sX2CDoVgEhp2vrk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i9bqwNYsfu4NNpVcPB3V8i9D1Rn9RE0mtgRx9KOEfN8dcXRjqNabTHdgdmWnQYyPPLkWtg8/3Pes1W2A3V6EL4BXTqOabzvhJdwvr0lfwKRs8Wg6Nk97wCE85ZTC7mvOi2VC2QvDzAXwKZOo5JyVLuSU/zXRMDJfB5mfRJKHYGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vczb0UDU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vczb0UDU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375121F00A3F;
	Wed, 29 Jul 2026 10:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321796;
	bh=BeCyCwQvZ0sD0W8m7RZhzzSnsJ2mgTInylSyZyi5NWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vczb0UDUWHf8QI9PLYb1eeq6v5SLutaZel3SyvXSF43ahEYUP3f4HHv6GtVdjztlR
	 Ge+O/8Ct3pLcZ35YUMbFyzggZ9IP8Y8Rg8lFAnQuVoZfMUG9xQoqVC+JnKB8+TfG2C
	 gpe6lUo6FxfQdW9ifWWeWNuYyzXipCG2ptudGVdg1deTVLtE7CUlPj6oH5eErlqf5D
	 TZqKLSDhgpEDl4Aw3yT6VQjWybrFfmKX8cbOEI/IUNcbWD/rTtEld1lzpWSTpZ/7rs
	 ISkdmpITdfE5UGvrOpTC6eUXlFWUnkSxiql3u00fZ1401ugaUwZ6BtF2+gEFb6SL3d
	 faj334xsPx4VA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/7] ptp: netc: remove unnecessary pcie_flr()
 call in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260728104548.3301214-3-wei.fang@oss.nxp.com>
References: <20260728104548.3301214-1-wei.fang@oss.nxp.com>
 <20260728104548.3301214-3-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:43:15 +0000
Message-Id: <20260729104316.375121F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the driver fails=
 to initialize NETC_TMR_TEMASK to 0 during probe, which can leave interrupt=
s enabled from a previous kernel. Combined with the ISR masking logic, this=
 causes unrecoverable interrupt wedging or storms.
- [High] This problem wasn't introduced by this patch, but teardown orderin=
g allows late IRQs to access a freed ptp_clock pointer, resulting in a use-=
after-free vulnerability.
--

--- Patch [2]: [PATCH net-next 2/7] ptp: netc: remove unnecessary pcie_flr(=
) call in probe ---
commit fe3a9be0d4fb11cfd834174e67a7435d22d701a7
Author: Wei Fang <wei.fang@nxp.com>
Date:   Tue Jul 28 10:45:43 2026 +0000

ptp: netc: remove unnecessary pcie_flr() call in probe

This commit removes an unnecessary function level reset call from the NETC
timer probe function. According to the reference manual, this reset is not
applicable to the timer as a supporting function.

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> index 683abcdff9ad6..072809ea7922c 100644
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c
> @@ -773,7 +773,6 @@ static int netc_timer_pci_probe(struct pci_dev *pdev)
>  	if (!priv)
>  		return -ENOMEM;
> =20
> -	pcie_flr(pdev);
>  	err =3D pci_enable_device_mem(pdev);
>  	if (err)
>  		return dev_err_probe(dev, err, "Failed to enable device\n");

[Severity: High]
This isn't a bug introduced by this patch, but the driver fails to initiali=
ze
NETC_TMR_TEMASK to 0 during probe, which can leave interrupts enabled from a
previous kernel. Combined with the ISR masking logic, could this cause
unrecoverable interrupt wedging or storms?

For example, in a kexec scenario, if the previous kernel left hardware
interrupts unmasked in NETC_TMR_TEMASK, the new kernel calls request_irq()
before clearing the hardware mask:

drivers/ptp/ptp_netc.c:netc_timer_probe() {
    ...
	err =3D netc_timer_init_msix_irq(priv);
	if (err)
		goto timer_pci_remove;

	netc_timer_init(priv);
    ...
}

The ISR reads NETC_TMR_TEVENT, masks it with the software shadow
priv->tmr_emask (which is initialized to 0), and writes 0 back to the
write-1-to-clear register:

drivers/ptp/ptp_netc.c:netc_timer_isr() {
    ...
	tmr_event =3D netc_timer_rd(priv, NETC_TMR_TEVENT);
	tmr_event &=3D priv->tmr_emask;
	/* Clear interrupts status */
	netc_timer_wr(priv, NETC_TMR_TEVENT, tmr_event);
    ...
}

Because priv->tmr_emask is 0, tmr_event becomes 0, and writing 0 fails to
clear the hardware interrupt state.

[Severity: High]
This is a pre-existing issue, but does the teardown ordering in
netc_timer_remove() allow late IRQs to access a freed ptp_clock pointer,
resulting in a use-after-free?

In netc_timer_remove(), ptp_clock_unregister() is called before the MSI-X
interrupt is freed or synchronized via netc_timer_free_msix_irq():

drivers/ptp/ptp_netc.c:netc_timer_remove() {
    ...
	ptp_clock_unregister(priv->clock);
	netc_timer_free_msix_irq(priv);
    ...
}

If an interrupt is in-flight or arrives after ptp_clock_unregister() frees =
the
clock instance, the ISR dereferences the dangling priv->clock pointer:

drivers/ptp/ptp_netc.c:netc_timer_isr() {
    ...
	if (tmr_event & TMR_TEVENT_PPEN_ALL) {
		event.type =3D PTP_CLOCK_PPS;
		ptp_clock_event(priv->clock, &event);
	}
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728104548.3301=
214-1-wei.fang@oss.nxp.com?part=3D2

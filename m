Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50F5188713
	for <imx@lists.linux.dev>; Sat, 25 Jul 2026 06:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784962066; cv=none; b=C2MO5dRsVRynpSFKA4rxvSaSO/TJr3bVqyij5JEX0HlFx91076XZp0Nc9hs+aE5DHIAcYyvGTOUK4k/312Mn7NrIGizYZbzf3bt8OnqbTZ0j2RPBA64kdOGusH4lC8xVKBYyST7Ag8/hfKKzHlJv2HJPY3vz8FlW2TqONi7QuKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784962066; c=relaxed/simple;
	bh=jomKR5vOtqo1njqFpS0ExYb796N0CtmcOpG8Cbx9ANA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k67GTudTPMMtq91gdux7qzmwrOVwMi6jOKjvMpWArHxw59DA6A8X2Hpw8v7uK4wuCWLm0uHZHaJO5gGZV6XtLiibPU1tDu3Am4ZEZ4zjTMRB8tpwU6s4Biphp3IsicK9QtaMI1EAr3DCcw19ccmTK7uqR6E9koLeLhNt3K7beQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yc7vDLAq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yc7vDLAq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3890F1F000E9;
	Sat, 25 Jul 2026 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784962065;
	bh=IvSRaAGWbaVfpJtEZdegnPTbDKW1UZ/ExdoT+6Jz4XM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yc7vDLAqDG4Fc6aBXd0+9adfbH9Q26e0p2cRm8M5qVNhbwBABSH8NDol0XTGCeFxS
	 JVVyD510xrDYS87q0LbCIjFN9mdElozAYCp4H30gLf0kahL2YCp3zltVpR2NKMaQcX
	 I6oAXh2sk6eR5tRfzCldEeLyL0T6oonIwzyexiz20WfoCIJcIQpIBayI9ELtoOZbtt
	 iQr+MEpv2Jbwd8Ge8j4L2OZ6tWHdoVSGo+0Ws6c5d38OIKM/5XF4Pt9uNlqbcI8xb7
	 odyMhcGC5PWAAFc/SDQ+QEiFTuOv3w/HrWs0Qhjf83z0xCECVhyIpzviS+3iBcziXD
	 /NqbJBq8tWLcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] ptp: netc: fix potential interrupt storm caused by
 incorrect unbind order
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260724065116.521893-1-wei.fang@oss.nxp.com>
References: <20260724065116.521893-1-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 06:47:44 +0000
Message-Id: <20260725064745.3890F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Moving ptp_clock_unregister() before disabling hardware interrupts=
 and freeing the IRQ introduces a critical Use-After-Free vulnerability in =
the interrupt handler.

Pre-existing issues:
- [High] Missing hardware state reset in probe and an unconditional IRQ_HAN=
DLED in the ISR combined with a failure to clear unmasked events causes an =
unrecoverable hard lockup.
--

--- Patch [1]: [PATCH net] ptp: netc: fix potential interrupt storm caused =
by incorrect unbind order ---
commit 013a4be8e793c3f4970ce39a1488e2416c4cea60
Author: Wei Fang <wei.fang@nxp.com>

ptp: netc: fix potential interrupt storm caused by incorrect unbind order

This commit reorders operations in netc_timer_remove() to unregister
the PTP clock before clearing the timer event mask and control registers.
This aims to prevent a race condition during driver unbind that could
leave hardware interrupts active and cause an interrupt storm.

Closes: https://sashiko.dev/#/patchset/20260720012508.23227-1-wei.fang%40os=
s.nxp.com

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> index 5e381c354d746..3bab86afe8e23 100644
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c
> @@ -1019,9 +1019,9 @@ static void netc_timer_remove(struct pci_dev *pdev)
>  {
>  	struct netc_timer *priv =3D pci_get_drvdata(pdev);
> =20
> +	ptp_clock_unregister(priv->clock);
> +	netc_timer_wr(priv, NETC_TMR_TEMASK, 0);

[Severity: High]
Does moving ptp_clock_unregister() before masking hardware interrupts
introduce a use-after-free regression in the interrupt handler?

If EXTTS events are configured, ptp_clock_unregister() drops the final
device reference and frees priv->clock if no file descriptors are open.

Because the hardware interrupt mask (NETC_TMR_TEMASK) is not cleared until
the next instruction, and free_irq() has not yet been called, the hardware
can still fire an EXTTS interrupt.

If this occurs, the ISR netc_timer_isr() processes the event and
unconditionally dereferences the freed clock object:

netc_timer_isr() -> netc_timer_handle_etts_event() {
    ...
    ptp_clock_event(priv->clock, &event);
    ...
}

>  	netc_timer_wr(priv, NETC_TMR_CTRL, 0);
> -	ptp_clock_unregister(priv->clock);
>  	netc_timer_free_msix_irq(priv);
>  	netc_timer_pci_remove(pdev);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but can the driver encounter a
hard lockup during probe on kexec or an unclean shutdown?

Because the NETC timer does not support PCIe FLR, hardware registers
retain their state. In netc_timer_probe(), the driver requests the IRQ via
netc_timer_init_msix_irq() before resetting the hardware state.

If the hardware has a pending interrupt, it fires immediately upon
request_irq(). At this point, priv->tmr_emask is 0.

The ISR netc_timer_isr() masks the hardware status with priv->tmr_emask
and writes 0 back to the Write-1-to-Clear (W1C) register, failing to clear
the pending hardware interrupt:

netc_timer_isr() {
    ...
    tmr_event =3D netc_timer_rd(priv, NETC_TMR_TEVENT);
    tmr_event &=3D priv->tmr_emask;
    /* Clear interrupts status */
    netc_timer_wr(priv, NETC_TMR_TEVENT, tmr_event);
    ...
}

The ISR then defeats the kernel's spurious interrupt detection by
unconditionally returning IRQ_HANDLED, causing the interrupt controller to
re-invoke the ISR in an infinite loop:

netc_timer_isr() {
    ...
    return IRQ_HANDLED;
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724065116.5218=
93-1-wei.fang@oss.nxp.com?part=3D1

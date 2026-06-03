Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FD741C314;
	Wed,  3 Jun 2026 08:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475112; cv=none; b=B/PDHh5kwz+mLVuU7SNuRcSvG641cP8QrcFo924glV8NFUeSrnA065Cv37pEi1X4AREO/xTCNX7Bkr8inE2G1f27gHP4UYAbexMenRGsaTDR9gq79YfoYTe6abcTXZTYfbJqit21HAG4NAak0FWX0bSQU+zDIwW0P01Z0f81B2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475112; c=relaxed/simple;
	bh=nVhPK1Ite25Pa5B9ZRy6N25I+44LyzmpxuEq1fd02Uc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a1D1KRbUHMb1Yf9JtQhnbI/hIxZhdzIsnzmkvgmpqOAA8eQom09T9toPn8gOAGuexdnnxp5p/oFumo6396LWEESGvUpBECBNnZPC7U216ZQOxl/qsEmKcSc3HYJtjl0v9oACx5gYRTYNmKcnmvyatz/IUkEXYaP1IPjW0KwG3XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kp0RB3mn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kp0RB3mn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32ED1F0089A;
	Wed,  3 Jun 2026 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780475111;
	bh=kyj/ZEwoUj3qmXmSokMJB0S858wBTWhbj8un9+kesYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kp0RB3mncnZ2kFMGoK8t7eQvfAJeHkBuiX0i9T56MltJXpglhcWgUPZgyXdY/x0ir
	 I2RdEWOGQesGYzal8vPYvzyx2QG+RClYqi1bLY3fz/mTuvuUWDNcugVZlUr+akXol1
	 Bf4gNjRbjgpSZz1LUJnpnTSURT6C2HrJpE1B6zzTMH2hGlI3dPWpL+SL+bfdYk+RYv
	 B5VTiwHRlPRzLU9QegoqLqUsc1CYwu45GODMK3qnI7vd/d2Pa+ILXDJ3bWbAGKzUVK
	 aGBt7WzxDTFowQKYv4hhnfyGoF6tqbCtgfZjb8TdizpEaeCHKjI0bpmEQ5eKHoshCq
	 PlFrdtzjQkJPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4 6/8] can: flexcan: add NXP S32N79 SoC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260603071342.641874-7-ciprianmarian.costea@oss.nxp.com>
References: <20260603071342.641874-7-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:25:10 +0000
Message-Id: <20260603082510.F32ED1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Wakeup functionality is broken for multi-IRQ FlexCAN platforms (li=
ke S32N79) because `enable_irq_wake()` is called on the mailbox interrupt (=
`dev->irq`) instead of the state/wakeup interrupt (`priv->irq_err`).
--

commit 39bd2be7b5ab93fd5fb7064b8e7d3eac344ed38f
Author: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

can: flexcan: add NXP S32N79 SoC support

This patch introduces support for the NXP S32N79 SoC in the FlexCAN driver.
It adds a new device data structure specifying necessary quirks, including
multiple interrupt handling, and registers the new compatible string.

> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -397,6 +397,15 @@ static const struct flexcan_devtype_data nxp_s32g2_d=
evtype_data =3D {
>  		FLEXCAN_QUIRK_SECONDARY_MB_IRQ,
>  };
> =20
> +static const struct flexcan_devtype_data nxp_s32n_devtype_data =3D {
> +	.quirks =3D FLEXCAN_QUIRK_DISABLE_RXFG | FLEXCAN_QUIRK_ENABLE_EACEN_RRS=
 |
> +		FLEXCAN_QUIRK_DISABLE_MECR | FLEXCAN_QUIRK_USE_RX_MAILBOX |
> +		FLEXCAN_QUIRK_BROKEN_PERR_STATE | FLEXCAN_QUIRK_SUPPORT_FD |
> +		FLEXCAN_QUIRK_SUPPORT_ECC | FLEXCAN_QUIRK_SUPPORT_RX_MAILBOX |
> +		FLEXCAN_QUIRK_SUPPORT_RX_MAILBOX_RTR |
> +		FLEXCAN_QUIRK_IRQ_BERR,

[Severity: High]
This isn't a bug introduced by this patch, but will wakeup functionality be
broken for this new platform since it uses multiple interrupts?

In flexcan_suspend() and flexcan_resume(), the driver hardcodes
enable_irq_wake(dev->irq) and disable_irq_wake(dev->irq):

flexcan_suspend() {
	...
	if (device_may_wakeup(device)) {
		enable_irq_wake(dev->irq);
	...
}

For multi-IRQ platforms using FLEXCAN_QUIRK_IRQ_BERR, dev->irq is dedicated
to mailboxes, while state changes and wakeups (FLEXCAN_ESR_WAK_INT) are
routed to priv->irq_err.

Because enable_irq_wake() is never called for priv->irq_err, will the
interrupt controller mask the actual wakeup interrupt during suspend,
preventing the CAN controller from waking up the CPU?

> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603071342.6418=
74-1-ciprianmarian.costea@oss.nxp.com?part=3D6

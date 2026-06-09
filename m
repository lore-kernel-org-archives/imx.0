Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8642352017;
	Tue,  9 Jun 2026 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016072; cv=none; b=dtgpJT9UesDrC/k68R1FLTkfk+t7iAFWNrxyXLR/YhgpaZVB8ZfPLWIRcneCOudgbCdB9KfT7YYtWDeFAp64EaWaeK+LMUJ9kyp4FJK8mx5OhjCgGzzl3vp09wGme0+p5BUqMmAdtk4kfGZpo53mt2855HsNtET6SJramgi+60M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016072; c=relaxed/simple;
	bh=mstWEfTxbPiyIM4cF29HhRbcY0gGIzDF1oynv9id97c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tqe9roMcMqH5eV7WnEEGYJ6XwqcVU1bzqwatSJ3NOGj8jkTrYOZ+y4KjXvb/nGfdnYcOUDf25b0ejsCga91xbwg5Kb1Lws4DfA74IabGUPdEr05EalOzNlI6dxUzvzPdGGvfTL7rB7VZHPg47xr/0IZ2SVKMNqvkKLrr6XF3Vqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QioU/03L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QioU/03L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC461F00898;
	Tue,  9 Jun 2026 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781016071;
	bh=eV4P8r7FsKauUXbveG4YhiH+vNS9845KRIVIzVMQ570=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QioU/03LNy2aD5Vp94r5nQe117LA13tV1KqsaYPRjuobBmxqaA4PHCdhZh0W8hxRt
	 5/MI4c0FP0oegyvgbfey/VEneymgw8piyWfYl6b0uybIPTWMPDKv9tMTDB/SzZe/h2
	 mztnoNZJH/2EFOfjIYTVC5bxytxMwK0hYvPdsi3SYksvxi0t3wCUTTX7dVH7F7oYCv
	 ZfvVR10ydLUeA4Ejw42uuSDuShvzK7zVJdOFxTGRQdRczHOq6T5tkcMtI49LnVOryi
	 FXLaX1pjz4SPsWfs6DB7QsNd8lo7jYHJgnBlDE+o4wnpEqrjiU5/BWuhTfDfzjNHyx
	 cyTvw7UfjzqoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/8] can: flexcan: add NXP S32N79 SoC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609142954.1807421-7-ciprianmarian.costea@oss.nxp.com>
References: <20260609142954.1807421-7-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 14:41:10 +0000
Message-Id: <20260609144111.1DC461F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `enable_irq_wake()` for the actual device state change/wak=
eup interrupt on multi-IRQ platforms.
--

commit 92f9d2a83610f1e8d4d83febb9e00ed2aea10a29
Author: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

can: flexcan: add NXP S32N79 SoC support

Adds device data and compatible string for NXP S32N79 SoC. The FlexCAN IP
integration on this SoC uses two interrupts, separating mailboxes from bus
errors and device state changes.

> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
[ ... ]
> @@ -403,6 +403,15 @@ static const struct flexcan_devtype_data nxp_s32g2_d=
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
This isn't a bug introduced by this patch, but this is a pre-existing issue
with platforms that use FLEXCAN_QUIRK_IRQ_BERR.

Will this platform fail to wake up from sleep upon CAN activity?

In flexcan_suspend() and flexcan_resume(), the code configures wakeup using
the primary interrupt:

flexcan_suspend() {
    ...
    enable_irq_wake(dev->irq);
    ...
}

However, on multi-IRQ platforms using FLEXCAN_QUIRK_IRQ_BERR, the device
state change and wakeup interrupt is handled by flexcan_irq_esr() and routed
to priv->irq_err (or priv->irq_boff). Since dev->irq is strictly dedicated
to mailboxes on these platforms and ignores device state changes, the
correct interrupt is never configured as a system wakeup source.

Should the suspend and resume routines be updated to call enable_irq_wake()
and disable_irq_wake() on priv->irq_err for platforms with this quirk?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609142954.1807=
421-1-ciprianmarian.costea@oss.nxp.com?part=3D6

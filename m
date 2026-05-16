Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9B92EA749;
	Sat, 16 May 2026 19:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778960580; cv=none; b=ZlRF2NHwdpC6SfguLXhHUTFaIW6ku4xK6f+7Kg1BjVZspCR2pVy+OqD0+/txroHeMe5DK/U+DuLbh2dLp+B7FeWAl8ph/bmzB2bO58ObooTukRt1s0esPZAEGs5pcVNft9WGPSre6nJ3Vmj+NLkAzMRidvyEQWDtbGcmbem5xxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778960580; c=relaxed/simple;
	bh=u0edW2Gtyv5jHanYCumq/xDuYjuv8sL0Fo7LOdxkaSI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UBlcXMF+DEM8plroYcI3I76dYAhDKCFKVdGT+RDDMrPKdMynGHNU/Ch6GKjEiwDROMeOWE/YoNedr4NetQw6bv5QFLEoD4DhoOmz7h/7lqnQpVEG8I6/hwq5eRvWddGxEhTTxtBJF1QLIGSp6xNTmEcmehM2pvTmjkFy41sprGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjtIbveD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjtIbveD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7F1C19425;
	Sat, 16 May 2026 19:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778960579;
	bh=u0edW2Gtyv5jHanYCumq/xDuYjuv8sL0Fo7LOdxkaSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fjtIbveDWdqFG4/4M+roeqe27fdlkZUJhILLLrYZwH+k3VB4uAEzSV/DyRumTcXy5
	 YdNbdAiynlw9PflSfRMcfP1J6s0649MNwxqlcKoccApKH8sxebyZlLHIvQ3MLlt+ME
	 HTbHM1v5QzHGy93PCNK98ln5I4OPE6vkOga71qAtGBvwG/LfhdCEH+N86QWGjVHnXA
	 QiAsL20M79aXBDUQKLOMdrhtfX3xRki7qfJG/1OF6iQL4WHyYORXFqOE1i9zkRqg7C
	 AEJ0u5pnWiXLGI9EFsPmDIInylSTqHMWWKSshc5Bwpt/dqAgMj8VFdS7BNrEBvIFbz
	 zbX6pi52JKZQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 18/22] drm: bridge: dw_hdmi: Use delayed_work to
 debounce hotplug event
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: neil.armstrong@linaro.org, Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org
In-Reply-To: <20260516183838.2024991-19-jonas@kwiboo.se>
References: <20260516183838.2024991-19-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:42:59 +0000
Message-Id: <20260516194259.6D7F1C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing the top-level interrupt mute in the remove path leaves al=
ready-latched interrupts unmasked, causing an unhandled interrupt storm aft=
er the IRQ is freed.
--

commit 0025156a478e265d2ea625b34b904b8645d80bed
Author: Jonas Karlman <jonas@kwiboo.se>
drm: bridge: dw_hdmi: Use delayed_work to debounce hotplug event

This commit uses a delayed work queue to debounce HDMI hotplug detect event=
s,
improving the handling of HPD low voltage level pulses. It also updates
the driver remove path to explicitly mask the PHY interrupt and free the
IRQ handler earlier during cleanup.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c

[ ... ]

> @@ -3531,6 +3592,14 @@ EXPORT_SYMBOL_GPL(dw_hdmi_probe);
> =20
>  void dw_hdmi_remove(struct dw_hdmi *hdmi)
>  {
> +	struct platform_device *pdev =3D to_platform_device(hdmi->dev);
> +	int irq =3D platform_get_irq(pdev, 0);
> +
> +	/* Disable cable hot plug irq. */
> +	hdmi_writeb(hdmi, ~0, HDMI_PHY_MASK0);
> +	devm_free_irq(hdmi->dev, irq, hdmi);
> +	cancel_delayed_work_sync(&hdmi->hpd_work);
> +
>  	drm_bridge_remove(&hdmi->bridge);
> =20
>  	if (hdmi->audio && !IS_ERR(hdmi->audio))
> @@ -3538,9 +3607,6 @@ void dw_hdmi_remove(struct dw_hdmi *hdmi)
>  	if (!IS_ERR(hdmi->cec))
>  		platform_device_unregister(hdmi->cec);
> =20
> -	/* Disable all interrupts */
> -	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
> -

Can removing the top-level interrupt mute cause an unhandled interrupt stor=
m?

While writing to HDMI_PHY_MASK0 stops the PHY from latching new interrupts,
it does not clear interrupts that are already latched in the
HDMI_IH_PHY_STAT0 register. Because the top-level HDMI_IH_MUTE_PHY_STAT0
mute is no longer applied, any previously latched interrupt might continue
to assert the physical IRQ line.

Immediately after writing the mask earlier in the function, devm_free_irq()
removes the driver's handler from the IRQF_SHARED line. With the handler
removed, the kernel will not invoke dw_hdmi_hardirq() to clear the device's
pending interrupt.

Since the interrupt controller might see the line continuously asserted,
other drivers sharing the IRQ would return IRQ_NONE. Could this lead to the
kernel logging an 'irq nobody cared' error and permanently disabling the
shared IRQ line, breaking other devices?

Would it be safer to restore the HDMI_IH_MUTE_PHY_STAT0 write to guarantee
the IRQ line drops before the handler is freed?

>  	if (hdmi->i2c)
>  		i2c_del_adapter(&hdmi->i2c->adap);
>  	else

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516183838.2024=
991-1-jonas@kwiboo.se?part=3D18

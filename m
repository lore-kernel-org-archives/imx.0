Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEFE220698;
	Mon, 18 May 2026 18:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130634; cv=none; b=gmU6QBW70UY19VYxE5LpwvS804bWNI4E2ropXcSoN4lFijKvr6awGkrV8N4xvtP858/WZGAtTBf+KuAVTZsvOYdkPA6kzd7jaGR/nIfIg3+rB0oNPVr+sPvTSSvmjz8f7zFvvG9sYjNu4PmX08spTR2s1oTnUzDv5KIrwfxSzIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130634; c=relaxed/simple;
	bh=k/A26yfrRD5bJhR3i3cajFC5mp82Cmcyh1Vy36p4OdY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W5rENVXM3esqDjI4Yz4buxuwMzbiyhaagySN8wC4r7qhUyfaQ48pxoVR6vpeaV1PqwLZBA6wYutPgzSnVMRtDi6SoZi4EjQLTRiOXHpL5eMg7idLb3CVYlbvA/SZ2FmV0fd4H/O16tMXLyj3haHeaMMQUmEcT+C0YbR+kYPtPUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sddueeqU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sddueeqU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EED3C2BCB7;
	Mon, 18 May 2026 18:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779130634;
	bh=k/A26yfrRD5bJhR3i3cajFC5mp82Cmcyh1Vy36p4OdY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sddueeqURXIOF8eaFjcV/u0Or/pwk/cqyWt7Ru5bC0OQP6NZelVm5dmRUat3ODGcH
	 Kj9ZaVq4CSltG1WXvR+OWTwxeEYrjgMJcHSCMaWpqKezdWbIBitbfhpGItaUP7wu93
	 07xka8tT8mdfVYywc3X74TiiK8LcNYBrl0Fa0kxVmd9X2g6mX+xEwWcZuhlxlxYZos
	 5JZyipM2TCq51hawdWNfwqYCMs6Z+1g1eaUBHd8lyDsVjbL72neJeRZvki7cks+GzE
	 n55HHfNHBSgGP6wsE/VwusPxD5xeuw6woBI6NyW+0rIevfPjLjQ/Wunzo3nhnwRJr4
	 ejSheMNRGZeGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 19/23] drm: bridge: dw_hdmi: Use delayed_work to
 debounce hotplug event
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, Frank.Li@kernel.org
In-Reply-To: <20260518180206.2480119-20-jonas@kwiboo.se>
References: <20260518180206.2480119-20-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 18:57:13 +0000
Message-Id: <20260518185714.1EED3C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The debounce logic completely filters out the 100ms EDID change pu=
lse, causing the DRM core to miss the hotplug event.
- [High] The shared IRQ handler is freed before hardware interrupts are mas=
ked, potentially causing an unhandled interrupt storm.
--

commit 2b07e0d99061a1389b7eef1c604f98ccf0e7d115
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Use delayed_work to debounce hotplug event

This commit introduces a delayed work queue to debounce HDMI hotplug detect
(HPD) events. It aims to improve the handling of EDID change pulses from the
sink by applying an 1100 msec timeout between the event and the DRM core
notification.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c

[ ... ]

> @@ -3101,8 +3136,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_i=
d)
>  			status =3D=3D connector_status_connected ?
>  			"plugin" : "plugout");
> =20
> -		if (hdmi->bridge.dev)
> -			drm_helper_hpd_irq_event(hdmi->bridge.dev);
> +		mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
> +				 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
>  	}

Does this debounce logic unintentionally filter out the 100ms EDID change p=
ulse
entirely?

When the sink signals an EDID change by pulsing HPD low for 100ms and then =
high
again, mod_delayed_work() will be called on both edges. The second call on =
the
rising edge will reset the timer, pushing the work execution to 1100ms after
the pin returns high.

When dw_hdmi_hpd_work() finally runs and calls drm_helper_hpd_irq_event(), =
the
DRM connector detect function will see the current HPD status as connected.
Since the previous status known to the DRM core was also connected (because=
 the
brief disconnect was never sampled), check_connector_changed() will conclude
that nothing changed. The epoch counter will not increment, and the userspa=
ce
uevent might be lost.

[ ... ]

> @@ -3532,6 +3593,18 @@ EXPORT_SYMBOL_GPL(dw_hdmi_probe);
> =20
>  void dw_hdmi_remove(struct dw_hdmi *hdmi)
>  {
> +	struct platform_device *pdev =3D to_platform_device(hdmi->dev);
> +	int irq =3D platform_get_irq(pdev, 0);
> +
> +	/* Free, mute and clear phy interrupts */
> +	devm_free_irq(hdmi->dev, irq, hdmi);
> +	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
> +	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
> +		    HDMI_IH_PHY_STAT0);

Could freeing the shared IRQ handler before masking the hardware interrupts
cause an unhandled interrupt storm?

If the HDMI device asserts a level-triggered interrupt exactly when
devm_free_irq() is called, the interrupt line will stay asserted but the
dw_hdmi handler will no longer be registered to clear it. Because the IRQ is
shared (requested with IRQF_SHARED), the kernel will repeatedly invoke other
handlers on this IRQ line.

Those other handlers will all return IRQ_NONE, which can cause the kernel to
permanently disable the shared IRQ line.

Should the hardware interrupts be explicitly masked and cleared before the
handler is freed?

> +
> +	/* Cancel any pending hot plug work */
> +	cancel_delayed_work_sync(&hdmi->hpd_work);
> +
>  	drm_bridge_remove(&hdmi->bridge);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518180206.2480=
119-1-jonas@kwiboo.se?part=3D19

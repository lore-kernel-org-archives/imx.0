Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5011FC7C5;
	Tue, 12 May 2026 03:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557827; cv=none; b=TMX2vehc8WThEv7TzIHiRPQ9KFIrT9dLGxyKbIqrhm9tzheqb1s7klyIeRgiyE1ebESyAbngsRpjru2D68744kYgQQADYiIXx1dK9f1fts8aJry8liP3HHyXi5laSjhoMW9HIabtlx7Mi50NHhTABfO2yfqhximNn5W7ksnDxZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557827; c=relaxed/simple;
	bh=NBlgbTJO2Ys9dzdqcsAdA9t49ampxfkpEwRwwpPvxj8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZF8vwDt1LFUoaxl1Jz5aALBlK2fXkMgdGqqKWXA2PhzBZDVfuByYb9Qkngu3l20bQDqxcIAOJFG6ucPUj5LPTqFXRuiLHKsc+cbskyxdVKTFHNo20xMHy2/oCrProQV1yp2lD9c9wq5GJ9CwfrAy6KHdusAmOwIgMpwMTGv92/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaX4MerA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaX4MerA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD93C2BCB0;
	Tue, 12 May 2026 03:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778557827;
	bh=NBlgbTJO2Ys9dzdqcsAdA9t49ampxfkpEwRwwpPvxj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iaX4MerA4668KcFl/DPbwFiRvPfLXB96cTYatBmk9ERSqaMT3qgSUEVULGr+P/qVm
	 69JhzwCiQVyYg4VeqLyzKZlk2ayeKWFBeX7VkVCqdQXfHrOqx816f4cdo4llC4SPOi
	 w1R+EooJcT9APQY8ZNJUac+issyr4P/w58GbhFwhHPqhboYJupQUpROFwwkOhy50vg
	 V2v7K1Q1gWiGw6UJgrEpVhUjQDo0Vj/q2G0n/Cs4MPOBTS+DGs3bX2sAbAyEu2Mo/V
	 8iiFQv2yBqPqqLzd6oA/GofFWqVlEY1zV7kzeV8eWL1LMABVFm/qiMtUjirugzBEuW
	 t2Qggq0v+w/XA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 21/21] drm: bridge: dw_hdmi: Drop call to
 drm_bridge_hpd_notify()
Reply-To: sashiko@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260510124111.1226584-22-jonas@kwiboo.se>
References: <20260510124111.1226584-22-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:50:26 +0000
Message-Id: <20260512035027.3AD93C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Removing `drm_bridge_hpd_notify()` violates the DRM bridge API con=
tract, breaks hotplug for non-polling setups, and causes inefficient global=
 polling.
- [High] Teardown asymmetry allows the interrupt handler to re-arm canceled=
 delayed work, leading to a Use-After-Free.
- [High] TOCTOU race condition in asynchronous workqueue leads to Use-After=
-Free on DRM device teardown.
--

commit ad165e8e6d6f42026d4a0bad754838b6429517bd
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Drop call to drm_bridge_hpd_notify()

This commit drops the call to drm_bridge_hpd_notify() in the HDMI hotplug
delayed work to prevent duplicate hotplug uevents and modesets, relying
solely on drm_helper_hpd_irq_event().

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 2ea8ce5eca367..d9c9d03f8eff2 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3019,14 +3019,28 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void =
*dev_id)
>  static void dw_hdmi_hpd_work(struct work_struct *work)
>  {
>  	struct dw_hdmi *hdmi =3D container_of(work, struct dw_hdmi, hpd_work.wo=
rk);

This is an existing issue not introduced by this patch, but does the
delayed work lifecycle have a use-after-free vulnerability during teardown?

If cancel_delayed_work_sync(&hdmi->hpd_work) is called in dw_hdmi_remove()
before hardware interrupts are muted, can dw_hdmi_hardirq() silently
re-arm the workqueue? If the hdmi structure is then freed by devres,
execution of this work function later would cause a use-after-free.

> -	enum drm_connector_status status;
> =20
>  	if (WARN_ON(!hdmi->bridge.dev))

This is another pre-existing issue, but is there a time-of-check to
time-of-use race condition here?

Since dw_hdmi is an external bridge, its lifetime is independent of the
master DRM device. If the master DRM driver unbinds concurrently, it
could set hdmi->bridge.dev to NULL and free the DRM device.

Could this workqueue evaluate hdmi->bridge.dev as non-NULL, get interrupted,
and then pass a freed DRM device pointer to drm_helper_hpd_irq_event()
below?

>  		return;

[ ... ]

>  	drm_helper_hpd_irq_event(hdmi->bridge.dev);
> -	status =3D dw_hdmi_phy_read_hpd(hdmi, hdmi->phy.data);
> -	drm_bridge_hpd_notify(&hdmi->bridge, status);
>  }

Does removing drm_bridge_hpd_notify() violate the DRM_BRIDGE_OP_HPD
contract and break hotplug functionality for non-polling setups?

Looking at drm_helper_hpd_irq_event(), it immediately returns false if
dev->mode_config.poll_enabled is false. For setups relying strictly on
interrupt-driven bridge hotplug notifications without enabling polling,
would this leave hotplug completely broken?

Additionally, instead of handling just the HDMI port, will
drm_helper_hpd_irq_event() force a synchronous detect() cycle on all
connectors on the DRM device that have the DRM_CONNECTOR_POLL_HPD flag set,
causing an inefficient system-wide poll?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510124111.1226=
584-1-jonas@kwiboo.se?part=3D21

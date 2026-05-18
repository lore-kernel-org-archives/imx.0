Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EF937BE83;
	Mon, 18 May 2026 19:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131139; cv=none; b=rw/nZWGa6V745ghOoSDhynzGT4Iss1NBNv523F+w2bYXdTdqqg5blMU1PyiXllT0lJqtHl9vJVftPQVtJDt3IYXACnm3y6d25Jgugp2cMGCsCVOclE+pR4b4wXuu0KlUu4CGdSk/qomO1EXA78v3H6qOr+ZseKItXz3IHJ+uV4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131139; c=relaxed/simple;
	bh=U6XH6tC9TbZbl9x9IOSGWouoX6yPsjMjQX908wFzbo0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LxmQX87rvnSiZS24WW8baNIx8UG1lQ33vXHNLf6Pud9SdafbubrTG7+wWTtqBnnewTuTqq6ACNAz1UIRJEhdxVw2Bh8gFWDM4bO+mt0EesYZ6dMOi8WyhsvxQVr40UrGr2B97U1PtQGhH0na95/H9TnXfqBwL775drS3cbfh8aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxTNYU0F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxTNYU0F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFA5C2BCB7;
	Mon, 18 May 2026 19:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779131139;
	bh=U6XH6tC9TbZbl9x9IOSGWouoX6yPsjMjQX908wFzbo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lxTNYU0FQyfbhvhqbqMHWMiCjR6uSgN/tv6QN8WGEdaaPxa+qzEkbDmIUS0I3cX0a
	 kJVMd4jfcLCxIX6FMevjaqhtVqm5Chx2Fvt2Op0IuZQGpv2SyFi2dbipZsOfYuxdAT
	 hXy1OJADCecLULLXSbCqMhaMNWY+m+e5znGZox69nGmk7oWbPCcSWojES48Hz/JSuI
	 D0HO+ApFh66g3Q+1QpbcuuqP58n6QzRuOJrVVaFBGo8W9c6FzMzwVfBB5SqInX+/Pd
	 0+ck3QOpZYXUsODVUWhNOERWnq9LGgiZE+CKjCUuYbuWElzRn1oI4azlZg3ZoDzeqy
	 ugrA/hATWnEuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 18/23] drm: bridge: dw_hdmi: Drop call to
 drm_bridge_hpd_notify()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260518180206.2480119-19-jonas@kwiboo.se>
References: <20260518180206.2480119-19-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 19:05:38 +0000
Message-Id: <20260518190538.BFFA5C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing `drm_bridge_hpd_notify()` violates the `DRM_BRIDGE_OP_HPD=
` contract and replaces targeted bridge HPD notification with an inefficien=
t global device poll.
--

commit f2225f0de66ea8205ddbd49531c0c402dab0c72b
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Drop call to drm_bridge_hpd_notify()

This commit removes the call to drm_bridge_hpd_notify() from the dw_hdmi
hotplug interrupt handler. It relies instead solely on
drm_helper_hpd_irq_event() to trigger hotplug events in order to prevent
multiple hotplug uevents and redundant modeset probes.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 5dacb8a99715b..8afc9d2401214 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3101,10 +3101,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_=
id)
>  			status =3D=3D connector_status_connected ?
>  			"plugin" : "plugout");
> =20
> -		if (hdmi->bridge.dev) {
> +		if (hdmi->bridge.dev)
>  			drm_helper_hpd_irq_event(hdmi->bridge.dev);
> -			drm_bridge_hpd_notify(&hdmi->bridge, status);
> -		}

Does removing the drm_bridge_hpd_notify() call violate the DRM_BRIDGE_OP_HPD
API contract?

The dw_hdmi driver is registered with the DRM_BRIDGE_OP_HPD flag, which
typically requires the driver to call drm_bridge_hpd_notify() on status
changes so that registered callbacks like drm_bridge_connector_hpd_cb()
are properly invoked.

By relying solely on drm_helper_hpd_irq_event(), doesn't this replace the
targeted bridge HPD notification with a global device poll?

Looking at drm_helper_hpd_irq_event() in drm_probe_helper.c, it acquires
dev->mode_config.mutex and iterates over all connectors on the DRM device,
calling their detect() functions synchronously. In multi-display systems
(for example, HDMI alongside eDP or DSI), will an HDMI hotplug interrupt
now trigger slow DDC/I2C/AUX probes on those completely unrelated connector=
s?

While later patches or discussions might address using delayed_work to debo=
unce
hotplug events to avoid mutex deadlocks, could the driver resolve those loc=
king
issues without bypassing the bridge framework's targeted notification mecha=
nism
and forcing an inefficient global poll?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518180206.2480=
119-1-jonas@kwiboo.se?part=3D18

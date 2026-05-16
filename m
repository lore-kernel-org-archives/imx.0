Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC47367F54;
	Sat, 16 May 2026 19:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778961145; cv=none; b=jFx5c13yk2I8iEeiQMAlxgeVXuGgQ+JvA42XlVnW3y3NX3f/q/Hdv2u7T5s1s7IBfJNcjT7D6e8Ig7d6cDQBBeoRE8bF051lSF9G7GR1HYoKLbHO1K2nZhZpEA3iqZi2LJrK0SEe2IwRbj2BxmL3Wo/cphFzhjSmTFoOABQ2SGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778961145; c=relaxed/simple;
	bh=fAsWNGwQAqu+EJ+8N3R741IrNe5Q1D1pfyWbyfS013c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H9ceFquAKjgDXQugJLs59iYSovSUhhpPV65ZSCGEb24b/LEr/sPHtUgg2tfV+qYwx0BM6GRTpPNPYlKefa53EAw3m9gYW8BO63IRayQaEWI45aUOykjODnLkhllai2AuhphemDWPzS8TP1EgFeTVa0+C6TnmwIcNVG01MKVHWvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkD+Pp0m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkD+Pp0m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2CBC19425;
	Sat, 16 May 2026 19:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778961144;
	bh=fAsWNGwQAqu+EJ+8N3R741IrNe5Q1D1pfyWbyfS013c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jkD+Pp0mnYYfYMurlZ0SylntRAn6adUMDneQodqK2Yynhiiqww3xyg206Mlm3OCmO
	 Nx8Tca0M4muyaUFAKOzJ26mQsfG9ixOI5NQBxWGQsIy9uadf66v3Sf6vOgZwERq6ss
	 iAnA1b4nyw1MOXw+DFw1j3BE76yIj1faGc+uFYDae1WRFeHvOs6ej4OHVkZVM/l2XJ
	 U2IYcgAal+X+CjB2B1o1YOva8k0BdmDpyr+7dCWakTlrznZhLhb7zpwOdSbmxdQzNY
	 P/jXi1/GzsDXfqYdR/1hhR5ckBnWXZt54xMDKn10YWfXgqdrrrqo0xoe1zQTtWUdgs
	 aI6WaxiO6UAAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 17/22] drm: bridge: dw_hdmi: Drop call to
 drm_bridge_hpd_notify()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: neil.armstrong@linaro.org, linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260516183838.2024991-18-jonas@kwiboo.se>
References: <20260516183838.2024991-18-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:52:24 +0000
Message-Id: <20260516195224.9E2CBC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing drm_bridge_hpd_notify() violates the DRM bridge API contr=
act and causes hotplug events to be permanently lost during system suspend.
--

commit 6b3491e39082015ab62431ea0c93c74c9344b995
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Drop call to drm_bridge_hpd_notify()

This commit removes the drm_bridge_hpd_notify() call from the dw_hdmi IRQ
handler, relying instead only on drm_helper_hpd_irq_event() to avoid sending
duplicate hotplug uevents to userspace.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index e9c4e24c090ca..6cc7b2a860bd8 100644
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
>  	}

Will removing drm_bridge_hpd_notify() cause hotplug events to be permanently
lost if they occur during system suspend?

Since the driver advertises DRM_BRIDGE_OP_HPD, does the DRM bridge API
contract still require it to call drm_bridge_hpd_notify() to properly
propagate hotplug events to the rest of the bridge chain?

Looking at drm_helper_hpd_irq_event(), it aborts early if polling is
disabled:

drivers/gpu/drm/drm_probe_helper.c:drm_helper_hpd_irq_event() {
	struct drm_connector *connector, *first_changed_connector =3D NULL;
	struct drm_connector_list_iter conn_iter;
	int changed =3D 0;

	if (!dev->mode_config.poll_enabled)
		return false;
...
}

During system suspend, drm_kms_helper_poll_disable() sets poll_enabled
to false. If an HPD interrupt fires while the system is suspended, won't
drm_helper_hpd_irq_event() silently drop the event without updating the
connector status or scheduling any deferred work?

Furthermore, when the system resumes, output_poll_execute() explicitly skips
connectors that use the DRM_CONNECTOR_POLL_HPD flag, and the dw_hdmi resume
handler does not appear to manually trigger a hotplug event check.

Could this result in the system being completely unaware of any display
connections or disconnections that happened while suspended, at least until
a manual reprobe is forced by userspace?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516183838.2024=
991-1-jonas@kwiboo.se?part=3D17

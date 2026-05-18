Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7393B346AC3;
	Mon, 18 May 2026 18:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130069; cv=none; b=iH6WxGVbCMuKJGVeSNehw21Zw5qH0HvtTTGCbACdxvTp+4xGbskNxKMUVpRz1wu6R6APS0OTEJFH/U3mwfWMBRRFBTPGmw/N8BMbZEiI6M9JgphJlzsPxliHs+rjNdSQbS/hxXjGdE4cbj51fLX2mMq7PYGmCPpIMTK2Rg1DWyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130069; c=relaxed/simple;
	bh=MUnT2y1oLieX9a2dR9KXeK15JblQSN6VkDgO5lObSzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vy/E+8Do2P1kPN3uGKLkeFfRCL+gJnRXMhrCq1BTgxLAukVuQvMDcG/OTDMoGNjFfYnCVAj6Zmy9LLY9xhdyYeoCwZOxqQIA1RleWvpejDiPbt/Vm78dt/10DNOD3uV0bTnAMnBl/P0JUGIu4ZngkGyxID0cf5EhiPKqojWmZ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBEqGO0N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBEqGO0N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC7EC2BCB7;
	Mon, 18 May 2026 18:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779130069;
	bh=MUnT2y1oLieX9a2dR9KXeK15JblQSN6VkDgO5lObSzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nBEqGO0Njf1+sJucoufedI/9pkr4m8Vgq3dg3OwQ9cSHpmEgZRWBPXYbvDWacFKMe
	 RY3buDUM97j1nm8nKZdPzwsJbONjdGlSPD/PV6+dDrhdY77fH8V/6OdZsA0Hy2F5mH
	 +zyzz8b9nyy6tu7WbBZwT+NXAlFdjMgjR2jKGk5P/ebJGle2rAiANJABbEfRPMND/Y
	 +e8/jAPd3Y5i2Yvn6NItTAK23SEzan7GSPkD37aW6z8dW/o/J79biRTKHRuU+AW15a
	 +hT8pe2+8dlDYVlbfBgIXyS/I2KCOLEFsxjuiiWeIcU4gTCHmcB28ZhVhLW4qOsgk2
	 EnYi4nkkt4B+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 13/23] drm: bridge: dw_hdmi: Use
 dw_hdmi_connector_status_update()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: imx@lists.linux.dev, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260518180206.2480119-14-jonas@kwiboo.se>
References: <20260518180206.2480119-14-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 18:47:48 +0000
Message-Id: <20260518184748.CDC7EC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The CEC physical address is no longer set when the connector statu=
s is `connector_status_unknown`, breaking CEC functionality for displays wi=
th unreliable HPD.
- [High] Unconditional EDID read over I2C in `detect()` ignores the `force`=
 parameter, causing severe performance degradation and I2C spam.
--

commit d5d270011a2b02f003218ae7b96f62fae2b447e9
Author: Jonas Karlman <jonas@kwiboo.se>
drm: bridge: dw_hdmi: Use dw_hdmi_connector_status_update()

This commit updates the dw-hdmi connector to fetch EDID and update CEC
physical addresses during detect and force functions rather than in get_mod=
es.
It aims to ensure userspace always has access to the latest read EDID.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c

[ ... ]

> @@ -2473,36 +2473,36 @@ dw_hdmi_connector_status_update(struct dw_hdmi *h=
dmi,

[ ... ]

>  	drm_edid =3D dw_hdmi_edid_read(hdmi, connector);
>  	drm_edid_connector_update(connector, drm_edid);
>  	drm_edid_free(drm_edid);
> =20
> -	cec_notifier_set_phys_addr(hdmi->cec_notifier,
> -				   connector->display_info.source_physical_address);
> +	if (status =3D=3D connector_status_connected)
> +		cec_notifier_set_phys_addr(hdmi->cec_notifier,
> +				connector->display_info.source_physical_address);
>  }

Does this break CEC functionality for displays with unreliable HPD?=20

By guarding the cec_notifier_set_phys_addr() call with a check for
connector_status_connected, the CEC physical address update is skipped if t=
he
status evaluates to connector_status_unknown.=20

Previously, this was called unconditionally after a successful EDID read,
which allowed CEC to work even when HPD was unreliable.

>  static enum drm_connector_status
>  dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
> -	struct dw_hdmi *hdmi =3D container_of(connector, struct dw_hdmi,
> -					     connector);
> +	struct dw_hdmi *hdmi =3D container_of(connector, struct dw_hdmi, connec=
tor);
>  	enum drm_connector_status status;
> =20
>  	status =3D dw_hdmi_detect(hdmi);
> =20
> -	if (status =3D=3D connector_status_disconnected)
> -		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> +	dw_hdmi_connector_status_update(hdmi, connector, status);

Will this cause performance issues by performing unconditional I2C EDID rea=
ds
on every detect call?=20

The dw_hdmi_connector_status_update() function reads the EDID over I2C unle=
ss
the status is disconnected, but this completely ignores the force parameter
passed to detect. If a system-wide hotplug event occurs on another port,
drm_helper_hpd_irq_event() will call detect with force=3Dfalse on all HPD-c=
apable
connectors.

Could this trigger an unnecessary 20-50ms I2C EDID read here, spamming the =
I2C
bus and blocking the shared KMS system workqueue?

> =20
>  	return status;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518180206.2480=
119-1-jonas@kwiboo.se?part=3D13

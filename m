Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617B4361DC3;
	Sat, 16 May 2026 19:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778961144; cv=none; b=FxaDpkaUMEqulsEFA0fxqRCo4LIGL/YCe5Cm9P79/Mro+FLBssSq2+EVdTsEAEqksXsgT6zOm1TkvaECQm3XCLtud8fD0XqLDKHwFrve42SSDMpkuWRc2cpd/zsknr3BURJOJZn5hXIvYJFe1OTGnBnGJIpFsUGRTQ1tZSl6pLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778961144; c=relaxed/simple;
	bh=wBiUkMKE2/fn+M4Bu0CfTv4s5XqMChnUixqGRUy9bEY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NA7ryMGrxTPHjML+lTzZGRJX5q7SOPUcvC7n2LpF6stnnFW48CISdfWXPUJ9PVCcEkK3nWl77XK113GOm1dCF7cbus5TvSArs5UHk4VC0NVgssgKzAqXHiYhhe+ZiXvfXB1bTMNOVmt64YL+t5wM5WErQ3WrV9+7qtAIM8ojJfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kw8ZCSe1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kw8ZCSe1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D23C19425;
	Sat, 16 May 2026 19:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778961144;
	bh=wBiUkMKE2/fn+M4Bu0CfTv4s5XqMChnUixqGRUy9bEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Kw8ZCSe1gu4lnQ7epI6WJasyyT62yMs8tHAlHd0yXuPRjymzeGcFAwhH2RfwBqHcG
	 rsAIApLHw3b1sl2hlbwvDnGG7BWLJAwFvQ2yW1kVkRkD4jMGzyCVqKJ6lAIB2cmPKs
	 eOJgLbONYedWc/rOaS7JSE8pgONcxpjnV/P74PKfzYdK4dtuxnEqCY5hXdZq01Xx2d
	 6mrL3STeVMzZAc/S6Bor0GRGKUMek0FYADd7EQb6dHy9Nf3c34R/tipEvo9upBEWO5
	 ZdPcnckGmXeI6ZsS/+kE9zdJcMuPgWHGoIbzEK2AjMJ5wjLO517TOG5Trkac7TgwgU
	 wN092HzAz6Spw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/22] drm: bridge: dw_hdmi: Update EDID and CEC phys
 addr in bridge detect()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260516183838.2024991-15-jonas@kwiboo.se>
References: <20260516183838.2024991-15-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:52:23 +0000
Message-Id: <20260516195223.C5D23C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Redundant, back-to-back EDID reads over I2C causing significant la=
tency during probe.
- [High] Unchecked return value from `drm_edid_raw()` causes a NULL pointer=
 dereference on malformed EDIDs.
--

commit 795c172faddaba022a4fd3aecfe0898f0291550f
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Update EDID and CEC phys addr in bridge detect()

This commit updates the EDID and CEC physical address in the bridge
detect() function. This is intended to closely match the behavior of a
bridge connector with an HDMI bridge attached and the dw-hdmi connector.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 2bb043d64b658..3649ccf8d994e 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2969,8 +2969,17 @@ static enum drm_connector_status
>  dw_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *c=
onnector)
>  {
>  	struct dw_hdmi *hdmi =3D bridge->driver_private;
> +	enum drm_connector_status status;
> +
> +	status =3D dw_hdmi_detect(hdmi);
> +
> +	/*
> +	 * Update EDID and CEC phys addr to match the behavior of a bridge
> +	 * connector with a HDMI bridge attached and the dw-hdmi connector.
> +	 */
> +	dw_hdmi_connector_status_update(hdmi, connector, status);

Does this cause redundant EDID reads over I2C during probe?

Because the driver does not set DRM_BRIDGE_OP_HDMI, the DRM core bridge
framework (drm_bridge_connector_get_modes_edid) is unaware of this EDID
update.

Consequently, during a standard modeset probe, the core framework calls
detect() again and then edid_read(), resulting in up to three separate
I2C EDID reads per probe cycle (one from initial detect, one from
get_modes detect, and one from get_modes edid_read). Since DDC reads are
slow, could this cause a latency regression?

Additionally, could calling dw_hdmi_connector_status_update() here trigger
a NULL pointer dereference on malformed EDIDs?

dw_hdmi_connector_status_update() calls dw_hdmi_edid_read(), which
unconditionally calls drm_edid_raw() and dereferences the result. However,
drm_edid_raw() can return NULL for malformed EDIDs where the extension
count indicates a size larger than the read buffer.

While this behavior existed previously, hooking the EDID read into the
detect() callback makes this bug significantly more reachable. Could this
cause a kernel panic simply by connecting a monitor with a malformed
EDID on hotplug?

> =20
> -	return dw_hdmi_detect(hdmi);
> +	return status;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516183838.2024=
991-1-jonas@kwiboo.se?part=3D14

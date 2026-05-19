Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87128492521
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189711; cv=none; b=P/0vhSMRgT+oAi6S/70LuYr64fKvOG+anErl6XV2/cJff5Ex5s+yE6Mq4eMzE2PPKO279b0bE2Pcvp1qVnGWsgZybWjTAEPNwwfMvw2Gd7SF57z2d4GtUnGBTpNwkpoad0if54AaUHqoGnrf77l5nOWtLLeOyeZYv4+L+W+1wbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189711; c=relaxed/simple;
	bh=k6sTDxV6YtYF9LBPW2THjajcCcV2E2GxsIzUfyTrW+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C+SBIyiWuLl6uiNBI47sYTSG30JO8GxJE+a0zKzYRtWJac9+Tmnv+nxg0worylPEJfsdyseJzOQx2N4YxM/xW3vDJtZMeBst3LtnsSJbOOMe3ZckJbqS6GjP48gmxeR2tm3L1nSyraQsYMphlRFRMgUkW50c9t9OOGHQyqHYSk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mfpsc1ax; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mfpsc1ax"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7A3C2BCB3;
	Tue, 19 May 2026 11:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189711;
	bh=k6sTDxV6YtYF9LBPW2THjajcCcV2E2GxsIzUfyTrW+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Mfpsc1axPTzXIYsQhmpXCdxIrpF7VnadmBR9yPH8bZcvIphDoCZFnpwqXIjZQhh0i
	 3CJ4a8KKKX3P4wHae7WflSzPfTasMJJa8014J+T/dJD9LAdT23EdTZad1358hYCnFs
	 GHl5/3xX0Sw6yLQAgPEXSVmNNLSdRsYtZnr9kxbzLN85prBKMseurzX9WVrRbMTtOi
	 hRTztLOU/bFDRzXj36g/m0L2Cb9V9i8OBrmixNwNqKPSlTZIzsG3Id/WsB7TbCgczH
	 knXJllASjY5wO3voh0pI00MpxyB+3cVcgRMb8o653kyb0n2GwzCR/4MKqQe+5RGn8Q
	 I8eD5ggs5Aijg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 35/37] drm/bridge: drm_bridge_attach(): don't fail on
 -EPROBE_DEFER
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-35-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-35-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:21:50 +0000
Message-Id: <20260519112150.EA7A3C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Masking `-EPROBE_DEFER` leaves failed, uninitialized bridges i=
n the active bridge chain, leading to UAF and crashes.
- [High] Unconditionally swallowing `-EPROBE_DEFER` breaks the generic prob=
e deferral mechanism for all bridge resources.
- [Low] The probe deferral diagnostic block in `err_reset_bridge` is now un=
reachable dead code.
--

commit 17390f0ac2160f3f951784d20085063db510a04e
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: drm_bridge_attach(): don't fail on -EPROBE_DEFER

This commit modifies drm_bridge_attach() to bypass the error cleanup path
when a bridge's attach callback returns -EPROBE_DEFER. This is intended to
allow the display pipeline to probe even if a downstream bridge is not yet
connected.

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 10af107823902..594cb1468266e 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -593,7 +593,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, st=
ruct drm_bridge *bridge,
> =20
>  	if (bridge->funcs->attach) {
>  		ret =3D bridge->funcs->attach(bridge, encoder, flags);
> -		if (ret < 0)
> +		if (ret < 0 && ret !=3D -EPROBE_DEFER)
>  			goto err_reset_bridge;
>  	}

If the bridge's attach callback returns -EPROBE_DEFER, skipping the
err_reset_bridge path will cause the function to return 0 (success) instead
of propagating the error. Does this break the generic probe deferral
mechanism? -EPROBE_DEFER could be returned because any required resource
(such as clocks or regulators) is missing, and returning 0 means the upstre=
am
driver will finish probing without the driver core ever retrying.

Additionally, because the bridge was added to encoder->bridge_chain prior to
calling the attach callback:

	mutex_lock(&encoder->bridge_chain_mutex);
	if (previous)
		list_add(&bridge->chain_node, &previous->chain_node);
	else
		list_add(&bridge->chain_node, &encoder->bridge_chain);
	mutex_unlock(&encoder->bridge_chain_mutex);

If we don't go to err_reset_bridge to remove it from the list, the bridge is
left permanently linked in the active chain even though its attach operation
failed and was rolled back. Will this cause use-after-free issues or crashes
when the DRM core later traverses the chain to invoke pipeline callbacks?

Finally, lower down in this function at the err_reset_bridge label, there is
a check for -EPROBE_DEFER:

err_reset_bridge:
	...
	if (ret !=3D -EPROBE_DEFER)
		DRM_ERROR(...);
	else
		dev_err_probe(encoder->dev->dev, -EPROBE_DEFER, ...);

Since the err_reset_bridge label is now only reachable when ret is strictly
not equal to -EPROBE_DEFER, is the else branch containing dev_err_probe() n=
ow
unreachable dead code?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D35

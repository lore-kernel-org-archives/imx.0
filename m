Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630714;
	b=oEPq2sjG9k56K1mXucW4zlvljIGWDGfm3yo1sY+vBLqmdTEhwHd/3L75Acl+r0Ps26B8
	 7eh5syPav6A34nnnihEHYs86wwt4/6bOGjBSBkg/YnrxMkRx2rocS9CdLs0ffFHnLyNmA
	 ODzQwrLRJAmJBLg+fHrLUSZchp7zHioLMPgMEFb7xG/jo2Te7OhOH8aBjItDmkVDp4DKz
	 55xCrUa/O6tJXDstgR2uqBVzvlfv9VsQ1yzqIJyl6D+r5ZZzOV+2yrz1eySL9XTwg/Eih
	 oj3Z5a+qsJqNeJQY5ymzOpqbQQSIBFnkPORBGDTjNAX2OF+ZceJ/OmNGwPqJP+FgJSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630714;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JNwyyTFdADOjhany7yNnMrbOAyashut3uPS6FuhGslk=;
	b=yQMutYIAOmLcT9BaBQ1QVx0wxVXamPDSzPUINyOk4TDMQFUqMoBet2czxdxN+4lbRc4p
	 Djl+2+kZ7XSGPHZemNpRZo2p4iUESq3gFnq+Y9M2AXn2DqrAepBVVrMz5BkU0ej3AdtVA
	 OIGsOeyduMAaau3NUJcInwsDORJ7XsOh/A+5I+z/1Z+Nc819EA32hDLQCf2AdFm06sbsV
	 Srfp54urS0OIOXH6J7Dy+CrRjoXX3Wut5k2EWNMW3P4OZ/lJdr55DMp/LwP/FWh1+bOlx
	 zh5a8o4YW307bFMPmgT2qN/bZyc+lW7JH8XtFm15zlhkX5hkM/Aa6al/StB27fQAcpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m+wfh5D7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29078606A31E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m+wfh5D7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABD21F000C4;
	Wed, 25 Nov 2026 18:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630713;
	bh=JNwyyTFdADOjhany7yNnMrbOAyashut3uPS6FuhGslk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m+wfh5D79lwbI7GbBHW1UYlR4K53MfdXAymlFD5C9svyShVVUUMYWzX/Pcruud2hJ
	 jiX0PbB/MXG2gIedoY0S8P9ZwJQg2PxsRpVcLP7C2Iql7cBvwzAwRTU/sGs4XHZs6t
	 KlUvlyy/pT/fbSwYGCbG+DH/drlnumbx2rFlqooKIm20mZmbwhAMWcDpBX3bY2i8Dk
	 WmhaQbtlwqSZbNRgCiEFK7Tz6pwsiNXA9AwZf7891ylh0hwImhMjGAJYByJ/hn91R9
	 Op95MO8eYYxXI0p1tJM/5j0VPz5r/6n5MdpXbe+2k7EgrcTSdsASfsYWI4wtIlWu0Y
	 2oHKFV8cQZCUA==
Message-ID: <sashiko-outbox-233960@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 24/32] drm/bridge: ti-sn65dsi86: implement
 .get_next_bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261125-drm-bridge-hotplug-v4-24-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
 <20261125-drm-bridge-hotplug-v4-24-822722850492@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:18:33 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/bridge: ti-sn65dsi86: UAF on pdata->next_bridge in
  sn65dsi86_get_next_bridge()
--

commit 79f96bd174206efa5c1019cb2a4980bed689b63c
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: ti-sn65dsi86: implement .get_next_bridge

This commit implements the .get_next_bridge callback and sets
DRM_BRIDGE_OP_GET_NEXT_BRIDGE to expose the downstream bridge in the
ti-sn65dsi86 driver.

> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 38318113a534f..6dadcd7eb8d18 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -743,6 +743,13 @@ static int ti_sn_attach_host(struct auxiliary_device=
 *adev, struct ti_sn65dsi86
>  	return devm_mipi_dsi_attach(&adev->dev, dsi);
>  }
> =20
> +static struct drm_bridge *sn65dsi86_get_next_bridge(struct drm_bridge *b=
ridge)
> +{
> +	struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> +
> +	return pdata->next_bridge ? drm_bridge_get(pdata->next_bridge) : ERR_PT=
R(-ENODEV);
> +}

[Severity: High]
Can sn65dsi86_get_next_bridge() pass a dangling or ERR_PTR pointer to
drm_bridge_get()?

ti_sn_bridge_probe() obtains pdata->next_bridge with
devm_drm_of_get_bridge(&adev->dev, np, 1, 0).  For a non-panel downstream
bridge (such as a DisplayPort connector bridge), devm_drm_of_get_bridge()
does not hold a reference to the returned bridge, so pdata->next_bridge
becomes a dangling pointer if the downstream bridge is removed and freed.

Even for a panel bridge, its devres release is bound to the child
auxiliary device (&adev->dev), whereas pdata->bridge lives on the parent
I2C device and neither ti_sn_bridge_remove() nor the probe error path
clears pdata->next_bridge.  In addition, ti_sn_bridge_probe() stores the
result of devm_drm_of_get_bridge() directly into pdata->next_bridge before
checking IS_ERR(), so a failed re-probe leaves an ERR_PTR in
pdata->next_bridge that passes the non-NULL check here and is dereferenced
by drm_bridge_get().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-drm-bridge=
-hotplug-v4-0-822722850492@bootlin.com?part=3D24

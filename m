Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630463;
	b=wwcboCAXfAYRhqM2zXwUtoJFDDG5KIitqFYf1pobhwFWb6/9Ouseqa6UIk6xX0pyPhGz
	 9iMIj5mx6pRT5cP5tf0qEO7lL0SJNwhsNtfdWZkXvhc90uVBNKaueQ4Ln1VJepXvdkvaT
	 rbt9VVpscDNGoJSKVX9eZi7S2XFCgZYtolKwRyYWlPd5GtUNJ2R3mijSS2r5eBvjoamNY
	 j2Nq+xZbAtO7Tey2T05/GSiYjJDFt69Nyisk5TvaA7naGozI57FePWilbE8VoouOrZ5Qc
	 URu3VJEkWkNBXBGlxGNDyVRqlDsSTzUd4/80uyvfSrY/FzfiVC6ySQUlGG3bOHoqr/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630463;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2k9mIGpiUoz/+tRof37PRM5uwmQ6bYmt9mVDu/ksd5Y=;
	b=oOHhlmHRXIqBksJEQ0Kn7uBqj+Rhkt0PSfDcM+sTxVZ6q1RsY7r/hM0rePrh5CDCqJnp
	 WsJ0V/q11xeF4r4YAIxGk3w3W/HeMMMDp5byzGaieApB/wL5srcf/T8jt9MxOUNE7ahmJ
	 mmVFTvo/MgCWQOSSq7IcnYpSG6EcV9t/y8fLTba3fCMqIExApNvJsac705LXn0tSmdhRp
	 r+MVOznSyfGc1CtUYmqYYUX1F7FU1rJFcYJOQoXd0n0DGdfXeavNiawzBZowx6W9xj8gD
	 5m2kfx/JmKoEGFdcz2ixRA//u9VyaZZsC6JwGg1E0JRB8rNmrq9OfceDav6SatVPixQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmfZWSg3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B0E606A336
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmfZWSg3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9301F000D3;
	Wed, 25 Nov 2026 18:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630462;
	bh=2k9mIGpiUoz/+tRof37PRM5uwmQ6bYmt9mVDu/ksd5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CmfZWSg3NKt8pFao81aFw6IYUFwJWpGdBC2awkMsdHrMu4Iv523cPt/NiYRX0pJBw
	 rjHDCbStnFqgz1/P1BnVEKth7/xJYBQFn9dJGw05MSvXW43wVU7Vi7ylZdl7rm/d5A
	 teR1tmyWHBpFrrlxh8AK0qEkfoLVl6tNd5hM28fKX2lN7hc02W4ieN5KFmX1/YAc8F
	 G2d6KJF7mwHB+gt2hoabWFXlnlc82Dpmas5YPpl1VZgNCwfkPdXfEg/0MvFa/yPCwX
	 jZMpRTTnviKB9g5k80BLtMrBzTjK4I6FMj1qGU55uDSdbOrlFWQf2yHahUnomeXxo0
	 QX0oLN8x5FzPg==
Message-ID: <sashiko-outbox-233932@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 23/32] drm/bridge: ti-sn65dsi83: implement
 .get_next_bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261125-drm-bridge-hotplug-v4-23-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
 <20261125-drm-bridge-hotplug-v4-23-822722850492@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:14:21 +0000
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
- [High] drm/bridge: ti-sn65dsi83: use-after-free in
  sn65dsi83_get_next_bridge()
--

commit 07f44b5de19c58e65f65432a2a999004dd04f3ae
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: ti-sn65dsi83: implement .get_next_bridge

This commit implements the .get_next_bridge callback for the ti-sn65dsi83
bridge driver to return a reference to ctx->panel_bridge.

> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi83.c
> index 77ef1613c5f51..9e9cf0dda92d8 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -295,6 +295,13 @@ static struct sn65dsi83 *bridge_to_sn65dsi83(struct =
drm_bridge *bridge)
>  	return container_of(bridge, struct sn65dsi83, bridge);
>  }
> =20
> +static struct drm_bridge *sn65dsi83_get_next_bridge(struct drm_bridge *b=
ridge)
> +{
> +	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +
> +	return ctx->panel_bridge ? drm_bridge_get(ctx->panel_bridge) : ERR_PTR(=
-ENODEV);
> +}

[Severity: High]
Can sn65dsi83_get_next_bridge() cause a use-after-free on
ctx->panel_bridge?

sn65dsi83_parse_dt() acquires ctx->panel_bridge via
devm_drm_of_get_bridge() -> drm_of_find_panel_or_bridge():

drivers/gpu/drm/drm_panel.c:drm_of_find_panel_or_bridge() {
	...
	if (bridge) {
		...
		*bridge =3D of_drm_find_bridge(remote);
		if (*bridge)
			return 0;
	}
	...
}

When the remote DT node is a non-panel bridge, of_drm_find_bridge() drops
the bridge reference before returning, so ctx->panel_bridge holds no
reference.  If the downstream bridge is later removed and freed while
sn65dsi83 stays bound, drm_bridge_get(ctx->panel_bridge) increments the
refcount on freed memory and returns a dangling pointer.

Even when the remote node is a drm_panel, devm_drm_panel_bridge_add() is
registered on ctx->dev after devm_drm_bridge_alloc(), so on unbind devres
puts ctx->panel_bridge before ctx->bridge is destroyed without clearing
ctx->panel_bridge; a concurrent holder of ctx->bridge calling
drm_bridge_get_next() can then access ctx->panel_bridge after its
reference was dropped.  Acquiring the downstream bridge with
of_drm_get_bridge_by_endpoint() and storing it in ctx->bridge.next_bridge
(or releasing it in a bridge .destroy callback) would keep the reference
alive for the lifetime of ctx->bridge.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-drm-bridge=
-hotplug-v4-0-822722850492@bootlin.com?part=3D23

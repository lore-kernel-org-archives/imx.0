Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28D335201A
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190328; cv=none; b=MIapII4iGexLU0b2DjMim1AtL06n7H5GyvOxSApJTttf2bZ1SnCJ3rg/Cs9Mw8wOancyXUS9Xht7yShe/TjMniiu63TtyIcuAXYt6RZONJISvQ7VZKf8ebUz4IysH9P50T9034hcmeD7J6G6mpFpibbqVHUUkUYYNf2qsxKLXQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190328; c=relaxed/simple;
	bh=SJsRi33E4kIHt9TZWM/7bBMF6tujPTxfK/WBb6gZdYI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D5UHHQaFLtFH65H1TKAfCWKoj+jd4Tu3ylm14bGUaGgnVncV90GtyKbGDpcz+F259BdXXdnp0NKjhUecXfGnLXoVIDV86v+1aExOhUGJJd/az0KVlOtQPRY/ngEVPvy4TyVJ+8MA40owL5/Cczu93h0AKZASdCn6Ws9kaeafg5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cu4MiLvP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cu4MiLvP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF97C2BCB3;
	Tue, 19 May 2026 11:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779190328;
	bh=SJsRi33E4kIHt9TZWM/7bBMF6tujPTxfK/WBb6gZdYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cu4MiLvPihrKHQfknmo4nstZqQfY34Ncwc3XBhrcri/kbr5QSa3COPTz6O08yO30+
	 xUUPMYQD+W0584CjrUiLZdQGnUkJIPXHBza3HbX7dTNCOYQTY6kGPh7JoHvkB/XuCf
	 nE22xDfd4eJpACNpVckShQ/kNM1va9ZeKCG/6OvQULlI7p1K7Sstvm5h5Zk615Ia08
	 B4KJU5Mj87XgJjJPc+8rZqQmn81Y4qJpknwNkOsXy7XDa8023Ew8A+rBcxZYoB0ACk
	 JT5LvsyteuzP0oGKJcMkUBqJuhuVjb3F18E+dPp5fUrUUqlEEpEYhZ2ks4sUi1wIQd
	 fDdghorKyzlzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 27/37] drm/bridge: notify about detached bridges
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260519-drm-bridge-hotplug-v1-27-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-27-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:32:07 +0000
Message-Id: <20260519113207.CAF97C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Dangling pointer: `bridge->encoder` is not cleared on detach, lead=
ing to potential Use-After-Free.
- [High] Premature teardown of atomic state, list linkages, and bridge reso=
urces before pipeline deconfiguration leads to UAF and list corruption.
--

commit 0a150cb9f7d5a0eebc9c0a446f33672c0a09a80b
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: notify about detached bridges

In preparation to support DRM bridge hotplug, let the drm_bridge code emit
an event when a bridge is detached, so that this event can trigger the
actions needed to deconfigure the pipeline and unregister the connector as
appropriate.

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index e7e17bf4fdf9e..62413fff35fcb 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
[ ... ]
> @@ -638,6 +639,9 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>  		bridge->funcs->detach(bridge);
> =20
>  	list_del_init(&bridge->chain_node);
> +
> +	drm_event_notifier_notify(DRM_BRIDGE_DETACHED, bridge);

The commit message mentions this event is meant to trigger actions to
deconfigure the pipeline. Since this event is emitted after tearing down the
bridge's atomic state, list linkages, and bridge resources, could this cause
issues when the listener attempts to safely disable the pipeline?

Specifically, earlier in this function:

	if (drm_bridge_is_atomic(bridge))
		drm_atomic_private_obj_fini(&bridge->base);

This destroys the bridge's modeset lock and frees its active atomic state. =
Any
concurrent atomic commit (like a userspace page flip) or a teardown commit
triggered by the listener might access freed memory or destroyed locks.

Additionally:

	list_del_init(&bridge->chain_node);

This locklessly modifies the encoder's bridge chain, which might corrupt the
list if a concurrent atomic commit is iterating the chain.

Finally, bridge->funcs->detach() has already executed, meaning the bridge h=
as
released its internal resources, potentially making subsequent atomic disab=
le
operations unsafe. Should the notification be emitted before the bridge sta=
te
and linkages are forcefully torn down?

> +
>  	bridge->dev =3D NULL;

Does this code also need to clear bridge->encoder?

Since bridges are refcounted, and listeners or other users might hold their
own references via drm_bridge_get(), the bridge can outlive the encoder.
If the encoder is destroyed (e.g., during driver unbind), could any access
to bridge->encoder by asynchronous event listeners or delayed cleanup
workers result in a use-after-free?

>  	drm_bridge_put(bridge);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D27

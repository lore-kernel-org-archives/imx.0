Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536353002BB
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189338; cv=none; b=C68UDtSOGwhkk80gq4k1mh2lOjFnAUSyWEIKbJ52KHNDLPQDWJLfQQOc2GX8QS8cB9Ps75bccjWeIMvqkeem69bi2hR0Y4uUH0JEhpu/XV++zB+x33WSG2L5sR16aH9sAswiRAqpzbV3BtSnaPITi779PY28THP1hIhkSMULkz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189338; c=relaxed/simple;
	bh=QSIz6WB0yjAxhv10GrlLJJlcXHWj4ef7lJyvoTGCCCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N+EUO4uPewvSRuPpkl1QFRcZveoghVqrr43q3zF+Wa8Y3k4u76NTzKLVabXupcsq4n+nCK6pbbXSfAY45S2PxLwKQiKXl+meUQBZOExcJIV0J1YvyWbgtZXpNuC+YlqgIyv7dmu1YU0+RdsrBwHGcFzHE2w72qYLBshQD95hM4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nuxe1/0F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nuxe1/0F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE07CC2BCB3;
	Tue, 19 May 2026 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189337;
	bh=QSIz6WB0yjAxhv10GrlLJJlcXHWj4ef7lJyvoTGCCCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Nuxe1/0FTtcRpTxuTBJiBRIlfYQ1Yv3bTEcgEAntqb+Zsz4B8IfDliOUDnrUiyccy
	 ewZDlZ+7WwYTbENl+rxx/ZiNVX1g7LgwW4c6bS/lhJQnZ7Cni+6vow/tN9dknvId44
	 nzJl3298Cv7NR0LyWuZPq4T/Pqg9MlZMSjqLOB/zmtY5eYBNKHQFye2NRYy+50Y/rq
	 SgPysslqhToPLpKK72FlS6IhBNuOBKSxqfA6fiyxFQmV0r2GSEMgQZc+tXmGgMbnUM
	 zipbvBpOs+aW+Acnu870OGVB6ASrltOd+emAavQs71chQbuEiG6VW8qkDp6qwuN7h/
	 fmAz6x5cHHkHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 36/37] drm/display: bridge-connector: handle bridge
 hotplug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-36-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-36-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:15:35 +0000
Message-Id: <20260519111537.BE07CC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] `drmm_bridge_connector_init()` returns NULL instead of the all=
ocated pointer on success.
- [High] Unchecked execution of the optional `attach` callback causes NULL =
pointer dereference.
- [High] TOCTOU race condition in `dynconn` creation leads to memory leaks =
and duplicate connector registrations.
- [High] Dynamic connector destruction on hot-unplug leaks `drmm` actions, =
leading to a Use-After-Free.
- [High] Lockless traversal of `encoder->bridge_chain` risks list corruptio=
n and Use-After-Free.
--

commit 31a28cb0ac7316fddfb3b8148c8e28f4da0bce4f
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/display: bridge-connector: handle bridge hotplug

This commit updates the DRM bridge connector infrastructure to handle bridge
hot-plugging by creating and destroying the DRM connector dynamically. It
introduces the drmm_bridge_connector_init() API, which registers a notifier
to react to attach/detach events and manage the connector lifecycle.

> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index b83da529cc7af..2ce6c04e2fc7a 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c

[ ... ]

> @@ -1037,6 +1042,19 @@ static int drm_bridge_connector_init_hdmi_audio_ce=
c(struct drm_bridge_connector_
>  	return 0;
>  }
> =20
> +static bool drm_bridge_connector_pipeline_is_complete(struct drm_bridge_=
connector *bridge_connector)
> +{
> +	struct drm_bridge *last_bridge __free(drm_bridge_put) =3D
> +		drm_bridge_chain_get_last_bridge(bridge_connector->encoder);

Is it safe to call drm_bridge_chain_get_last_bridge() here without holding
bridge_connector->encoder->bridge_chain_mutex? It seems this can be called
asynchronously from hotplug event notifiers, potentially traversing the
list while it is being modified.

> +
> +	if (!last_bridge || !drm_bridge_is_tail(last_bridge)) {
> +		drm_dbg_driver(bridge_connector->drm, "pipeline not (yet) fully connec=
ted");
> +		return false;
> +	}
> +
> +	return true;
> +}

[ ... ]

> @@ -1153,6 +1171,79 @@ static int drm_bridge_connector_add_connector(stru=
ct drm_bridge_connector *bridg
>  	return ret;
>  }
> =20
> +/*
> + * Propagate the attach chain and possibly add a drm_connector after a n=
ew
> + * drm_bridge is hot-plugged.
> + *
> + * The connector is added only if the pipeline is now complete. This cou=
ld
> + * not be the case for various reasons:
> + *
> + * - the new bridge is just unrelated to our encoder
> + * - the new bridge is not be the next one in the pipeline
> + * - the new bridge is the next in the pipeline but the pipeline is not =
yet
> + *   complete
> + *
> + * All these cases are normal, not an error.
> + */
> +static void drm_bridge_connector_try_complete(struct drm_bridge_connecto=
r *bridge_connector)
> +{
> +	int err;
> +
> +	/*
> +	 * drm_connector already present, the new bridge must be for
> +	 * another card
> +	 */
> +	if (bridge_connector->dynconn)

Could there be a race condition here? If multiple hotplug events are proces=
sed
concurrently, two threads could observe dynconn as NULL here outside the
lock, and both proceed to allocate and assign it in
drm_bridge_connector_add_connector().

Would it be better to re-verify bridge_connector->dynconn after acquiring
dynconn_mutex inside drm_bridge_connector_add_connector()?

> +		return;
> +
> +	/* Propagate the attach call chain to newly hotplugged bridge(s) */
> +	struct drm_bridge *last_bridge __free(drm_bridge_put) =3D
> +		drm_bridge_chain_get_last_bridge(bridge_connector->encoder);

As mentioned above, should this list traversal be protected by
bridge_connector->encoder->bridge_chain_mutex?

> +
> +	/* Encoder chain empty? */
> +	if (!last_bridge)
> +		return;
> +
> +	err =3D last_bridge->funcs->attach(last_bridge, bridge_connector->encod=
er,
> +					 DRM_BRIDGE_ATTACH_NO_CONNECTOR);

What happens if the last bridge does not implement the attach callback?

Since attach is optional in struct drm_bridge_funcs, should there be a check
for last_bridge->funcs->attach before calling it to avoid a NULL pointer
dereference?

> +	if (err)
> +		return;
> +
> +	/* Add the connector if the pipeline is now complete */
> +	if (drm_bridge_connector_pipeline_is_complete(bridge_connector))
> +		drm_bridge_connector_add_connector(bridge_connector);
> +}
> +
> +static int drm_bridge_connector_handle_event(struct notifier_block *nb,
> +					     unsigned long event, void *data)
> +{
> +	struct drm_bridge_connector *bridge_connector =3D
> +		container_of(nb, struct drm_bridge_connector, drm_event_nb);
> +
> +	switch (event) {
> +	case DRM_MIPI_DSI_ATTACHED:
> +		/* One or more bridges hot-plugged, try adding the drm_connector */
> +		drm_bridge_connector_try_complete(bridge_connector);
> +		break;
> +	case DRM_BRIDGE_DETACHED:
> +	{
> +		/*
> +		 * A bridge was unplugged, remove the drm_connector if it's
> +		 * part of the same pipeline
> +		 */
> +		struct drm_bridge *bridge =3D (struct drm_bridge *)data;
> +
> +		if (bridge_connector->dynconn &&
> +		    bridge->encoder =3D=3D bridge_connector->encoder)
> +			drm_bridge_connector_dynconn_release(bridge_connector);

Does drm_bridge_connector_dynconn_release() safely clean up the drmm actions
registered in drm_bridge_connector_init_hdmi_audio_cec()?

Since drmm_connector_hdmi_cec_register() and similar tie cleanup actions to
the drm_device, releasing the connector here and freeing the dynconn
structure might leave those actions active, potentially causing a
use-after-free when the device is eventually destroyed.

> +		break;
> +	}
> +	default:
> +	}
> +
> +	return NOTIFY_DONE;
> +}

[ ... ]

> +struct drm_bridge_connector *drmm_bridge_connector_init(struct drm_devic=
e *drm,
> +							struct drm_encoder *encoder)
> +{
> +	struct drm_bridge_connector *bridge_connector;
> +	int ret;
> +
> +	bridge_connector =3D drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_K=
ERNEL);
> +	if (!bridge_connector)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mutex_init(&bridge_connector->dynconn_mutex);
> +	bridge_connector->drm =3D drm;
> +	bridge_connector->encoder =3D encoder;
> +	bridge_connector->drm_event_nb.notifier_call =3D drm_bridge_connector_h=
andle_event;
> +
> +	if (drm_bridge_connector_pipeline_is_complete(bridge_connector)) {
> +		ret =3D drm_bridge_connector_add_connector(bridge_connector);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
> +	ret =3D drmm_add_action_or_reset(drm, drm_bridge_connector_fini, bridge=
_connector);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret =3D drm_event_notifier_register(&bridge_connector->drm_event_nb);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret =3D drmm_add_action_or_reset(drm, drm_bridge_connector_notifier_unr=
egister,
> +				       &bridge_connector->drm_event_nb);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return 0;

Should this return the bridge_connector pointer instead of 0? Callers using
IS_ERR() will treat 0 (NULL) as success and potentially dereference it.

> +}
> +EXPORT_SYMBOL_GPL(drmm_bridge_connector_init);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D36

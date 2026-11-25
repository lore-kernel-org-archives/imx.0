Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630523;
	b=Npan4B0RB7Ll5UgpzGeWVtVT8XP5ZSYl0YuL3538QknsTmfxnrCzlyTjdGxtBAZP9V42
	 9Fs85E9bZsKqbKFZ+SiVLuyDMxpA8dmR/vbat7834WmriIkkEKXy9U7QyBdAPB+V24ht1
	 xrPmRlj9GW/Fg9BFK5QDMNdTK9CEugr5YA/gyN4alITLr8vaco4O6UvP/Edq8hEqWTueA
	 EGUmi+AW768VHbgDiDI3yxLQS5dz2q4r3o5yJJbzi85sjUzWknvzJRhIat6tPIIr/PPdh
	 Y2TZRyR6lX6jpyTqeCxKAyI53qGkYpbT+Rd4L0QQ4sqCH7mDKeJVCEPUVa6/boNFqxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630523;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=h+lbt7kj1uhNQxBSIdVRznpLBzU/8FdTtl2Tk92QD6c=;
	b=Z/k+S1cECE14YYOwYUPERR8UXVUdWBgw8O4z3TP4Kj2bY/A6B+y/qU8NnIyGSYrsx1+A
	 fxwTfioiCNPViZghteY8BCT4TwOMnVKT+Nwz8zy2J4lIktgksv+SutiKhZsyVdwSaKc+F
	 x1xUVUG47FnN9M930FcX+zbNqp6mkc/cq8mdr/J4b0z0Guo2SkeqZIh2nlMfPB1QQDxN7
	 pUor8A6ENpgox9VkvN81pr3i7/QPJUdWiaXvwSd9s3J6r5UWaxkoQHvrAIEhB3rda9g6Z
	 HTl2cM1DNFq+Xe2Du9Cr+qtonCEdMskB+nK5En9ZQFNRNWtGLiFkqOTkBQaWyRS3VVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FpZv1f0c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E60606A690
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FpZv1f0c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6871F000C4;
	Wed, 25 Nov 2026 18:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630523;
	bh=h+lbt7kj1uhNQxBSIdVRznpLBzU/8FdTtl2Tk92QD6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FpZv1f0cf0zZpf0RlMh+fjTALNqw90u7ACfc/gA5+S+JNw6T5Wkynj2ajOV/Hi8if
	 VwUd1ggfEqqqlbIOLYdtAz4Pf1ca/tlqFGS8OVIJUtQ/Ot6dOwt4EUiTX+rwzrNNLv
	 EAYiadP6OjuG3VP3BC2opxT2XZb1ZI5nvZPYkjOyd+bXI7kUznSqpvd8md1klES3oM
	 hmzvc60e/8WFUx3qfGl3GTZvQXriAt/J6r4FT1BQuWf6asabf82aOh9O5xJlsuBsbv
	 H8RengJIb/1gEOxIltNz3keFol5f0+HDY1eU5LcRcTrqlj8DgHUdc/D7FhoO5hLtv4
	 VmEuFWNlbUlaw==
Message-ID: <sashiko-outbox-233940@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 26/32] drm/bridge: add drm_bridge_detach_from()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261125-drm-bridge-hotplug-v4-26-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
 <20261125-drm-bridge-hotplug-v4-26-822722850492@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:15:22 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/bridge: stack list corruption and infinite loop in
  drm_bridge_detach_from()
- [Medium] drm/bridge: unused static drm_bridge_detach_from() breaks
  -Werror bisect
--

commit 2c3d13618a66d24a86a5bd8331f35f64a19c35c9
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: add drm_bridge_detach_from()

This commit adds a helper to detach a bridge and all subsequent bridges in =
an
encoder's bridge chain.

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index e0e0dd7fc12bb..c00d5276e55b3 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -504,6 +504,40 @@ int devm_drm_bridge_add(struct device *dev, struct d=
rm_bridge *bridge)
>  }
>  EXPORT_SYMBOL(devm_drm_bridge_add);
> =20
> +/**
> + * drm_bridge_detach_from - detach a given bridge and all the following
> + *                          from an encoder chain
> + * @bridge: first bridge to remove
> + *
> + * Removes from an encoder all the bridges starting with a given bridge
> + * and until the end of the chain.
> + *
> + * Does nothing if the bridge is not attached to an encoder chain.
> + */
> +static void drm_bridge_detach_from(struct drm_bridge *bridge)

[Severity: Medium]
Does defining drm_bridge_detach_from() as static without any callers in this
patch break bisection under CONFIG_WERROR=3Dy or CONFIG_DRM_WERROR=3Dy?

drivers/gpu/drm/Makefile enables -Wunused, so compiling drm_bridge.o fails
with -Werror=3Dunused-function until the later commit "drm/bridge: shutdown
encoder and detach downstream bridges on bridge unplug" adds the caller in
drm_bridge_remove().  Marking it __maybe_unused here (or introducing it in
the patch that uses it) avoids the build failure.

Also, the commit message still refers to the v2 name
drm_encoder_cleanup_from() instead of drm_bridge_detach_from().

> +{
> +	struct drm_encoder *encoder =3D bridge->encoder;
> +	struct drm_bridge *next;
> +	LIST_HEAD(tmplist);
> +
> +	/*
> +	 * We need the bridge_chain_mutex to modify the chain, but
> +	 * drm_bridge_detach() will call DRM_MODESET_LOCK_ALL_BEGIN() (in
> +	 * drm_modeset_lock_fini()), resulting in a possible ABBA circular
> +	 * deadlock. Avoid it by first moving all the bridges to a
> +	 * temporary list holding the lock, and then calling
> +	 * drm_bridge_detach() without the lock.
> +	 */
> +	mutex_lock(&encoder->bridge_chain_mutex);
> +	if (!list_empty(&bridge->chain_node))
> +		list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, ch=
ain_node)
> +			list_move_tail(&bridge->chain_node, &tmplist);
> +	mutex_unlock(&encoder->bridge_chain_mutex);
> +
> +	while (!list_empty(&tmplist))
> +		drm_bridge_detach(list_first_entry(&tmplist, struct drm_bridge, chain_=
node));
> +}

[Severity: High]
Can moving bridge->chain_node onto a stack-local tmplist cause list
corruption and an infinite loop if a downstream bridge is detached while
drm_bridge_detach_from() is already running?

list_move_tail(&bridge->chain_node, &tmplist) removes each bridge from
encoder->bridge_chain, but leaves bridge->chain_node non-empty while linked
into tmplist on the first caller's stack.  drm_bridge_detach() only runs
list_del_init(&bridge->chain_node) after sleeping in
drm_atomic_private_obj_fini() and calling bridge->funcs->detach() without
encoder->bridge_chain_mutex held:

CPU0                                  CPU1
drm_bridge_detach_from(bridgeA)
  mutex_lock(&bridge_chain_mutex)
  list_move_tail(bridgeA, &tmplist0)
  list_move_tail(bridgeB, &tmplist0)
  mutex_unlock(&bridge_chain_mutex)
  drm_bridge_detach(bridgeA)
    drm_atomic_private_obj_fini()
                                      drm_bridge_detach_from(bridgeB)
                                        mutex_lock(&bridge_chain_mutex)
                                        if (!list_empty(&bridgeB->chain_nod=
e))
                                          list_for_each_entry_safe_from(
                                            bridgeB, ...,
                                            &encoder->bridge_chain, ...)
                                            <-- walks tmplist0, never hits
                                                &encoder->bridge_chain

Because bridgeB->chain_node is on CPU0's tmplist0 rather than
encoder->bridge_chain, CPU1's list_for_each_entry_safe_from() walks around
tmplist0 (including the stack list head itself as a struct drm_bridge),
never reaches &encoder->bridge_chain, and corrupts CPU0's stack list while
looping forever under encoder->bridge_chain_mutex.

In addition, if drm_bridge_detach() ever takes its early return on
WARN_ON(!bridge->dev), bridge->chain_node is not unlinked and
while (!list_empty(&tmplist)) spins forever.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-drm-bridge=
-hotplug-v4-0-822722850492@bootlin.com?part=3D26

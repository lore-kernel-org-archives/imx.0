Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6875D492517
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189249; cv=none; b=hA2C79YfWe36eqnPKHnvJIOxLvGc8tnCiyS0DRGjl1lTjer4yqBSs6SxDIvUce1l193t+HOc0e35y6xKf7WnMZTE3A3GYHlQf9PG58n5gybVjhWzMN2Qil1BpEZ34kpq7bL7t9Uz88rVF+MHco/dg9qP5spx0e7021f8JM8Zqss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189249; c=relaxed/simple;
	bh=/qKPeZjoYbPnpVxHS7WVWV/X6+WCjTQgr/Gq5rrAoUo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PsBDjpNP2/tfxOu9/7DAiQvbacNTdcbQFsrjZFSqk5q9kDsQo3z+/KebVCPI5Ye6z/72oaQlsLlgFndTvo8iIkBewDJ3lSdsh36IDbB4reWlc+hgglPOrZwjU5Wc6YPjcsBCoNovYSZeP8pIX99lFkPRstJy5qIsC5GQriZg3nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=slufl4/K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="slufl4/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C75C2BCC6;
	Tue, 19 May 2026 11:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189249;
	bh=/qKPeZjoYbPnpVxHS7WVWV/X6+WCjTQgr/Gq5rrAoUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=slufl4/KQ3HbkGwb/o2n+Eq+ty2nsbBUZWLybaQ4maOrtJji8osxM7YK0+6Q7K+15
	 ndQvkzAAq8tqvG9N0EBD3aNipMDjyCeD5jIWjdCMxzGhI3ZeM+80rnMbATMoEsSPop
	 k8LP/Tq2Azd81VXKW8wzySMK2PPl4s/cPN7HBYdw0dT/ITjnv9aJwzHEfRSrm38vNi
	 XvLXisVauCyDCtSYdkh411psGDnvbhqtth7qqF042w/GcD8tkeihWP26X7BEOCg33r
	 8MA+pyzmNe1VA4HQ5SykZokejmerjKeAdHT5Euw/mkYZkRtFK3KCsmrY9uYMhs58eK
	 uMfadSmkuUxwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 23/37] drm/encoder: add drm_encoder_cleanup_from()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260519-drm-bridge-hotplug-v1-23-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-23-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:14:08 +0000
Message-Id: <20260519111408.C2C75C2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Infinite loop (kernel lockup) if `drm_bridge_detach()` returns ear=
ly.
- [High] Unsafe list membership check leads to out-of-bounds traversal and =
memory corruption.
- [High] Moving bridges to a stack list breaks bridge chain iterators durin=
g detach callbacks.
--

commit 36261e8ecb547e8946c95a0aed4ce37428b2d56e
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/encoder: add drm_encoder_cleanup_from()

Introduce a variant of drm_encoder_cleanup() to detach all bridges from
a given point to the end of the pipeline.

> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
[ ... ]
> +void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_br=
idge *bridge)
> +{
> +	struct drm_bridge *next;
> +	LIST_HEAD(tmplist);
> +
> +	/*
> +	 * We need the bridge_chain_mutex to modify the chain, but
[ ... ]
> +	 */
> +	mutex_lock(&encoder->bridge_chain_mutex);
> +	if (!list_empty(&bridge->chain_node))
> +		list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, ch=
ain_node)
> +			list_move_tail(&bridge->chain_node, &tmplist);
> +	mutex_unlock(&encoder->bridge_chain_mutex);

Could this list_empty() check lead to an out-of-bounds traversal?

The check confirms the bridge is on a list, but not necessarily the
provided encoder's chain. If a caller mistakenly passes a bridge from a
different encoder, or if a concurrent caller processes a bridge already mov=
ed
to another thread's tmplist, list_for_each_entry_safe_from() will iterate
over that unrelated list.

Since the loop termination checks against &encoder->bridge_chain, it will
never find the list head, running past the end of the foreign list and
corrupting memory.

> +
> +	while (!list_empty(&tmplist))
> +		drm_bridge_detach(list_first_entry(&tmplist, struct drm_bridge, chain_=
node));

Can this loop become infinite if drm_bridge_detach() returns early?

Looking at drm_bridge_detach() in drm_bridge.c:

void drm_bridge_detach(struct drm_bridge *bridge)
{
        if (WARN_ON(!bridge))
                return;

        if (WARN_ON(!bridge->dev))
                return;
...
        list_del_init(&bridge->chain_node);
...

If an early return triggers before list_del_init(), the bridge remains in
tmplist. The list never becomes empty, and the loop will process the exact
same failing bridge indefinitely. Should the bridge be unlinked from the
temporary list before calling drm_bridge_detach()?

Also, does moving bridges to a stack-allocated tmplist break bridge chain
iterators during the detach callbacks?

drm_bridge_detach() executes bridge->funcs->detach(bridge). If a driver
calls a chain traversal API like drm_bridge_chain_get_next_bridge() during
this detach callback, the macro checks:

list_is_last(&bridge->chain_node, &bridge->encoder->bridge_chain)

Because the bridge is currently on tmplist (a stack variable), this boundary
check fails. This causes the iterator to read past the list end, returning
the stack tmplist head cast as a struct drm_bridge *, leading to memory
corruption.

> +}
> +EXPORT_SYMBOL(drm_encoder_cleanup_from);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D23

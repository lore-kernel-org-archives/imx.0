Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631334;
	b=PN+bOy+7NdueteByMSHPs9XprXiEPedgYWqpPtiSexkVZzYaBmSvVDjFUdvTKPcVPMtY
	 aUGlYAsPiWu/rVBsXG4yUAwcDF4Wf1LMygXRRn1DGl7qHlfgyFZ/9tinsc2xc44gE0BWL
	 V+eXeT4sthduiVysjU+pq0AzqRr3tzqBJrYiidluO0Xnqi4gZ4laO9MCJJtnuiSsRR4N8
	 sxnBOlZ/xf/Zu/tL6iG0GDbUhSVPdoH1riVRGngnvJKaHcRS7+CGh+/yryYmK9lgp8yb1
	 MvDXj33S91QlMLzuCzrgb8nOo+JymlDnQLGQ+eMIuQyQiHoXFguoy90iTjHgxeSJ+gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631334;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kBLmM8S7+LArUBZJzYC3OCY4mci6rf9XWasnJyC7E7c=;
	b=DK/zS316hA7UwYkpUqbtm8o7lqzWTO/hg4DCWOwy7+eT9JPuNBg46R+GA+pOUHnD3mVh
	 knUTtXLKc48NnvY0JAQgoJ1hKyCUtdXK1WTV/RnNdqIkujKHXpFPMB7O/KykR98yuGyzT
	 Uflen2pXai6p2YDCpbLHzv8a2nN6TYY5C546fVk7xa1yz7AZXxQvFrxpxCFdXsTxX9j+s
	 35kGJMHM+0jarbXE1lPT74/XPxavQa8p7fOeGGeIDeaqMFfTF3tbwTjh8rG82BlIenw5m
	 efVW3SW+5haZv7s4U+CMKUenMa25IkRV28HczTGXjVr7SE/9mNsLQpN6ZKoernOD0GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jrSasNTU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D75D606A326
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jrSasNTU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387DA1F000C6;
	Wed, 25 Nov 2026 18:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631333;
	bh=kBLmM8S7+LArUBZJzYC3OCY4mci6rf9XWasnJyC7E7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jrSasNTUmSm7iwUgKqjp4Y6nXnQz65j/NDzhploTyY0k3EFAlQSSQMRiix5p7Dy+u
	 Lnj9h/mFPltKgV3IAo9Wr0soelb74p8ONgdQs1gBqWq512uiqpUO8x9rWhJqz/VYtz
	 /XfU2VcDIJN7Asv3nLyI/1Kk//ktLQvdNZ0XHD9+WPIMVgjkY+6asCw7+/LLewnDhn
	 l2x0FYQZWHTTV+lCLs9xTfnKDBjgwbPb7rbEYK0fgd3mjxZ4C4PFkv2CKdS1x6OENp
	 xxy0YXWEqOt3xEqKNpmaa2Re+k5Ecig8WDuDxFkwR0QeTZo10arQVCZOvwt8gbXEn8
	 H1+skzPcxRtGg==
Message-ID: <sashiko-outbox-233990@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 30/32] drm/bridge: shutdown encoder and detach
 downstream bridges on bridge unplug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261125-drm-bridge-hotplug-v4-30-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
 <20261125-drm-bridge-hotplug-v4-30-822722850492@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:28:52 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] drm/bridge: UAF of shared encoder-bridge container in
  drm_bridge_remove()
- [High] drm/bridge: TOCTOU race and NULL deref on encoder in
  drm_bridge_remove()
- [High] drm/bridge: cross-thread stack tmplist corruption in
  drm_bridge_detach_from()
- [Medium] drm/bridge: bridge left on bridge_list during detach in
  drm_bridge_remove()
--

commit ed101139b3ca92ec58e58cfca1356ce33f6b56c4
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: shutdown encoder and detach downstream bridges on bridge unplug

This commit shuts down the encoder pipeline and detaches the removed
bridge and any downstream bridges from the encoder chain when
drm_bridge_remove() is called on an attached bridge.

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index d82e81b26ace2..d942c776db1a9 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
[ ... ]
> @@ -547,9 +548,17 @@ static void drm_bridge_detach_from(struct drm_bridge=
 *bridge)
>   * it won't be found by users via of_drm_find_and_get_bridge(), and add =
it
>   * to the lingering bridge list, to keep track of it until its allocated
>   * memory is eventually freed.
> + *
> + * If the bridge is currently attached, also shut down the encoder pipel=
ine
> + * and detach this bridge and the following ones.
>   */
>  void drm_bridge_remove(struct drm_bridge *bridge)
>  {
> +	if (bridge->encoder) {
> +		drm_atomic_shutdown_encoder(bridge->encoder);
> +		drm_bridge_detach_from(bridge);
> +	}

[Severity: High]
Does detaching the bridge in drm_bridge_remove() cause a use-after-free of
the encoder in drivers that embed struct drm_bridge and struct drm_encoder
in the same devm_drm_bridge_alloc() container, such as tidss and meson?

drivers/gpu/drm/tidss/tidss_encoder.c:tidss_encoder_create() {
	t_enc =3D devm_drm_bridge_alloc(tidss->dev, struct tidss_encoder,
				      bridge, &tidss_bridge_funcs);
	if (IS_ERR(t_enc))
		return PTR_ERR(t_enc);

	ret =3D drm_encoder_init(&tidss->ddev, &t_enc->encoder,
			       &tidss_encoder_funcs, encoder_type, NULL);
    ...
}

In tidss, devm_drm_dev_alloc() and drmm_mode_config_init() are registered
before tidss_encoder_create() calls devm_drm_bridge_alloc(),
drm_encoder_init(), devm_drm_bridge_add(), and drm_bridge_attach().

On driver unbind or post-encoder probe failure, devres releases actions in
reverse order: drm_bridge_remove_void() now detaches t_enc->bridge and
drops both the attach and add references, and then drm_bridge_put_void()
drops the final allocation reference.  __drm_bridge_free() calls
kfree(bridge->container), freeing t_enc while t_enc->encoder is still on
mode_config.encoder_list.  When devm_drm_dev_init_release() later runs
drm_mode_config_cleanup(), it calls drm_encoder_cleanup() on the freed
t_enc->encoder.

[Severity: High]
Can a concurrent upstream bridge removal clear bridge->encoder while
drm_atomic_shutdown_encoder() is sleeping, causing a NULL pointer
dereference in drm_bridge_detach_from()?

CPU0 (downstream bridge B)        CPU1 (upstream bridge A)
drm_bridge_remove(B)
  if (B->encoder)
    drm_atomic_shutdown_encoder()
                                  drm_bridge_remove(A)
                                    ...
                                    drm_bridge_detach_from(A)
                                      drm_bridge_detach(B)
                                        B->encoder =3D NULL
    drm_bridge_detach_from(B)
      encoder =3D B->encoder
      mutex_lock(&encoder->bridge_chain_mutex)
        <-- NULL pointer dereference

drm_bridge_detach_from() re-reads bridge->encoder without a NULL check
before locking encoder->bridge_chain_mutex.  Similarly, if
drm_bridge_remove() races with drm_encoder_cleanup(), the encoder and its
mutex can be destroyed and freed before drm_bridge_detach_from() locks it;
and if it races with drm_bridge_attach() after bridge->encoder is assigned
but before bridge->chain_node is added to encoder->bridge_chain,
drm_bridge_detach_from() sees list_empty(&bridge->chain_node) and leaves
the removed bridge attached.

[Severity: High]
Can concurrent calls to drm_bridge_detach_from() on two bridges in the
same chain corrupt the stack list head in the upstream caller?

drivers/gpu/drm/drm_bridge.c:drm_bridge_detach_from() {
    ...
	mutex_lock(&encoder->bridge_chain_mutex);
	if (!list_empty(&bridge->chain_node))
		list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, chain=
_node)
			list_move_tail(&bridge->chain_node, &tmplist);
	mutex_unlock(&encoder->bridge_chain_mutex);

	while (!list_empty(&tmplist))
		drm_bridge_detach(list_first_entry(&tmplist, struct drm_bridge, chain_nod=
e));
}

When drm_bridge_detach_from() moves bridge A and downstream bridge B onto
its stack-allocated tmplist and drops encoder->bridge_chain_mutex, B's
chain_node is still non-empty (linked into that stack tmplist) and
B->encoder is still non-NULL until drm_bridge_detach(B) reaches
list_del_init(&B->chain_node):

CPU0 (upstream bridge A)          CPU1 (downstream bridge B)
drm_bridge_detach_from(A)
  mutex_lock(&bridge_chain_mutex)
  /* moves A and B to CPU0 tmplist */
  mutex_unlock(&bridge_chain_mutex)
  drm_bridge_detach(A)
    drm_atomic_private_obj_fini()
                                  drm_bridge_remove(B)
                                    ...
                                    drm_bridge_detach_from(B)
                                      mutex_lock(&bridge_chain_mutex)
                                      if (!list_empty(&B->chain_node))
                                        list_for_each_entry_safe_from(...)
                                          list_move_tail(..., &tmplist)
                                            <-- walks CPU0 tmplist past
                                                its stack list head

Because B->chain_node is on CPU0's tmplist rather than
encoder->bridge_chain, CPU1's list_for_each_entry_safe_from() never sees
&encoder->bridge_chain as the termination head.  It moves CPU0's stack
tmplist head onto CPU1's tmplist and passes a bogus struct drm_bridge
pointer derived from CPU0's stack frame to drm_bridge_detach().

> +
>  	mutex_lock(&bridge_lock);
>  	list_move_tail(&bridge->list, &bridge_lingering_list);
>  	mutex_unlock(&bridge_lock);

[Severity: Medium]
Should bridge->list be moved to bridge_lingering_list before shutting down
the encoder and detaching the bridge?

Leaving the bridge on bridge_list until after drm_bridge_detach_from()
means the bridge is still discoverable via of_drm_find_and_get_bridge() or
drm_bridge_get_next() while drm_bridge_detach() emits DRM_BRIDGE_DETACHED
and clears bridge->dev and bridge->encoder, allowing a concurrent lookup
to find and re-attach the bridge right before drm_bridge_remove() moves it
to bridge_lingering_list and destroys its HPD mutexes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-drm-bridge=
-hotplug-v4-0-822722850492@bootlin.com?part=3D30

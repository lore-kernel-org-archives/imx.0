Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630327;
	b=gDK9Ck3KwO0kaEub2mkIB457F+E6VI8eLlcByEJAX6i7uOo7L9tQjiBp+BAfqgVpib7K
	 HB2OAv2ZSeRGplQ3AlgVcQgFWEaQiQDW7AEigU0ZLwal09IU9kyS1nIwlh49+Jb/cFirq
	 vG0lxQXtOVwlwKsMffjCfek+8oYIcnjnYUhfXwilIB7aaQ3NBefR4yNU1u789p3ACYAvW
	 u5TX751Cv6t8cLqCD56Q5tccoXfcoPQrg0gtmdEHl9OQZztXtLcUxDUG4pcemkP4W4N9n
	 y//PNBUYqOarcD1gbS7zc4HYTRvfhcYsBLEEXQkoJOsH7PafwwlapT3Q+71iMUm+fxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630327;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FdtKe+UtIBioXqmGwjWgR7+kCcSV7e1NnFJPjab9dUQ=;
	b=4/2ZTHhrMjlafcPwFL3aSvhme/9kpci45Kf3JTl3mCnMrpMkEFfI9o2cMlDUoqVBxT+K
	 DPhx9s0jJIh6isb3uaxgGK7GP/VjUiDmndgf4hPkDVfHKzvVxtXPetE4MH1ifVuMmxFW+
	 1Spqf4ol5vgajrbzcq4B1Zww7h9VgwgzZ3kX+7LpL7TP0hCyogBwLxpYko7nA5Bi38Wdw
	 gLVmp7go66R7WajVcVv5wR76YXqx431zseZqeFzVJ2uqiWPmSaNDGTBLPNP+9qyFHy7r6
	 hmbtRWV70oa9mSk28LcqBQk4Diqh6ydnQVV5r6PAz1SYBlR81Yx0k4a2iXOElhZq7UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NsHr6zGZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E1B606A683
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NsHr6zGZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8CD1F000C0;
	Wed, 25 Nov 2026 18:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630327;
	bh=FdtKe+UtIBioXqmGwjWgR7+kCcSV7e1NnFJPjab9dUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NsHr6zGZZXW8tPnk5vgzmaV9J93Gff+fnE88QL0Q0llXDzf2Bhsy8QRZf/dpYMdqM
	 vzSOBZyPeVtkUryykWokRX4uHMpeSMxIb7rU6k10/qFpxABh+CCBCbMt5wj+pXc8/L
	 KYURsAgVsynVNrLbWGxDMPY1iJbyH7uEVORDqLIg9b8cMA/5lluhuF5LvnPNXXTPKI
	 9MKPVYFUpy/Gdp559UP0/xC6qv+fSM80F1/Fg9fzPjsKP22Qwjait8pRVX1leLiaLD
	 6K67rNL991c50GDEPmRvuhtrj9ItCDaki2DLpgMja49APNOeW7zWDJEwzW0Tt68lTe
	 hBh7KjzaY1sMA==
Message-ID: <sashiko-outbox-233922@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 15/32] drm/atomic: drm_atomic_private_obj_fini:
 protect private_obj removal from list
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261125-drm-bridge-hotplug-v4-15-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
 <20261125-drm-bridge-hotplug-v4-15-822722850492@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:12:07 +0000
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
- [High] drm/atomic: race on obj->lock after unlock in
  drm_atomic_private_obj_fini()
--

commit 3a87086f7fda1b1abd7935fa8244d82c32bc24a2
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/atomic: drm_atomic_private_obj_fini: protect private_obj removal from l=
ist

This commit wraps the list_del_init(&obj->head) call in
drm_atomic_private_obj_fini() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END() to serialize private object removal against
concurrent modeset locking.

> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 1c3fe07b327ec..096f85419b369 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1106,6 +1106,9 @@ EXPORT_SYMBOL(drm_atomic_private_obj_init);
>  void
>  drm_atomic_private_obj_fini(struct drm_private_obj *obj)
>  {
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret =3D 0;
> +
>  	/*
>  	 * Some callers ignore drm_atomic_private_obj_init() failures
>  	 * and unconditionally register a teardown action that calls
> @@ -1117,7 +1120,10 @@ drm_atomic_private_obj_fini(struct drm_private_obj=
 *obj)
>  	if (list_empty(&obj->head))
>  		return;
> =20
> +	DRM_MODESET_LOCK_ALL_BEGIN(obj->dev, ctx, 0, ret);
>  	list_del_init(&obj->head);
> +	DRM_MODESET_LOCK_ALL_END(obj->dev, ctx, ret);
> +
>  	obj->funcs->atomic_destroy_state(obj, obj->state);
>  	drm_modeset_lock_fini(&obj->lock);
>  }

[Severity: High]
Can a thread that already observed obj before list_del_init(&obj->head)
acquire obj->lock as soon as DRM_MODESET_LOCK_ALL_END() drops it, racing
with atomic_destroy_state() and drm_modeset_lock_fini()?

For example, if drm_modeset_lock_all_ctx() hits -EDEADLK on obj->lock
(because another atomic operation holds obj->lock), modeset_lock() saves
&obj->lock in ctx->contended and drm_modeset_backoff() drops all held
locks, including connection_mutex, before slow-locking contended:

CPU0                                  CPU1
drm_mode_obj_get_properties_ioctl()
  DRM_MODESET_LOCK_ALL_BEGIN()
    drm_modeset_lock_all_ctx()
      drm_modeset_lock(&obj->lock)
        ctx->contended =3D &obj->lock
        returns -EDEADLK
  DRM_MODESET_LOCK_ALL_END()
    drm_modeset_backoff()
      contended =3D ctx->contended
      drm_modeset_drop_locks()
                                      drm_bridge_detach()
                                        drm_atomic_private_obj_fini()
                                          DRM_MODESET_LOCK_ALL_BEGIN()
                                          list_del_init(&obj->head)
                                          DRM_MODESET_LOCK_ALL_END()
      modeset_lock(contended, ...)
        list_add(&obj->lock.head,
                 &ctx->locked)
                                          atomic_destroy_state()
                                          drm_modeset_lock_fini(&obj->lock)
                                            WARN_ON(!list_empty(&lock->head=
))
                                        ...
                                        drm_bridge_put() -> kfree(bridge)
    drm_modeset_drop_locks()
      /* touches freed obj->lock */  <-- use-after-free

The same race occurs if another thread blocks directly on obj->lock
without holding connection_mutex, such as drm_atomic_get_bridge_state()
while bridge->chain_node is still on encoder->bridge_chain (since
drm_bridge_detach() unlinks chain_node after drm_atomic_private_obj_fini()),
or __drm_state_dump().  When DRM_MODESET_LOCK_ALL_END() unlocks obj->lock,
the waiter wakes up and duplicates or reads obj->state while
atomic_destroy_state() frees it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-drm-bridge=
-hotplug-v4-0-822722850492@bootlin.com?part=3D15

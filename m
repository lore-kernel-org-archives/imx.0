Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141452;
	b=iRc0oC4EwCQiUgZMFiFIwoJd7VEXLo7TVQESHb3OjlrICBRuFvuAoyxnq0W9EGoBRPDV
	 iiOB10eoLhJuPalX12TdcZyzMTRhWM4kPb1k0KotI/EyMIcAbua7h5rpxQplvA16oLwQT
	 DvhgV/6+8nNUvKRAgumlA//7lfurT83aoAaHjPql1KsR8VOTTKRyOBkotgCZVj9hl0/wB
	 0zhg3Ewc4tV/X4/xWYADdU2RTLPlDhQw/Scpmud63Hwx5pgaVszGJ9vAwjGLi9jaUPwog
	 7CrfQkEYUS6ZdzrsXYUj+7eyuR/AQtEOeNe52a0Uu+PNdQy+ITSc1kKm4P0hcJhUGmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141452;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wtqhuCAhz0EmO+3zYRfVGhM8rJcwLvDnaKbqoAkLTQo=;
	b=dem0sMcNH5Y6aJDMLxhFtiyAPv6/hpXFmJLqmCf3tnKTklcDWGAYu0XlVDo9QHVMqVj5
	 KrdK70Bcfw3E/klSG3q3cvO03HMfs69GFXOTtMpTrd7x2IxAW+C7nfMIYtuFgOugHef3S
	 gu9WuyOlhjRHgFPQBebkoR3VVzSN+Ye4G/VxdqiBgbIoIQ056m/pBrmKbrLfS+Mjk2AlR
	 9IcNfZ7BTqozbeVuOlO4XUQ6PG0zANuNMgutaO8tXrbdcPyRHIGnLsKn0LzbEDhGkZLcD
	 GC0kjokkPmvRUuwCcBMhZX1zeJMU4E0sROX2bD3dMi7bX4ZthpVOCDhBTkcUrlaElAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHgWGgbI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E52C606A31C
	for <imx@lists.linux.dev>; Sun,  8 Nov 2026 12:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHgWGgbI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A4C1F0089F;
	Sun,  8 Nov 2026 12:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794141451;
	bh=wtqhuCAhz0EmO+3zYRfVGhM8rJcwLvDnaKbqoAkLTQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RHgWGgbIdxmacCsuJgJIt5BIwjVmF+AIsRBkSW2uFI0d1Rk9KlRcnnWSqZGbS5Edm
	 Q9yyQ4TDx/oVcjk9G1PR4ZSUH+7S8VmeO3L7/24Z3k/4WIFIztaitOqcWVXfxiKPz9
	 wqnYx8ysxylB1tu5psbyO3Xx3K7cXxWsJjzEj/ekGLHIorUzd72Ui9DqzKeDxq7rqx
	 2WLpxxrdg/9xh8ulndzSfeFcMkFaMNOUejEHMx3tgit8ixvZ9bkRyK28EqdEahO0vl
	 pIShil5ShZ9EQSC24G396I8BINMLrQG2BtS21hh853CABrIQ93Zear68IHCGehw8bM
	 05XPDx/qkmm9Q==
Message-ID: <sashiko-outbox-203735@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/mxsfb: Complete page flips only once the new buffer
 is latched
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Gmeiner" <christian.gmeiner@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261108-mxsfb-flip-latch-v1-1-ad816b23b646@igalia.com>
References: <20261108-mxsfb-flip-latch-v1-1-ad816b23b646@igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 12:37:30 +0000
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
- [High] drm/mxsfb: premature plane cleanup in
  mxsfb_crtc_handle_vblank()
--

commit c09da195fd06536925306459ef31e61d236a956a
Author: Christian Gmeiner <cgmeiner@igalia.com>

drm/mxsfb: Complete page flips only once the new buffer is latched

This commit holds the pending vblank event in mxsfb_drm_private and
sends it from the vblank interrupt handler only once CUR_BUF matches
NEXT_BUF (and AS_BUF matches AS_NEXT_BUF when the overlay is enabled).

> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mx=
sfb_kms.c
> index bbc2a2df9f161..c7e516758a1ae 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -328,6 +328,7 @@ static int mxsfb_crtc_atomic_check(struct drm_crtc *c=
rtc,
>  static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
>  				    struct drm_atomic_commit *state)
>  {
> +	struct mxsfb_drm_private *mxsfb =3D to_mxsfb_drm_private(crtc->dev);
>  	struct drm_pending_vblank_event *event;
> =20
>  	event =3D crtc->state->event;
> @@ -338,12 +339,54 @@ static void mxsfb_crtc_atomic_flush(struct drm_crtc=
 *crtc,
> =20
>  	spin_lock_irq(&crtc->dev->event_lock);
>  	if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> -		drm_crtc_arm_vblank_event(crtc, event);
> +		mxsfb->event =3D event;
>  	else
>  		drm_crtc_send_vblank_event(crtc, event);
>  	spin_unlock_irq(&crtc->dev->event_lock);
>  }
> =20
> +static bool mxsfb_crtc_buffers_latched(struct mxsfb_drm_private *mxsfb)
> +{
> +	if (readl(mxsfb->base + mxsfb->devdata->cur_buf) !=3D
> +	    readl(mxsfb->base + mxsfb->devdata->next_buf))
> +		return false;
> +
> +	if (mxsfb->devdata->has_overlay &&
> +	    (readl(mxsfb->base + LCDC_AS_CTRL) & AS_CTRL_AS_ENABLE) &&
> +	    readl(mxsfb->base + LCDC_AS_BUF) !=3D readl(mxsfb->base + LCDC_AS_N=
EXT_BUF))
> +		return false;
> +
> +	return true;
> +}
> +
> +static void mxsfb_crtc_finish_page_flip(struct mxsfb_drm_private *mxsfb)
> +{
> +	struct drm_crtc *crtc =3D &mxsfb->crtc;
> +
> +	drm_crtc_send_vblank_event(crtc, mxsfb->event);
> +	drm_crtc_vblank_put(crtc);
> +	mxsfb->event =3D NULL;
> +}
> +
> +void mxsfb_crtc_handle_vblank(struct mxsfb_drm_private *mxsfb)
> +{
> +	struct drm_crtc *crtc =3D &mxsfb->crtc;
> +
> +	drm_crtc_handle_vblank(crtc);
> +
> +	/*
> +	 * The controller copies NEXT_BUF to CUR_BUF at the end of a frame. If
> +	 * the commit wrote NEXT_BUF after that point, the new buffer is only
> +	 * scanned out from the next frame on. Complete the flip only once the
> +	 * hardware has latched it, otherwise userspace gets back a buffer that
> +	 * is still being scanned out.
> +	 */
> +	spin_lock(&crtc->dev->event_lock);
> +	if (mxsfb->event && mxsfb_crtc_buffers_latched(mxsfb))
> +		mxsfb_crtc_finish_page_flip(mxsfb);
> +	spin_unlock(&crtc->dev->event_lock);
> +}

[Severity: High]
Can calling drm_crtc_handle_vblank() before the new buffer is latched
cause drm_atomic_helper_commit_tail_rpm() to clean up the old framebuffer
while it is still being scanned out?

mxsfb_mode_config_helpers uses drm_atomic_helper_commit_tail_rpm(), which
waits via drm_atomic_helper_wait_for_vblanks() rather than
drm_atomic_helper_wait_for_flip_done():

drivers/gpu/drm/drm_atomic_helper.c:drm_atomic_helper_commit_tail_rpm() {
	...
	drm_atomic_helper_commit_hw_done(state);

	drm_atomic_helper_wait_for_vblanks(dev, state);

	drm_atomic_helper_cleanup_planes(dev, state);
}

When a commit writes NEXT_BUF just after the end-of-frame copy, the next
frame-done interrupt sees mxsfb_crtc_buffers_latched() =3D=3D false and def=
ers
mxsfb_crtc_finish_page_flip() (leaving commit->flip_done unsignaled).
However, drm_crtc_handle_vblank() still increments the vblank count and
wakes drm_atomic_helper_wait_for_vblanks() on that unlatched interrupt.

commit_tail() then immediately runs drm_atomic_helper_cleanup_planes() and
drops the old framebuffer reference while the LCDIF DMA engine is still
scanning it out from CUR_BUF for another frame.  For a blocking commit, it
also returns to userspace before commit->flip_done is signaled, causing an
immediate follow-up non-blocking flip to fail with -EBUSY in
stall_checks().

A custom atomic_commit_tail that calls
drm_atomic_helper_wait_for_flip_done() instead of
drm_atomic_helper_wait_for_vblanks() would keep plane cleanup and commit
completion synchronized with mxsfb_crtc_finish_page_flip().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-mxsfb-flip=
-latch-v1-1-ad816b23b646@igalia.com?part=3D1

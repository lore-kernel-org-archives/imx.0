Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515769;
	b=vonVPefwFKY2H+ia6Q8YJY+uz2Xp2bkk+hJ/fwQ769IpmGf/FaTG2V6mBkRbbBN4fAIJ
	 G7zqj9vlHpM0E/FjkbO6p6mF4BQzqC/8IB0A1pkIbBDTorGj9F9zgLEWo49AP7p2X57Rw
	 L3njDfNiUEY0HPIByYAOVvoPQgFPYx6RoUyIep3pt1x3Kq2BfkL6lT1hDDTJawXgPaOlE
	 v5vF0GbcNLNv2C0dAm6th8HPyBkJ5U8c82UTFp/Q6bupxzvypRWeUlPv8lhEDNkeZ4ItJ
	 EXWu3JhtRcejXQDwLVsreOTbzsJQVZ7EUaWd7xHetJUEFgrCcwBwk/tRsCv/FGJwVYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
	b=a3iZR0Ghzu/n7yc5T3+woG/hfADXwRebHZhKf9ZAwvztmKLudyH0/XxpQe6cSByhdwbA
	 9z0EcIMNEv38tkGOSIH8IuLN2UjEXnA+ZMHrAdpIV6TcWd5iq61DlptrVxkQ83j/IRnfc
	 My/jhwgVp59Ky19VcGUTEBfw7LvDEHPDlXC+8nJjnEheRgX7jSEN156AQ3MbPzPhyvZ1n
	 82VZoRNxNlWWrz8yC9lAur+P6MjX5JHBVh3JG907zmZ8AXVZZ7KLcEKuwMMv+e6l7mEjc
	 7ZpgudsaJ+D9Kh07TbAwoC7GTLEg8Q5YEibN9PLz3qqz5cqM+mFZcWIyZlxjwpNT+yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E73HZq1A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18366606A321
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 10:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18366606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E73HZq1A
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67db8985419so5338451d50.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 02:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515768; cv=none;
        d=google.com; s=arc-20260327;
        b=g3pYLjISel6yGrIpYqCRvfn4JElHybrBinx3nnba4qPhS+mpecjMycSRUkalz90803
         LFx99neanu872/PzoRcDw44iYqv4ov32Sif4FwjuAz30vhNTMG1UUnnGiG6SQJjadwtN
         Amkd7BNGx9qg7m281egM5SFysY7T1c1imanXJ6sLTdhqO/vUk7gmeecfqyLXU/J/h94v
         t8y51yPVAJXChfQ+dP2+sz5qEkdDqlOiigynIityUUZsQak9f4OerGrUVobxYDAAjolq
         ckeBwOVqm+ZNQ6T6LkjBAdijWJw1GvyV1n8+uDxxkuXF16LcvbDxkoyYy4IG3/Kb6y7a
         90Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
        fh=lJrySuB20R4gHTq5ukwgsGNs76vDZ9+pGtsWCMvOHm0=;
        b=W15c2Gb1NoXzblK4DJEAVZEAAK4PYv4q9wCzRe4NrV5GTfg2pxyBuLNNSXTVm+TRdN
         ElVavyxrvjfZ4tMrBNK1supwRP40zxm3bMtuwxtUeHqRcQc6647YYsg+hBMgs4kCrDkF
         cfoniQV9b0QapG+W4wb9FsMZdWXGOnK7ex7oOC5ZUPdhvQw4fR5IVZro3kMxnX5Tgkt1
         S/z7gDINiOk0Y5uYSqfb76ZEghUcSgZk21bkROMHOOopUe5QOyXUxfRE6fKPLFoCT0yU
         +W1yXGjec8806nMhxqy2YE0vxkfFXUH95iJEvlWopnNWPv1/OnqaoLP1eTB18gIL6Iul
         u9Bw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795515768; x=1796120568; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
        b=E73HZq1AZY3A8zSMUOQwiVHyNHj0Fu64cjfjT0o9KkBQXei17HjJJ73maDXhcXtv0O
         0IQN02+9u0aWg1sAvTCBqdydEqvn9w8IEpmEO2IUG2eAcmYjaDy7oYS+IyKtkszfOBFl
         7eUl1lnfy4Z8MioWV3d/myqP6dlg7gUa/T1g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515768; x=1796120568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
        b=j1LzWCkN+OZWEQXYWflctEdMtkeOzJNURc898Fy1zYn9gW1gMYORpSG7Z/jhFLq/xR
         dpuLU09ljBcL3AB2mMa/WVl2OMvsS9kiORbJS6mKPOAgyvVeMEitBwAbqWqVdvXNDEiv
         QMCHRnPrWk0sKL46m9lCSJGWGWjPT2Qdvxh3lygy74XqwokehxAKeRAOGdnb39voO4Qz
         qNXAK2hZGUEfaZPJzag7loFk8Ir/PdgxSVSjMZBy3OR+IoCxOOI7aTVVRXCpBg9RRk7R
         kqMsEjOwZufXTQxKzaXHK6JiVs8AzUEA3VaWGgMxeNEQck6TLNItP/kLozxZCU0Xli9X
         dyCQ==
X-Forwarded-Encrypted: i=1; AL+hErGlehU4x8hzmE8/U7xAcV8dggFN8NDGFJ0IhmFvUtspdwfvYFGP5p8nPuydjZhLI8PR1tI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8int97PRk2pSzyLM25/hHcIj/c2JsWTzUOakK5NI2kjFZ6XbSP
	qyg1sSMKngtDQrbDUKvG6tFfvm1MliRt2D3b7iPM/FBek8bgTa5FNpla/pS/b4jh7mroR2l21nG
	4pIVGdyMjjKXGYjE1u2Z7bgDaBZKbelnNSrAj5k08
X-Gm-Gg: AZFdTZdt/BUSEu8uYdBUY8rr9b7u/UrOlK+E2EPjT9j7Y+YwKCiAAghqdZuZgsJYf9F
	dpVI+hJY/WOyMhPOVzXsVVr9JbwhIYl+7457rCnnYq0v4P3RHL6V1+WboEP1UTK1My/XGrdIpQB
	+w7VvfB+LbEoxMZOWgDChd/b/UTLhw38ffbCEKAPRmos4wmWXFUCfxRINWnBVDi5naeNxKWsOEd
	zFXQFVV03xihwL4Oe2GRs/1FnbaAz2WWu6ZCBPasiD3d1thIDSfu/9l/HFdRwDeSuJsfriE04Mm
	zHqG9Bp9VuOTLWfNEkLUWZ86DWB/M1N5R5ibxm7pGFeW4xohsjgSo4mm9pWpwcbbaaexXIuKlD6
	lZRtJKQHCQzde0GAOecj1JBEZczA5khPq57NHHVSdETroe6dtwmZq8CiD14aYSA5teHM=
X-Received: by 2002:a05:690c:6e8c:b0:8a8:7e5a:dc2f with SMTP id
 00721157ae682-8b5204440fdmr67264947b3.12.1795515768163; Tue, 24 Nov 2026
 02:22:48 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261124074041.115251-1-wenst@chromium.org> <20261124074041.115251-3-wenst@chromium.org>
 <19cd5949-05dc-4107-bd2b-d8ad1e2332eb@suse.de>
In-Reply-To: <19cd5949-05dc-4107-bd2b-d8ad1e2332eb@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Nov 2026 18:22:37 +0800
X-Gm-Features: Aa3M54pNfcesZWo4EiEVJfs9QKzf9OEio3h9s-Qk4g3wBzB4RP2yK5vRHxNLzEQ
Message-ID: <CAGXv+5HSV7MJ96qTcOp+JaKWtmmYYWAmDROrT18pZ9PztNCJ-g@mail.gmail.com>
Subject: Re: [PATCH RFT v3 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Liu Ying <victor.liu@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 3:57=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 24.11.26 um 08:39 schrieb Chen-Yu Tsai:
> > drm_fb_dma_get_gem_addr() returns the DMA address to the "unclipped"
> > framebuffer. However some display drivers want the "clipped" framebuffe=
r
> > instead, as they are also using the clipped coordinates to program the
> > hardware.
> >
> > Some of these drivers are open-coding drm_fb_dma_get_gem_addr() with
> > the source coordinates replaced, while others have been incorrectly
> > converted to using drm_fb_dma_get_gem_addr(), which would end up
> > causing incorrect parts of the framebuffer to be displayed if it were
> > somehow clipped.
> >
> > Add drm_fb_dma_get_gem_clipped_addr(), a "clipped" version of
> > drm_fb_dma_get_gem_addr() for these drivers to use.
> >
> > Cc: <stable@vger.kernel.org> # dependency for next patch
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Use new drm_framebuffer_get_block_offset() helper
> > ---
> >   drivers/gpu/drm/drm_fb_dma_helper.c | 37 +++++++++++++++++++++++++---=
-
> >   include/drm/drm_fb_dma_helper.h     |  4 ++++
> >   2 files changed, 37 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_=
fb_dma_helper.c
> > index ab0f37d8a5ff..0aaf4926db4e 100644
> > --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> > @@ -60,15 +60,16 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(s=
truct drm_framebuffer *fb,
> >   EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
> >
> >   /**
> > - * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, =
for pixel
> > - * formats where values are grouped in blocks this will get you the be=
ginning of
> > - * the block
> > + * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped fra=
mebuffer,
> > + * for pixel formats where values are grouped in blocks this will get =
you the
> > + * beginning of the block
> >    * @fb: The framebuffer
> >    * @state: Which state of drm plane
> >    * @plane: Which plane
> > - * Return the DMA GEM address for given framebuffer.
> >    *
> >    * This function will usually be called from the PLANE callback funct=
ions.
> > + *
> > + * Return: GEM DMA address for given framebuffer, unclipped.
> >    */
> >   dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
> >                                  struct drm_plane_state *state,
> > @@ -86,6 +87,34 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_frameb=
uffer *fb,
> >   }
> >   EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> >
> > +/**
> > + * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for clipp=
ed
> > + * framebuffer, for pixel formats where values are grouped in blocks t=
his
> > + * will get you the beginning of the block
> > + * @fb: The framebuffer
> > + * @state: Which state of drm plane
> > + * @plane: Which plane
> > + *
> > + * This function will usually be called from the PLANE callback functi=
ons.
>
> You should mention what clipping means in this context. It's not obvious
> what it's clipping against. Or maybe point to other docs that explain it.

What about:

/**
 * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for the start
 * of the visible (CRTC-clipped) part of the framebuffer
 * @fb: The framebuffer
 * @state: Which state of drm plane
 * @plane: Which plane
 *
 * A plane may be positioned partially off-screen, in which case it gets
 * clipped to the visible CRTC area by drm_atomic_helper_check_plane_state(=
)
 * (populating the clipped coordinates in &drm_plane_state.src and
 * &drm_plane_state.dst). For example, if a plane extends past the left or
 * top edge of the screen, only its right and/or bottom portion is visible.
 * Drivers whose hardware cannot clip by itself (i.e. accept negative
 * destination coordinates) should use this helper instead of
 * drm_fb_dma_get_gem_addr() so scanout starts from the visible portion of
 * the framebuffer.
 *
 * For pixel formats where values are grouped in blocks, this returns the
 * beginning of the block.
 *
 * This function will usually be called from the PLANE callback functions.
 *
 * Return: GEM DMA address for the visible part of the framebuffer.
 */

> > + *
> > + * Return: GEM DMA address for given framebuffer, clipped.
> > + */
> > +dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
> > +                                        struct drm_plane_state *state,
> > +                                        unsigned int plane)
> > +{
> > +     struct drm_gem_dma_object *obj;
> > +
> > +     obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> > +     if (!obj)
> > +             return 0;
> > +
> > +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane=
,
> > +                                                             state->sr=
c.x1 >> 16,
> > +                                                             state->sr=
c.y1 >> 16);
>
> I had to look several times to spot the difference to the regular

I suppose I should add a comment to make the difference more visible:

    /* Use clipped source coordinates state->src.[xy]1 instead ->src_[xy] *=
/

> helper. In any case
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

If the changes above are acceptable to you I'll send out a new version
with your tag kept.


Thanks
ChenYu

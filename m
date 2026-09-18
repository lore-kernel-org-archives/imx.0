Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BFF49CF59
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715234; cv=pass; b=VUX0j4fwoAscTn0NrzROYmg8rHo48gfRvboutOly3cCWzK+owv4aRN3whj9XJhRnEB4wpG0alEe2jM3qL7jH05KDCOtO9Tlc+S4gRiOXz2JpsJjHXUBD5PPagosiqLc99UeIKDquN/QkInUApldm8n9zUyWHFpS/I4yFdXwEZ9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715234; c=relaxed/simple;
	bh=hnGmBkKP9ldG990awhuRYySkLT6FFnTZIuKmIFeC1Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tRjRh/5Ii31v1LHCPaWvkPwqh26MNtDPRk164lrq5tRE0TpSycpioHCTuiY5jbPu0x86ESOHed8OGHDwFkhXCpASpBRKLLrXgjEIKu1RkmfOxGz9/hunwnQ37rTUYESEKBkTVqm7JMWkYwdxETOtG6vkw+Rk/LcIplGbKcnIy2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WJJE+0Mt; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WJJE+0Mt"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-66e4aa8d881so444405d50.1
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 00:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789715223; cv=none;
        d=google.com; s=arc-20260327;
        b=L1GJtm0QlM6ZGRSp/4HdbUb4rPvf0odqn7TNcu8qkpv+4BGaXfdx/IPOK0G04/etAw
         05NDsmOnifKBEV2oriv1Rhd6n5EIs/SzQPeX/XWgoEdWwx2LzJ5kWB+a6WYR1hKRdzgs
         GKJEW47qrwikysnCYhPTrxSD3K30zgl2SxpqAPoyNYxD6hVW4ZAi/ya9bf0ok5jp9gsw
         dD6FHWdBBZqriXGid5HmMGnaWQiXL2IFrOcnt/mptNH25VmDxDSMY9g/q0OQFApLNhZI
         9TUlwsVh7QeQlmTTQgCpxleH3uvfFzD9V0Uxj0Cj4qBG1oujmx9EHaEyLhhINqryvvdy
         gDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZVTLUeibsWBPZCdD+qqGVF/fmQVK7DA4WjMhu8zs7u0=;
        fh=m1opbvAyvDl4k8M5nCaurVeT7saCka2HtuG3XgPFgws=;
        b=KXfIagN4ZlaqabrcdzctxysceIt0/BZsF10EKrxDsvubatpJ6QW0isZFVXYO25oHPW
         YQWLF6QVn6gY6A38vXSnfwRgtME0aZRqUeYZypSkp+vBnt20avzKT9akp6tqBYbfrTho
         NwoaQz5l2YvVNwCYVPUKtbPnGAzpwRWgbijJlTHA6mK2utNxbuWjD/mOhQaoopbFTx52
         kE8CDzHW5y5VU43YGsWvcB6v7AvwFxsBOg6btXzR1Dr2/OlRzx7PF/ILfbcMyArHwlNQ
         ixOf62nk0KXylzCmwRKVXDeqsqY0FF66VxAFkdV5sswP4hvg3XtALYB3uW3t8Bv0w/5e
         9IeQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789715223; x=1790320023; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVTLUeibsWBPZCdD+qqGVF/fmQVK7DA4WjMhu8zs7u0=;
        b=WJJE+0MtbBwQJMbBdYRFjNqvzY1PLEfcKCmo2knoBdKA4K9hrJRrHS83ehaiNpdiyw
         m9ZkriRyVHdO5qq4CEc94iJwMKO70FT6d+Ge1qo2Wa7iuwe80fD58SI82vBOOEHAgcv5
         Tx85Gots8bR2HkEe3xETJloYkY8kkV6a9YbgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715223; x=1790320023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVTLUeibsWBPZCdD+qqGVF/fmQVK7DA4WjMhu8zs7u0=;
        b=m8C5Q1n8EqvGF8OHCWUB68YzWaWmSsJDC3zXGua04RhFxQLL3a8AbFf4ilZ8MFkwaM
         1Zxd/jFh0xEKeg1FPRs2HbSgrOuqd/EjWxvq0fhtbUXIj7xe2CifUODOiWNXUK92Odhw
         U/O1j/xXgDgjFSywgFq+1ydk9UwOJkaYhGk5cR1Kj8IKCzdHrO2ZJqWfAT89//h8+PZ+
         B7KRZIDNsIV5gyAT+6R4hMFAuoZLWnRH/NM3nHzMEx7YDVke8UbwfZjLYl/ViiYmI39r
         z76DahNxO6m4Bh+3edy0n5aSxRFPmzSMJkM/BA9BQMmUtz5oRQB7MyD1dGELRsjO9svV
         XXlA==
X-Forwarded-Encrypted: i=1; AKwUvByjDsx7Zsq+GkbTtVyJ1jgI9iK75V/A2/SHIMOv7wURBG6w9HXJBiBSZhIVCkI2mwHEpJQ=@lists.linux.dev
X-Gm-Message-State: AFuF++k+4r4P2gjiRCd6/EOBNEt1LlFf+guXAT4uaAryca7QzBCOsp6y
	RDL4+ZaxFphrh+VcDkyIKSoQhbGlUjagvUkMkswH7jyTJYIwaPoORaV1nhcQwRAww57y8aNvsGv
	M3tHrodHrN8A+bcnlqGlAxZPTAlNYc3sk+d6Lk90q
X-Gm-Gg: AYBFou1npHJKnCMp2LYKVcfqjE90C3dMmQDjjZfQh6inXNFg0fLxeAI3SKkmFRWgy7L
	h/1DwNDtBYAXrZTHjH/gqxYc3qjXl1C4HNr6KT6JiI7P82fV+Fy5gHD5XS+uZPkCblk/94jYFkE
	pIWaAOkGjv50ENT0DPWqioIxYarPa8Y38wBLILAeiH5rnhZ+FXup5O8YwkjTDCtzOuJBtMCSnvD
	s0gUKJl9jRo4pReI5rPFTSIRo0iNvEa3moa8RShn19AspAjUgw2KDNDCJ/IXc0UAv4v09VwEFk6
	ypbq1Xbky3RXyrAxQO++dAwaVTyW5v9zX9tCovsLMKBsGVLdUuBwjhKwHoVOAeAf3AzvEA61KNc
	khbD6BaRjvw==
X-Received: by 2002:a05:690e:c4d:b0:671:7b0:e5ce with SMTP id
 956f58d0204a3-6717fdf1073mr497902d50.75.1789715223118; Fri, 18 Sep 2026
 00:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <20260916033327.3054126-2-wenst@chromium.org>
 <f6ace486-70d8-4e81-89cb-e9d55ad9ac8b@suse.de> <CAGXv+5ErgWVNtnRiW+QA7+Mzh=W_Y+HGL_iRa1fOaXCYSoAwMA@mail.gmail.com>
 <f7fa4c4c-bc59-4822-94bb-6e9d68f8f0ca@suse.de>
In-Reply-To: <f7fa4c4c-bc59-4822-94bb-6e9d68f8f0ca@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Sep 2026 15:06:51 +0800
X-Gm-Features: AcwNN1VLg__gblp0p9qUFHinFpHutsjL-_8trTnXduaSEQp1OhTN0-X1tjhNQaU
Message-ID: <CAGXv+5GNjKxzHuBn28PbRtbFA1yuJ7h02xDpght4add3emuKJg@mail.gmail.com>
Subject: Re: [PATCH RFT v2 1/5] drm: Split framebuffer pixel offset
 calculation from drm_fb_dma_get_gem_addr()
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

On Fri, Sep 18, 2026 at 2:41=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 18.09.26 um 06:16 schrieb Chen-Yu Tsai:
> > On Thu, Sep 17, 2026 at 11:20=E2=80=AFPM Thomas Zimmermann <tzimmermann=
@suse.de> wrote:
> >> Hi
> >>
> >> Am 16.09.26 um 05:33 schrieb Chen-Yu Tsai:
> >>> Currently drm_fb_dma_get_gem_addr() calculates the offset into the
> >>> framebuffer memory for the framebuffer's unclipped source coordinates=
,
> >>> adds that to the framebuffer's backing storage, and returns the resul=
t.
> >>>
> >>> We are about to add a variant that uses the clipped source coordinate=
s,
> >>> so there is already some reuse of code. However, calculating the data
> >>> offset for a given pixel is not specific to the DMA FB helpers. The
> >>> offset is only related to the framebuffer.
> >>>
> >>> Split out the offset calculation into a new framebuffer helper so tha=
t
> >>> non-DMA users can also reuse the same code.
> >>>
> >>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Cc: <stable@vger.kernel.org> # dependency for next patch
> >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>> ---
> >>> Changes since v1:
> >>> - New patch
> >>> ---
> >>>    drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
> >>>    drivers/gpu/drm/drm_framebuffer.c   | 45 +++++++++++++++++++++++++=
++++
> >>>    include/drm/drm_framebuffer.h       |  3 ++
> >>>    3 files changed, 51 insertions(+), 25 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/dr=
m_fb_dma_helper.c
> >>> index fd71969d2fb1..ab0f37d8a5ff 100644
> >>> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> >>> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> >>> @@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_fra=
mebuffer *fb,
> >>>                                   unsigned int plane)
> >>>    {
> >>>        struct drm_gem_dma_object *obj;
> >>> -     dma_addr_t dma_addr;
> >>> -     u8 h_div =3D 1, v_div =3D 1;
> >>> -     u32 block_w =3D drm_format_info_block_width(fb->format, plane);
> >>> -     u32 block_h =3D drm_format_info_block_height(fb->format, plane)=
;
> >>> -     u32 block_size =3D fb->format->char_per_block[plane];
> >>> -     u32 sample_x;
> >>> -     u32 sample_y;
> >>> -     u32 block_start_y;
> >>> -     u32 num_hblocks;
> >>>
> >>>        obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> >>>        if (!obj)
> >>>                return 0;
> >>>
> >>> -     dma_addr =3D obj->dma_addr + fb->offsets[plane];
> >>> -
> >>> -     if (plane > 0) {
> >>> -             h_div =3D fb->format->hsub;
> >>> -             v_div =3D fb->format->vsub;
> >>> -     }
> >>> -
> >>> -     sample_x =3D (state->src_x >> 16) / h_div;
> >>> -     sample_y =3D (state->src_y >> 16) / v_div;
> >>> -     block_start_y =3D (sample_y / block_h) * block_h;
> >>> -     num_hblocks =3D sample_x / block_w;
> >>> -
> >>> -     dma_addr +=3D fb->pitches[plane] * block_start_y;
> >>> -     dma_addr +=3D block_size * num_hblocks;
> >>> -
> >>> -     return dma_addr;
> >>> +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, pla=
ne,
> >>> +                                                             state->=
src_x >> 16,
> >>> +                                                             state->=
src_y >> 16);
> >>>    }
> >>>    EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_=
framebuffer.c
> >>> index d32aceb6ca9b..9e1231162047 100644
> >>> --- a/drivers/gpu/drm/drm_framebuffer.c
> >>> +++ b/drivers/gpu/drm/drm_framebuffer.c
> >>> @@ -1208,6 +1208,51 @@ void drm_framebuffer_print_info(struct drm_pri=
nter *p, unsigned int indent,
> >>>        }
> >>>    }
> >>>
> >>> +/**
> >>> + * drm_framebuffer_get_block_offset() - Get offset to start of pixel=
 block for
> >>> + * the given framebuffer and coordinates.
> >>> + * @fb: The framebuffer
> >>> + * @plane: Which plane
> >>> + * @x: x coordinate for pixel
> >>> + * @y: y coordinate for pixel
> >>> + *
> >>> + * This function will usually be called from the PLANE callback func=
tions,
> >>> + * or from one of the helpers that calculates the framebuffer's DMA =
address.
> >>> + *
> >>> + * Return: offset from start of framebuffer to start of pixel block
> >>> + */
> >>> +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, uns=
igned int plane,
> >>> +                                  unsigned int x, unsigned int y)
> >> Better use u64 as return type.
> > To avoid overflow? Not sure who would use crazy large framebuffers, but
> > doesn't hurt to play it safe.
>
> I'd be worried about a malicious user space that tries to access OOB.
>
> Apart from that, we use u64 for other framebuffer-related sizes like
> pitch calculations or dma addresses. Using u64 here would keep that
> consistent.

Indeed. It seemed weird that the helper originally used u32. Maybe it
was carried over from CMA on ARMv7, which predominantly only had
32-bit address space data busses?

>
> >
> >>> +{
> >>> +     u8 h_div =3D 1, v_div =3D 1;
> >>> +     u32 block_w =3D drm_format_info_block_width(fb->format, plane);
> >>> +     u32 block_h =3D drm_format_info_block_height(fb->format, plane)=
;
> >>> +     u32 block_size =3D fb->format->char_per_block[plane];
> >>> +     u32 sample_x;
> >>> +     u32 sample_y;
> >>> +     u32 block_start_y;
> >>> +     u32 num_hblocks;
> >>> +     u32 offset;
> >>> +
> >>> +     offset =3D fb->offsets[plane];
> >>> +
> >>> +     if (plane > 0) {
> >>> +             h_div =3D fb->format->hsub;
> >>> +             v_div =3D fb->format->vsub;
> >>> +     }
> >>> +
> >>> +     sample_x =3D x / h_div;
> >>> +     sample_y =3D y / v_div;
> >>> +     block_start_y =3D (sample_y / block_h) * block_h;
> >>> +     num_hblocks =3D sample_x / block_w;
> >>> +
> >>> +     offset +=3D fb->pitches[plane] * block_start_y;
> >>> +     offset +=3D block_size * num_hblocks;
> >> User space controls the values in fb->offsets and fb->pitches.  I'm no=
t
> >> sure how well they have been validated already at this point. Did you
> >> investigate this?
> > It wouldn't be worse than before, since this changes is purely code mov=
ement.
> >
> > There are minimal sanity checks done by drm_internal_framebuffer_create=
()
> > in framebuffer_check(), such as offset overflow or pitch size too small=
,
> > but that's about it. It would be up to individual drivers to perform mo=
re
> > checks that match their hardware limitations.
>
> Right, makes sense. Looking through the framebuffer validation, a
> buffer-size check could be done in framebuffer_check().  But that's
> another patch series.

That's further covered by drm_gem_fb_init_with_funcs(), which
drm_gem_fb_create*() goes into. I didn't check all the drivers that
implemented their own .fb_create callback though.

- rockchip uses the GEM FB helpers
- MSM reimplements the GEM FB helpers, but does have proper size checks
- nouveau has size checks
- omap has size checks

> >
> > What sort of issues are you thinking about?
>
> Again, I'm thinking of malicious user space that crafts these values to
> force an OOB access.

I think we're covered.


Thanks
ChenYu

> Best regards
> Thomas
>
>
> >
> >
> > ChenYu
> >
> >> Best regards
> >> Thomas
> >>
> >>
> >>> +
> >>> +     return offset;
> >>> +}
> >>> +EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
> >>> +
> >>>    #ifdef CONFIG_DEBUG_FS
> >>>    static int drm_framebuffer_info(struct seq_file *m, void *data)
> >>>    {
> >>> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuf=
fer.h
> >>> index 38b24fc8978d..c07aea1cc59f 100644
> >>> --- a/include/drm/drm_framebuffer.h
> >>> +++ b/include/drm/drm_framebuffer.h
> >>> @@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffe=
r *fb);
> >>>    void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
> >>>    void drm_framebuffer_unregister_private(struct drm_framebuffer *fb=
);
> >>>
> >>> +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, uns=
igned int plane,
> >>> +                                  unsigned int x, unsigned int y);
> >>> +
> >>>    /**
> >>>     * drm_framebuffer_get - acquire a framebuffer reference
> >>>     * @fb: DRM framebuffer
> >> --
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> >> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
> >>
> >>
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
>
>

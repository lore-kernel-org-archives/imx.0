Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBE533F58D
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 07:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715848; cv=pass; b=ixjcI+Yc2Pgnfp8xKe3jAAND/GSkgIxkONdAXUPSl6B5f7Mi6v0nl9hOl9MLZkN76ZFxPJrJug9Dvs4Ti1nE0CB5apF2dsQcVLpoZqpI0+gaZYlLDGzc8VWdf9XOn9mUvsaRDTQCNlZLkA2yAlAKLJiJLjh/1v7eY0WrUzQxf+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715848; c=relaxed/simple;
	bh=2Bm3gAwazjbLTUFW3jtpTEj1rRnxPSASuhBdBF/Mong=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=En3UI5snrHhmqu6stfKtOgm9+/aIkzyM5VettQuZScjX8FRZVZ4RvyMr3FoHkd8D7xhp/C7trF8Mn3xpxmbEo6fjgllvhXLzDaIAuRe5FgxGRQ13mv5qZid/rL8hotO9cqXSUexNIJeLg+uY6Qrue8ieJdYtZnGijaDyO6beK80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XAn5n73i; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XAn5n73i"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-670fee39d73so441676d50.3
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 00:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789715844; cv=none;
        d=google.com; s=arc-20260327;
        b=RTowCOHs+5X5+KCetdIeIImriGKGTLTEHD+1UZatS3GSTAQ0IKAjsX993G6ERghKhe
         dtTydgsWdo+QDP0bmGQJB1SvGAs5qxarT1k36YTdkiif16ErdYyIP1UauTCIh0tTyah/
         /hqDaB8LAAYwSWCdcXVimu5GsNMVTC5SvjwDlPtbYrPio/CoAzij/p8vgQvqae3mnk+l
         pUjzXxir+vd0H/1omu7yELxnYDglos0O2PyMXFR8A6mVAl/EJ88y9EvtL8y0C6GBE2dh
         NLp9lPEh7H3C4DPMZMPpYJn3PMBD+kpxYdk8938YqPEu+wB+DS4Qf5/HgLv+XB1sE5ww
         Yijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITqNY912hHAbwc9T2h8ninUwVl/brEY9TWjcH5XDilY=;
        fh=IY1mgvwvVa9WX7uba7u/VKFe9ITZAX/BF8+lOGDibuA=;
        b=bWFqBaiR0snbWPsXOCIHYFuEP9ADEipFv0cV5W9mvKXn8Z2IpCzcIoymhdTAMzSnq/
         OMoaY1y0XzgyZUvSbzzHFsaOv5jdFLu+gn0VcE2jJeQ9th6b8tdi7+MIeR3vk+OFubnT
         BOkAawGF2uYLW71XR98veTKvttzVk3Ig/mPFyNRTGH1szgZG5VUP2X1JHbiM83gK7GL7
         Fff3CYG/YwFaGCW6sEA/u6SLuOkFyhhwiXNjB3y+DJf+s1dvDUQQSUpvmdF7SeWBM6Lz
         YQs1EuF7yIEAewewxYUpW+QGGfPdKJo8/ao47O3bNv1asZ5nYk/Hk9+c8K4nw/P26j7t
         TVQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789715844; x=1790320644; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITqNY912hHAbwc9T2h8ninUwVl/brEY9TWjcH5XDilY=;
        b=XAn5n73iXr4C96IgXMKiwpFKuQrhBb7UkOGmm2R8LXfiAknF7cR2qMkiRaxBeC6py8
         VX9MkYKNXuyqp4w6uPWPFNwvRZRmCyaC9dXYatiVNPinvJrczWr5TEBBc97uzeifEWT2
         Q9n9eua0onNI+IHKNBC6Ui12gUKeGT72n+aVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715844; x=1790320644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITqNY912hHAbwc9T2h8ninUwVl/brEY9TWjcH5XDilY=;
        b=tpcejZ8MjdKEuWEuAVoR3tCCaJhYjx+PwLFGU995xpHJSYAlrZMKx3N8nuFZlqGQoe
         QKzE6tJ7wb3AprG93DWkRKHFwEUn6Qsb+14I58bbYZJZteTqM3YgEt50iY1n0lIGoit2
         XYUk3RkYh949hdEEED3zE3jzmoI6zrfcoP62ouRD/UQQhRseBTuNrzq/pL0LEpNcFdKC
         7JtJWC8CseZvIKcacsL5n41GjFOEEMJl7CoQaK9+UurT4WcNVedI3KZgwGskSUc2mkHE
         3Er/DcPZgkMdDAtzLXKMRitA4uH0IRp7ESuILfQ+0wOpWS7fFi3Gjpeovi6ST+nxR+63
         rwZg==
X-Forwarded-Encrypted: i=1; AKwUvBwRXilc+fw7qraTmZ7qOeb70LwrJlmzIbcNuQxtvt5aV0uuWnqDxzjTWt1oLxK9byCoF6w=@lists.linux.dev
X-Gm-Message-State: AFuF++mwmU1GsMeYief0SM/YWhILsz5cXkulHwp0Ec7G51aoHhph9gDq
	XCQjOXLF6sA1UIPojj0UlLQLjgd2HOFi1olkH1aoVy/6/lCDM2Sqlm6a+z8B0Vttdoo+cCyeCdT
	RmSTsHIPHDN4VTFnpfJwIhV/JSf6aLxBsW/+qZVs7
X-Gm-Gg: AYBFou2MScsA93dhWQHV3yML6ntYcsbTL/bqN7dR3Ud7aQUYia216ZdmIIZhtN2dKer
	Eqx/QKF5H1+xLTBDmRolVZlxPjT+Tk/dK6ld5ZhJhaNbDMxum4c19tAUBqErExeWsMijR7FLLvG
	2ohxW8NGVwUKhUcDp0TKz6mxujovOzm91pAEYFa+CHCy5eJ3VXwZqJmSgv6FCsd4e+1eUma0W/n
	Lz0QfvuG61379T+1RJDXMZ2Hx6No+ZXhqb/0zuM1vZPI/SqUx6/l2J2VNY7bHD8lWO+64TWQdYs
	0X4APSHlVr4Y/5voA1yMAEvp9wqlKdF0G0oEm9W9w8/jUQ5GItxb/G8xl9sO8rhhoDCUgZnv/eJ
	YYP8aAJNPNQ==
X-Received: by 2002:a05:690e:1244:b0:667:ba34:51e2 with SMTP id
 956f58d0204a3-6717fc73f18mr528044d50.13.1789715844017; Fri, 18 Sep 2026
 00:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <20260916033327.3054126-2-wenst@chromium.org>
 <f6ace486-70d8-4e81-89cb-e9d55ad9ac8b@suse.de> <CAGXv+5ErgWVNtnRiW+QA7+Mzh=W_Y+HGL_iRa1fOaXCYSoAwMA@mail.gmail.com>
 <f7fa4c4c-bc59-4822-94bb-6e9d68f8f0ca@suse.de> <CAGXv+5GNjKxzHuBn28PbRtbFA1yuJ7h02xDpght4add3emuKJg@mail.gmail.com>
In-Reply-To: <CAGXv+5GNjKxzHuBn28PbRtbFA1yuJ7h02xDpght4add3emuKJg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Sep 2026 15:17:12 +0800
X-Gm-Features: AcwNN1VfNznx-wGfs8r_CeKKtrEj641j8sqUrt8qB1yK2OIkZ-fPkbPmzPQcswY
Message-ID: <CAGXv+5FOB9Y3HCt=ydrcUPdo7S92MiJRqsjXAZiW99-3NfYECQ@mail.gmail.com>
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

On Fri, Sep 18, 2026 at 3:06=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Fri, Sep 18, 2026 at 2:41=E2=80=AFPM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
> >
> > Hi
> >
> > Am 18.09.26 um 06:16 schrieb Chen-Yu Tsai:
> > > On Thu, Sep 17, 2026 at 11:20=E2=80=AFPM Thomas Zimmermann <tzimmerma=
nn@suse.de> wrote:
> > >> Hi
> > >>
> > >> Am 16.09.26 um 05:33 schrieb Chen-Yu Tsai:
> > >>> Currently drm_fb_dma_get_gem_addr() calculates the offset into the
> > >>> framebuffer memory for the framebuffer's unclipped source coordinat=
es,
> > >>> adds that to the framebuffer's backing storage, and returns the res=
ult.
> > >>>
> > >>> We are about to add a variant that uses the clipped source coordina=
tes,
> > >>> so there is already some reuse of code. However, calculating the da=
ta
> > >>> offset for a given pixel is not specific to the DMA FB helpers. The
> > >>> offset is only related to the framebuffer.
> > >>>
> > >>> Split out the offset calculation into a new framebuffer helper so t=
hat
> > >>> non-DMA users can also reuse the same code.
> > >>>
> > >>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >>> Cc: <stable@vger.kernel.org> # dependency for next patch
> > >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > >>> ---
> > >>> Changes since v1:
> > >>> - New patch
> > >>> ---
> > >>>    drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
> > >>>    drivers/gpu/drm/drm_framebuffer.c   | 45 +++++++++++++++++++++++=
++++++
> > >>>    include/drm/drm_framebuffer.h       |  3 ++
> > >>>    3 files changed, 51 insertions(+), 25 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/=
drm_fb_dma_helper.c
> > >>> index fd71969d2fb1..ab0f37d8a5ff 100644
> > >>> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> > >>> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> > >>> @@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_f=
ramebuffer *fb,
> > >>>                                   unsigned int plane)
> > >>>    {
> > >>>        struct drm_gem_dma_object *obj;
> > >>> -     dma_addr_t dma_addr;
> > >>> -     u8 h_div =3D 1, v_div =3D 1;
> > >>> -     u32 block_w =3D drm_format_info_block_width(fb->format, plane=
);
> > >>> -     u32 block_h =3D drm_format_info_block_height(fb->format, plan=
e);
> > >>> -     u32 block_size =3D fb->format->char_per_block[plane];
> > >>> -     u32 sample_x;
> > >>> -     u32 sample_y;
> > >>> -     u32 block_start_y;
> > >>> -     u32 num_hblocks;
> > >>>
> > >>>        obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> > >>>        if (!obj)
> > >>>                return 0;
> > >>>
> > >>> -     dma_addr =3D obj->dma_addr + fb->offsets[plane];
> > >>> -
> > >>> -     if (plane > 0) {
> > >>> -             h_div =3D fb->format->hsub;
> > >>> -             v_div =3D fb->format->vsub;
> > >>> -     }
> > >>> -
> > >>> -     sample_x =3D (state->src_x >> 16) / h_div;
> > >>> -     sample_y =3D (state->src_y >> 16) / v_div;
> > >>> -     block_start_y =3D (sample_y / block_h) * block_h;
> > >>> -     num_hblocks =3D sample_x / block_w;
> > >>> -
> > >>> -     dma_addr +=3D fb->pitches[plane] * block_start_y;
> > >>> -     dma_addr +=3D block_size * num_hblocks;
> > >>> -
> > >>> -     return dma_addr;
> > >>> +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, p=
lane,
> > >>> +                                                             state=
->src_x >> 16,
> > >>> +                                                             state=
->src_y >> 16);
> > >>>    }
> > >>>    EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> > >>>
> > >>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/dr=
m_framebuffer.c
> > >>> index d32aceb6ca9b..9e1231162047 100644
> > >>> --- a/drivers/gpu/drm/drm_framebuffer.c
> > >>> +++ b/drivers/gpu/drm/drm_framebuffer.c
> > >>> @@ -1208,6 +1208,51 @@ void drm_framebuffer_print_info(struct drm_p=
rinter *p, unsigned int indent,
> > >>>        }
> > >>>    }
> > >>>
> > >>> +/**
> > >>> + * drm_framebuffer_get_block_offset() - Get offset to start of pix=
el block for
> > >>> + * the given framebuffer and coordinates.
> > >>> + * @fb: The framebuffer
> > >>> + * @plane: Which plane
> > >>> + * @x: x coordinate for pixel
> > >>> + * @y: y coordinate for pixel
> > >>> + *
> > >>> + * This function will usually be called from the PLANE callback fu=
nctions,
> > >>> + * or from one of the helpers that calculates the framebuffer's DM=
A address.
> > >>> + *
> > >>> + * Return: offset from start of framebuffer to start of pixel bloc=
k
> > >>> + */
> > >>> +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, u=
nsigned int plane,
> > >>> +                                  unsigned int x, unsigned int y)
> > >> Better use u64 as return type.
> > > To avoid overflow? Not sure who would use crazy large framebuffers, b=
ut
> > > doesn't hurt to play it safe.
> >
> > I'd be worried about a malicious user space that tries to access OOB.
> >
> > Apart from that, we use u64 for other framebuffer-related sizes like
> > pitch calculations or dma addresses. Using u64 here would keep that
> > consistent.
>
> Indeed. It seemed weird that the helper originally used u32. Maybe it
> was carried over from CMA on ARMv7, which predominantly only had
> 32-bit address space data busses?
>
> >
> > >
> > >>> +{
> > >>> +     u8 h_div =3D 1, v_div =3D 1;
> > >>> +     u32 block_w =3D drm_format_info_block_width(fb->format, plane=
);
> > >>> +     u32 block_h =3D drm_format_info_block_height(fb->format, plan=
e);
> > >>> +     u32 block_size =3D fb->format->char_per_block[plane];
> > >>> +     u32 sample_x;
> > >>> +     u32 sample_y;
> > >>> +     u32 block_start_y;
> > >>> +     u32 num_hblocks;
> > >>> +     u32 offset;
> > >>> +
> > >>> +     offset =3D fb->offsets[plane];
> > >>> +
> > >>> +     if (plane > 0) {
> > >>> +             h_div =3D fb->format->hsub;
> > >>> +             v_div =3D fb->format->vsub;
> > >>> +     }
> > >>> +
> > >>> +     sample_x =3D x / h_div;
> > >>> +     sample_y =3D y / v_div;
> > >>> +     block_start_y =3D (sample_y / block_h) * block_h;
> > >>> +     num_hblocks =3D sample_x / block_w;
> > >>> +
> > >>> +     offset +=3D fb->pitches[plane] * block_start_y;
> > >>> +     offset +=3D block_size * num_hblocks;
> > >> User space controls the values in fb->offsets and fb->pitches.  I'm =
not
> > >> sure how well they have been validated already at this point. Did yo=
u
> > >> investigate this?
> > > It wouldn't be worse than before, since this changes is purely code m=
ovement.
> > >
> > > There are minimal sanity checks done by drm_internal_framebuffer_crea=
te()
> > > in framebuffer_check(), such as offset overflow or pitch size too sma=
ll,
> > > but that's about it. It would be up to individual drivers to perform =
more
> > > checks that match their hardware limitations.
> >
> > Right, makes sense. Looking through the framebuffer validation, a
> > buffer-size check could be done in framebuffer_check().  But that's
> > another patch series.
>
> That's further covered by drm_gem_fb_init_with_funcs(), which
> drm_gem_fb_create*() goes into. I didn't check all the drivers that
> implemented their own .fb_create callback though.
>
> - rockchip uses the GEM FB helpers
> - MSM reimplements the GEM FB helpers, but does have proper size checks
> - nouveau has size checks
> - omap has size checks

Side note: it seems that the drivers that reimplement
drm_gem_fb_init_with_funcs() do so because they need to do additional
checks on the (sub-classed) GEM objects. Perhaps exporting drm_gem_fb_init(=
)
or deconstructing drm_gem_fb_init_with_funcs() could allow more of them
to use common helpers for things like size checks.

> > >
> > > What sort of issues are you thinking about?
> >
> > Again, I'm thinking of malicious user space that crafts these values to
> > force an OOB access.
>
> I think we're covered.
>
>
> Thanks
> ChenYu
>
> > Best regards
> > Thomas
> >
> >
> > >
> > >
> > > ChenYu
> > >
> > >> Best regards
> > >> Thomas
> > >>
> > >>
> > >>> +
> > >>> +     return offset;
> > >>> +}
> > >>> +EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
> > >>> +
> > >>>    #ifdef CONFIG_DEBUG_FS
> > >>>    static int drm_framebuffer_info(struct seq_file *m, void *data)
> > >>>    {
> > >>> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_frameb=
uffer.h
> > >>> index 38b24fc8978d..c07aea1cc59f 100644
> > >>> --- a/include/drm/drm_framebuffer.h
> > >>> +++ b/include/drm/drm_framebuffer.h
> > >>> @@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuf=
fer *fb);
> > >>>    void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
> > >>>    void drm_framebuffer_unregister_private(struct drm_framebuffer *=
fb);
> > >>>
> > >>> +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, u=
nsigned int plane,
> > >>> +                                  unsigned int x, unsigned int y);
> > >>> +
> > >>>    /**
> > >>>     * drm_framebuffer_get - acquire a framebuffer reference
> > >>>     * @fb: DRM framebuffer
> > >> --
> > >> --
> > >> Thomas Zimmermann
> > >> Graphics Driver Developer
> > >> SUSE Software Solutions Germany GmbH
> > >> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> > >> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
> > >>
> > >>
> >
> > --
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> > GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
> >
> >

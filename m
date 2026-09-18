Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC65390222
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 04:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789704991; cv=pass; b=YyVm64umbB0/km8cJrwchHTew5YpYx1Cwf6hSPCHCUBis4FkBZts6GFxyriiqBQUK008Nvj8NbSdO1TepbaT/nCtHHWkvtH6lCoEmVynTK2tPwiqu3Uld6h8OanLntkiTdN7BotSEecxBx8bMfx99A07zQXch1BA71YYkRHbCQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789704991; c=relaxed/simple;
	bh=Ru2OV2CffCL9NpSNIMTei8TR1QcXxODWTos4dcRwWHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ok9yvqqBDxjWlgilfOgcNG1GHNTCnFTywz6lv8fuXI6d84D9NdBQc9tdJ004F+BfpbYQd7avygBWFBcVwRyMc7K7cSoyqHXvvf1BkLUPy3I/ovxPqvGCNCG2bE0k4cAx+pKuzhwYQn0dF2TglnU8nUoE2X6gs6Yo5HsLTA3bXkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aqoYkHrp; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aqoYkHrp"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-66e4ab2029eso325111d50.1
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 21:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789704989; cv=none;
        d=google.com; s=arc-20260327;
        b=sTxW2GQg9aVUp/fCySMX8vVaumkEU9Rg6+1YOIr6A72xxcQ6HLpnI/j18yeUpIrmbm
         ukUyBjTEhP3usMnrFl6qBbvx0khTU6zeurnLwQ+NWnno7mr18F+m10rUDhiSOfxmmBLY
         gMguSfULrb3BY/xC9cIAahJ6wHTolSn8XdCuNqzNBurhp2zsApNVd7bDLVibyvLq9BxE
         WMqyBjmmBoQShVTgpgNrFxMVncBS9BP5vUV5L428N+9tx2s4Q87CrZxTp7LOArVUeOkr
         7C8GqO58AG3sM/IGWrX8952OGxgWs/J91ijrok8ak+6WceZrsXiXlYe0q14NblRYHXBJ
         j3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5DKEYyvWEAWVKejXJm1cVbz3X+KIz29ykH7P6jopns=;
        fh=0SKXBQiOjLr+MpWuR6s/WWdldmccSCe+8xHrB6RgO04=;
        b=XgVZAb9QnWHVuL60cU7Ju5SCpcW9pIzUeb5ypuRr8XokrQ9A5eF1Rg8Rdagyw9g6oR
         aF8ugLbytQT9XBrS1ktxwKYvAd6ZnpHZqb5HDK2rYsgCyTU9ptmLJ3IgTEW8bkwGsqMs
         LKIPXCQBBcEjL2095Mi//9TsagWE86ErVeW3KYThSMFHdxlFlR5CAdHcXbcVgPCR9tY3
         dJYFcJ0oGf0G4b0dgUM8NnlVcv1jMBtSz9ErxuJFuo5LLNradBpJZiHJYye46P7WD6+7
         2DarzV9qbQoiU1QpEn15v/avq15yJz9/1/qN9gkcFibcUfdR8cp0vr4apNtMQHSXVIb4
         c+6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789704989; x=1790309789; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5DKEYyvWEAWVKejXJm1cVbz3X+KIz29ykH7P6jopns=;
        b=aqoYkHrpc5rIijUFBwH58iqAoxhxkhK6NhRBYO7J6Cf6bTJ6s4q13Xb92cO+BLdh7K
         qeCUTq5FdU1/anySBLJWi4a/Hu6+KVOMtlVDI+TMhTNGRDifmFR1MF/e2k0s2Wur1jce
         +gk2T6wF2OW12kGBDL9dFtZG4Sm50149RVcuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789704989; x=1790309789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5DKEYyvWEAWVKejXJm1cVbz3X+KIz29ykH7P6jopns=;
        b=dSYO2u63M54YLfg9c7AVjofGB/tyCe/nwgtZFStMxQxtA7Z6SrPZiT+L7Ym3xpV7nC
         uTa4u+40idmqyZDUayUpHUGdKdggH/VltxENGo6MAmOYZ6pvQiCDmn2qtapZFQw7nFS9
         zaHdRotadZtio3q33Y4j61EW3jrUejKNTEHHfDcz6rcE3+F//YeFqKoNYrJAXLujMSO4
         LCbULA8AqvBoJIr3qeapYAZpFgMziEbWcPz64CWj7GRKQbpHc/uVYhcFhTAYK5VtTo8t
         nobq9Yj7f+z3gjtU3Tm0Y+DefY+43PYj+G3TqFDGz0KK8PvaCHAHirBvM8DxIDDMpncu
         b6uw==
X-Forwarded-Encrypted: i=1; AKwUvBwfZ1ITWSy28ERx/3zjjMD8nb1uCeCIH1ueSaxBUHBBF8xe5dHkrPKykTBAXGYlxW5G1fg=@lists.linux.dev
X-Gm-Message-State: AFuF++kKZtabbzIOqDLJGLnOZ6u5mG2H6mXjJfK8KQLaRl++c2nvi/lm
	tbwlIi2Q4U6rfQgfOeggq5z6MEfmGNyG9NVkgXHWZpeWm0o9LV2nz0S8lVBrj/16kHuopFN5hYi
	+LKxsQms4/XhdEp0gXOFWLqtcmllz7s0mxDmLIJTV
X-Gm-Gg: AYBFou1g0f5EMWXGEfiW2h/LWUPtByR7hD0686HyytR34SdBc/InpMRuNyCVpKXrEDP
	hgOTqJtynBD84DwAt+3tFYlmm2fXpEHDQD/36vVCS9LHu/SBJY7L3XCkn0fEPyyGv5iS7g8TN2n
	+UZ604uebTp5zDWwN29k9WKDyE63JAmp315Rb+4nlDtd2B1ikb5ej9J1d2ByNd/m0NShqpY8Y/3
	VjzO2DANSbA47Cq7T8qb/r5m7EIFUmXeJXXkGLUlP5clzhBYPlIr0PZHQZMp2EnaBxl4Bsko4gk
	UbyEplsSw3auCrsLc5/R1pUqSzaZfo4W5OEfEDqL7X1MohvGB4brxRtiqprqZWvBXYNVNawId30
	PDWB70rd3jw==
X-Received: by 2002:a05:690e:809:10b0:671:3141:3832 with SMTP id
 956f58d0204a3-6717fc76ff0mr285169d50.4.1789704988719; Thu, 17 Sep 2026
 21:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <20260916033327.3054126-2-wenst@chromium.org>
 <f6ace486-70d8-4e81-89cb-e9d55ad9ac8b@suse.de>
In-Reply-To: <f6ace486-70d8-4e81-89cb-e9d55ad9ac8b@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Sep 2026 12:16:17 +0800
X-Gm-Features: AcwNN1UR3eVFLoBD9oF0TIdnuDNIVRYA94Woweb8vmhnl_ZgpInsWYdL86x54Xk
Message-ID: <CAGXv+5ErgWVNtnRiW+QA7+Mzh=W_Y+HGL_iRa1fOaXCYSoAwMA@mail.gmail.com>
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

On Thu, Sep 17, 2026 at 11:20=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Hi
>
> Am 16.09.26 um 05:33 schrieb Chen-Yu Tsai:
> > Currently drm_fb_dma_get_gem_addr() calculates the offset into the
> > framebuffer memory for the framebuffer's unclipped source coordinates,
> > adds that to the framebuffer's backing storage, and returns the result.
> >
> > We are about to add a variant that uses the clipped source coordinates,
> > so there is already some reuse of code. However, calculating the data
> > offset for a given pixel is not specific to the DMA FB helpers. The
> > offset is only related to the framebuffer.
> >
> > Split out the offset calculation into a new framebuffer helper so that
> > non-DMA users can also reuse the same code.
> >
> > Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: <stable@vger.kernel.org> # dependency for next patch
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - New patch
> > ---
> >   drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
> >   drivers/gpu/drm/drm_framebuffer.c   | 45 ++++++++++++++++++++++++++++=
+
> >   include/drm/drm_framebuffer.h       |  3 ++
> >   3 files changed, 51 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_=
fb_dma_helper.c
> > index fd71969d2fb1..ab0f37d8a5ff 100644
> > --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> > @@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_frame=
buffer *fb,
> >                                  unsigned int plane)
> >   {
> >       struct drm_gem_dma_object *obj;
> > -     dma_addr_t dma_addr;
> > -     u8 h_div =3D 1, v_div =3D 1;
> > -     u32 block_w =3D drm_format_info_block_width(fb->format, plane);
> > -     u32 block_h =3D drm_format_info_block_height(fb->format, plane);
> > -     u32 block_size =3D fb->format->char_per_block[plane];
> > -     u32 sample_x;
> > -     u32 sample_y;
> > -     u32 block_start_y;
> > -     u32 num_hblocks;
> >
> >       obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> >       if (!obj)
> >               return 0;
> >
> > -     dma_addr =3D obj->dma_addr + fb->offsets[plane];
> > -
> > -     if (plane > 0) {
> > -             h_div =3D fb->format->hsub;
> > -             v_div =3D fb->format->vsub;
> > -     }
> > -
> > -     sample_x =3D (state->src_x >> 16) / h_div;
> > -     sample_y =3D (state->src_y >> 16) / v_div;
> > -     block_start_y =3D (sample_y / block_h) * block_h;
> > -     num_hblocks =3D sample_x / block_w;
> > -
> > -     dma_addr +=3D fb->pitches[plane] * block_start_y;
> > -     dma_addr +=3D block_size * num_hblocks;
> > -
> > -     return dma_addr;
> > +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane=
,
> > +                                                             state->sr=
c_x >> 16,
> > +                                                             state->sr=
c_y >> 16);
> >   }
> >   EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> >
> > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_fr=
amebuffer.c
> > index d32aceb6ca9b..9e1231162047 100644
> > --- a/drivers/gpu/drm/drm_framebuffer.c
> > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > @@ -1208,6 +1208,51 @@ void drm_framebuffer_print_info(struct drm_print=
er *p, unsigned int indent,
> >       }
> >   }
> >
> > +/**
> > + * drm_framebuffer_get_block_offset() - Get offset to start of pixel b=
lock for
> > + * the given framebuffer and coordinates.
> > + * @fb: The framebuffer
> > + * @plane: Which plane
> > + * @x: x coordinate for pixel
> > + * @y: y coordinate for pixel
> > + *
> > + * This function will usually be called from the PLANE callback functi=
ons,
> > + * or from one of the helpers that calculates the framebuffer's DMA ad=
dress.
> > + *
> > + * Return: offset from start of framebuffer to start of pixel block
> > + */
> > +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsig=
ned int plane,
> > +                                  unsigned int x, unsigned int y)
>
> Better use u64 as return type.

To avoid overflow? Not sure who would use crazy large framebuffers, but
doesn't hurt to play it safe.

> > +{
> > +     u8 h_div =3D 1, v_div =3D 1;
> > +     u32 block_w =3D drm_format_info_block_width(fb->format, plane);
> > +     u32 block_h =3D drm_format_info_block_height(fb->format, plane);
> > +     u32 block_size =3D fb->format->char_per_block[plane];
> > +     u32 sample_x;
> > +     u32 sample_y;
> > +     u32 block_start_y;
> > +     u32 num_hblocks;
> > +     u32 offset;
> > +
> > +     offset =3D fb->offsets[plane];
> > +
> > +     if (plane > 0) {
> > +             h_div =3D fb->format->hsub;
> > +             v_div =3D fb->format->vsub;
> > +     }
> > +
> > +     sample_x =3D x / h_div;
> > +     sample_y =3D y / v_div;
> > +     block_start_y =3D (sample_y / block_h) * block_h;
> > +     num_hblocks =3D sample_x / block_w;
> > +
> > +     offset +=3D fb->pitches[plane] * block_start_y;
> > +     offset +=3D block_size * num_hblocks;
>
> User space controls the values in fb->offsets and fb->pitches.  I'm not
> sure how well they have been validated already at this point. Did you
> investigate this?

It wouldn't be worse than before, since this changes is purely code movemen=
t.

There are minimal sanity checks done by drm_internal_framebuffer_create()
in framebuffer_check(), such as offset overflow or pitch size too small,
but that's about it. It would be up to individual drivers to perform more
checks that match their hardware limitations.

What sort of issues are you thinking about?


ChenYu

> Best regards
> Thomas
>
>
> > +
> > +     return offset;
> > +}
> > +EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
> > +
> >   #ifdef CONFIG_DEBUG_FS
> >   static int drm_framebuffer_info(struct seq_file *m, void *data)
> >   {
> > diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffe=
r.h
> > index 38b24fc8978d..c07aea1cc59f 100644
> > --- a/include/drm/drm_framebuffer.h
> > +++ b/include/drm/drm_framebuffer.h
> > @@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffer =
*fb);
> >   void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
> >   void drm_framebuffer_unregister_private(struct drm_framebuffer *fb);
> >
> > +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsig=
ned int plane,
> > +                                  unsigned int x, unsigned int y);
> > +
> >   /**
> >    * drm_framebuffer_get - acquire a framebuffer reference
> >    * @fb: DRM framebuffer
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

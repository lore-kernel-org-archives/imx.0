Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624369;
	b=nwAa+jA8azUbyQo2OCHqV7UkDyUtPX8pqU8/Gnkf/8+UZoq+F4WFs91mgCaSsWxPlEY1
	 uJnVhTaSqXJtOG3dnqt1fBH5idLclLdK7WGefWSayLosSS1LkWxt11wTjS4hBPQjh5lpe
	 zp/kLdAtnMypH3CZYwYQNbtOeDB7Hi+FRCkTMeJwfV/bONMjMDIC+t1+DfHaRqkQ2D9ZB
	 l8Sv60z6SajSBuJ1knXVWFMADXwzI8kZ9FHiOhc08GgfGcyiayjwfH1RL2FoB69+qK0xU
	 GZpps+zFbKpk8Bq/maJYkEU8oKxm8l/Gje0vordmTJO3QKwCDLVwsv9xnDsm+jTa/1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=fjeXOElCViRQmgZvgDDdONv2Uyhg+At7B3MV4y/CS3E=;
	b=TGBumWhLoTc5RbL3hfkcmWjFKrT4c1fSXauYvlWLnTyagCHEcgefWoEI/+z7GB6A/e35
	 iNdZWF1ssUg/xBjZF8DPnrlZoEvIdrDxoVndj4TC6rZKmCL4cCjdHiiJLF6ImNn46MGn7
	 mTgmYYzyUmhisGR7OiCpSukjXPqOoAy71wc7+iNDsQlB8FXkO80Y2SKcZU4YohyLQJM1J
	 H2ow37RAsaEDm6mZ05xR3jtDxYc3XdfqOLyqulDijzdcXsw21mo3fGPfQhwAo6DkgUUMM
	 473cf0c5k/lQ5T8i9OKVL026vzp2AdwXxdAG19c9tnytxYb3KOpPRJ62FXsxv3nbyug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRsrn693;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9EB606A33D
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 16:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9EB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRsrn693
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb606491faso32164345e9.3
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795624367; x=1796229167; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fjeXOElCViRQmgZvgDDdONv2Uyhg+At7B3MV4y/CS3E=;
        b=vRsrn69325843ApKLNF0OSjywFs3Xl5IXyw3SuQfgoBMgkvm+A1yV07CS7X9LbmMEn
         bkQ0g5KmUZ/H/a34XG1nmzlnBfpQcB577g502xzJFAoXmy2fWl18hA5PUDgidR57hb+z
         +iERTTgtlvHjtgZOdGtv9LW8Pxj/DC7pAlgXDadcuscdOz5n2buAvvvG3z63YnkgykxF
         hn1TnZyDxVahHaML5Wbo/3LSZoD2rloGPJoVdCNNL6WQhrbpuKmteyvDvBxx0GEC4pgv
         PLYXOiNJ4kd9VEd9g0ToEXh1EuMjNSXG5gMNLYeJ6vK1uX0u3aCow/eEF6hccestk7sW
         rTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624367; x=1796229167;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjeXOElCViRQmgZvgDDdONv2Uyhg+At7B3MV4y/CS3E=;
        b=ekrYAEJU6aNtXOZjsXIyeZ14cb5r+S02KukJlo90emVZWIqzCNKfI1s7RaJnr1moW6
         VpUULtKHXH13kBjYujsa9valwmLe+Ofqp8N5p60R0MwgnL9LGkxQXFVgIrAuuEY1ByjU
         T+u4+si6TZA/8pH9zKDpZBtv6jX6c//nZKz9TQsk3Jg4IE1WUSDEq31gi5mry/fdMDpv
         METdvfll0Tj5jt3+z/e+b1X0w2yeFjhEvC1B8aG6izGzCoOn8dTSt3TFFq67B5z82AME
         eNF+MvffLBaA29cd/G3vr/QZULX9tXI6imdtk4waHl6vFe7Nduq2PP6frqxw7vCU9010
         7XxA==
X-Forwarded-Encrypted: i=1; AL+hErGdg1ECATDne5bjB0U1AosxJJeTuBTxE/BPTYJpItas1ACJgf6SxBS85UVADa/pSF+pMfM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9geaDojI1uO7fYcWGvttA92NAX6L1uGgiEnXqJ2JE5BZXxROFW
	8XCEsvXjLntiyhbUprze/pYgaHkpCLBT1qhtjxLq6A6p21FqX0KWqvU3
X-Gm-Gg: AZFdTZfRpcFzgUVULoaktl+C5RsV0pISLLjHRxM3JQYXaMZVaeo7jBFt+cZTf1VIDeQ
	piiR9miwGiOrR7Q5eW+u98EpnLxUStFiOrRFWeSYvD1Exo0SK0IewodMMgpLop7hKVwllJZvTNb
	SDvvt1OgYBMpUHrGATmhwcdxwWAkwAnkvLhN9LhNZQHvqjHSUViULaKewV8Uda4zJB5IZx58lcj
	TTjIknmrY86cQlsn7xOpZmRwbeLhABSj2Efx8oEbB4zXsb9A3+w/Cf+48kVbev75tM4jWSRTMao
	ap1S2wZIQhsit7Agv0UNaBHwJiX9YjZun8J6gwRANsq7DdBk5yfJk+fA8H59wUBAZ+8m2d0McJv
	V0gxNDAm/Iva4Xh7/KKYx7X66r72rGRFW+euJj6t2Vd14+eOkahmqRYoBu4JSj31GyBe6RX5xfi
	/TB4oxM0OjNUuRhJG06Y07a1typt54YTomK1pDNaqFjNX3G2ZtnL9xcyFwTxt1esA1fnGqnwQkN
	X5a9ww+d5OoMgbzHRzMQ3v3hlZNNoBCJEFaNR3u6hfC7AEF4XRlJ+pqS/zeNf+1VBWs3zmvXh5M
	hc6iV9s0s4fRc+Gucrrpy45Uru/qkDGMq+vgRO6D9MxMfNb+2oVqYlM1ImX37h/x83Nqutzh1/P
	4KzB3IKk4dFBu6hO/KzjvcVLFHpTEmTkiFIRjrlcrKPmMq9CyKA475ujyMq4AhKjtfv4BBxzqMk
	03dCMnv4J7cWwCMpmKKK0XRadynD4TS6aqMJeooFWGEzWkeahlM0SecCpEvuXBkI2thzGnxm/N0
	RauSCLQuK5KXkqDx64Gsv2KzdU6l/CeUP8hyggu2PbLPHVkd01RbGLEB+JuIhZ54CHNfwn0g6US
	leiLj5qp
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr381679255e9.19.1795624366963;
        Wed, 25 Nov 2026 08:32:46 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm560493135e9.8.2026.11.25.08.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:32:46 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liu Ying <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject:
 Re: [PATCH RFT v3 3/5] drm/sun4i: layers: Fix VI buffer address for clipped
 offsets
Date: Wed, 25 Nov 2026 17:32:45 +0100
Message-ID: <sBipOLw6T_aZ1e-H2zFl3g@gmail.com>
In-Reply-To: <20261124074041.115251-4-wenst@chromium.org>
References:
 <20261124074041.115251-1-wenst@chromium.org>
 <20261124074041.115251-4-wenst@chromium.org>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. november 2026 ob 08:39:31 Srednjeevropski standardni =C4=8Da=
s je Chen-Yu Tsai napisal(a):
> Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
> get display memory") dropped the code to calculate the framebuffer's DMA
> address in favor of drm_fb_dma_get_gem_addr().
>=20
> This turned out to be wrong in a couple ways. The hardware is programmed
> with clipped dimensions, so it needs the buffer address to start at the
> clipped boundary. Moving to the helper negated the clipping. Also, when
> clipping on the left, the buffer address needs to start at the first
> pixel in the sub-sampling group even for the luma plane. The hardware
> handles the interpolation internally.
>=20
> Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
> buffer address starting at the clipped boundary. Calculate the intra-group
> offset and adjust the luma plane buffer address so that it points to the
> start of the sub-sampling group.
>=20
> Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to=
 get display memory")
> Cc: <stable@vger.kernel.org> # v7.1+, needs drm_fb_dma_get_gem_clipped_ad=
dr()
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> This is an alternative to Jernej's original revert:
> https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785=
772659.git.jernej.skrabec@gmail.com/
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index f9c7f28f9fa2..67cce1b0e70f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -130,7 +130,7 @@ static void sun8i_ui_layer_update_buffer(struct sun8i=
_layer *layer,
>  	ch_base =3D sun8i_channel_base(layer);
> =20
>  	/* Get the start of the displayed memory */
> -	dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, 0);
> +	dma_addr =3D drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
> =20
>  	/* Set the line width */
>  	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 4d3fc03f9877..b6796416d550 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -205,7 +205,21 @@ static void sun8i_vi_layer_update_buffer(struct sun8=
i_layer *layer,
> =20
>  	for (i =3D 0; i < format->num_planes; i++) {
>  		/* Get the start of the displayed memory */
> -		dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
> +		dma_addr =3D drm_fb_dma_get_gem_clipped_addr(fb, state, i);
> +
> +		/*
> +		 * The mixer can handle odd offsets into sub-sampled YUV
> +		 * planes, but needs the address of the first pixel in each
> +		 * sub-sampled block. Adjust the luma buffer address backwards.
> +		 */
> +		if (i =3D=3D 0) {
> +			u32 x_diff, y_diff;
> +
> +			x_diff =3D (state->src.x1 >> 16) & (format->hsub - 1);
> +			y_diff =3D (state->src.y1 >> 16) & (format->vsub - 1);
> +			dma_addr -=3D y_diff * fb->pitches[i];
> +			dma_addr -=3D x_diff * format->cpp[i];
> +		}


This could be done differently.

Before for loop (done only once):
src_x =3D (state->src.x1 >> 16) & ~(format->hsub - 1);
src_y =3D (state->src.y1 >> 16) & ~(format->vsub - 1);

Inside for loop:
gem =3D drm_fb_dma_get_gem_obj(fb, i);
dma_addr =3D gem->dma_addr + drm_framebuffer_get_block_offset(fb, i, src_x,=
 src_y);

But it works in any case, so:
Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> =20
>  		/* Set the line width */
>  		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
>=20





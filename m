Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795209324;
	b=wEEIF8loKA0UmYr9mPipiexO3uXPJRWBzEC43Dxm/pQoX9ta/zhgWVh9CPhe1RjA8rXt
	 x1RajpGLO91vh3qe4IKQOTcDzpS+OTF5TZM5ZrZpPqZacDJen3EfHuRvZFY81lihxB+Bs
	 tQz3iwM1CalFd0yr8Vab8xFm4mrMWBR+cf63EOjfdWcXomgHFqgeabf7l7rbAC0tX51r2
	 IEndeXsKzreOvhOQJtnLaSl8beogF995bC6G4uLpuYkH+XyuCfq2IfBU1RO0iK80142b+
	 V0sqJB88BxIY2kKSVNRuJ5v9FssLPVIUTiv7W3fSMWBlvtmbhE5B5nMInQl3faGhrjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jhsdAq68aTOS0woPorboO2Q3We/YdgAlOANjhDh+IIk=;
	b=Oh9V6S3RS5sbV992Uq6Wp/9VxkYZJJphE3Qpcd4F9HuaELQtcPmu6EfsQuPprGPWIMj6
	 8VOFRDS7k8tomJyYJXVaD6x4AfgIrkF9A2h7CvRavtiB2Jv8fsGdx06PRuOcJa8qcqQdn
	 jVc/q1n1rUwAfOfuF8FAipV7lMBvdy3au3mEa4TCtOM5Ku+tGxKiUadq8R1k9wyIWtpDp
	 yHN8IBSbCIVU8RJlc+sBzCLGtEmvjrE637egnG/5DJVjPhfgW56knI2OnpMvKSFi6nKmG
	 IB3m/YwiEJY8WgTNHLazif+T5FQP2ryt4Gzhm9lueo1kdSEy7T4dPZ3g2YgBBImdPZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FtUpZSk9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663A9606A69C
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 21:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 663A9606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FtUpZSk9
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so839398e87.0
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 13:15:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795209320; cv=none;
        d=google.com; s=arc-20260327;
        b=P2BNAge9Lbc/0DRjwbt/8V/rmfg57/rofVGUtSz/E5Ql8P76mbFT57UfqrHUCJhkGF
         QNufyM/BO9rT93Y5CgwVe0hNsEYOlKIfr2KH58jRx7HrI+kHYPBXARimgEGUNm+k54Xf
         6Frhwc3bZ51UkMm5Uv2jTP5kqmNwq1kJab/F6q+A6Q77DAYrPDIlVlU6UT69pZ/Z5M96
         qzqxdkzOgkcZYkX9Vk3r1DgTtyPxxVPjk1Yms0wXRO5caTNIJvb/h7K357IqhgOBaAt1
         zopL/evEiWitFDd800wvCJUEiij4fM7D4B9KlC1ne4XhMZKm2ddBqDJlNqzaKt6XI34h
         ot8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jhsdAq68aTOS0woPorboO2Q3We/YdgAlOANjhDh+IIk=;
        fh=0tcqOIGyKAl8QCC7b2KrDG2zS7bGmftRZYws70ZU0fw=;
        b=AnysvLm4Af8peQmxI0Yfo080FDJ7P43ZBQgT94Hy0ZNuNGAe6WMldbcXVg6uLAgeim
         xO/YWP73+H+H/QmHNi3voAD9Zijb9R22RZfNynqhO2CArNRkEBl+kFauBRvZlvZOodtL
         JEQ6ygCyBC3nVPJA9EZyR8z+WNuVycIBpfG0bCfw4z6RWDjNsmc02PCMt41jaMGX4hj2
         cZL6YQBYeSVf+VbgaNbfer/vuT1LSaReMJztf0tGLCO/F1JvQzgxsFsi1DmpQ4v7MOOm
         FaDSyvGb85GJWDil0xC8q3cdyMLes7ixzWUcucy0+dGFkcQBfFsqI1GX9mtLkkCs/lLb
         x79A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209320; x=1795814120; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhsdAq68aTOS0woPorboO2Q3We/YdgAlOANjhDh+IIk=;
        b=FtUpZSk9Vw41b5SOP9nfxVdEFI9IZ0koeGL+XezZCcwmdmA7Q1b+QYdh9P/eEfB5Mz
         xCxF3VWR1YpPX7hJrBRSjDpo7NjswUZuKBesuef0p5JH/28A6FTqVS831minO0txkXY5
         8a6X1VjzAzplLGY8d6c/O8mC5p3jQ1wFt6S0v2RyS/Tupn9d/xExgArCdP/LClWVzqyR
         aDMCQcyUY4ABjJB/1v2r996D3FJKpfa6tLS5aRPjpmz0M8KcdDAswlJ5OrSVJ43DZiaa
         ik57Fs43A3GR7Af6PEb9jDGP05iKiLyY9WUY6KWqZCLinz8QriYs/OHZQ4VqRc52u8P8
         ZjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209320; x=1795814120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhsdAq68aTOS0woPorboO2Q3We/YdgAlOANjhDh+IIk=;
        b=jtkveRcuraYc8Pqc8ZZL2OuEglnX1HCSJ3t4fYhEsJcLEDczoc7BdCR6FyAwIbjZQW
         dOXvbv4UNvMKe0O9f0rJp+/4Z3t/A9jexW/0ibE3scqy0C9OyAXAw/dxVduKQGKUcudE
         Ng4HznVweqePnmLhDjWM1j4xEJlSDspxL08uGW1Pl380vyg95j5FagfPiSyGygsWMiMd
         7aDQKR3tQCgYpiZ37xPkkAUZqRA/LI/3w5tBH16OfLfW5isNfBXGciZFTbVHUA8vcA1w
         RRdbhI6J9ERV4hrGHVwgpBZTUnI1/6eDogxHDcYagTKRHz1zwaZMiugXSSrajdmSX2NY
         uiuw==
X-Forwarded-Encrypted: i=1; AL+hErEbjSibnlTCt8S+xSAqw+WNhgqh9IrZl8MX5KGGBe8j93z92yg2aAmP1oTdLga0VEDl8LM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/fdx779oICXP/0rLiwIhGDvDKltsZqV9zYT9Uu89YyvPFqX8eO
	p2xpxfWJmGIemuMCeqXAy6xq+a0xpWRKIv7oAEUkLJacvI+T4ZYpJg+YgRz1RaT6VGqrR7DFSx8
	kDhdWPZYlvHzhz1v29kndVLB5IFcqafU=
X-Gm-Gg: AZFdTZcJzpOjAu0KCO7pqWxfwYOdVI5ttjcK55aTM9Fgpob33A2TML/nu9tFjwpv3dR
	4mq9ULK7up4FvwI+fLtycb5OaarN2YA/3j1b6S1ONHlHKFbGG/oRs3Wu4ct3zOCwZmctJOQPqY6
	u1Z9M8a+uerbY+UuOfT0lx+1ii5NQnlKjvKeLXztNBu+R+i8ifLb8S6FzlmalYN2kcCOjAEN7Vp
	KXVuy8RX/d/Suy1W3zoEsSPTlSx9yp81Yl4QmSQ7v1DclNsWf1WYiTyMCqNRRQQyY732oJTsxat
	KVnjMp0YHqGhz63neSksOefzQLjGEsyYgm0c9TRLBN36FkCLwLyXJlcOA/TjoFIha1OuO3ZUkV1
	1p0M8luaRUXIuFh5hz3oD5GR8nf8S4eZjJKt9hEK13Bk5KFoUKaJ9Uq4xHvg7UL03AMWCh1rLdd
	e5nj3WOxSDpvOaUTMpdfTAecgt
X-Received: by 2002:a05:6512:b14:b0:5c1:c4b4:a3e5 with SMTP id
 2adb3069b0e04-5c1c4b4a448mr663384e87.27.1795209320229; Fri, 20 Nov 2026
 13:15:20 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260909210213.946159-1-festevam@gmail.com>
In-Reply-To: <20260909210213.946159-1-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Nov 2026 18:15:08 -0300
X-Gm-Features: Aa3M54p88NC6g05pV48qVC2p_9ZAScZjtIt_fyZczxzCKvkLyILovNFeQdmLZhk
Message-ID: <CAOMZO5DuwQq_-hMPvpb65drpU40UNWYXQ_ksPW0ACXxaCwOoWw@mail.gmail.com>
Subject: Re: [PATCH] drm/mxsfb: lcdif: Fix use-after-free on unbind
To: marex@denx.de, Luca Ceresoli <luca.ceresoli@bootlin.com>, Liu Ying <victor.liu@nxp.com>
Cc: mripard@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 6:02=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> lcdif allocates its private data, which embeds the CRTC and primary
> plane, and its encoders using devres. These DRM objects are linked into
> the mode_config lists.
>
> Since mode_config cleanup is DRM-managed, it is deferred until the DRM
> device is released. An open DRM file can keep the DRM device alive after
> the platform device has been unbound and devres has freed those objects.
> The later mode_config cleanup then dereferences freed memory.
>
> Allocate the private data with drmm before initializing mode_config so
> that it remains alive until mode_config cleanup has completed. Allocate
> encoders with drmm_plain_encoder_alloc(), which cleans up each encoder
> and removes it from the mode_config list before freeing its memory.
>
> This can be reproduced on i.MX8MP by keeping the DRM card open across an
> LCDIF unbind and closing it afterwards.
>
> Cc: stable@vger.kernel.org
> Fixes: 1c71d925c03a ("drm: lcdif: Switch to drmm_mode_config_init")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

A gentle ping.



> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index e2173c4d6fc2..7e9f3b205a45 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -24,6 +24,7 @@
>  #include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mode_config.h>
>  #include <drm/drm_module.h>
>  #include <drm/drm_of.h>
> @@ -43,10 +44,6 @@ static const struct drm_mode_config_helper_funcs lcdif=
_mode_config_helpers =3D {
>         .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
>  };
>
> -static const struct drm_encoder_funcs lcdif_encoder_funcs =3D {
> -       .destroy =3D drm_encoder_cleanup,
> -};
> -
>  static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  {
>         struct device *dev =3D lcdif->drm->dev;
> @@ -74,19 +71,16 @@ static int lcdif_attach_bridge(struct lcdif_drm_priva=
te *lcdif)
>                                              "Failed to get bridge for en=
dpoint%u\n",
>                                              of_ep.id);
>
> -               encoder =3D devm_kzalloc(dev, sizeof(*encoder), GFP_KERNE=
L);
> -               if (!encoder)
> -                       return dev_err_probe(dev, -ENOMEM,
> -                                            "Failed to allocate encoder =
for endpoint%u\n",
> -                                            of_ep.id);
> -
> -               encoder->possible_crtcs =3D drm_crtc_mask(&lcdif->crtc);
> -               ret =3D drm_encoder_init(lcdif->drm, encoder, &lcdif_enco=
der_funcs,
> -                                      DRM_MODE_ENCODER_NONE, NULL);
> -               if (ret)
> +               encoder =3D drmm_plain_encoder_alloc(lcdif->drm, NULL,
> +                                                  DRM_MODE_ENCODER_NONE,=
 NULL);
> +               if (IS_ERR(encoder)) {
> +                       ret =3D PTR_ERR(encoder);
>                         return dev_err_probe(dev, ret,
>                                              "Failed to initialize encode=
r for endpoint%u\n",
>                                              of_ep.id);
> +               }
> +
> +               encoder->possible_crtcs =3D drm_crtc_mask(&lcdif->crtc);
>
>                 ret =3D drm_bridge_attach(encoder, bridge, NULL, DRM_BRID=
GE_ATTACH_NO_CONNECTOR);
>                 if (ret)
> @@ -131,7 +125,7 @@ static int lcdif_load(struct drm_device *drm)
>         struct lcdif_drm_private *lcdif;
>         int ret;
>
> -       lcdif =3D devm_kzalloc(&pdev->dev, sizeof(*lcdif), GFP_KERNEL);
> +       lcdif =3D drmm_kzalloc(drm, sizeof(*lcdif), GFP_KERNEL);
>         if (!lcdif)
>                 return -ENOMEM;
>
> --
> 2.43.0
>

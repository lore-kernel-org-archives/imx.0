Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A6E145FE0
	for <imx@lists.linux.dev>; Mon, 28 Apr 2025 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855129; cv=none; b=KYsbqYW81Zlj/l64RXpVbng6vC08HMs37YWBLey0QgnhQmdzLHmWFUSNm8xTUC4e50zFF2VvQzohiF+tqRHqL4D3MzsOJNxkI++fKPZ7dKrBlGQfeCHR3bsJzU8xwgda6RxEr/HDw0Fo0o2x8IAFdf/eoFA/7PC+bxBvxIWfKP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855129; c=relaxed/simple;
	bh=dwgYOym45oyNAdQ44afULSTNmEmOJnzMpDMS/yioqQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOPCAksn1QgtW4AygqbmBMRlaTL6d/OYoaadW8bk5rf7cLlpK593BQxdxUIKX3jOfTVyY99YTvRlabiIBNz35kiq+05raIK6kaOiSkGUq7T6ZfCq2GblrkP6mZOr0vRWEt5K+PlFCyNgZBcQQ0FpjMiZhfTe8ye0lzFP8SiLnYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=d6IteC1U; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="d6IteC1U"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e6df1419f94so3843037276.0
        for <imx@lists.linux.dev>; Mon, 28 Apr 2025 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745855125; x=1746459925; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=;
        b=d6IteC1U6GsN6+gHPvLfatRHxu2J4UaX9UWdavtjqiot5d4u01DZqRYsg55px97aRd
         NyXHnedfTslkm8h9iU+J7GggUKP3SfKqyy1bQ4Xudropp5CF8IVpkW2GnH/Dl4c7p1Ik
         HlL4idrWtNyhdgtHrRu3gVOuvnNXNaucnScs92xdKMI3thjW7bVkZppd2Jd9K9clrMIY
         4c3loc+o9OL969DguDQ3KBBPfRiQTG6w1HKMlQlN0M1LGw5aDJAsybj/g09cKQR9O/cO
         EXnOlXpC3RvnNGldwqQ0JjjH6GdPPcvhRuFkdONdjHlRzw2FFFEOtVrnVvVEs+ZK/oG3
         nRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855125; x=1746459925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=;
        b=u68xn0b+K2yq27WMUXHWdBUMO1ZMf0PXL/GmDYsdjwFpLUMGU3vjnYeHSOJ9Bka8Xt
         MIWXN9THPjLJrkhH5Dmk+PCYqHwKMGECGL28HYD5E+A5zMXlX7I7pVzifYpHLqJcnHu/
         bkWmeubkwVatJGAZ21Jc0x1OkZaXZQb8iY8l7WjltT2D+uBQ77jXrP0iDDF2LopFVUeN
         aJx6QQQ8YigCLfG6ZFfNEj6URl8ntSNdk1HETXTsI8e8S//tEiV2YJrP9W4Qg7MrctYR
         6iynCunyJX8InywjFOCKNmiePes5mQ/XgQd2Hc24ftKetvi6Y8mZgFANCRd95GChQOBf
         ZoEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNGrE8xVvNQ/9cDZAJUJesXDH73BEo0ywab032mexfI0dg9qFAI6Xp0e2bCtSfOFReQOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJzAxpdyKiVGStqJyNkKPEQevTXeU/h4zlczuvrr6pmMi5M1qf
	J8r/sVkTOxLdH+j2ze3tC4tSZtWdv9WMYIbZ6iJhmdb4OeI8lX+syBJv+B/1sqKcT+2vfwFC7gc
	bUyN6Hxg9/jYZl8kzP/CORB5eUhGrb5aahtdV6w==
X-Gm-Gg: ASbGnctzfLiLNq8i9vIkYuVglarAF3L/ihsWlBvU4AvFb3GpkeXg5UI7dqUumFbTF3x
	FufjHVIQuKPGUOUENSxXj56I/UFRZwcPLXP8t0tXPiGwKtEnEiz9IHlgA+KWeqtoWU1f9yZHYiq
	INQ7OKhAbF0mVFnkoe3lD8+Xzd60p40PO+JXalPy3mIWEFmiy8gWRpXnW8UyCNENs=
X-Google-Smtp-Source: AGHT+IEF9MSlc844cuGTIRN/jaSQKExcmjeU1UeJwf54mw2x30vI+iBpqqWrdgOqbrjU+FD8mBfkUxmgGRAbgf2Y+6M=
X-Received: by 2002:a05:6902:2701:b0:e72:d88e:7a9a with SMTP id
 3f1490d57ef6-e73500e777emr136870276.45.1745855124717; Mon, 28 Apr 2025
 08:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Apr 2025 16:45:08 +0100
X-Gm-Features: ATxdqUF8zRJ18UCRRqpYogjOFDok1I-AvafpDPPJcxH-STXodhofR9H1CLM8tQg
Message-ID: <CAPY8ntDwK0DZ6sThryDRBUgjTb+muNHtRNp+LohTs6+FWeB5TQ@mail.gmail.com>
Subject: Re: [PATCH v2 27/34] drm/vc4: convert to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Apr 2025 at 20:01, Luca Ceresoli <luca.ceresoli@bootlin.com> wro=
te:
>
> This is the new API for allocating DRM bridges.
>
> This driver already implements refcounting of the struct vc4_dsi, which
> embeds struct drm_bridge. Now this is a duplicate of the refcounting
> implemented by the DRM bridge core, so convert the vc4_dsi_get/put() call=
s
> into drm_bridge_get/put() calls and get rid of the driver-specific
> refcounting implementation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks.

> ---
>
> Cc: "Ma=C3=ADra Canal" <mcanal@igalia.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>
> Changed in v2:
> - fix error code checking
> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 34 +++++-----------------------------
>  1 file changed, 5 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.=
c
> index efc6f6078b026764c59cfb2a33b28a88b7018c3a..458e5d9879645f18bcbcaeeb7=
1b5f1038f9581da 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -552,8 +552,6 @@ struct vc4_dsi {
>         struct vc4_encoder encoder;
>         struct mipi_dsi_host dsi_host;
>
> -       struct kref kref;
> -
>         struct platform_device *pdev;
>
>         struct drm_bridge *out_bridge;
> @@ -1622,29 +1620,11 @@ static void vc4_dsi_dma_chan_release(void *ptr)
>         dsi->reg_dma_chan =3D NULL;
>  }
>
> -static void vc4_dsi_release(struct kref *kref)
> -{
> -       struct vc4_dsi *dsi =3D
> -               container_of(kref, struct vc4_dsi, kref);
> -
> -       kfree(dsi);
> -}
> -
> -static void vc4_dsi_get(struct vc4_dsi *dsi)
> -{
> -       kref_get(&dsi->kref);
> -}
> -
> -static void vc4_dsi_put(struct vc4_dsi *dsi)
> -{
> -       kref_put(&dsi->kref, &vc4_dsi_release);
> -}
> -
>  static void vc4_dsi_release_action(struct drm_device *drm, void *ptr)
>  {
>         struct vc4_dsi *dsi =3D ptr;
>
> -       vc4_dsi_put(dsi);
> +       drm_bridge_put(&dsi->bridge);
>  }
>
>  static int vc4_dsi_bind(struct device *dev, struct device *master, void =
*data)
> @@ -1655,7 +1635,7 @@ static int vc4_dsi_bind(struct device *dev, struct =
device *master, void *data)
>         struct drm_encoder *encoder =3D &dsi->encoder.base;
>         int ret;
>
> -       vc4_dsi_get(dsi);
> +       drm_bridge_get(&dsi->bridge);
>
>         ret =3D drmm_add_action_or_reset(drm, vc4_dsi_release_action, dsi=
);
>         if (ret)
> @@ -1810,15 +1790,12 @@ static int vc4_dsi_dev_probe(struct platform_devi=
ce *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct vc4_dsi *dsi;
>
> -       dsi =3D kzalloc(sizeof(*dsi), GFP_KERNEL);
> -       if (!dsi)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(&pdev->dev, struct vc4_dsi, bridge,=
 &vc4_dsi_bridge_funcs);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>         dev_set_drvdata(dev, dsi);
>
> -       kref_init(&dsi->kref);
> -
>         dsi->pdev =3D pdev;
> -       dsi->bridge.funcs =3D &vc4_dsi_bridge_funcs;
>  #ifdef CONFIG_OF
>         dsi->bridge.of_node =3D dev->of_node;
>  #endif
> @@ -1836,7 +1813,6 @@ static void vc4_dsi_dev_remove(struct platform_devi=
ce *pdev)
>         struct vc4_dsi *dsi =3D dev_get_drvdata(dev);
>
>         mipi_dsi_host_unregister(&dsi->dsi_host);
> -       vc4_dsi_put(dsi);
>  }
>
>  struct platform_driver vc4_dsi_driver =3D {
>
> --
> 2.49.0
>

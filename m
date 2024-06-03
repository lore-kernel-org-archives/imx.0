Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CF9BE48
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 03:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717383942; cv=none; b=SXKfh+OGqq2h9sa8jgqwUaOv8yMOiQbGB8VOVPK53Eda2T69E7DKwJl181g72CaI1ErpZiMvFb1O3YjCHYnt4rPux3Ye0CcmNNrOtF6emxPQ1AyTYFFVEXKnRe4TmP8ebXlKQfkaqa6F7u7OptVKMXmK+fyRGobOeS97SUTpvVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717383942; c=relaxed/simple;
	bh=/GyxD5rC8Zqtp4hk/yBIKR2/o4ziMaBwm0qqbNSJiMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwtsf0A4y+1pxanCVJrpMB3VvGvsGss4zikCN4BTe2rX/HEInPBaxW0b/9sk2YZOSOQw5WIBcZMPCNlzKhYYT+5XHIAhyujRD0kmmR2WIGTEjM61RuF6qsU9Ur0k9pxoafH6jGWeOaf8adS6svkaZuhRmdv2WSmlWowwHBztv+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ldap05u+; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ldap05u+"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eaad2c673fso8629911fa.3
        for <imx@lists.linux.dev>; Sun, 02 Jun 2024 20:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717383939; x=1717988739; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjbofJ4QhGtFV8hR/G9Tjboy1h+3aztsLKcxB9QZ+1s=;
        b=Ldap05u+ILfgNNClAf7fCtBmCCv0N79Q9dKx9yi3GCOgFSxpPFeJNLOQg9RtV3qsd6
         WMOUHYJu1/vlGXREAicSDMG+TluaLsVvxjWbksNVYoN6u/VXFhLWEQZIivqz6NLI3ep3
         9tszc5WUDmdohmmG57a3LcGJjZd8BBM4BmhSWflCG3vIppsS4gR7t/D9oRSgVhBubWJm
         zqMxddoHntGODRy+iM+p/vfHpbVsAtqDSLhj8eG2W1TL487ZO226H6brrRDjaEfX9fo+
         HP7Bp65faB8/XJw2pO9hHY6eKzWRNItrrIS5ghZRjDUkgychq4v6OPa2zEC1cjv9Hhfr
         Gawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717383939; x=1717988739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjbofJ4QhGtFV8hR/G9Tjboy1h+3aztsLKcxB9QZ+1s=;
        b=MfrCa5msqr4AuomGsvuwdr4uThdLD2AgkUHpO/MmcYew/hn7AaL2vayjotmdxcPmnG
         j94AX6yrQxOFo05cOqABZKgW47gPV7RVJkY5RnAcfULjmEf8sCdwvhhi/0+fqajaDQEm
         asB8O1vSJTc3fIH1bs62e6YOJMyf3MA+2l9IRHWOCZdaxseBjFsvNnxlGBuBpy/q1ga/
         GDQ71lTipu604tRnJDXuWdpEjf+IAWesWGejSjNqRa7R9ZbsulXSKKdfzqXLMFwE1OVp
         qqC5c06sj64+a2wIlEmQDG8HzUMcrel+0yiS4PyQqRDuZANr9Zt11VabVB6r5XoiE4zf
         ycLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDuypWGOteGLVu8NKsXnTabwYJlRFBZn1aWVRJAevs/cV8RHMHmxixImGPMAyKR62gaHY13P/7fsHy0+lOqhZJtmL0
X-Gm-Message-State: AOJu0YzKKfZryj+B7mwu/4SqGlysfikVMietcnFoLQwKeyB3wGHQJ25R
	78345RqQgiILNOO/A4zHJ6dbS5qWzEJ0hTXLZDT/AhyraVSrg9Pcx0cu5rLsIFXy4r5f+6ONVDm
	OhOJGELj9Gz+DuQDXY7QFielGjG4=
X-Google-Smtp-Source: AGHT+IGAy9L5QmUGuRFXmfHd42nmRBDmJWy1EV2xrDLPHLiwUr4qkqY9jQgDywNed/Xl7l5P7xkbPH0kNLImzsAsUSo=
X-Received: by 2002:a05:651c:2059:b0:2ea:7a2a:4d1c with SMTP id
 38308e7fff4ca-2ea950e93b3mr62175161fa.8.1717383938853; Sun, 02 Jun 2024
 20:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org> <20240602-drm-imx-cleanup-v3-11-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-11-e549e2a43100@linaro.org>
From: Chris Healy <cphealy@gmail.com>
Date: Sun, 2 Jun 2024 20:05:27 -0700
Message-ID: <CAFXsbZrGR8uX3i-vR_+B2HjZMM+y0+j6tVy69fA2JRF7ZMZ0Tg@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] drm/imx: parallel-display: switch to
 imx_legacy_bridge / drm_bridge_connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 2, 2024 at 5:04=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Use the imx_legacy bridge driver instead of handlign display modes via
> the connector node.

fix spelling of "handling"
>
> All existing usecases already support attaching using
> the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, while the imx_legacy bridge
> doesn't support creating connector at all. Switch to
> drm_bridge_connector at the same time.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c | 100 ++++++---------------=
------
>  1 file changed, 20 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/d=
rm/imx/ipuv3/parallel-display.c
> index 9ac2a94fa62b..70f62e89622e 100644
> --- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> +++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> @@ -12,19 +12,18 @@
>  #include <linux/platform_device.h>
>  #include <linux/videodev2.h>
>
> -#include <video/of_display_timing.h>
> -
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> +#include <drm/bridge/imx.h>
>
>  #include "imx-drm.h"
>
>  struct imx_parallel_display_encoder {
> -       struct drm_connector connector;
>         struct drm_encoder encoder;
>         struct drm_bridge bridge;
>         struct imx_parallel_display *pd;
> @@ -33,51 +32,14 @@ struct imx_parallel_display_encoder {
>  struct imx_parallel_display {
>         struct device *dev;
>         u32 bus_format;
> -       u32 bus_flags;
> -       struct drm_display_mode mode;
>         struct drm_bridge *next_bridge;
>  };
>
> -static inline struct imx_parallel_display *con_to_imxpd(struct drm_conne=
ctor *c)
> -{
> -       return container_of(c, struct imx_parallel_display_encoder, conne=
ctor)->pd;
> -}
> -
>  static inline struct imx_parallel_display *bridge_to_imxpd(struct drm_br=
idge *b)
>  {
>         return container_of(b, struct imx_parallel_display_encoder, bridg=
e)->pd;
>  }
>
> -static int imx_pd_connector_get_modes(struct drm_connector *connector)
> -{
> -       struct imx_parallel_display *imxpd =3D con_to_imxpd(connector);
> -       struct device_node *np =3D imxpd->dev->of_node;
> -       int num_modes;
> -
> -       if (np) {
> -               struct drm_display_mode *mode =3D drm_mode_create(connect=
or->dev);
> -               int ret;
> -
> -               if (!mode)
> -                       return 0;
> -
> -               ret =3D of_get_drm_display_mode(np, &imxpd->mode,
> -                                             &imxpd->bus_flags,
> -                                             OF_USE_NATIVE_MODE);
> -               if (ret) {
> -                       drm_mode_destroy(connector->dev, mode);
> -                       return 0;
> -               }
> -
> -               drm_mode_copy(mode, &imxpd->mode);
> -               mode->type |=3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREF=
ERRED;
> -               drm_mode_probed_add(connector, mode);
> -               num_modes++;
> -       }
> -
> -       return num_modes;
> -}
> -
>  static const u32 imx_pd_bus_fmts[] =3D {
>         MEDIA_BUS_FMT_RGB888_1X24,
>         MEDIA_BUS_FMT_BGR888_1X24,
> @@ -171,7 +133,6 @@ static int imx_pd_bridge_atomic_check(struct drm_brid=
ge *bridge,
>  {
>         struct imx_crtc_state *imx_crtc_state =3D to_imx_crtc_state(crtc_=
state);
>         struct drm_display_info *di =3D &conn_state->connector->display_i=
nfo;
> -       struct imx_parallel_display *imxpd =3D bridge_to_imxpd(bridge);
>         struct drm_bridge_state *next_bridge_state =3D NULL;
>         struct drm_bridge *next_bridge;
>         u32 bus_flags, bus_fmt;
> @@ -183,10 +144,8 @@ static int imx_pd_bridge_atomic_check(struct drm_bri=
dge *bridge,
>
>         if (next_bridge_state)
>                 bus_flags =3D next_bridge_state->input_bus_cfg.flags;
> -       else if (di->num_bus_formats)
> -               bus_flags =3D di->bus_flags;
>         else
> -               bus_flags =3D imxpd->bus_flags;
> +               bus_flags =3D di->bus_flags;
>
>         bus_fmt =3D bridge_state->input_bus_cfg.format;
>         if (!imx_pd_format_supported(bus_fmt))
> @@ -202,19 +161,16 @@ static int imx_pd_bridge_atomic_check(struct drm_br=
idge *bridge,
>         return 0;
>  }
>
> -static const struct drm_connector_funcs imx_pd_connector_funcs =3D {
> -       .fill_modes =3D drm_helper_probe_single_connector_modes,
> -       .destroy =3D imx_drm_connector_destroy,
> -       .reset =3D drm_atomic_helper_connector_reset,
> -       .atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate=
_state,
> -       .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_sta=
te,
> -};
> +static int imx_pd_bridge_attach(struct drm_bridge *bridge,
> +                               enum drm_bridge_attach_flags flags)
> +{
> +       struct imx_parallel_display *imxpd =3D bridge_to_imxpd(bridge);
>
> -static const struct drm_connector_helper_funcs imx_pd_connector_helper_f=
uncs =3D {
> -       .get_modes =3D imx_pd_connector_get_modes,
> -};
> +       return drm_bridge_attach(bridge->encoder, imxpd->next_bridge, bri=
dge, flags);
> +}
>
>  static const struct drm_bridge_funcs imx_pd_bridge_funcs =3D {
> +       .attach =3D imx_pd_bridge_attach,
>         .atomic_reset =3D drm_atomic_helper_bridge_reset,
>         .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
>         .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> @@ -239,7 +195,6 @@ static int imx_pd_bind(struct device *dev, struct dev=
ice *master, void *data)
>                 return PTR_ERR(imxpd_encoder);
>
>         imxpd_encoder->pd =3D imxpd;
> -       connector =3D &imxpd_encoder->connector;
>         encoder =3D &imxpd_encoder->encoder;
>         bridge =3D &imxpd_encoder->bridge;
>
> @@ -247,28 +202,14 @@ static int imx_pd_bind(struct device *dev, struct d=
evice *master, void *data)
>         if (ret)
>                 return ret;
>
> -       /* set the connector's dpms to OFF so that
> -        * drm_helper_connector_dpms() won't return
> -        * immediately since the current state is ON
> -        * at this point.
> -        */
> -       connector->dpms =3D DRM_MODE_DPMS_OFF;
> -
>         bridge->funcs =3D &imx_pd_bridge_funcs;
> -       drm_bridge_attach(encoder, bridge, NULL, 0);
> -
> -       if (imxpd->next_bridge) {
> -               ret =3D drm_bridge_attach(encoder, imxpd->next_bridge, br=
idge, 0);
> -               if (ret < 0)
> -                       return ret;
> -       } else {
> -               drm_connector_helper_add(connector,
> -                                        &imx_pd_connector_helper_funcs);
> -               drm_connector_init(drm, connector, &imx_pd_connector_func=
s,
> -                                  DRM_MODE_CONNECTOR_DPI);
> -
> -               drm_connector_attach_encoder(connector, encoder);
> -       }
> +       drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CON=
NECTOR);
> +
> +       connector =3D drm_bridge_connector_init(drm, encoder);
> +       if (IS_ERR(connector))
> +               return PTR_ERR(connector);
> +
> +       drm_connector_attach_encoder(connector, encoder);
>
>         return 0;
>  }
> @@ -292,12 +233,11 @@ static int imx_pd_probe(struct platform_device *pde=
v)
>
>         /* port@1 is the output port */
>         imxpd->next_bridge =3D devm_drm_of_get_bridge(dev, np, 1, 0);
> +       if (imxpd->next_bridge =3D=3D ERR_PTR(-ENODEV))
> +               imxpd->next_bridge =3D devm_imx_drm_legacy_bridge(dev, np=
, DRM_MODE_CONNECTOR_DPI);
>         if (IS_ERR(imxpd->next_bridge)) {
>                 ret =3D PTR_ERR(imxpd->next_bridge);
> -               if (ret !=3D -ENODEV)
> -                       return ret;
> -
> -               imxpd->next_bridge =3D NULL;
> +               return ret;
>         }
>
>         ret =3D of_property_read_string(np, "interface-pix-fmt", &fmt);
>
> --
> 2.39.2
>

Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870D63A1BE
	for <imx@lists.linux.dev>; Mon, 11 Mar 2024 11:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710156299; cv=none; b=qKZccILIheZFFfbCqtXv7gpwZYFOLo1T7bcM+cL/NEyxyKaLGEQUFjYIns6YqADK+qz6w4mFpk046OPGeFnKbDCywwsrpwQGeYiNJCTi+OL5NSzLMa6IgoIf3iiGsGejAP7ODgLBlHy+ujrFg5pzCBY8GY7rHg+2ExgsOuWXrNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710156299; c=relaxed/simple;
	bh=N9UtfBXWVg6XXA83MdMuDQOmpH9JbIBoGct16wva8Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wh4laRSP6PhKIRs/DFOAo28/f648W/upvmjtETrbutMFfGmx6cE7WsAZF+MhkOdfcGafVGsy4/n3MWfPZ2EwisiuA07mPpA8l2YurDVssPF/Y7RTd2IWxwDpGI8Heo7J20Im2aJK53XVMQTIEbSOSv8hfiKVYcVc16SZFEBGkJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSJ+yN8J; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSJ+yN8J"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc742543119so2527243276.0
        for <imx@lists.linux.dev>; Mon, 11 Mar 2024 04:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710156296; x=1710761096; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S0IsFe9y8t0EcHo4tcp8SMBDbuFs5ifF+Z+mZqRXXwk=;
        b=HSJ+yN8JD1rRXw75J/KzKmO30DqBbNfrWlbdF2gDIcZsNhmGqo/Z7k3FoOwh4satuk
         Qy7hZq7zqLjx5gEd22e3LRp/mrLhuNcUQECK09+No3PaacsU2TS2h0Mjow7LpXj4YUXz
         iM6Fw/ooUSM2adZ1SW14kDt/s+m3etA4dbbwOWHksQ5nLLSlqGi0LQtXFTQ8io0bbWo4
         xUk8+fZZDgxHEA23JPm2SFZf/KgtPivieG/V11QJP/Jcv/V4iZStYmzMHcycTKhDKv19
         Y7vxoQr/ntqwfrVbzqEzxbmlld0jB7DFQROPJ6xO2TrFbYHIhiD6q1YEqkBacDuVp59V
         74+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710156296; x=1710761096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0IsFe9y8t0EcHo4tcp8SMBDbuFs5ifF+Z+mZqRXXwk=;
        b=KtA3iB4qVC4c4jMBb+Ypb8cUOj4wo4QRGEdIqN/iX2TS72+MNLk9kMcIGpCJSEVAIx
         EH9Wn9razC82vjOF5h25a3DDlHQDM3nIYmqWnq8+IcSRFfhML4sJfGlfuL5dc0elHc1N
         j4VihXAGmvY+rS3Jdxwki76gjOPvEZrRmZE0J9cLZQR/vcnEMUkeJTlGe41AH96th0ZA
         BEozRTmoP7C0ykr/S/vB1e00ueYMZfRR9tiMQLID5BhJ8qitmvSStxSSWnb08n9SLVyC
         TnbRgNogD/HUrNFJdXnsqRCa8JAXsT2IDYSRYNK4D6BuW81rln7DDA7Zf+jXFzZ10saa
         hTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz+B4VSrCJtAYscNg163242wsxOS2rBURuxclaq8Y3WD+N+XovfZpHs2QSzzxvq+bWsubtpNl+1JHL2tfPvAib4VHX
X-Gm-Message-State: AOJu0YwZAeekCao223JXHrunpElKxZp7GLre1kClVioJBW0AbsqXvx+i
	UKrWhgyAtdBvG3E3be65Ikt/oY0VBBxcnXnFr8I0d1RuW5fuD+yxg3o408Jfaa01mIiTXBDwlUR
	duytDOxleTMzjKGIZTeIld3qy4x6vHoBlygicbQ==
X-Google-Smtp-Source: AGHT+IH6UM8A9Kfzf16Bc6glr4NWyGl0cEcRcD8zoWTvcHgtglC2mDiiwEZhjQ2RxH7iBK1Kah1MXY01ERDeTMOH6wE=
X-Received: by 2002:a25:9907:0:b0:dc6:ff12:13d7 with SMTP id
 z7-20020a259907000000b00dc6ff1213d7mr2732619ybn.60.1710156296453; Mon, 11 Mar
 2024 04:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org> <20240311-drm-imx-cleanup-v1-11-e104f05caa51@linaro.org>
In-Reply-To: <20240311-drm-imx-cleanup-v1-11-e104f05caa51@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:24:45 +0200
Message-ID: <CAA8EJprf4RJageEa+-PTTR9WSFzkZfiQLnHqiEZG2uH79cqSBA@mail.gmail.com>
Subject: Re: [PATCH 11/12] drm/imx: parallel-display: switch to
 imx_legacy_bridge / drm_bridge_connector
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Mar 2024 at 13:20, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Use the imx_legacy bridge driver instead of handlign display modes via
> the connector node.
>
> All existing usecases already support attaching using
> the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, while the imx_legacy bridge
> doesn't support creating connector at all. Switch to
> drm_bridge_connector at the same time.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c | 95 +++++-----------------------
>  1 file changed, 17 insertions(+), 78 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> index 9b60bfbd16e6..73a15259c93c 100644
> --- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> +++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> @@ -12,10 +12,9 @@
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
>  #include <drm/drm_panel.h>
> @@ -25,7 +24,6 @@
>  #include "imx-drm.h"
>
>  struct imx_parallel_display_encoder {
> -       struct drm_connector connector;
>         struct drm_encoder encoder;
>         struct drm_bridge bridge;
>         struct imx_parallel_display *pd;
> @@ -34,51 +32,14 @@ struct imx_parallel_display_encoder {
>  struct imx_parallel_display {
>         struct device *dev;
>         u32 bus_format;
> -       u32 bus_flags;
> -       struct drm_display_mode mode;
>         struct drm_bridge *next_bridge;
>  };
>
> -static inline struct imx_parallel_display *con_to_imxpd(struct drm_connector *c)
> -{
> -       return container_of(c, struct imx_parallel_display_encoder, connector)->pd;
> -}
> -
>  static inline struct imx_parallel_display *bridge_to_imxpd(struct drm_bridge *b)
>  {
>         return container_of(b, struct imx_parallel_display_encoder, bridge)->pd;
>  }
>
> -static int imx_pd_connector_get_modes(struct drm_connector *connector)
> -{
> -       struct imx_parallel_display *imxpd = con_to_imxpd(connector);
> -       struct device_node *np = imxpd->dev->of_node;
> -       int num_modes;
> -
> -       if (np) {
> -               struct drm_display_mode *mode = drm_mode_create(connector->dev);
> -               int ret;
> -
> -               if (!mode)
> -                       return -EINVAL;
> -
> -               ret = of_get_drm_display_mode(np, &imxpd->mode,
> -                                             &imxpd->bus_flags,
> -                                             OF_USE_NATIVE_MODE);
> -               if (ret) {
> -                       drm_mode_destroy(connector->dev, mode);
> -                       return ret;
> -               }
> -
> -               drm_mode_copy(mode, &imxpd->mode);
> -               mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> -               drm_mode_probed_add(connector, mode);
> -               num_modes++;
> -       }
> -
> -       return num_modes;
> -}
> -
>  static const u32 imx_pd_bus_fmts[] = {
>         MEDIA_BUS_FMT_RGB888_1X24,
>         MEDIA_BUS_FMT_BGR888_1X24,
> @@ -172,7 +133,6 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
>  {
>         struct imx_crtc_state *imx_crtc_state = to_imx_crtc_state(crtc_state);
>         struct drm_display_info *di = &conn_state->connector->display_info;
> -       struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
>         struct drm_bridge_state *next_bridge_state = NULL;
>         struct drm_bridge *next_bridge;
>         u32 bus_flags, bus_fmt;
> @@ -184,10 +144,8 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
>
>         if (next_bridge_state)
>                 bus_flags = next_bridge_state->input_bus_cfg.flags;
> -       else if (di->num_bus_formats)
> -               bus_flags = di->bus_flags;
>         else
> -               bus_flags = imxpd->bus_flags;
> +               bus_flags = di->bus_flags;
>
>         bus_fmt = bridge_state->input_bus_cfg.format;
>         if (!imx_pd_format_supported(bus_fmt))
> @@ -203,19 +161,16 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
>         return 0;
>  }
>
> -static const struct drm_connector_funcs imx_pd_connector_funcs = {
> -       .fill_modes = drm_helper_probe_single_connector_modes,
> -       .destroy = imx_drm_connector_destroy,
> -       .reset = drm_atomic_helper_connector_reset,
> -       .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> +static int imx_pd_bridge_attach(struct drm_bridge *bridge,
> +                               enum drm_bridge_attach_flags flags)
> +{
> +       struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
>
> -static const struct drm_connector_helper_funcs imx_pd_connector_helper_funcs = {
> -       .get_modes = imx_pd_connector_get_modes,
> -};
> +       return drm_bridge_attach(bridge->encoder, imxpd->next_bridge, bridge, flags);
> +}
>
>  static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
> +       .attach = imx_pd_bridge_attach,
>         .atomic_reset = drm_atomic_helper_bridge_reset,
>         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> @@ -240,7 +195,6 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
>                 return PTR_ERR(imxpd_encoder);
>
>         imxpd_encoder->pd = imxpd;
> -       connector = &imxpd_encoder->connector;
>         encoder = &imxpd_encoder->encoder;
>         bridge = &imxpd_encoder->bridge;
>
> @@ -248,28 +202,14 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
>         if (ret)
>                 return ret;
>
> -       /* set the connector's dpms to OFF so that
> -        * drm_helper_connector_dpms() won't return
> -        * immediately since the current state is ON
> -        * at this point.
> -        */
> -       connector->dpms = DRM_MODE_DPMS_OFF;
> -
>         bridge->funcs = &imx_pd_bridge_funcs;
>         drm_bridge_attach(encoder, bridge, NULL, 0);

This should have become DRM_BRIDGE_ATTACH_NO_CONNECTOR. I'll fix it
for v2, if the overall series is thought to be acceptable.

>
> -       if (imxpd->next_bridge) {
> -               ret = drm_bridge_attach(encoder, imxpd->next_bridge, bridge, 0);
> -               if (ret < 0)
> -                       return ret;
> -       } else {
> -               drm_connector_helper_add(connector,
> -                                        &imx_pd_connector_helper_funcs);
> -               drm_connector_init(drm, connector, &imx_pd_connector_funcs,
> -                                  DRM_MODE_CONNECTOR_DPI);
> -
> -               drm_connector_attach_encoder(connector, encoder);
> -       }
> +       connector = drm_bridge_connector_init(drm, encoder);
> +       if (IS_ERR(connector))
> +               return PTR_ERR(connector);
> +
> +       drm_connector_attach_encoder(connector, encoder);
>
>         return 0;
>  }
> @@ -293,12 +233,11 @@ static int imx_pd_probe(struct platform_device *pdev)
>
>         /* port@1 is the output port */
>         imxpd->next_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
> +       if (imxpd->next_bridge == ERR_PTR(-ENODEV))
> +               imxpd->next_bridge = devm_imx_drm_legacy_bridge(dev, np, DRM_MODE_CONNECTOR_DPI);
>         if (IS_ERR(imxpd->next_bridge)) {
>                 ret = PTR_ERR(imxpd->next_bridge);
> -               if (ret != -ENODEV)
> -                       return ret;
> -
> -               imxpd->next_bridge = NULL;
> +               return ret;
>         }
>
>         ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

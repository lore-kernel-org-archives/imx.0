Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC5D35C183
	for <imx@lists.linux.dev>; Mon,  3 Aug 2026 12:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761793; cv=none; b=acLYucwxdUf46V/kNCUWxizyAzxCudHK930xR+TMnmEewlAPlTiDMCkJ7F5mRuSb+PLMUBrwpygRFpZCQl17qkjC9gdFtq1lAhDWnpbbWC9PUjc8i2FFZl7MUJgN5Uir0j8iZZVRZVrHJ3q26ZuI4Q+3fkeF/P0sb2u0O6/JQFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761793; c=relaxed/simple;
	bh=Ir8txI41duHjjdUa1tYJv/Mb4slAcXRYTZiQjfKa4u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWKmc8dEQjp9rA22BH5n0spKJ9OYq2Kh1vOooH8+YyGkM6bxR+sqsD48u03U6on4mD5oTFxwMDT1bijMR2rb397jJqdd9shumv15KEUkLgDYYDslBjMOufKbmFgeon4+wowSrAa0nT+DN18J950ExbMGIyqQmxXFWcXsegtWjlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c3a1d005c5so599054e0c.1
        for <imx@lists.linux.dev>; Mon, 03 Aug 2026 05:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761791; x=1786366591;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WGVqxVKLC2Gks94xayPEyUqyvnJiYIaVHNXa8plDaec=;
        b=GKv1N9OEMayXwlF47phRGm/Cdsql4z9BZ60MzJfy+6k1LmsJRszyvPA74UrREiqtBT
         ibUYZxPGGJ8wQwKCKXBJ89lwmqGs5mjCLRwnYkFWOhl50CJeK9JQykJsDdMYkdl7XAtl
         xvuh0Le+D/Kb2fw2NVFdOxONpyMAXNQKbFTn42/adqqqDsyEHWSkqjtJvn5uI399XGCB
         3+Pw4dPSdor4+SH+I4MqU7PGZhNI4Zu+ovcsKcanseT4sncY+vAWSamadn9KIcuSJh9s
         UbN8fvbY89OT23pz7rcEf/i5IzwaRuudTkPiU7E8eU75KFkjnmMYLsTyzQeTSsdnpkfm
         UlDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDRCUsxT9/4ZVEVkCRr5p2cKEAXyOrmK7VKYSuD+0QTmhIvAbVb5R5z9Bjgpnn85lnbnw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRe6vlUoMatZkmFQfDxGXh7QmdPyamDsJ7nQBPmg7+rxtIdEXq
	sqS6+wdRcm/Ca+bdmmOkNiqmCdIMCRZecEQuq2orQVsnkr5kNWh1bFmqWVgi4SYP
X-Gm-Gg: AR+sD11HEvEUvLEhgmaIsPlPUzz5BJ7aS81OQxT4+3tPhz5M7WVycdPpBbfsqE4kHNU
	q4LvyCp3ptIDKdUAo5qG/TlwjLAPAEytC6YHQezyDnsXFMuk0Rzc2rPWI6q6Ck3ni2cRWcIgfEI
	vBwD5HTqV6q5kV+NPOg8cxzY06mbeV05DqK2eExd9bObY7LC2sawr31SwTWytI/Gel6Ibk4UPrd
	p9QeFAKpZLfI9fEMBSeii4TUUrCIic6Dju6QrTMjmFsuUEIBrscQ9LYnkK6vKUE2F7o0ePtXEb5
	+un8FOl/qBZXqBVjQXC308DBe9Urng8zEfgGwjeUCvMMXNkxsIcR8+rqXfSsWUcuCTGdpNtuD6q
	LHzpKmZz7rHKef8yvu1CRdBgEct1C/PehjwlPdngposl2e7KSKEUb2LcoMLMIsr/HszsTGJ//pi
	2NU328qt4zkGEdV/RgG2zrGEnDmPmApIIorjGF47aaCd+kmjqDUyO2sWyrYpYUuKYQbf7gRfh93
	wGw8qHkhpd2l9zWXTzvYql6Hw==
X-Received: by 2002:a05:6122:78a:b0:5bd:73b5:6d25 with SMTP id 71dfb90a1353d-5c3877687dcmr3050355e0c.5.1785761790776;
        Mon, 03 Aug 2026 05:56:30 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c37eb6befasm8610170e0c.8.2026.08.03.05.56.30
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:56:30 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-74d55dac06eso1885113137.3
        for <imx@lists.linux.dev>; Mon, 03 Aug 2026 05:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RodeTaSdg2Hm6HW33ertw3MLudS0u2rpqB8RoZebs9oFE0Frv+X3CuPtwGJ4vLZih5gLv8=@lists.linux.dev
X-Received: by 2002:a05:6102:6a83:b0:729:affa:70fd with SMTP id
 ada2fe7eead31-75b2295c6d6mr7103654137.8.1785761305110; Mon, 03 Aug 2026
 05:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 14:48:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
X-Gm-Features: AUfX_mz7dUNKx_CkXmX2bBiqeRWfQJXaKympC5b4Q722_mZANMq2M_rTZsMnNYo
Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Michal Simek <michal.simek@amd.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Diogo,

On Mon, 20 Jul 2026 at 17:41, Diogo Silva <diogompaissilva@gmail.com> wrote:
> The simple KMS helpers are deprecated because they only add an
> intermediate layer between drivers and atomic modesetting.
>
> Open-code drm_simple_encoder_init() by calling drm_encoder_init()
> directly and providing driver-local drm_encoder_funcs.
>
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c

> @@ -29,7 +30,6 @@
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
>
>  #include <video/videomode.h>
> @@ -436,6 +436,10 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
>         .mode_fixup = shmob_drm_encoder_mode_fixup,
>  };
>
> +static const struct drm_encoder_funcs shmob_encoder_funcs = {

Nit: shmob_drm_encoder_funcs?

> +       .destroy = drm_encoder_cleanup,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Encoder
>   */

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

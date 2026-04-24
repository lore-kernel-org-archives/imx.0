Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD4D3126C0
	for <imx@lists.linux.dev>; Fri, 24 Apr 2026 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017028; cv=none; b=dNpnxBNSCiYwStUSGQ0YDv3CS3BVadYoPay4BnUA6+YsqMFLKbKHXyvfZwqwydUlcESte11MzFogmL6A8+bhBGxsrxBFkm0v2B/KQhrPSe1+ajvxK9Pm6K3zPcUIQi25wJ872uYDrHn/vJ6w9bkma/IpixJsPro/HBUplT2G90M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017028; c=relaxed/simple;
	bh=BZaZ3g7ZBPkjQoz8nLCka6ZxevyTyp8FYNkCXs7p8Ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSRDRquRF0GZ9Y/Vh90Gjs8UFrOvLXEW/XQggB9XrmvSRwcgyXhu6YXN2RvpsgljHmF1xAhjXZSp/TpdTj7BukhAqleymXEQuSyTKZQhRrLTywOruAuYJx/KjQxz1Ni8KXpD8F1F3VdyhBS5HV6CsQ3UDOYDJkYDZGclPOpPbn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-956995b5bb6so2008171241.3
        for <imx@lists.linux.dev>; Fri, 24 Apr 2026 00:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017026; x=1777621826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+k21mzy1Q8IyL290m/XCuURamP2UyoHvl1hWQE5Pk/w=;
        b=ph4zSw+jvnhxNCmQaHO7ncBGC4PRrfku1I1O1KrEt/jxCRbFHhmi+IkIeAMarAf6Sy
         5hPrGADDPNoef37zCBxXAM7fQTRkSk79d8KMp1S/DSqns/wQuvXFpxGTbQrOzRNcr8qa
         MWM8WDmyIvQ+iiUqe31haMalXVqX0tSHauRY+YewjdtWiolDHmaQElCi4plnJcdg80a7
         sdmNrgJ9h/N+z44TrotPgen1Pq8gc0xExNYFg+5ZBgBF84i8Nap7GeRAH5OMMVT+9LwK
         qU5echp1GS5KZpQywK4nxHoHEFy/wgjBLhOrYtHM3iNdOdBlOPikyFzG8EuYekFeResM
         OlpQ==
X-Forwarded-Encrypted: i=1; AFNElJ950DgTiVOmwE0Qw+54XxCKuPwhHqfrFqTTkaF05HYzHz/pOndL9GeCd87tjJNhlsAYhk8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXI8Y9Zrj/LlogA+X4h29aIED2zTU+0lE+HSHBkIyIdV6CTLZn
	DLslGsc6CJ0nBzLpW+gsrbDFRfUlSe6fiK1kKP+OQqT3vrqKp4/el7FRBLQ59F+6NY4=
X-Gm-Gg: AeBDietGf0q1XfoMkIYI/rD0S2UC0vN50X500l61XGq4NajBpWFcGsDzyu0D/CO2UJG
	NVHegjh7rXVHzlDLInYEJs26nFTTO/1j6sJEpRIfAimsPGM0aF8GxzC/q1ogiSiRv3Dma114k/Z
	6lhR2eG4Xxq9TBL2Ph065NKcxBPL2yJE2EzypcoTx1fjDRjTNKIEs8vN5xzWGqQvacWEV4NMK/i
	mOs2IVsthIT1hiY7MfUK9Fd2PwVUwaag40OH9QC75wOR2A+HgmLeECtPaX7i8VRUiYCgK3AkWIB
	dm9Fp2/tHoS6oav2YGZL4zf2o4Yut2j6VDr5Fv7Oxi1L/KYn1ZD/ZlQmNCJ8wJHhDdCWVWxCxon
	Rx9NvW43mfHwQXZnMFBASE1Tfw65msmRWgnSSXQImcKU9uym8yl5xl8t1KlGPj3IooV4kGVHigi
	pBybN3y9xgnU27cfufyVEYyRGYEAlmU5LBzHLGFy6sDnqBwzubWjbF/h8j+HouoqHWd2ME7E0=
X-Received: by 2002:a05:6102:4a90:b0:611:17bb:934a with SMTP id ada2fe7eead31-616f88b456amr15103202137.28.1777017025588;
        Fri, 24 Apr 2026 00:50:25 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61745c9e53esm10833519137.5.2026.04.24.00.50.23
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:50:23 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95699e8e26aso1846444241.0
        for <imx@lists.linux.dev>; Fri, 24 Apr 2026 00:50:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+04riqKDRp3F65WK8HxUHdV2U1x7aw0LPfzEClh/CG/7X0sbQ4ZOEg30wka0yrfP/5bGc=@lists.linux.dev
X-Received: by 2002:a05:6102:38cb:b0:5e8:1d93:921a with SMTP id
 ada2fe7eead31-616f772e968mr14645934137.15.1777017023068; Fri, 24 Apr 2026
 00:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115550.444930-7-luca.ceresoli@bootlin.com>
In-Reply-To: <20260423115550.444930-7-luca.ceresoli@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:50:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
X-Gm-Features: AQROBzASdrVB_Aky8lNaIViGqa4fIOoRKTkBEjNLF-nFJbKyYgy5oQezNNnYjKM
Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
Subject: Re: [PATCH v2 41/41] drm: renesas: shmobile: remove now-redundant
 call to drm_connector_attach_encoder()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, Liu Ying <victor.liu@nxp.com>, 
	Douglas Anderson <dianders@chromium.org>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jingoo Han <jingoohan1@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek <michal.simek@amd.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Luca,

On Thu, 23 Apr 2026 at 13:59, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> shmob_drm_connector_create() can init the connector in two ways, based on
> the 'if (sdev->pdata)':
>
>  1. manually in shmob_drm_connector_create(), or
>  2. delegating to drm_bridge_connector_init()
>
> Whichever branch is taken, drm_connector_attach_encoder() is called
> immediately after to attach the connector to the encoder.
>
> Now drm_bridge_connector_init() calls drm_connector_attach_encoder() on the
> connector so it is not needed anymore in case 2 and should be removed, but
> it is still needed in case 1. Move drm_connector_attach_encoder() from the
> common path to inside shmob_drm_connector_create() in order to get back to
> a single drm_connector_attach_encoder() in both cases.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

For case 2:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

As none of the old SH platform have been converted from
sh_mobile_lcdc_fb to shmob-drm yet, case 1 cannot be tested.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

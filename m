Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EA71802A4
	for <imx@lists.linux.dev>; Wed, 17 Jul 2024 13:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721224653; cv=none; b=UnHnPG9PKV8En481M3cdmRrhUJtPjOnMuhmvMFG3JxLSm0Biw8+3FszXDkj1fy/ODBYcag+mluxEY8d1rIg4lb0FBOp8AMyCw/PO54v2/gpRmZ1Oht4sV2qIwYPDaaY8EueW+jlm1JGeLYABF7yG116JyffVDJAxUqTNJs0CcHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721224653; c=relaxed/simple;
	bh=mj9lyALcWaNJFJX7S4WRviV1aZ7NNgMIecZZbWmCzDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSiJIwRG72wg30xH5eGFqyRhlegk7w3Xlh+1k/z5dsX12zg0qhS4yg+bvkuk0ORUW8MrpSS4MhrRthwJ2SMuzum4JkFr6UfrxxKnampegIYPIg7srVwMrV6NNwZz6G4C+VMhkiGSBMYuMQUsDiCzQhSbx55cwyCsyrDHFFG5zx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=err3vM7k; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="err3vM7k"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ee910d6a9eso7603051fa.1
        for <imx@lists.linux.dev>; Wed, 17 Jul 2024 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721224650; x=1721829450; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHJbV+bzx4RI8mDOQI+N5X7vHq/DAFW5fyNCzOVzMjI=;
        b=err3vM7kj7LNb/RxKJMbIg/zvzIwQ+DZuKYOOL8hvZ2tlm/r4b0cMFkfdJsFlB9gHv
         0oseEUA82C7BBrV4S3QHf95V/8Eo2NK23/MossfAZb9UUGzrAtbUslidBT46XoP8pHuq
         Ab0D9jZHpIWRUNbDryURUYborbHalrEi7TGBwOu54uJDWSOZVIkxg1iKuPQn1I8+i5nN
         L1yUExEF8ZtyPH/mpIL/hxwyPG6UJqVSLH+0GgLDMGvwBmewgt7NesdWLES5nqhePHdr
         +3nnwM4puQ+Fys1x+ygth2jhb2r2NIXNar8NJ/HvznAeWASRD2F1Nr5/IYsgsG9Z6Jw1
         hSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721224650; x=1721829450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHJbV+bzx4RI8mDOQI+N5X7vHq/DAFW5fyNCzOVzMjI=;
        b=V0tkzCTXXxoJvFz7lvLGaS01tRiA6x+VOy0sYf9T9Evj8S5kNz8JfQ215e2Zj4/7VF
         5fbDz2pgaSmHct144jpeH7eaAg2/9K2N5OBJt6IcHqW9uVJ4d0QZvPhwMIut879o/cwg
         2w1TIl+018qnCjH2Qvw0piJDCswQYj0Kt/SP91n08CA9NHTzyNZVXwn78ssR/OGOox83
         qELOgPrBS1U9giahrv53Rp00p1j7mV5x5zeO5PmLjfEu6dw4xbKhjt71VeeDcATlYUsj
         a23BLVbv1/1Y5P1cKRakcojtN/yJRiAuWrwSsI1bsfOj9eBJ88pEx5ZivsRF6fHostB5
         ZWQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVj21lbntXZEJ99YCSIoA7qv/vhvPye5WugWWTyltg2Dq4JixXIJaTNsioC9uyoZMcqLN//oTNwWNOWStRognKH7kR
X-Gm-Message-State: AOJu0YxTGA6GwyLyxJp1U+ONTSiZeG18vOdoU2Hw6KauvBYgxwOCvltG
	m06oqxShQkUh4wAbjA+fZ5FMhdri4siFpGAI+Cb93dIJbpPQFZ5loL8P3kgwPM0=
X-Google-Smtp-Source: AGHT+IG7iDrtCuBBKWvQaoQQbv/0kaeeUtziuz9N7l7vX5y+JvpROqU3u5NL1wFj8j7PpznoM4x7Ww==
X-Received: by 2002:a05:651c:2213:b0:2ec:1df4:589b with SMTP id 38308e7fff4ca-2eefcd61dd7mr7308201fa.1.1721224648985;
        Wed, 17 Jul 2024 06:57:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee19148adsm14501371fa.100.2024.07.17.06.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 06:57:28 -0700 (PDT)
Date: Wed, 17 Jul 2024 16:57:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/5] drm/drm_property: require DRM_MODE_PROP_IMMUTABLE
 for single-value props
Message-ID: <gbcunf7zmafn5z76mrlgldmsy74s7e6jacv53mgpym2l75uq6h@talxrisbufsw>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
 <20240715-drm-bridge-connector-fix-hdmi-reset-v4-2-61e6417cfd99@linaro.org>
 <20240717-bouncy-horned-mamba-5691b8@houat>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717-bouncy-horned-mamba-5691b8@houat>

On Wed, Jul 17, 2024 at 03:42:46PM GMT, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jul 15, 2024 at 09:33:02AM GMT, Dmitry Baryshkov wrote:
> > Document that DRM_MODE_PROP_IMMUTABLE must be set for the properties
> > that are immutable by definition - e.g. ranges with min == max or enums
> > with a single value. This matches the behaviour of the IGT tests, see
> > kms_properties.c / validate_range_prop(), validate_enum_prop(),
> > validate_bitmask_prop().
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> We had a discussion yesterday about it on IRC with Sima, Simon and
> Xaver.
> 
> https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622;
> 
> The conclusion was that it would create an inconsistency between drivers
> on whether a given property is immutable or not, which will lead to more
> troubles for userspace.
> 
> It's not clear why Ville added that check in the first place, so the
> best course of action is to remove the IGT test and get the discussion
> started there.

Ack, I'll work on removing those tests later today.

-- 
With best wishes
Dmitry

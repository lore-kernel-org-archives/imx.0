Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DFC20297B
	for <imx@lists.linux.dev>; Fri, 15 Aug 2025 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755270449; cv=none; b=sv5PkvWK7/9z2wAdC/Tfl9oVb1SSC0VUMtZsJwKl46Xty31kUaScuP5xqx49Wv+m7aNw1a084p0wdTZUzUcEff77B9QDb7tpuXxXQA9YCCOa5oaSz2EZBhXNoJXLCTh7TWy/kiGhoFR0p6VE8AR9Ow8hf+cxlEuzg6u+75EsLFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755270449; c=relaxed/simple;
	bh=BcITpFybWBt3uJnJlV7HPPQk242CaQC+wMDxngtmLG0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AWEW7+mPAwjNlwwB1ndmsxJt9HQwDDnwGho6Q7XBJHJkPBYFWULUgMe6MgChJqsEKLFk7U/RLnlBDxd5mYh4F5ti8csifCGGhCqGwaDJo+dy1LEr7+1EPXpN/6gXFxziZqupIu6eMJmBFsABejrssV8HUjd3NWC6f4wY9ffiCjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umw10-0004t6-6g; Fri, 15 Aug 2025 17:06:46 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umw0x-000R8g-1i;
	Fri, 15 Aug 2025 17:06:43 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umw0x-000PY3-1L;
	Fri, 15 Aug 2025 17:06:43 +0200
Message-ID: <93025d4cb696f06228e1c84a7c22dbcede6e77a3.camel@pengutronix.de>
Subject: Re: [PATCH 04/21] drm: remove unneeded 'fast_io' parameter in
 regmap_config
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?ISO-8859-1?Q?St=FCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Fri, 15 Aug 2025 17:06:43 +0200
In-Reply-To: <20250813161517.4746-5-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
	 <20250813161517.4746-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Mi, 2025-08-13 at 18:14 +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot =
is
> happy, too.
>=20
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c   | 1 -
>  drivers/gpu/drm/imx/dc/dc-cf.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-de.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-ed.c                   | 2 --
>  drivers/gpu/drm/imx/dc/dc-fg.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-fl.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-fw.c                   | 2 --
>  drivers/gpu/drm/imx/dc/dc-ic.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-lb.c                   | 2 --
>  drivers/gpu/drm/imx/dc/dc-tc.c                   | 1 -
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c              | 2 --
>  drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c | 1 -
>  12 files changed, 16 deletions(-)
>=20
[...]
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ip=
uv3/imx-tve.c
> index c5629e155d25..b34037d0d7a8 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> @@ -457,8 +457,6 @@ static struct regmap_config tve_regmap_config =3D {
> =20
>  	.readable_reg =3D imx_tve_readable_reg,
> =20
> -	.fast_io =3D true,
> -
>  	.max_register =3D 0xdc,
>  };
> =20

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3DC15ADAA
	for <imx@lists.linux.dev>; Wed, 29 May 2024 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994731; cv=none; b=QVrckr5v0RTmlrVhLgDKw8/ZNldbuhHhPtXjxGMfMdaORvN2CnYPzrifaV0fyWqVstKt0ZDHg42HEoYCQjRqV/BMB8SzjhXqCLSwJfYWVgLep1hf50oe9XVo2z7ToH+/3dyfLxI7TggGM2I3koZkEdeOXyrEhoXggR9kqtM0Kho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994731; c=relaxed/simple;
	bh=6xi2NBW8ZjzgMEJ2xLYuRhqr318m3e8Up2+gITmbGAU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N/3WT10xD4+vnaWIyJUmMAB+6s+S/H/vjdV4xWW55q4zIl1qUUm1R+/vtyawHuivoFWUFVGtfH50TEYqidoxLvJC9ubaTKqnBukA9hubj8X6sTKutI6ig2O0cmdm58KeoURpItdlL6jt78irB0p15dfL7Ge8WdNeA13f6NaqQiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sCKku-00037W-O1; Wed, 29 May 2024 16:58:20 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sCKkt-003Tdu-M0; Wed, 29 May 2024 16:58:19 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sCKkt-000DZi-1v;
	Wed, 29 May 2024 16:58:19 +0200
Message-ID: <5174c0495000d5c1637aaa40a97badd1e9b3775b.camel@pengutronix.de>
Subject: Re: [PATCH v2 08/12] drm/imx: parallel-display: switch to
 drm_panel_bridge
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Wed, 29 May 2024 16:58:19 +0200
In-Reply-To: <20240331-drm-imx-cleanup-v2-8-d81c1d1c1026@linaro.org>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
	 <20240331-drm-imx-cleanup-v2-8-d81c1d1c1026@linaro.org>
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

On So, 2024-03-31 at 23:29 +0300, Dmitry Baryshkov wrote:
> Defer panel handling to drm_panel_bridge, unifying codepaths for the
> panel and bridge cases.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/imx/ipuv3/Kconfig            |  2 ++
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c | 35 +++++++---------------=
------
>  2 files changed, 10 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv=
3/Kconfig
> index 4e41611c8532..8aaf2441bcef 100644
> --- a/drivers/gpu/drm/imx/ipuv3/Kconfig
> +++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
> @@ -13,6 +13,8 @@ config DRM_IMX_PARALLEL_DISPLAY
>  	tristate "Support for parallel displays"
>  	select DRM_PANEL

This shouldn't be necessary anymore either.

>  	depends on DRM_IMX
> +	depends on DRM_BRIDGE

I'd prefer this to select DRM_BRIDGE.

> +	select DRM_PANEL_BRIDGE
>  	select VIDEOMODE_HELPERS
> =20
>  config DRM_IMX_TVE
> diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/d=
rm/imx/ipuv3/parallel-display.c
> index 4d17fb96e77c..b7743b30475a 100644
> --- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> +++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c

You can drop the "#include <drm/panel.h>".


regards
Philipp

Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0315AADE
	for <imx@lists.linux.dev>; Wed, 29 May 2024 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994729; cv=none; b=rzorrh9oCSAuGL/NVJgsoBnG7MCnkWkzCevDN1P2MKVN6K25IhGJRjlVlZJAXpTZMy0FHinF0kmCfUFFBB/psLM4iKmvcIcpLACwXk4guBZRyGLhKBlz9Q4HtZeOV7Ttbd/tMmnp5XtgsuYanZaS0d0vPzrnjb9UHB9j/EL+UBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994729; c=relaxed/simple;
	bh=D/KHEOSbPCLIuOq8sWS35ux5QKqBNifC402qQ1qcCiE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qs/nZISDiAGWIL5pa7xJUZPX81WO0WTngUZAdW11o7xgb/aiRqWIT8tyQzU6ReHMOKMWJKcYbPtfYS3sRnC/Ltq49FsIoK7JfDdekYVklxr66T4f8VtdfKGmUhMWaQTX4QYVo3Z9IKegQacMNEI2NlxeXKWY5+ffzrjKv3Pfdg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sCKkx-00038v-2U; Wed, 29 May 2024 16:58:23 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sCKkw-003Te0-F8; Wed, 29 May 2024 16:58:22 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sCKkw-000Da6-1F;
	Wed, 29 May 2024 16:58:22 +0200
Message-ID: <52baeec98214106ca406dd190e1b7eecd73fe255.camel@pengutronix.de>
Subject: Re: [PATCH v2 07/12] drm/imx: ldb: switch to drm_panel_bridge
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
Date: Wed, 29 May 2024 16:58:22 +0200
In-Reply-To: <20240331-drm-imx-cleanup-v2-7-d81c1d1c1026@linaro.org>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
	 <20240331-drm-imx-cleanup-v2-7-d81c1d1c1026@linaro.org>
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
>  drivers/gpu/drm/imx/ipuv3/Kconfig   |  2 ++
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 44 ++++++++++++-------------------=
------
>  2 files changed, 16 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv=
3/Kconfig
> index bacf0655ebaf..4e41611c8532 100644
> --- a/drivers/gpu/drm/imx/ipuv3/Kconfig
> +++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
> @@ -28,7 +28,9 @@ config DRM_IMX_LDB
>  	tristate "Support for LVDS displays"
>  	depends on DRM_IMX && MFD_SYSCON
>  	depends on COMMON_CLK
> +	depends on DRM_BRIDGE

To avoid hiding the DRM_IMX_LDB option for legacy configurations with
DRM_BRIDGE disabled, it would be better to select DRM_BRIDGE here
instead.

>  	select DRM_PANEL

And this shouldn't be necessary anymore.

regards
Philipp

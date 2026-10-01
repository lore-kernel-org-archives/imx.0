Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC7A485950
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842965; cv=none; b=fvFuI9wVMEetDHBMXN+D5xAvrn7c/b3jRzBMtMUt4TgQbzycg486NTAlyIMHVZj+YmCJ4lXieyjv5DnjwuXAUPBrvL4dmvzpgGwONFUUnSn/iOv86woApmmqKbsG3KrUO+je9ey1oHeL+8tvNpaAhy0Z0kiyKVv7dqPDL9Jzlog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842965; c=relaxed/simple;
	bh=l3pNl8eVfMIFbhX2KJ2917zrtECrHhyEBC2FW99QDHM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GMFHkDtMpHDefNdlt7f7H/eM7FyLoCrvpPqehl6iMHXS8EJ8e/v5AX94j6JpnSJNSTbb2fziqNni+H2qlXrBPK/8mIMHuBe6bpd+zmDEi6DDbXKkFhZO1MVYMx9hacWQOSk5Nndn+s0QjFfOWr34sVh9767mAobO+04cJOkQiFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nJMALIU1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nJMALIU1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 07E261A109D;
	Thu,  1 Oct 2026 08:22:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2B5460341;
	Thu,  1 Oct 2026 08:22:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1420E103290C1;
	Thu,  1 Oct 2026 10:22:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790842943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SU7IEV8K31VentfUkgezeCnenvWoxswvOfrHYxEVQl0=;
	b=nJMALIU1tbooMgeAGLRs2BwuEqkgLDYowj4ggQkgLnldsk/8YLuEjRzAHIXmOof/jZcEaQ
	T7J6diupyFGSakm03gCM8vIRmqJQE8EVFg3fJBWL+rKwWX4HV/Q5SXidLYHAMRuaFAvFsF
	vS8jLNOfhY8W4QTzpqQ97fB7F7Cg7WrqQdnU/b9MOqOClfczP4vyB1uSF/jDaJ7uCjeZhv
	xkGeQ0iOxAgcwpeg3re+PQLytVEtBpn5A+9lcpzMC/eu6xx8gDPokAPeFAAPeuEfSkI0La
	P/8dzBerMm0+UT9db8wgBWRxKLUmw1fphI9jrFFXbTzH3slUjdTvLfHAX5XHmw==
Message-ID: <accaa9f4ad05ef73071e5cfb5368fcbdd394d3ab.camel@bootlin.com>
Subject: Re: [PATCH v2 5/7] drm/vc4: dpi: stop using deprecated
 drmm_of_get_bridge()
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Li	 <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng	
 <zhengxingda@iscas.ac.cn>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>,  =?ISO-8859-1?Q?Ma=EDra?= Canal
	 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance	
 <kernel-list@raspberrypi.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni	 <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 	imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Thu, 01 Oct 2026 10:22:13 +0200
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v2-5-6da431d8f180@bootlin.com>
References: 
	<20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
	 <20260929-drm-fix-of_get_bridge-build-regression-v2-5-6da431d8f180@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

Hi Luca,

Le mardi 29 septembre 2026 =C3=A0 15:39 +0200, Luca Ceresoli a =C3=A9crit=
=C2=A0:
> drmm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put.
>=20
> drm_panel.h becomes unused, drop the include.
>=20
> Also remove a comment that is now obvious: now panels are just bridges.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> =C2=A0drivers/gpu/drm/vc4/vc4_dpi.c | 9 ++-------
> =C2=A01 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.=
c
> index 53f36626a50d..5060eb463704 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -16,7 +16,6 @@
> =C2=A0#include <drm/drm_drv.h>
> =C2=A0#include <drm/drm_edid.h>
> =C2=A0#include <drm/drm_of.h>
> -#include <drm/drm_panel.h>
> =C2=A0#include <drm/drm_print.h>
> =C2=A0#include <drm/drm_probe_helper.h>
> =C2=A0#include <drm/drm_simple_kms_helper.h>
> @@ -279,16 +278,12 @@ static const struct of_device_id vc4_dpi_dt_match[]=
 =3D {
> =C2=A0	{}
> =C2=A0};
> =C2=A0
> -/* Sets up the next link in the display chain, whether it's a panel or
> - * a bridge.
> - */

The first part of the comment is not wrong, I would keep "Sets up the next =
link
in the display chain".

> =C2=A0static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
> =C2=A0{
> -	struct drm_device *drm =3D dpi->encoder.base.dev;
> =C2=A0	struct device *dev =3D &dpi->pdev->dev;
> -	struct drm_bridge *bridge;
> =C2=A0
> -	bridge =3D drmm_of_get_bridge(drm, dev->of_node, 0, 0);
> +	struct drm_bridge *bridge __free(drm_bridge_put) =3D
> +		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
> =C2=A0	if (IS_ERR(bridge)) {
> =C2=A0		/* If nothing was connected in the DT, that's not an
> =C2=A0		 * error.

It could make sense to go the extra mile and just move that code back into =
the
caller function, I don't see much benefit in having it in a static function
here.

Cheers,
-Paul

Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732873BBFBB;
	Tue, 21 Jul 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624639; cv=none; b=uPTBHH7VdEQilpGk2l/etiUACVIkPYoMTnc60duxDy4zFOoykb56NtEnWFhlpUl72DLI+SD4LP4nr+rTEUlfySazrCF4ShMhka1Nc/M3FQ5wrRjV5Bv8hTeJv8uiMuB1Uuj9snvH4HrlKwJrPOeDG+yyvT91s3uPpQ5sa1C6yhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624639; c=relaxed/simple;
	bh=KwwGbInWigwo/rfbss/xxRWk36bcM6vKSLDMtxqBjhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G4I0VoNkTESA0d8zKSGbMxhXAQgtGfDoga+6LAJeMYZLKA8WX+t9AKrihoRoWVAarhVw2ubSwXD2nW/Wwzk3RFsV6NiuPMvKthe9fxEGiiwfKgMqIXQ7o5YmyFZhiDMlHN6OragwDdkrvIa6vKmjW50I25oF++ZEW7gPXyLZrZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nlQug6It; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nlQug6It"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=gvD5V6euci/as5s5zTLUVH7L6MHGtAjyvBUswRosovo=; b=nlQug6It0yWWP0ig82UACxhpY5
	BPz//xjoUN8R4diTMfMEE90uKWveEm21wF1fq/MaXTyyW0XvpsEw3yBU+OBZfnDreWAzeypeiC/xk
	nv8esCdDuXYhg+pxr0Z5eYOGL1rsG+vC/5HsIAu5uwlNyCKqqozbYAMlLIHgnKTxKOzL1ZZz3DjM9
	lf5bO9Joan0ciIZUhhliKUuIfCGX/fPRcLezrBhb04VTlfFx/Bc5K0SFzGaB0Q1z8EbZgRa7aTlvx
	28VzfWLihuqotKAX5NKwUCJqfdKWEgRvEti4jlPu491z4JarfwI1ZtDv+ZqUX6WiooDziq0NWIcWu
	4doW2p9A==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wm6OE-000DCG-0S;
	Tue, 21 Jul 2026 11:03:50 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wm6OD-000NUe-1r;
	Tue, 21 Jul 2026 11:03:49 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Francesco Dolcini <francesco@dolcini.it>
Subject:
 Re: [PATCH v1 2/4] drm: mxsfb: Allow optional LCDIF interface format override
Date: Tue, 21 Jul 2026 11:03:48 +0200
Message-ID: <5121074.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260717121847.488148-3-francesco@dolcini.it>
References:
 <20260717121847.488148-1-francesco@dolcini.it>
 <20260717121847.488148-3-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28067/Tue Jul 21 08:23:56 2026)

Hi Francesco,

thanks for the patch.

Am Freitag, 17. Juli 2026, 14:18:44 CEST schrieb Francesco Dolcini:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
> format reported by the downstream panel or bridge describes the display
> input, but it does not describe how the LCDIF data pins are physically
> wired on the board.
>=20
> These can differ. For example, a 16-bit LCDIF bus can be connected to a
> 24-bit display by wiring the available color bits to the corresponding
> display inputs. In that case, using the display's 24-bit format to
> configure LCDIF selects the wrong data-bus mode and changes the assignment
> of color bits on the LCD_DATA pins.
>=20
> Read the optional interface-pix-fmt property from the LCDIF node and use
> it to select the media bus format used to configure LCDIF. This allows
> the LCDIF bus mode to describe the physical interface independently of
> the downstream display format.
>=20
> When the optional property is absent, continue using the format reported
> by the downstream display device, preserving the existing behavior.
>=20
> This follows the same approach already implemented in
> drivers/gpu/drm/imx/ipuv3/parallel-display.c.
>=20
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Nice, this work on my imx6ul based hardware where a 18-bit display is
attached as a 24-bit one.
Using interface-pix-fmt =3D "rgb24" this works as expected.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 16 ++++++++++++++++
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c |  8 ++++++++
>  3 files changed, 26 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mx=
sfb_drv.c
> index 9b8fbda85d28..edf347968fd2 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -12,7 +12,9 @@
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/pm_runtime.h>
> @@ -209,7 +211,10 @@ static int mxsfb_load(struct drm_device *drm,
>  		      const struct mxsfb_devdata *devdata)
>  {
>  	struct platform_device *pdev =3D to_platform_device(drm->dev);
> +	struct device_node *np =3D pdev->dev.of_node;
>  	struct mxsfb_drm_private *mxsfb;
> +	u32 bus_format =3D 0;
> +	const char *fmt;
>  	int ret;
> =20
>  	mxsfb =3D devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
> @@ -236,6 +241,17 @@ static int mxsfb_load(struct drm_device *drm,
>  	if (IS_ERR(mxsfb->clk_disp_axi))
>  		mxsfb->clk_disp_axi =3D NULL;
> =20
> +	ret =3D of_property_read_string(np, "interface-pix-fmt", &fmt);
> +	if (!ret) {
> +		if (!strcmp(fmt, "rgb24"))
> +			bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> +		else if (!strcmp(fmt, "rgb565"))
> +			bus_format =3D MEDIA_BUS_FMT_RGB565_1X16;
> +		else if (!strcmp(fmt, "rgb666"))
> +			bus_format =3D MEDIA_BUS_FMT_RGB666_1X18;
> +	}
> +	mxsfb->bus_format =3D bus_format;
> +
>  	ret =3D dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mx=
sfb_drv.h
> index d160d921b25f..f64800f06a69 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -46,6 +46,8 @@ struct mxsfb_drm_private {
>  	struct drm_connector		*connector;
>  	struct drm_bridge		*bridge;
> =20
> +	u32 bus_format;

Indent broken.

> +
>  	bool				crc_active;
>  };
> =20
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mx=
sfb_kms.c
> index d8ebebc5314b..8b482727aed5 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -386,6 +386,14 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc=
 *crtc,
>  	if (!bus_format)
>  		bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> =20
> +	/*
> +	 * Prefer bus format set via optional "interface-pix-fmt" DT property,
> +	 * over panel or next bridge bus format. This is necessary to support
> +	 * 24bit DPI panels connected to a 18bit interface, for example.

Maybe rephrase and state "mismatching interface" as it goes both ways.

Best regards,
Alexander

> +	 */
> +	if (mxsfb->bus_format)
> +		bus_format =3D mxsfb->bus_format;
> +
>  	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
> =20
>  	/* Write cur_buf as well to avoid an initial corrupt frame */
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D689A3B5847;
	Thu, 13 Aug 2026 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613183; cv=none; b=WqVjAhl8Qmi63C6VjUlSWBcLUUxqmg2WnPxGfWnY3OREwx14TJFL5CiO76ghtY7wZ3HliWKO+jgLZPizJHRxxkbezhQKgFen3w6R1TUySCG/ESbn75pzTRFC2ENtJnehUenhoUvjc/DYYqq6epCpdaUBhfIa/GkUDhhE7pArp34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613183; c=relaxed/simple;
	bh=OJg286iu0qYAAr4kx4ggHrhT7nJqXK85IwiMmTzM3yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X8/xxlN2pDs5rOR0LGe34lqrt/cPZpd9ljMS3XdMihZISat0MRz0nUtJOC0+cn0WY91glskZrWeU+9BssfCHYUUv/W/kQdggxxH4eK7SU0YqXkrpaFXxIBbwWKmx3UIZGycUtDlfEiH07fiNDCPuXsJ7wLMsblBwkzZrN9//t/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nykcABIS; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nykcABIS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eGx9tTiQdOBn7DN5qCJ32D8R2TduRxZShtLtOWV9bwk=; b=nykcABISTLy7A0Km0vFoKMmp19
	J7uanBGGFGeQ/YS+/ctlTFzX1jh/KIBrD9/DPU2QL0O1Pt1VXIxeeN2N+UrRJvoX3oHUlWG4uLvBj
	JUW0l2NlEMJq0uzH3Gj0bXVWTzZBeFKMqM9SFzs25PQLNc/bXhFcFbszPCaZF/4R7SiS/JoV1RzHb
	c/rfahjyRodt/Ze43t5JkBfUdsSA48voxaebMePchMSuyGOGpiCmKtpjD5y+jLz8k0Z6SPkzS0Fc+
	c6WeypKvIQ2AYr7dtUq5LKxcw6gvXEehMwUrfDtbx2qx7U0ssyyc8S1QVihjIagKJx2EsViWht2c1
	vO1fJrGQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuRBz-000BKa-2p;
	Thu, 13 Aug 2026 10:53:40 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuRBz-0004dI-17;
	Thu, 13 Aug 2026 10:53:39 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH v3 2/4] drm: mxsfb: Add optional DPI output bus-width
 configuration
Date: Thu, 13 Aug 2026 10:53:38 +0200
Message-ID: <9200378.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260812132954.148571-3-francesco@dolcini.it>
References:
 <20260812132954.148571-1-francesco@dolcini.it>
 <20260812132954.148571-3-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)

Am Mittwoch, 12. August 2026, 15:29:50 CEST schrieb Francesco Dolcini:
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
> Read the optional bus-width endpoint property from the LCDIF output port
> and use it to select the media bus format used to configure LCDIF. This
> allows the LCDIF bus mode to describe the physical interface
> independently of the downstream display format.
>=20
> When the optional property is absent, or it has an invalid value, continue
> using the format reported by the downstream display device, preserving
> the existing behavior. The code is not validating the DT for
> correctness and just fall back to the previous behavior in case of
> errors.
>=20
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Thanks.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa6UL[L]x

> ---
> v3: improve commit message and make it clear that the code assumes that
>     the DT is correct, when the DT contains an invalid property value,
>     the code safely fall-back to the previous behavior
> v2: use the common bus-width property instead of the legacy interface-pix=
=2Dfmt
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 12 ++++++++++++
>  3 files changed, 38 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mx=
sfb_drv.c
> index 8b4a500347fb..f8ecc8bbd63c 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -12,7 +12,10 @@
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/pm_runtime.h>
> @@ -211,7 +214,10 @@ static int mxsfb_load(struct drm_device *drm,
>  		      const struct mxsfb_devdata *devdata)
>  {
>  	struct platform_device *pdev =3D to_platform_device(drm->dev);
> +	struct device_node *np =3D pdev->dev.of_node;
>  	struct mxsfb_drm_private *mxsfb;
> +	struct device_node *ep;
> +	u32 bus_width =3D 0;
>  	int ret;
> =20
>  	mxsfb =3D devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
> @@ -238,6 +244,24 @@ static int mxsfb_load(struct drm_device *drm,
>  	if (IS_ERR(mxsfb->clk_disp_axi))
>  		mxsfb->clk_disp_axi =3D NULL;
> =20
> +	ep =3D of_graph_get_next_endpoint(np, NULL);
> +	if (ep) {
> +		of_property_read_u32(ep, "bus-width", &bus_width);
> +		of_node_put(ep);
> +	}
> +
> +	switch (bus_width) {
> +	case 16:
> +		mxsfb->bus_format =3D MEDIA_BUS_FMT_RGB565_1X16;
> +		break;
> +	case 18:
> +		mxsfb->bus_format =3D MEDIA_BUS_FMT_RGB666_1X18;
> +		break;
> +	case 24:
> +		mxsfb->bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	}
> +
>  	ret =3D dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mx=
sfb_drv.h
> index d160d921b25f..bdc47ce5be79 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -46,6 +46,8 @@ struct mxsfb_drm_private {
>  	struct drm_connector		*connector;
>  	struct drm_bridge		*bridge;
> =20
> +	u32				bus_format;
> +
>  	bool				crc_active;
>  };
> =20
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mx=
sfb_kms.c
> index d8ebebc5314b..1d78c486d147 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -386,6 +386,18 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc=
 *crtc,
>  	if (!bus_format)
>  		bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> =20
> +	/*
> +	 * Prefer the bus format derived from the OF graph endpoint "bus-width"
> +	 * property when available. Otherwise, use the bus format reported by
> +	 * the downstream bridge or panel.
> +	 *
> +	 * This supports mismatched display and interface bus widths, such as
> +	 * a 24-bit panel connected through an 18-bit interface or an 18-bit
> +	 * panel connected through a 24-bit interface.
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



Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFDC3A6F05;
	Thu,  5 Mar 2026 15:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723216; cv=none; b=hUJ0EoROlGS2LX4MhuQOyAVMoFN+dzhHWY5tFF7n+h6TlTjRngWZFcGhWU/vPnng/pS2I60blHvEg810YyS8iLIW4K3HqrnQrpoTmpuAnKmFPrYYjj/YpzGfYisRyxpBIC0scSFm8yQgjutd3+/J4INwIyX+j0QQppC/Sq2Gw2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723216; c=relaxed/simple;
	bh=AGHLH22J3Pd/fgCOMvjI431iORaqKR7lUDD/wYadxYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NrtgjDS5Bc7FTsImfrxXR5fVaggkEae37LIi53UGvVN7k0zGkTJjO2M7OoZ2Xen1t8PaUmV1UYT1lN4mPJOzE1rcSETX7W9x9ZRMlNjuVqFkw2tzSNBSEZBY2HG4Sd8v0j+wi5apjZHuZS4R0uTFNPQmMNjsnMEatQ/zsYeoS1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=LU4HGuZE; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LU4HGuZE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=jJYYjVaNri6uqi/hQTfzZ+kswxplzg5Gi2JWgEwj3V0=; b=LU4HGuZEghHpqwi/LqSv5SR2ck
	X+kfuRkQhm+bwAJfjvhN7rkitJzjVs/fUpJYJ0JBw6X8TvT53LGDty/47sZ7y94+paa+0Hvh7cSR5
	pf+MID3WzwGApKqOu6IUqqmaj37Okt6M11QMeEbC6Y2NtR2PKtjiDVDz7q1lC9cjTnuyUqC3JL5PQ
	r3QRHv5NN7Bq1E4/oxK7FnfjREGu5umQLOjcMkgUzpW3+tAuyJHb1epe2lpLm0mRbRPQkyKJIqoWE
	9Hdz0/+a+PszZeA286SjsWjRRqqWimICYM2zM/RCsTLBd/CTZtXwXj8EnsssvcEBG2Yrl1pTSgMKr
	4XZmXdgw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1vy9pp-000L7i-2O;
	Thu, 05 Mar 2026 15:37:53 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1vy9po-000Flr-2V;
	Thu, 05 Mar 2026 15:37:52 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com, Frank Li <Frank.Li@nxp.com>,
 dri-devel@lists.freedesktop.org, Marco Felsch <m.felsch@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Marco Felsch <m.felsch@pengutronix.de>
Subject:
 Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Date: Thu, 05 Mar 2026 15:37:51 +0100
Message-ID: <7394538.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
References:
 <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de>
 <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7029791.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27931/Thu Mar  5 08:24:23 2026)

--nextPart7029791.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Thu, 05 Mar 2026 15:37:51 +0100
Message-ID: <7394538.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0

Am Dienstag, 3. M=E4rz 2026, 11:34:27 CET schrieb Marco Felsch:
> From: Liu Ying <victor.liu@nxp.com>
>=20
> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Add a DRM bridge driver to support the display format configuratio=
n.
>=20
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v7.0-rc1]
> [m.felsch@pengutronix.de: add review feedback (Alexander)]
> [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
> [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
> [m.felsch@pengutronix.de: add bus-width support]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

on TQMa93xxCA on MBa91xxCA

> ---
>  drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 225 ++++++++++++++++++++++++++=
++++++
>  3 files changed, 237 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/=
imx/Kconfig
> index b9028a5e5a065c3237b404111d8df57e8e017f9d..47829300a4486a090514ebe91=
4b7667a703039a9 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -99,4 +99,15 @@ config DRM_IMX93_MIPI_DSI
>  	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
>  	  processor.
> =20
> +config DRM_IMX93_PARALLEL_DISP_FMT_CONVERTER
> +	tristate "NXP i.MX91/i.MX93 parallel display format converter"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	help
> +	  On i.MX93 and i.MX91 SoCs the parallel display format output is
> +	  controlled via the MEDIAMIX BLK-CTRL DISPLAY_MUX.
> +
> +	  Say 'Y' or 'M' if you use the parallel display output path on a
> +	  i.MX93 or i.MX91 SoC.
> +
>  endif # ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge=
/imx/Makefile
> index 8d01fda25451aaa1bf51a068da18948094327116..da57fde2d813b88cdde89115c=
a801b4cfc69afbd 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) +=3D imx8qxp-pix=
el-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) +=3D imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) +=3D imx8qxp-pxl2dpi.o
>  obj-$(CONFIG_DRM_IMX93_MIPI_DSI) +=3D imx93-mipi-dsi.o
> +obj-$(CONFIG_DRM_IMX93_PARALLEL_DISP_FMT_CONVERTER) +=3D imx93-pdfc.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx93-pdfc.c b/drivers/gpu/drm/br=
idge/imx/imx93-pdfc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..27a54424319838517b206ab7d=
7447538aa1489eb
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
> @@ -0,0 +1,225 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2022-2025 NXP
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +
> +#define IMX93_DISPLAY_MUX_REG		0x60
> +#define PARALLEL_DISP_FORMAT		GENMASK(10, 8)
> +#define FORMAT_RGB888_TO_RGB888		FIELD_PREP(PARALLEL_DISP_FORMAT, 0)
> +#define FORMAT_RGB888_TO_RGB666		FIELD_PREP(PARALLEL_DISP_FORMAT, 1)
> +#define FORMAT_RGB565_TO_RGB565		FIELD_PREP(PARALLEL_DISP_FORMAT, 2)
> +
> +struct imx93_pdfc {
> +	struct drm_bridge bridge;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	u32 phy_bus_width;
> +};
> +
> +static struct imx93_pdfc *bridge_to_imx93_pdfc(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct imx93_pdfc, bridge);
> +}
> +
> +static int
> +imx93_pdfc_bridge_attach(struct drm_bridge *bridge, struct drm_encoder *=
encoder,
> +			 enum drm_bridge_attach_flags flags)
> +{
> +	return drm_bridge_attach(bridge->encoder, bridge->next_bridge, bridge, =
flags);
> +}
> +
> +static void imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
> +					    struct drm_atomic_state *state)
> +{
> +	struct imx93_pdfc *pdfc =3D bridge_to_imx93_pdfc(bridge);
> +	const struct drm_bridge_state *bridge_state;
> +	unsigned int mask =3D PARALLEL_DISP_FORMAT;
> +	unsigned int val;
> +
> +	bridge_state =3D drm_atomic_get_new_bridge_state(state, bridge);
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_FIXED:
> +		val =3D FORMAT_RGB888_TO_RGB888;
> +		if (pdfc->phy_bus_width =3D=3D 18) {
> +			/*
> +			 * Can be valid if physical bus limitation exists,
> +			 * therefore use dev_dbg().
> +			 */
> +			dev_dbg(pdfc->dev, "Truncate two LSBs from each color\n");
> +			val =3D FORMAT_RGB888_TO_RGB666;
> +		}
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +		val =3D FORMAT_RGB888_TO_RGB666;
> +		break;
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		val =3D FORMAT_RGB565_TO_RGB565;
> +		break;
> +	}
> +
> +	regmap_update_bits(pdfc->regmap, IMX93_DISPLAY_MUX_REG, mask, val);
> +}
> +
> +/* TODO: Add YUV formats */
> +static const u32 imx93_pdfc_bus_output_fmts[] =3D {
> +	MEDIA_BUS_FMT_FIXED,
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +	MEDIA_BUS_FMT_RGB666_1X18,
> +	MEDIA_BUS_FMT_RGB565_1X16,
> +};
> +
> +static bool imx93_pdfc_bus_output_fmt_supported(u32 fmt)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
> +		if (imx93_pdfc_bus_output_fmts[i] =3D=3D fmt)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u32 *
> +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *bridge_state,
> +					    struct drm_crtc_state *crtc_state,
> +					    struct drm_connector_state *conn_state,
> +					    u32 output_fmt,
> +					    unsigned int *num_input_fmts)
> +{
> +	struct imx93_pdfc *pdfc =3D bridge_to_imx93_pdfc(bridge);
> +	u32 *input_fmts;
> +
> +	*num_input_fmts =3D 0;
> +
> +	input_fmts =3D kmalloc_obj(*input_fmts);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts =3D 1;
> +
> +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
> +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDI=
A_BUS_FMT_RGB888_1X24\n");
> +		input_fmts[0] =3D MEDIA_BUS_FMT_RGB888_1X24;
> +		return input_fmts;
> +	}
> +
> +	switch (output_fmt) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		input_fmts[0] =3D output_fmt;
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +	case MEDIA_BUS_FMT_FIXED:
> +		input_fmts[0] =3D MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	}
> +
> +	return input_fmts;
> +}
> +
> +static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *bridge_state,
> +					  struct drm_crtc_state *crtc_state,
> +					  struct drm_connector_state *conn_state)
> +{
> +	struct imx93_pdfc *pdfc =3D bridge_to_imx93_pdfc(bridge);
> +	u32 format =3D bridge_state->output_bus_cfg.format;
> +
> +	if (imx93_pdfc_bus_output_fmt_supported(format))
> +		return 0;
> +
> +	dev_warn(pdfc->dev, "Unsupported output bus format: 0x%x\n", format);
> +
> +	return -EINVAL;
> +}
> +
> +static const struct drm_bridge_funcs funcs =3D {
> +	.attach			=3D imx93_pdfc_bridge_attach,
> +	.atomic_enable		=3D imx93_pdfc_bridge_atomic_enable,
> +	.atomic_duplicate_state	=3D drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_bridge_destroy_state,
> +	.atomic_get_input_bus_fmts	=3D imx93_pdfc_bridge_atomic_get_input_bus_f=
mts,
> +	.atomic_check		=3D imx93_pdfc_bridge_atomic_check,
> +	.atomic_reset		=3D drm_atomic_helper_bridge_reset,
> +};
> +
> +static int imx93_pdfc_bridge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct drm_bridge *next_bridge;
> +	struct imx93_pdfc *pdfc;
> +	struct device_node *ep;
> +	int err;
> +
> +	pdfc =3D devm_drm_bridge_alloc(dev, struct imx93_pdfc, bridge, &funcs);
> +	if (IS_ERR(pdfc))
> +		return PTR_ERR(pdfc);
> +
> +	pdfc->regmap =3D syscon_node_to_regmap(dev->of_node->parent);
> +	if (IS_ERR(pdfc->regmap))
> +		return dev_err_probe(dev, PTR_ERR(pdfc->regmap),
> +				     "failed to get regmap\n");
> +
> +	/* No limits per default */
> +	pdfc->phy_bus_width =3D 24;
> +
> +	/* Get output ep (port1/endpoint) */
> +	ep =3D of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
> +	if (ep) {
> +		err =3D of_property_read_u32(ep, "bus-width", &pdfc->phy_bus_width);
> +		of_node_put(ep);
> +
> +		/* bus-width is optional but it must have valid data if present */
> +		if (err && err !=3D -EINVAL)
> +			return dev_err_probe(dev, err,
> +					     "failed to query bus-width\n");
> +	}
> +
> +	next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	if (IS_ERR(next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(next_bridge),
> +				     "failed to get next bridge\n");
> +	pdfc->dev =3D dev;
> +	pdfc->bridge.of_node =3D dev->of_node;
> +	pdfc->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
> +	pdfc->bridge.next_bridge =3D next_bridge;
> +
> +	return devm_drm_bridge_add(dev, &pdfc->bridge);
> +}
> +
> +static const struct of_device_id imx93_pdfc_dt_ids[] =3D {
> +	{ .compatible =3D "nxp,imx93-pdfc", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx93_pdfc_dt_ids);
> +
> +static struct platform_driver imx93_pdfc_bridge_driver =3D {
> +	.probe	=3D imx93_pdfc_bridge_probe,
> +	.driver	=3D {
> +		.of_match_table =3D imx93_pdfc_dt_ids,
> +		.name =3D "imx93_pdfc",
> +	},
> +};
> +module_platform_driver(imx93_pdfc_bridge_driver);
> +
> +MODULE_DESCRIPTION("NXP i.MX93 parallel display format configuration dri=
ver");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL");
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart7029791.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmmplT8ACgkQaS+g2M0Z
/iV9CQf9GbkFbECiKid6I+rC64yA+LJqh/LDST9e/Od7twCmc+YoVCt3R3pNndtQ
thAqMQjaMG+eVzbSX5OfqthFZViLArJlc38Djn7DiQq077jRgBe1xFLLgw73SYCo
q50o7b/ugu4nWYRSI/XfNzfRuGh0iIIXtUYuJkJlOmN5ZIar2tm5zSehH98jViOa
PpAsXZMRrkHck0TQut17YXMHUtJGjoWW5EqSS0g/VodNVnQF5wfnJDtZmbyqiP6g
yOTz2uSfZq6nH1cO2nj3Ohqo5DErryLE3z1sNtqDXvR89fbbyiQnd9tMqVv1kHnZ
8+Z1XPYNVoNsoJudp3K25YWd0fYldg==
=Leit
-----END PGP SIGNATURE-----

--nextPart7029791.LvFx2qVVIh--




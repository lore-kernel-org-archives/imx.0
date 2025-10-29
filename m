Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72822126C
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761742724; cv=pass; b=NYwRlcxyZOHrR1NfvXZaopXheG/EXBV4D/DGxchcSjcmA4Tm6TAQ1ZjUEOExEswiwe3lUnIm9KPKNW+jPk45ijduDreaS7ZFMiu93Sjh13mm4W0GiAqArKBvV6eg/bjcr3heTJicvNkiIs7YIWRl4l3qqN4mzHksPqoz1CDZiFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761742724; c=relaxed/simple;
	bh=qqXZpmRAdwZJbQzpBZ9hVLXtxfiYzD2nZK2ZSYHeI54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jY6+1grwVs+TRlpGRpFfG8wfoNVAKsuBb4CIB6250rHruf7cGChLI8cChzj/JYqxk6iw/wmX5xmIzYFXmkg+WAUbJyj/A8+LuU7iTEjvy9aD35NI5HsiInXHpLIfdOSX+2/hMk/Cq32r7J3utU935VkvQJu+jlwFdUOxw1JW+PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=L5L5Gk0V; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=DdRe5bk6; arc=pass smtp.client-ip=185.56.87.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="L5L5Gk0V";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="DdRe5bk6"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-vzr5.prod.antispam.mailspamprotection.com; s=arckey; t=1761742722;
	 b=Y2IidWaRwjidlMd/XP6A81tBK4E9fiRC7rgQiF8hGyk09eUeGrnovrG6jmItU85Ho9n0unXp9N
	  Thek/CGpRfmw+nq6bBvoyx6b/kPJLr1jXPnNsT7h0eXUKebCr7MKC9KIGoAKgnTPxs8q3QC7sc
	  WvWX5OxClmqtTgpnaz5KAyQOlylcg/ZpalHb9+xE3OQGR7Ttw6RVQ7b4rVRx2J20eRHfUMUyIX
	  d5g2uBsd+wkL1wmiD0mj7wqyQO+9mAqT6q8d+tC+ST5AnlU08T7PoqVrBO1vA/vbhmW/ZB97kb
	  u/Ap/TsUiB2OKOspT7rofMPL2nntmOaXT6kYXXxBYa6rmA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-vzr5.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-vzr5.prod.antispam.mailspamprotection.com; s=arckey; t=1761742722;
	bh=qqXZpmRAdwZJbQzpBZ9hVLXtxfiYzD2nZK2ZSYHeI54=;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	  To:From:DKIM-Signature:DKIM-Signature;
	b=ajHYL5Ymmxsbq3WQcPK+WjrrKrGYpbpsAdKH9Uxb3vkeroH1Pf256KE0qKPDfnSp8IR41y6E6v
	  mNUZh+O/0r+gusMByoPRCquEKoIsubAyzoJqp4N2ruJCTlkLXkAjC/rAgCxlCFsYgxYPrY8BNo
	  uQtlyP0u2fGjwxHcoiRX0TlPjpAgqeJYGhm1vGr6uXf8NzbdlaWWumNHcZ4N8mblqPglV6m6zi
	  aBaHqemCP8A5jH+IwGYuH12MR+U28RT0JsyoypJTmLHGWPOvJi1iJOMslrvje3wzHNF+k37gzo
	  MCiHsff+5gu1HMN/plhbqrJ2GXRLaaRi1P194vFr12q5bw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=3oSppA+afvyqUxNHhPIkWdr61ZGsrwZwGDBFFJQIi6Q=; b=L5L5Gk0VIBcIR7Rs7vx+UWGHGr
	1uX/JaIdwEeSoj/EjFEY9PfTqeKS8el2YH3jOiV6CLqeb2qTYS4Vz4hh/+/LT7mFVjTjUTfPQMzPS
	C5/zPLY3oGabSPsQcVn2bsv7Z64Nxwf0LyXA2n1VzcZRCtYQ2ffn6y7rpj2DTZbDdhqI=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-vzr5.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vE5l8-00000006xJC-0t8G
	for imx@lists.linux.dev;
	Wed, 29 Oct 2025 12:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=3oSppA+afvyqUxNHhPIkWdr61ZGsrwZwGDBFFJQIi6Q=; b=DdRe5bk6zHEGKn06FFuSn8vLai
	gOfhjPA/iOu0RxB4imGfGZyjzmqBZzS8mNaAiMMhNRUVBJdllLCWS4IHvuzCSBzbNl2XBRlejr2dm
	awE0AYwn5f4hU+XkXqwGN00y4MdlnIhla834mpoOz7TaYBCtVykxqVSAn07lTJRGK1FI=;
Received: from [95.75.8.65] (port=19426 helo=fedora.localnet)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vE5l0-00000000CSz-20fj;
	Wed, 29 Oct 2025 12:58:30 +0000
From: Francesco Valla <francesco@valla.it>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: dri-devel@lists.freedesktop.org, Liu Ying <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/9] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Wed, 29 Oct 2025 13:58:14 +0100
Message-ID: <2192154.9o76ZdvQCi@fedora>
In-Reply-To: <20250911-dcif-upstreaming-v5-2-a1e8dab8ae40@oss.nxp.com>
References:
 <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
 <20250911-dcif-upstreaming-v5-2-a1e8dab8ae40@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2765006.vuYhMxLoTh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: c1f7916853dfdea3a06919b43b9f1700
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vE5l8-00000006xJC-0t8G-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-vzr5.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

--nextPart2765006.vuYhMxLoTh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Francesco Valla <francesco@valla.it>
Date: Wed, 29 Oct 2025 13:58:14 +0100
Message-ID: <2192154.9o76ZdvQCi@fedora>
In-Reply-To: <20250911-dcif-upstreaming-v5-2-a1e8dab8ae40@oss.nxp.com>
MIME-Version: 1.0

Hi,

On Thursday, 11 September 2025 at 13:37:02 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> The next bridge in bridge chain could be a panel bridge or a non-panel
> bridge.  Use devm_drm_of_get_bridge() to replace the combination
> function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
> to get either a panel bridge or a non-panel bridge, instead of getting
> a panel bridge only.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 5c3cf37200bcee1db285c97e2b463c9355ee6acb..665053d0cb79d2b4f50e69c397863ab024553867 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -15,7 +15,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_of.h>
> -#include <drm/drm_panel.h>
>  
>  #define LDB_CTRL_CH0_ENABLE			BIT(0)
>  #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
> @@ -86,7 +85,7 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>  struct fsl_ldb {
>  	struct device *dev;
>  	struct drm_bridge bridge;
> -	struct drm_bridge *panel_bridge;
> +	struct drm_bridge *next_bridge;
>  	struct clk *clk;
>  	struct regmap *regmap;
>  	const struct fsl_ldb_devdata *devdata;
> @@ -118,7 +117,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
>  {
>  	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>  
> -	return drm_bridge_attach(encoder, fsl_ldb->panel_bridge,
> +	return drm_bridge_attach(encoder, fsl_ldb->next_bridge,
>  				 bridge, flags);
>  }
>  
> @@ -292,9 +291,7 @@ static const struct drm_bridge_funcs funcs = {
>  static int fsl_ldb_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *panel_node;
>  	struct device_node *remote1, *remote2;
> -	struct drm_panel *panel;
>  	struct fsl_ldb *fsl_ldb;
>  	int dual_link;
>  
> @@ -317,33 +314,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	if (IS_ERR(fsl_ldb->regmap))
>  		return PTR_ERR(fsl_ldb->regmap);
>  
> -	/* Locate the remote ports and the panel node */
> +	/* Locate the remote ports. */
>  	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
>  	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
>  	fsl_ldb->ch0_enabled = (remote1 != NULL);
>  	fsl_ldb->ch1_enabled = (remote2 != NULL);
> -	panel_node = of_node_get(remote1 ? remote1 : remote2);
>  	of_node_put(remote1);
>  	of_node_put(remote2);
>  
> -	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
> -		of_node_put(panel_node);
> -		return dev_err_probe(dev, -ENXIO, "No panel node found");
> -	}
> +	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
> +		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
>  
>  	dev_dbg(dev, "Using %s\n",
>  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
>  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
>  
> -	panel = of_drm_find_panel(panel_node);
> -	of_node_put(panel_node);
> -	if (IS_ERR(panel))
> -		return PTR_ERR(panel);
> -
> -	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> -	if (IS_ERR(fsl_ldb->panel_bridge))
> -		return PTR_ERR(fsl_ldb->panel_bridge);
> -
> +	fsl_ldb->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
> +						      fsl_ldb->ch0_enabled ? 1 : 2,
> +						      0);
> +	if (IS_ERR(fsl_ldb->next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(fsl_ldb->next_bridge),
> +				     "failed to get next bridge\n");
>  
>  	if (fsl_ldb_is_dual(fsl_ldb)) {
>  		struct device_node *port1, *port2;
> 
> 

Reviewed-by: Francesco Valla <francesco@valla.it>

This is also required to complete support for some of the i.MX8MP
platforms for which a DTS already exists, as well as for upcoming i.MX93
work (see [2]).

[1] https://elixir.bootlin.com/linux/v6.17.5/source/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
[2] https://lore.kernel.org/all/20251028-imx93_ldb_bridge-v1-1-fca2e7d60e0a@valla.it/


Thank you!

Francesco


--nextPart2765006.vuYhMxLoTh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRUrtjevJ039mawAeLir2xSXEi5AAUCaQIPZgAKCRDir2xSXEi5
AMbCAP42EvVfJ0roztG8NupiiGaTkb86WaCv99Prrby9Vkr0SwD+K9vUyxfRtmxI
8VKWhxQWZp0tPzFGBEz88OWVOOp7fAU=
=BQyw
-----END PGP SIGNATURE-----

--nextPart2765006.vuYhMxLoTh--




Received: from mx-relay12-hz2.antispameurope.com (mx-relay12-hz2.antispameurope.com [83.246.65.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46AB32D421
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 12:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761654548; cv=pass; b=Y8wlZtT3h9oGTbUP+r4pAdWphNyn7Z1Qb2iQaoJ8YrMVnSBrINIkBCg5g2jN6NyDsEYqDcr4CzND47mrQQBWDiqrnmn7keFDusdgTZKCZsvWOyBIgyCMMfFY/1LXpeqFczp4O8K4soPo9XMfglbCGx4Yh8x8HNdVxN78IcH1wJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761654548; c=relaxed/simple;
	bh=jWHgzTZMeTi8JTLykS2JTXiDEf17twZZQIBlewdfBtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dadBDjKhVmNhYOKqMNpEmYZRcBzKIbKwe30khRP+GUN4he4Q2brbx3uJEbAyIBXfuRrh4eQUQ9L5syoC2G4DWH1DE3AN3uMfuNx4uzmmKQcP9TWHrOS+fcRvhHJzdECCI5ETTE49T3U9oKcQ8+pCeSKZWGAJcLmGwimiOkKvAfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NPCWNend; arc=pass smtp.client-ip=83.246.65.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NPCWNend"
ARC-Authentication-Results: i=1; mx-gate12-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=968rqhHVFcxnYfiQeYIAS+1AueuObuJtnvbjiS2I6xI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761654468;
 b=FiBSNXLIq8/0LlDsocEG1pVhDXs3yd5uQGaFeJiFuYxcNp70yT3NsHUpnN9J7t3I7UJoCeN3
 auGnanbKMmcAQh2ZfzAHIClrq7a2iPuwXfecGWGa7TfF92OZkG9KcpctuAckIAYsDFIFdS4Ejes
 6DwKS2YHD32Yue4QiCZZAri6AkLaMmZS7pcycPFodIBSvyak0JLsxsvFuzCdJTyAKawsKV2uFWn
 C+6JeAgDBZGolt+z07bawPvTepDoFojbQe/RRsUia3z8T9DN4GFo7Doc7uGsnhl863aFVbEmwdI
 uyBhynbDHYW6keKBESMObP5c9CquW33I11Ql6Ai6DX75w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761654468;
 b=sWaHUrdJwtux1npKEwkOnzHexUcL4ZZ8X5BhzGmMW2o5dPCjUx9yMa2/rRaeKLIKNdN85dsp
 mhtSJ+CPZUjziED90FF4iruZvFDeWpV7Ke/cUU8jgbpG3fnCQieCCo4CxutDsWAB6hda1d5SWwT
 qQURpau4VJTLMDsvx5JAeMzy77cIbLkRroYe5/OmlEstEBcGONX/3Uq4cn5E/lreJJrLVNeLvQD
 5MupIPHmp6LGKcXnOsm4QPjYy6JsO7njI4cvTHJr0gqEWcPvycteM02mQD2zVw2TtxwRg9R/6KX
 BoFcWQhOC5jBsIbsC9HJG6+UI10kuer1iBoYVBeOnGImg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay12-hz2.antispameurope.com;
 Tue, 28 Oct 2025 13:27:48 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9D3DCA41044;
	Tue, 28 Oct 2025 13:27:37 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Francesco Valla <francesco@valla.it>
Cc: Fabian Pflug <f.pflug@pengutronix.de>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ldb: add support for an external bridge
Date: Tue, 28 Oct 2025 13:27:37 +0100
Message-ID: <1944228.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251028-imx93_ldb_bridge-v1-1-fca2e7d60e0a@valla.it>
References: <20251028-imx93_ldb_bridge-v1-1-fca2e7d60e0a@valla.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay12-hz2.antispameurope.com with 4cwqQL3mttz3BKkc
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:672ff784a508aef985d73529930087ab
X-cloud-security:scantime:1.873
DKIM-Signature: a=rsa-sha256;
 bh=968rqhHVFcxnYfiQeYIAS+1AueuObuJtnvbjiS2I6xI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761654468; v=1;
 b=NPCWNend1fYwJ0KKF3hOFZd3+4p3LAxa3r/bD/zeYB/44PEsJPrZTZrl/ITQn8iyFMbsshNx
 uX9h8hCfeXNZaULvFIrfRcJ+32LN42iEp/Ug9inP59vvlxlYttaZFoK2NjK+o7inSv8lneMnaRi
 eDkw4Pe1XwTWfs6qBHEaEv4sdyj4s5VDnsvbdbwNwVDGEKUMlqmDXh/Ktoz7IvH1gijMnI1g6fW
 If2OiAjqAZTN1X2lpJs6c7+PK0j4/nm3DqfJaE14Fi4LOWIfwOMoKUkMCFfhg887PkH2EOVe/OY
 o/8kSYXivz6bq9szknvPE1+hpJ3o37Ryb8O26hjNWA2PA==

Hi Francesco,

Am Dienstag, 28. Oktober 2025, 13:12:29 CET schrieb Francesco Valla:
> One option for the LVDS port of the LDB is to be connected to an
> additional bridge, such as a LVDS to HDMI converter. Add support for
> such case, along with the direct connection to a panel.
>=20
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> I was trying to add display support for the i.MX93 FRDM on top of the
> patch sent some time ago by Fabian Pflug [1], using some of the work
> already done by Alexander Stein but not yet merged [2], but then I
> noticed that the support for LVDS-HDMI converter bridges was missing
> from the LDB driver already present for the i.MX93.
>=20
> Not a fail of the driver itself, obviously, but I wonder if/how the
> existing i.MX8MP setups (e.g.: [3]), which use the same driver, work
> correclty. Unfortunately I don't have the i.MX8MP hardware to test them.
>=20
> Anyhow, a patch for such setup is attached; it was tested on the i.MX93
> FRDM using [1] and [2] plus some more devicetree modifications.
>=20
> [1] https://lore.kernel.org/all/20251022-fpg-nxp-imx93-frdm-v3-1-03ec40a1=
ccc0@pengutronix.de
> [2] https://lore.kernel.org/all/20250304154929.1785200-1-alexander.stein@=
ew.tq-group.com
> [3] https://elixir.bootlin.com/linux/v6.17.5/source/arch/arm64/boot/dts/f=
reescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
>=20
> Regards,
> Francesco
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fs=
l-ldb.c
> index 5c3cf37200bcee1db285c97e2b463c9355ee6acb..fad436f2e0bfac8b42096a6fc=
d0022da0f35284e 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -294,7 +294,6 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	struct device *dev =3D &pdev->dev;
>  	struct device_node *panel_node;
>  	struct device_node *remote1, *remote2;
> -	struct drm_panel *panel;
>  	struct fsl_ldb *fsl_ldb;
>  	int dual_link;
> =20
> @@ -335,15 +334,24 @@ static int fsl_ldb_probe(struct platform_device *pd=
ev)
>  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
>  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
> =20
> -	panel =3D of_drm_find_panel(panel_node);
> -	of_node_put(panel_node);
> -	if (IS_ERR(panel))
> -		return PTR_ERR(panel);
> -
> -	fsl_ldb->panel_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> -	if (IS_ERR(fsl_ldb->panel_bridge))
> -		return PTR_ERR(fsl_ldb->panel_bridge);
> +	/* First try to get an additional bridge, if not found go for a panel */
> +	fsl_ldb->panel_bridge =3D of_drm_find_bridge(panel_node);
> +	if (fsl_ldb->panel_bridge) {
> +		of_node_put(panel_node);
> +	} else {
> +		struct drm_panel *panel;
> =20
> +		panel =3D of_drm_find_panel(panel_node);
> +		of_node_put(panel_node);
> +		if (IS_ERR(panel))
> +			return dev_err_probe(dev, PTR_ERR(panel),
> +					     "Failed to find panel");
> +
> +		fsl_ldb->panel_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> +		if (IS_ERR(fsl_ldb->panel_bridge))
> +			return dev_err_probe(dev, PTR_ERR(fsl_ldb->panel_bridge),
> +					     "Failed to add panel bridge");
> +	}

Without looking into the details this somehow looks similar to
drm_of_find_panel_or_bridge(), or drmm_of_get_bridge for the managed varian=
t.

Best regards,
Alexander

> =20
>  	if (fsl_ldb_is_dual(fsl_ldb)) {
>  		struct device_node *port1, *port2;
>=20
> ---
> base-commit: fd57572253bc356330dbe5b233c2e1d8426c66fd
> change-id: 20251028-imx93_ldb_bridge-3c011e7856dc
>=20
> Best regards,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



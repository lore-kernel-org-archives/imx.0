Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50AE2D837C
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030887; cv=pass; b=uNDfC9AXVuNRztyyMBBdPuldfyWSvITtmR6OQopQpJk9hPSCW4Of/qukWf9lSETHv73/U8KBy4vOa/ZnCRPGFtPfbFZKqPhkjepSwiP7xpubPmGfXIX/ExV+zzsdjHQxRwHzAPOyCHtUOjKlGyGWcsH+rEYxhtPUXGedhmDCQfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030887; c=relaxed/simple;
	bh=+7g+UtPmV34BNSCav0a+cKt01S3ncAII8xDayvopAW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JI9qfaSqMuysVYyPkKEgot77gjXKyCsAGkYkaGAlfiPFu9vcmhDJRspePw9FG/WlKAgF72oR9fBfmHmt78P05xK26SMklO0TZWvIBZmjvSUDJu7bZ/UB7IFEHqKmcssc8EkcnhnusAfVgYOTvMx+/yG6KbD0E0RmOICHVte4V0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FfxWturS; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FfxWturS"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=cPfvqiPK0XBbGB7jgxZcnmtoFkef5Esy2Ux2OKDfXoY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763030844;
 b=gZ0XCeLRlcj4p1GmIRfNroTvECoQjuOsH8fp1UFimU9PY3fmm35nV6cSzP7R+SHnA+f40OOJ
 w8hgOI0hhmSyv3A+I45ehHXrs7bpBF+ZOlreGXK2XNqZIvW3T6K7XTq0DS3S9tb5Opp1gCsO71E
 vnbcm7g/jxPkfGYoAPMsiaBW8kfNhK+ZhmR2DHanMBHzfbT7NbW3kS8PM3eXPgpvCf6VJUX4nZB
 O+gEQYpbtNpRnynNpi6Jrha4W1NfWPum2cyGc1nxSllbWdZnRiMOWkLq95mZkhlXXJNhjSQUmIM
 hVszOdjnjlML7Z5MF8k4kN2NZ12OxsQa7QS0MYM138SbQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763030844;
 b=rCXK12XhzHLsNPoAQfz/1aiKLonhHq/s3DCDdiJ2ZudeWTpC1yFJvnQUqCrBL9sZNMsoZRVi
 EGRC+eNQSBusY5rUXK0ozR//PQXpjCioEvPOQKyC32FZ4uk9xL0ggKLjQMHwUocW1V+BAyf5Dkk
 WPaJ1BJDknOMOM9qSd8d3UPYNKBfW4+UEhvHS/VZIQbcMNQzE52oSNhExyRLXlyUTiSY5KU7Tal
 GZY56YPCwMKkVRrcp1OndOXJX1Kf7McWKXaEBtcQ9ba/W6ucR6Zqazz2KjdChH7E2OJJmqMQR+O
 ZoONqgdh/B3FP7q/SUbxCKasYlPVP8fZGdscVs6PzTH2Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 13 Nov 2025 11:47:24 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7250ECC0A1D;
	Thu, 13 Nov 2025 11:47:14 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 1/1] drm: lcdif: Use dev_err_probe()
Date: Thu, 13 Nov 2025 11:47:13 +0100
Message-ID: <3410946.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251020095846.116202-1-alexander.stein@ew.tq-group.com>
References: <20251020095846.116202-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4d6cR73sMNz2nGtR
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:8e80b3bb434ae492471754dc7e2ef656
X-cloud-security:scantime:2.077
DKIM-Signature: a=rsa-sha256;
 bh=cPfvqiPK0XBbGB7jgxZcnmtoFkef5Esy2Ux2OKDfXoY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763030843; v=1;
 b=FfxWturSdHmHR361roxLvyU6XHjzQa76KEIX7JuxeVSBkahGyMfx6/KF19j1hhPUTiAnOtcs
 7MROlPYGrImB9R+hzdtY6XbmTLoE5Q+f3Zek7c6PlK7JdFTCilWiFk6jKoa+ZKx3eDH7UqLVyGL
 rGgRCa3NOTZUTTD7qBP8634J2NiJMSc6uRKHVwX3lcIa77RdF54Sj+PnUbzpM6VHUkaAiZkBVLv
 bBjXMMAnADzST9UbguNdyTq0fQtH1UPR/Xj+wrjwRJy8oPXMtWhvn2IG1mzMB7GkfWwv0tv3V4X
 IQdT9moCuBXS8DclgzZIUPdD8QHzoU00KU+Y/mcGjwxjg==

Hi,

Am Montag, 20. Oktober 2025, 11:58:45 CET schrieb Alexander Stein:
> Use dev_err_probe() to add a reason for deferred probe. This can
> especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock
>=20
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Any other feedback?

Thanks and best regards
Alexander
> ---
> Changes in v2:
> * Collected Liu's and Marcos' R-b
>=20
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index fcb2a7517377e..47da1d9336b90 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -149,15 +149,17 @@ static int lcdif_load(struct drm_device *drm)
> =20
>  	lcdif->clk =3D devm_clk_get(drm->dev, "pix");
>  	if (IS_ERR(lcdif->clk))
> -		return PTR_ERR(lcdif->clk);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk), "Failed to get pix=
 clock\n");
> =20
>  	lcdif->clk_axi =3D devm_clk_get(drm->dev, "axi");
>  	if (IS_ERR(lcdif->clk_axi))
> -		return PTR_ERR(lcdif->clk_axi);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_axi),
> +				     "Failed to get axi clock\n");
> =20
>  	lcdif->clk_disp_axi =3D devm_clk_get(drm->dev, "disp_axi");
>  	if (IS_ERR(lcdif->clk_disp_axi))
> -		return PTR_ERR(lcdif->clk_disp_axi);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_disp_axi),
> +				     "Failed to get disp_axi clock\n");
> =20
>  	platform_set_drvdata(pdev, drm);
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



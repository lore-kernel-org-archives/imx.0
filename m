Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6607C3A1684
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005097; cv=none; b=ZjFUbxkOzKPAaJfRe+Kgh/UxbsPV/fSFXPgxFEIPzFXHL+eDe4HfPxjmltEnktdm3nL+II8LFieDyhHHdPMGnicTXTNXpFmPPb0BWPJ+Gfddg6YcxTr16HI/J1Vb+RYCi8OsNsIyLZGRXvQFB3HtBBTLcTWB3jGpm43U9EUdYzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005097; c=relaxed/simple;
	bh=SqGdlcRvy5fmyJEhp9QLngdtzZOVrTojv6F8bBn9Ceg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Hah55lHPqoS/Pv9ddOCugTmf8yXXsHb+YMy8ibpoSwoy7ondEf+1DeyrCOMTRV2MTgsZR6C3G+grki0tDkNn7Qq2FKHWq+OWkmTgxjuDvs1M03vgNEcKw7Yug9T+2vRkhtA9mhpI39nE1tBWatmUjpO6gmWYnwyQ2/O3jp7DsvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yNrwKTG6; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yNrwKTG6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2D4C8C415B5;
	Fri, 20 Mar 2026 11:11:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6B25600E0;
	Fri, 20 Mar 2026 11:11:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86B5410450BAE;
	Fri, 20 Mar 2026 12:11:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774005091; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OgCLycKADg8WapEoALnr45EN8oOjbM/c3hEclAHzFQA=;
	b=yNrwKTG67Wfi/l6/Cx6JLjhzRR66Q6F9KbZdHALz92gFHiJ903UlF3jJnclHpJfIXNAv76
	gEccg/auQ56Dw7hAkprTo3+lpIXUBHLIN5DrQJPSHKVtz/Wet1c8DG9c3rK8T/43o/ZuOi
	xPydDpkCfh2ECLycX5Eeq9uuS34aOv+sCFhedLnSlqul76QFADCHSHYCZ9x+Qf4Uox7x5T
	xAOcUxV/ciAkAPwFD5P7aNA9Gje3+1Bz1cxASeOTuzdeDBaQY/J0hrN+M4xz5ROWnuUCFw
	U8KauHG0D8vWQbHcvGtAyGAI6FmR8hU59zMvkMbyJjc+3UzzkhjIgh5vmwnsOg==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 12:11:17 +0100
Message-Id: <DH7KBDWAGOHC.39HCC46YG53PN@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/8] drm/mxsfb/lcdif: simplify remote pointer management
 using __free
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Adam Ford" <aford173@gmail.com>, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>, "Anson Huang"
 <Anson.Huang@nxp.com>, "Christopher Obbard"
 <christopher.obbard@linaro.org>, "Daniel Scally"
 <dan.scally@ideasonboard.com>, "Emanuele Ghidoli"
 <emanuele.ghidoli@toradex.com>, "Fabio Estevam" <festevam@denx.de>,
 "Francesco Dolcini" <francesco.dolcini@toradex.com>, "Frieder Schrempf"
 <frieder.schrempf@kontron.de>, "Gilles Talis" <gilles.talis@gmail.com>,
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, "Heiko
 Schocher" <hs@denx.de>, "Joao Paulo Goncalves"
 <joao.goncalves@toradex.com>, "Josua Mayer" <josua@solid-run.com>, "Kieran
 Bingham" <kieran.bingham@ideasonboard.com>, "Marco Felsch"
 <m.felsch@pengutronix.de>, "Martyn Welch" <martyn.welch@collabora.com>,
 "Oleksij Rempel" <o.rempel@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>,
 "Philippe Schenker" <philippe.schenker@toradex.com>, "Richard Hu"
 <richard.hu@technexion.com>, "Shengjiu Wang" <shengjiu.wang@nxp.com>,
 "Stefan Eichenberger" <stefan.eichenberger@toradex.com>, "Vitor Soares"
 <vitor.soares@toradex.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Marek Vasut"
 <marex@denx.de>, "Stefan Agner" <stefan@agner.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>
X-Mailer: aerc 0.20.1
References: <20260320-drm-lcdif-dbanc-v1-0-479a04133e70@bootlin.com>
 <20260320-drm-lcdif-dbanc-v1-1-479a04133e70@bootlin.com>
In-Reply-To: <20260320-drm-lcdif-dbanc-v1-1-479a04133e70@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Fri Mar 20, 2026 at 11:46 AM CET, Luca Ceresoli wrote:
> Putting the remote device_node reference requires a of_node_put(ep) in bo=
th
> error return points. Use a cleanup action to simplify the code.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index 47da1d9336b9..756ca96373c8 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -53,16 +53,13 @@ static int lcdif_attach_bridge(struct lcdif_drm_priva=
te *lcdif)
>  	int ret;
>
>  	for_each_endpoint_of_node(dev->of_node, ep) {
> -		struct device_node *remote;
> +		struct device_node *remote __free(drm_bridge_put) =3D
                                                  ^^^^^^^^^^^^^^

I just realized there's a mistake here, this should be
__free(device_node). However this does not prevent testing the series in
its entirety because patch 2 fixes this mistake.

Will be fixed in v2.

Sorry about the noise, did too many rebases today!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

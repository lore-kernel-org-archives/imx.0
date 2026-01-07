Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A35D3054EB
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797141; cv=none; b=hSNX/hAbdi6jU7RH0HN0Zimx8DjDM596btlisHCByyFI6iTmJMeqBpl4G3H/QWjaCtsNPy2Ydm7emedq26dNDD+7uImzovS19zme8jst5iBYLGdiPAv+ylHix0BuklZCExfo69Q9ftK8Zu0ukIGx89wz5WlaWzpW8R1M/GQHyqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797141; c=relaxed/simple;
	bh=qebzucOqrBSH1D2guSGfc6reEYtzMB040F5q1JVMq9g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=u2h+TxNO7gTibUgAcEImO4QX7eRqQjFnjq8kEfoabVWyCaCU66WUUkZfRBCtvSIeIaXJFKDeSJlPDSrt5kr1J2dPmil0bPyMBFFJU4qBJ+NTxXiKPMR5oP7A54JPVHlhze8UAo1awcQtipKJ5YYd7bam6epLn8lOruQg9BgfUME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mwG58V21; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mwG58V21"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1EBA5C1EC90;
	Wed,  7 Jan 2026 14:45:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3334A606F8;
	Wed,  7 Jan 2026 14:45:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54B3D103C87C1;
	Wed,  7 Jan 2026 15:45:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767797135; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nTlOT3AM4kdk7PxlNs3Skb2xq4/lCpkf95bKd6Z7IFA=;
	b=mwG58V21Feidw7j15RkZ1DlmeBnygryUTg12PFyeun6SbL9UTMeQuBa/8vHS1eHFd8029L
	gUBiXaA5jWnwZ2IoTRm9A0ijTAesUa4m5wNMBnTmFh/kEfP25+oWQuPHZcFzPm52arShlN
	Z6LgEDcsgolgB1iwvYzSEO7kLDdcRqlxXrCocxejFHvB+d3UGfDMa3mipAFKt/h/EQuM9/
	vMFxUGBzyLB/mtlmKx5GPM6T8Ub5eDu524wcrnK1htz4OoOxRzvVkBhGLLVU2p/DojiX3V
	E3WLiGA8J/pTx5Gb0zznUhkhDBxNE2CLn0CfTKOwLLdUB8Mgwhp5crAsU6ogSg==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 15:45:24 +0100
Message-Id: <DFIFS3S64SGO.3UGHYN3F6HHRQ@bootlin.com>
Subject: Re: [PATCH 09/12] drm/bridge: imx8qxp-ldb: convert to
 of_drm_find_and_get_bridge()
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Philippe Cornu"
 <philippe.cornu@st.com>, <benjamin.gaignard@linaro.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Adrien Grassein"
 <adrien.grassein@gmail.com>, "Liu Ying" <victor.liu@nxp.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-9-283d7bba061a@bootlin.com> <20260107-weightless-adaptable-wildebeest-a3ed6f@houat>
In-Reply-To: <20260107-weightless-adaptable-wildebeest-a3ed6f@houat>
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime,

Thanks for the blazingly fast review of the entire series!

On Wed Jan 7, 2026 at 3:08 PM CET, Maxime Ripard wrote:
> Hi,
>
> On Wed, Jan 07, 2026 at 02:13:00PM +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure i=
t
>> is put when done.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/=
bridge/imx/imx8qxp-ldb.c
>> index 122502968927..6b80d798b27a 100644
>> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
>> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
>> @@ -552,7 +552,7 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx=
8qxp_ldb *imx8qxp_ldb)
>>  		goto out;
>>  	}
>>
>> -	imx8qxp_ldb->companion =3D of_drm_find_bridge(companion_port);
>> +	imx8qxp_ldb->companion =3D of_drm_find_and_get_bridge(companion_port);
>>  	if (!imx8qxp_ldb->companion) {
>>  		ret =3D -EPROBE_DEFER;
>>  		DRM_DEV_DEBUG_DRIVER(dev,
>> @@ -679,6 +679,7 @@ static void imx8qxp_ldb_remove(struct platform_devic=
e *pdev)
>>  	struct ldb *ldb =3D &imx8qxp_ldb->base;
>>
>>  	ldb_remove_bridge_helper(ldb);
>> +	drm_bridge_put(imx8qxp_ldb->companion);
>
> the companion bridge is used in pretty much every KMS hook, we need to
> put the reference in destroy.

Ouch, indeed! Will fix in v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

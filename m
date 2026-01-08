Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE53347BDB
	for <imx@lists.linux.dev>; Thu,  8 Jan 2026 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879223; cv=none; b=DuDMKH3Yazr1gUzhNUOKCLZF2cHsKGIiV2L+xkBtG5ZvamXorMSKB+EbVclT9Npgglyg6+LWdM18fH56YhQ9AgcGmvnVhG8jjZYiktHn2+pmw2ZMYuoz0X6OtA8Y6e8VYQPBtFVoUfJQdDDCfO7//bKvton60kw7Ao1ahaDskrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879223; c=relaxed/simple;
	bh=DARGW1cSE4CwSpFQOUaM0QTjdEYEp6vZIbn9bLeIVsg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=hVCKbO4ePvhSJ+Tcgpmg7UAD3mpr4WC84jEEheZaoIJopsBp9sEPMtGq/7Js7aawlZ2Ssn4H8ZEnG2kdCSFzXzXI4AN8tx2vDI0GShUhBN7hYkkpC8E/VQwW1v2XLk9247q6EWzqZfMgRZsrXl7oOX6Bzllg9O8ovyaax5nc3BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sKPwsa9F; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sKPwsa9F"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 260511A2702;
	Thu,  8 Jan 2026 13:33:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7479606B6;
	Thu,  8 Jan 2026 13:33:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A0A8103C8015;
	Thu,  8 Jan 2026 14:33:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767879212; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=veR9z3VsPIxAIyHsq0lQYRUjw8X7wRPHnBNDDdwkacw=;
	b=sKPwsa9FJ30YXeCceqg/sgl5hl7N1B8vBkjnivZtZ9WLfiad/iUvCpYp5zx7EH5mnAktcS
	Ukx6sLzq365pfy43i0wXbEVOdcXzZZQpq0S4P/AXGeB0jErgEAE8MI/cWs073s+X6Q6BO0
	U2rBXKXJUw1Be/qgPhWJfeyCLbj/3cPgEkKlKvb4CuwEBxfW6P4TCMcZ5/aLlK5g3B8sdk
	3Jh6Ax3CjT4bdTICgvdVo+DssWSbO4INP6ToR3ILqbznkgVqDCtCtlHw7j9ir2CvbGyFdA
	w2bF6QUnuM0tyBSp5vR7652XvHbchIM4GmarNyGAGcbtlVBhI2IWlgOJtlX/8A==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 14:33:21 +0100
Message-Id: <DFJ8VHH9BVEZ.2445GF73YTGSO@bootlin.com>
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
To: "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Philippe Cornu"
 <philippe.cornu@st.com>, <benjamin.gaignard@linaro.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Adrien Grassein"
 <adrien.grassein@gmail.com>, "Liu Ying" <victor.liu@nxp.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 10/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: use a temporary variable for the next bridge
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com> <CGME20260107131416eucas1p22557f62e9d6498e5fdda4e6280cfe793@eucas1p2.samsung.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-10-283d7bba061a@bootlin.com> <be425ab8-1772-46fb-84ee-0c8840c3eef2@samsung.com>
In-Reply-To: <be425ab8-1772-46fb-84ee-0c8840c3eef2@samsung.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Marek,

On Thu Jan 8, 2026 at 10:26 AM CET, Marek Szyprowski wrote:
> On 07.01.2026 14:13, Luca Ceresoli wrote:
>> In preparation to handle refcounting of the out_bridge, we need to ensur=
e
>> the out_bridge pointer contains either a valid bridge pointer or NULL, n=
ot
>> an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
>> redeference an ERR_PTR.
>>
>> As a preliminary cleanup, add a temporary local 'next_bridge' pointer an=
d
>> only copy it in dsi->out_bridge when returning successfully.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>   drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bri=
dge/samsung-dsim.c
>> index eabc4c32f6ab..b3003aa49dc3 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1886,6 +1886,7 @@ static int samsung_dsim_host_attach(struct mipi_ds=
i_host *host,
>>   {
>>   	struct samsung_dsim *dsi =3D host_to_dsi(host);
>>   	const struct samsung_dsim_plat_data *pdata =3D dsi->plat_data;
>> +	struct drm_bridge *next_bridge;
>>   	struct device *dev =3D dsi->dev;
>>   	struct device_node *np =3D dev->of_node;
>>   	struct device_node *remote;
>> @@ -1924,17 +1925,17 @@ static int samsung_dsim_host_attach(struct mipi_=
dsi_host *host,
>>
>>   	panel =3D of_drm_find_panel(remote);
>>   	if (!IS_ERR(panel)) {
>> -		dsi->out_bridge =3D devm_drm_panel_bridge_add(dev, panel);
>> +		next_bridge =3D devm_drm_panel_bridge_add(dev, panel);
>>   	} else {
>> -		dsi->out_bridge =3D of_drm_find_bridge(remote);
>> -		if (!dsi->out_bridge)
>> -			dsi->out_bridge =3D ERR_PTR(-EINVAL);
>> +		next_bridge =3D of_drm_find_bridge(remote);
>> +		if (!next_bridge)
>> +			next_bridge =3D ERR_PTR(-EINVAL);
>>   	}
>>
>>   	of_node_put(remote);
>>
>> -	if (IS_ERR(dsi->out_bridge)) {
>> -		ret =3D PTR_ERR(dsi->out_bridge);
>> +	if (IS_ERR(next_bridge)) {
>> +		ret =3D PTR_ERR(next_bridge);
>>   		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
>>   		return ret;
>>   	}
>> @@ -1967,6 +1968,7 @@ static int samsung_dsim_host_attach(struct mipi_ds=
i_host *host,
>>   	dsi->lanes =3D device->lanes;
>>   	dsi->format =3D device->format;
>>   	dsi->mode_flags =3D device->mode_flags;
>> +	dsi->out_bridge =3D next_bridge;
>>
>
> This assignment is too late, dsi->out_bridge is used (indirectly, by
> samsung_dsim_attach() called from drm_bridge_attach()) by
>
> ret =3D pdata->host_ops->attach(dsi, device);

Thanks for testing, reporting, and suggesting a solution. I'm not sure why
it worked on my setup, but this is indeed a bug.

> a few lines before this assignment, so the following fix has to be added:
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c index b3003aa49dc3..f88aa8ab2879
> 100644 --- a/drivers/gpu/drm/bridge/samsung-dsim.c +++
> b/drivers/gpu/drm/bridge/samsung-dsim.c @@ -1959,6 +1959,7 @@ static int
> samsung_dsim_host_attach(struct mipi_dsi_host *host, return ret; } +
> dsi->out_bridge =3D next_bridge; if (pdata->host_ops &&
> pdata->host_ops->attach) { ret =3D pdata->host_ops->attach(dsi, device);
> if (ret) @@ -1968,7 +1969,6 @@ static int
> samsung_dsim_host_attach(struct mipi_dsi_host *host, dsi->lanes =3D
> device->lanes; dsi->format =3D device->format; dsi->mode_flags =3D
> device->mode_flags; - dsi->out_bridge =3D next_bridge; return 0; }

This needed a bit of demangling :) but it looks like a correct solution.

I took a moment to understand why this did not break my setup. The answer
is I have a fsl,imx8mp-mipi-dsim, which has no .attach set in its
samsung_dsim_host_ops.

Sorry for the inconvenience. I'm fixing this in v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

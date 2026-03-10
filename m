Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF838B7CB
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 11:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143615; cv=none; b=ifxnHKNPLOGsnJPvMjefn8BXzUBR7oR0kw0McGzRqbo+xpxR9sb8n+McGNQVfGq0HVVXsOCM1JHdnVogwYxNFfPvi9qNFDo+LnkpD+9pzylxK6weas+9b3jmsRGsqC5cv+fH2ZmLp2oQx3wnsteuP+lyiJb0QyW5Rhd8Emvj88w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143615; c=relaxed/simple;
	bh=9NQ8IQeN7TCQBSjsDDw3vu92CpoBz/RDigSuI/X3km8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=f9uLzBSq4DoSRJ6MN6FSiyZWAjENO1H0tGUodafM3xk7VpWVIgOGrpN8lA+xWbTq8+VKIbwcf10sm8edGM0kOVTYycCTUwErN1HhtXxkFe3FUsWqlbSossyulRi8Jr4yzQnljRKuMWqgESkZhEL+bmksnxTH0z1jFwEaCCWXMSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z7BbISe7; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z7BbISe7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D826EC40FBE;
	Tue, 10 Mar 2026 11:53:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0613660002;
	Tue, 10 Mar 2026 11:53:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EDCD10369A98;
	Tue, 10 Mar 2026 12:53:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773143610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=23B0sW7TLy2SsjrPyd+kkupKVDBS90ijKBBr+MbJjFA=;
	b=Z7BbISe7HT9N7v21Wm54gyJ2yfbxsNsWE8LqImb+BJAg92oi32vIe26wWUBb/tVjx9ggaL
	hx2mmCQ3eChBTkeRRU+VkFHUBnkRQ/VE86g0+kLTQeMWdplzeXSLPZMm4CYIvYjyOYrjjQ
	gQBOKfHunMd8tCuDBlo+7rm4jj+cawyiLGrZgXWKAI83d7lj5uQ8thUj463AUegMpo233h
	C030UHBSUNWMu5u/d/6UgGR8g7pSobUR9XzHqciYgKFhiNwKDW+OYoTO2EQ/4F2TZUt5D2
	f0zW+Lg7P4CERgYoe1H12rCsMBUQz1b/wHr/gjUqZaZRGGSN8/3m6c6P+776Qg==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 12:53:07 +0100
Message-Id: <DGZ2XYTVUR28.16ITKRM9S2ACV@bootlin.com>
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Cc: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Marco Felsch"
 <m.felsch@pengutronix.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Peng Fan" <peng.fan@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de> <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de> <33e09cc9-69bd-468b-8361-b92a50686f74@nxp.com>
In-Reply-To: <33e09cc9-69bd-468b-8361-b92a50686f74@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Liu, Marco,

On Tue Mar 10, 2026 at 3:57 AM CET, Liu Ying wrote:
> Hi Marco, Luca,
>
> On Tue, Mar 03, 2026 at 11:34:27AM +0100, Marco Felsch wrote:
>
> [...]
>
>> +	next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>> +	if (IS_ERR(next_bridge))
>> +		return dev_err_probe(dev, PTR_ERR(next_bridge),
>> +				     "failed to get next bridge\n");
>> +	pdfc->dev =3D dev;
>> +	pdfc->bridge.of_node =3D dev->of_node;
>> +	pdfc->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
>> +	pdfc->bridge.next_bridge =3D next_bridge;
>
> When I was reviewing another patch[1], I was aware of the necessity of
> calling drm_bridge_get() for next_bridge to balance the next bridge's
> refcount put from __drm_bridge_free() for this bridge.  I'd be good if
> Luca may confirm this is correct.  Sorry for bringing this up late.

Indeed you have a good point.

After re-checking devm_drm_of_get_bridge(), as I wrote on the other thread
you pointed to, you should call drm_bridge_get():

-	pdfc->bridge.next_bridge =3D next_bridge;
+	pdfc->bridge.next_bridge =3D drm_bridge_get(next_bridge);

Marco, you can keep my R-by if you resend with just this change.

Sorry about the confusion here.

As mention on the other thread, devm_drm_of_get_bridge() is unable to
support bridge hotplug. So it should be deprecated, but as of now there is
no alternative.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

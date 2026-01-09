Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1AA3382F8
	for <imx@lists.linux.dev>; Fri,  9 Jan 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955451; cv=none; b=uMz913Ia7bY6o01YeW43nSoNEwggPi9/8GVYg1I2NAM741l5EkX5TpWi6wlST+dzUjNmSGW3lh68uubvCWbJq/wd4gezRAepCvTnSRlQ6VNEKn7Quvxd5j4ImqxnGDPq8wPOtLsQ46axMOrfxRH9WR9nxlE+uP/eQLXO+C7GP8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955451; c=relaxed/simple;
	bh=heRUsgtR8J5gfVgo3v5KkSNHlF4BfjCnFvshhBUlf0c=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=W81n4b/yEs38xB+ROrZavsOG3C7qhjDmnzEzBQAPdNuukljI8wo/EGNcs00KTMluETtjjP/t1qxCOYn8mgLNa9p+ezY32UxEy7DLoznRa+Zm0+l3a0VlhUxhJuAVORrDk14H6FUtQ0E5078QFmtRf0CKvOV/nfLIZZS5WT+2OBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CHHVmWab; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CHHVmWab"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1B28D1A274B;
	Fri,  9 Jan 2026 10:44:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E132160734;
	Fri,  9 Jan 2026 10:44:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81CCF103C88D6;
	Fri,  9 Jan 2026 11:43:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767955445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SiCIIDZ8DQ4eVHwh0jh/RzqDH1KSvakfkkduuvCNYtk=;
	b=CHHVmWabxW4J/FmEQWQbUQcLH8cRIxzAgak+rlrLVxhBB2O5qUMp+0aTrZYpUZwDEM2+k0
	4y3Pq+0kpPbv3sEh0MQO68+EKWWON4m3vFnbhSeAfcEEskuzDo6oKvKTvr3ItBGPbchM2b
	6iopx7goSrbT2ijmFwt27qimHfFzTsgWNNhEoAKS/4YyyMZhk73zlTXB5jrgbXS//0Jdee
	sx6pS0gYykrS3erWjnqH64b2J1cmOGYPQ3/LMT3yKQQ3gd8HUm4pICNfR5iOtUMblWVHIz
	LicE7Ye8j8vmLi6pipJmBpcPYwmdDo2RBgVA0SvgJNBTZDOG8JcDnxvvjFnkJA==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 11:43:57 +0100
Message-Id: <DFJZWBL17LBX.X68EJ7CSQFB8@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 0/4] drm/bridge: add of_drm_find_and_get_bridge() and
 a managed *next_bridge, deprecate of_drm_find_bridge()
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com> <7d937ad1-dd7c-4a68-9af7-f386ca2c27dc@nxp.com>
In-Reply-To: <7d937ad1-dd7c-4a68-9af7-f386ca2c27dc@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Liu,

On Fri Jan 9, 2026 at 10:53 AM CET, Liu Ying wrote:
>
>
> On 1/7/26 17:56, Luca Ceresoli wrote:
>> This v4 contains the leftovers of the v3 series that deprecated
>> of_drm_find_bridge(), added a replacement which handles bridge refcounti=
ng,
>> and converted some of the direct users. All patches have been applied
>> except the imx8qxp-pixel-link ones, which still need a review for the fi=
rst
>> patch.
>>
>> @Liu, patch 1 is waiting for a review and it's non-trivial, it would be
>> nice if you could have a look at that one at least.
>
> Luca, I'v been too busy recently for tasks assigned by my employer to
> give an in-time review, sorry about that.  I'll try to review this late
> next week if not sooner.

That would be great, thanks! And I understand, aren't we all busy? :)

I have resent as v4 just to ensure it's clear that these patches are not
yet applied. My e-mail [0] might have suggested the opposite, due to my
total noobness in using the b4 auto-thankanator, sorry if that was the
case.

Having patch 1 reviewed is the most important thing here. Other patches are
already reviewed by Maxime, so your review would of course be very useful
but not strictly necessary for this series to go forward.

[0] https://lore.kernel.org/lkml/176708623356.127863.8623917477288453126.b4=
-ty@bootlin.com/

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

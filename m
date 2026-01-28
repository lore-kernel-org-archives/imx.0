Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A972F25EF
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615911; cv=none; b=Du9+fi5qMpY/4YPcMNpWUGilTkilOvgrQ7DlIFHbD686P/C7+S+oAHH69rBLoMjp8624cE1tsO2W2oqf/6XFDc5E7u7l8LGXAy2fPGEQ5xMC3KFgO+3h4vhHXlpe4ECjAnhGrvALebLcfJfTAhZSZHfKnQ3zpF9MKJJQ28Oy0CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615911; c=relaxed/simple;
	bh=LsAz4Gkdq/Zp0Orc9tSOWFYRifWan4dl1WpTdpSzKwU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=TCnM7PgGZkjHgO699b6K2sIqhkDVwU+Q+FXDfUOf4eF2Ir4E67XzCQFlWXnBMR3BIKbG9Ap3IeNNSmeBe77rvPbCkIKUz+QstTbTT5vYG0E++zBjH9KuS4pRHkSBrdNaf29oenEH+Xd8eq1fracESK75oDM6yTw8BQS4tFCmV1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QamPg3xM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QamPg3xM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 02F7C4E422FB;
	Wed, 28 Jan 2026 15:58:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8DD06071F;
	Wed, 28 Jan 2026 15:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C68C4119A880E;
	Wed, 28 Jan 2026 16:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769615906; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=opAspiy4bTRYcLC6unWKPdWWHfqQ8ZUrRbEYl36TmAQ=;
	b=QamPg3xM/8AtOWXPVKLc0zQYrpOuZwfbPdoikFrYbxLui6jdcfG7NjcdieV7BNDPrjj+Lw
	rEc6DRq8w0F8oS+UQ5VoVnmbOp1n9qMLfRQKl3c5efASRc6MC9ceoMkU0Fn2yk+SfaLCQ8
	XcceSvgfcibNP4C7fekLjCJgdKZ8qkxjSl0CivQkkTMgzphGvSpsy4O8uEmHyNPRiI20l3
	BpmCJ9EChqaTYfc6huYMMomKw5MHNGcqYcVWKUsY7wqFm416lZhLlnsfPRg/jNPlzNNv/8
	aBSUCRLcEH6XZfJqoS211BBiMpOPkrb3jTiIfvh142LnY872qGqJSHteXn4dXA==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 16:58:18 +0100
Message-Id: <DG0CHD0TAH9A.27UW4KKY2O9V7@bootlin.com>
Subject: Re: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
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
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com> <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com> <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com> <efeb3583-dd0c-4e91-bbfc-54b04644f2c2@nxp.com>
In-Reply-To: <efeb3583-dd0c-4e91-bbfc-54b04644f2c2@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Jan 27, 2026 at 4:54 AM CET, Liu Ying wrote:

...

>>>> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(str=
uct imx8qxp_pixel_link *pl)
>>>>  {
>>>>  	struct device_node *np =3D pl->dev->of_node;
>>>>  	struct device_node *port;
>>>> -	struct drm_bridge *selected_bridge =3D NULL;
>>>> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) =3D NULL;
>>>>  	u32 port_id;
>>>>  	bool found_port =3D false;
>>>>  	int reg;
>>>> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(str=
uct imx8qxp_pixel_link *pl)
>>>>  			continue;
>>>>  		}
>>>>
>>>> -		struct drm_bridge *next_bridge =3D of_drm_find_bridge(remote);
>>>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
>>>> +			of_drm_find_and_get_bridge(remote);
>>>>  		if (!next_bridge)
>>>>  			return -EPROBE_DEFER;
>>>>
>>>> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(s=
truct imx8qxp_pixel_link *pl)
>>>>  		 * Select the next bridge with companion PXL2DPI if
>>>>  		 * present, otherwise default to the first bridge
>>>>  		 */
>>>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-=
pxl2dpi"))
>>>> -			selected_bridge =3D next_bridge;
>>>> +		if (!selected_bridge || of_property_present(remote, "fsl,companion-=
pxl2dpi")) {
>>>> +			drm_bridge_put(selected_bridge);
>>>> +			selected_bridge =3D drm_bridge_get(next_bridge);
>>>
>>> Considering selecting the first bridge without the companion pxl2dpi,
>>> there would be a superfluous refcount for the selected bridge:
>>>
>>> 1) of_drm_find_and_get_bridge: refcount =3D 1
>>> 2) drm_bridge_put: noop, since selected_bridge is NULL, refcount =3D 1
>>> 3) drm_bridge_get: refcount =3D 2
>>> 4) drm_bridge_put(__free): refcount =3D 1
>>> 5) drm_bridge_get: for the pl->bridge.next_bridge, refcount =3D 2
>>
>> Here you are missing one put. There are two drm_bridge_put(__free), one =
for
>> next_bridge and one for selected_bridge. So your list should rather be:
>>
>> 1) next_bridge =3D of_drm_find_and_get_bridge: refcount =3D 1
>> 2) drm_bridge_put(selected_bridge): noop, since selected_bridge is NULL,=
 refcount =3D 1
>> 3) selected_bridge =3D drm_bridge_get: refcount =3D 2
>> 4) drm_bridge_put(next_bridge) [__free at loop scope end]: refcount =3D =
1
>> 5) pl->bridge.next_bridge =3D drm_bridge_get(), refcount =3D 2
>> 6) drm_bridge_put(selected_bridge) [__free at function scope end]: refco=
unt =3D 1
>
> Ah, right, I did miss this last put because selected_bridge is declared w=
ith
> __free a bit far away from the loop at the very beginning of
> imx8qxp_pixel_link_find_next_bridge() - that's my problem I guess, but I'=
m
> not even sure if I'll fall into this same pitfall again after a while, wh=
ich
> makes the driver difficult to maintain.
>
> Also, it seems that the refcount dance(back and forth bewteen 1 and 2) is=
 not
> something straightforward for driver readers to follow.

I thing the whole logic becomes straightforward if you think it this way:

 * when a pointer is assigned =3D a new reference starts existing -> refcou=
nt++
 * when a pointer is cleared/overwritten or goes out of scope =3D a referen=
ce
   stops existing -> refcount--

In short: one pointer, one reference, one refcount.

If you re-read the patch with this in mind, does it become clearer?

>>> I think the below snippet would be the right thing to do:
>>> -8<-
>>> {
>>> 	...
>>>
>>> 	struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
>>> 		of_drm_find_and_get_bridge(remote);
>>>   		if (!next_bridge)
>>>   			return -EPROBE_DEFER;
>>>
>>> 	/*
>>> 	 * Select the next bridge with companion PXL2DPI if
>>> 	 * present, otherwise default to the first bridge
>>> 	 */
>>> 	if (!selected_bridge)
>>> 		selected_bridge =3D drm_bridge_get(next_bridge);
>>>
>>> 	if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>>> 		if (selected_bridge)
>>> 			drm_bridge_put(selected_bridge);
>>>
>>> 		selected_bridge =3D drm_bridge_get(next_bridge);
>>> 	}
>>> }
>>
>> Your version of the code looks OK as well so far, but totally equivalent=
 to
>> what my patch proposes.
>>
>> Do you think splitting the if() into two if()s is clearer? Would you lik=
e
>> me to change this?
>
> Yes, please.  Two if()s are easier for me to read.

OK, will do.

> Also I think the
> "if (selected_bridge)" before "drm_bridge_put(selected_bridge)" improves
> readability, though I know drm_bridge_put() checks input parameter bridge
> for now.

I was about to reply "the NULL check in drm_bridge_put() is part of the API
contract as its documentation says", but then realized the documentation
does not say that. My bad, I was convinced I had documented that behaviour
to make it part of the contract so users can rely on it. I'm sending a
patch ASAP to document that.

>
>>
>>> ...
>>> pl->bridge.next_bridge =3D selected_bridge;
>>
>> Based on the logic above the drm_bridge_get() is still needed here (both
>> with the single if() or the split if()s) because at function exit the
>> selected_bridge reference will be put.
>
> Can the refcount dance be simplified a bit by dropping the put at
> function exit?  This snippet is what I'd propose if not too scary:
>
> -8<-
> 	struct drm_bridge *selected_bridge =3D NULL;
> 	...
>
> 	{
> 		...
>
> 		struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
> 			of_drm_find_and_get_bridge(remote);
> 			if (!next_bridge)
> 				return -EPROBE_DEFER;
>
> 		/*
> 		 * Select the next bridge with companion PXL2DPI if
> 		 * present, otherwise default to the first bridge
> 		 */
> 		if (!selected_bridge)
> 			selected_bridge =3D drm_bridge_get(next_bridge);
>
> 		if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
> 			if (selected_bridge)
> 				drm_bridge_put(selected_bridge);
>
> 			selected_bridge =3D drm_bridge_get(next_bridge);
> 		}
> 	}
>
> 	...
> 	pl->bridge.next_bridge =3D selected_bridge;
> -8<-

Based on the "one pointer, one reference, one refcount" logic I explained
above, I find this version more complex to understand. I read it as:
selected_bridge and pl->bridge.next_bridge are two pointers sharing a
single reference, and we know that would not create bugs because by careful
code inspection we realize that the life of the two references is
overlapped without a hole inbetween. I'm not a fan of this.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE491DE8BE
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 18:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769451542; cv=none; b=PQH3oIDTznDi2B/MTPP46fL2GH+n8v4DHyKKHc+k1veJN0/PEWqEkNH9hZ94Ni81NWPNZi7ABYHvZjR9viKPPBn8XW51Y6wB2NE8GKdiHNdwB92ypnxCe48l/IP29hfZkMzNJJcb7ReaphunBf7kgKljOEfILs3FOUADS8oBUfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769451542; c=relaxed/simple;
	bh=nUJDz3Krsa+J2Yf8rpXbhAKPggSYETDIXFRvihdG7aY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=maeeWFBaW9Q+ay8pG5W102xzadewRNe0bbVj42dHC/GeMY98DdDLL4Rp7ACguSU7vUJUoDVbYrZFBjzguG69es3xK4RHDmJSU1RTgKW90ZZyKRNrB9THbm/4Q3g0Xf7MygIlXgVtaHpI5L/fGw6GAdwmK1wkxDRkgHsuGNVFJ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NcArdz7x; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NcArdz7x"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0B921C214CF;
	Mon, 26 Jan 2026 18:18:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3774260717;
	Mon, 26 Jan 2026 18:18:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79086119A8652;
	Mon, 26 Jan 2026 19:18:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769451534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ls3taMwzvNNXHeVbQeNP5rFTYcAY6U5onCvB1yfNoQ8=;
	b=NcArdz7xzE0B9ZKlGEpC4zys8TGIgogLWz9VpMtrP6U+Em5MEEDrFaMiAA9LMfnJOpreJv
	+ZdWvIbH72LlOeGJQrsfZtHfGRyEexTvGXSZH6iMeG+1cpyK2Fi1EIwRshDDheiXKzKyd6
	wFNvp/9Bn4tLGNKIVhFjrKh4uJQ0WTU3BXvL2twizcVRwZbaeSzyo4fl5XICglLCoCeaC/
	xitZfUwjJmHl2YgbfQWLn4TR5aftP7+FMbOufQuPhkrL8oZwOx17YjlVJQgnJ5ioVgpTfz
	aYri0JDVyWhMbP97zYlt7JDxojnKMCruFM1l22lKmreDdrZRvqinZs6aNjVMCA==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 19:18:47 +0100
Message-Id: <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com>
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
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com> <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com>
In-Reply-To: <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Liu,

On Mon Jan 26, 2026 at 9:06 AM CET, Liu Ying wrote:
> Hi Luca,
>
> On Wed, Jan 07, 2026 at 10:56:29AM +0100, Luca Ceresoli wrote:
>> This driver obtains a bridge pointer from of_drm_find_bridge() in the pr=
obe
>> function and stores it until driver removal. of_drm_find_bridge() is
>> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
>> refcounted and use bridge->next_bridge to put the reference on
>> deallocation.
>>
>> This needs to be handled in various steps:
>>
>>  * the bridge returned of_drm_get_bridge() is stored in the local tempor=
ary
>>    variable next_bridge whose scope is the for loop, so a cleanup action=
 is
>>    enough
>>  * the value of next_bridge is copied into selected_bridge, potentially
>>    more than once, so a cleanup action at function scope plus a
>>    drm_bridge_put() in case of reassignment are enough
>>  * on successful return selected_bridge is stored in bridge->next_bridge=
,
>>    which ensures it is put when the bridge is deallocated
>>
>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks for having found the time to go into the details and provide a
careful review of this series!

>> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>> @@ -23,7 +23,6 @@
>>
>>  struct imx8qxp_pixel_link {
>>  	struct drm_bridge bridge;
>> -	struct drm_bridge *next_bridge;
>>  	struct device *dev;
>>  	struct imx_sc_ipc *ipc_handle;
>>  	u8 stream_id;
>> @@ -140,7 +139,7 @@ static int imx8qxp_pixel_link_bridge_attach(struct d=
rm_bridge *bridge,
>>  	}
>>
>>  	return drm_bridge_attach(encoder,
>> -				 pl->next_bridge, bridge,
>> +				 pl->bridge.next_bridge, bridge,
>>  				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>  }
>>
>> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(struc=
t imx8qxp_pixel_link *pl)
>>  {
>>  	struct device_node *np =3D pl->dev->of_node;
>>  	struct device_node *port;
>> -	struct drm_bridge *selected_bridge =3D NULL;
>> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) =3D NULL;
>>  	u32 port_id;
>>  	bool found_port =3D false;
>>  	int reg;
>> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struc=
t imx8qxp_pixel_link *pl)
>>  			continue;
>>  		}
>>
>> -		struct drm_bridge *next_bridge =3D of_drm_find_bridge(remote);
>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
>> +			of_drm_find_and_get_bridge(remote);
>>  		if (!next_bridge)
>>  			return -EPROBE_DEFER;
>>
>> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(str=
uct imx8qxp_pixel_link *pl)
>>  		 * Select the next bridge with companion PXL2DPI if
>>  		 * present, otherwise default to the first bridge
>>  		 */
>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-px=
l2dpi"))
>> -			selected_bridge =3D next_bridge;
>> +		if (!selected_bridge || of_property_present(remote, "fsl,companion-px=
l2dpi")) {
>> +			drm_bridge_put(selected_bridge);
>> +			selected_bridge =3D drm_bridge_get(next_bridge);
>
> Considering selecting the first bridge without the companion pxl2dpi,
> there would be a superfluous refcount for the selected bridge:
>
> 1) of_drm_find_and_get_bridge: refcount =3D 1
> 2) drm_bridge_put: noop, since selected_bridge is NULL, refcount =3D 1
> 3) drm_bridge_get: refcount =3D 2
> 4) drm_bridge_put(__free): refcount =3D 1
> 5) drm_bridge_get: for the pl->bridge.next_bridge, refcount =3D 2

Here you are missing one put. There are two drm_bridge_put(__free), one for
next_bridge and one for selected_bridge. So your list should rather be:

1) next_bridge =3D of_drm_find_and_get_bridge: refcount =3D 1
2) drm_bridge_put(selected_bridge): noop, since selected_bridge is NULL, re=
fcount =3D 1
3) selected_bridge =3D drm_bridge_get: refcount =3D 2
4) drm_bridge_put(next_bridge) [__free at loop scope end]: refcount =3D 1
5) pl->bridge.next_bridge =3D drm_bridge_get(), refcount =3D 2
6) drm_bridge_put(selected_bridge) [__free at function scope end]: refcount=
 =3D 1

The idea is that for each pointer (which is a reference) we get a reference
(refcount++) when the pointer is set and put the reference when that same
pointer goes out of scope or is reset to NULL. "the pointer is set" can be
either of_drm_find_and_get_bridge() or an assignment, as each of these
operations creates another reference (pointer) to the same bridge.

Does it look correct?

> I think the below snippet would be the right thing to do:
> -8<-
> {
> 	...
>
> 	struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
> 		of_drm_find_and_get_bridge(remote);
>   		if (!next_bridge)
>   			return -EPROBE_DEFER;
>
> 	/*
> 	 * Select the next bridge with companion PXL2DPI if
> 	 * present, otherwise default to the first bridge
> 	 */
> 	if (!selected_bridge)
> 		selected_bridge =3D drm_bridge_get(next_bridge);
>
> 	if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
> 		if (selected_bridge)
> 			drm_bridge_put(selected_bridge);
>
> 		selected_bridge =3D drm_bridge_get(next_bridge);
> 	}
> }

Your version of the code looks OK as well so far, but totally equivalent to
what my patch proposes.

Do you think splitting the if() into two if()s is clearer? Would you like
me to change this?

> ...
> pl->bridge.next_bridge =3D selected_bridge;

Based on the logic above the drm_bridge_get() is still needed here (both
with the single if() or the split if()s) because at function exit the
selected_bridge reference will be put.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

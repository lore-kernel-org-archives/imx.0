Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C236EA9F
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 08:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281539; cv=none; b=NBiQH193b/3wxXCfiNQEA7Jn+JUjRWC6oclwF1NDbsXhCb3em9NT2zCSfa30xC/ZTn16CMyA3pbaFMRtfaYrp1+fE1rzK7s4OWnW/yxc0EpMEM5ANc3UUk2BfniLvaeA8f2MOjYE/Oze03U7+voe+3S7/yidEnvpqqgrTfZ+LFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281539; c=relaxed/simple;
	bh=ZCZKEyBhUUCs1UznclDEASQLongwx06FGKzg2s8MjwQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=aU9ApUjKm9AL+P6GPVqvk4gDqxNvPVtf0f1lt94E/OlK2mkEgCel5AAPpoL/il9nChyb0N91JhUJ1841DeOwc7G+wuxn2cPtyAxZaCbgmn/n3v7Epg1CnKcYVDGU+Ww8Trgzwjswh7WpNNhNOEPIWfR143h0xdK8uZLQAzyqKiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V/OuwqIz; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V/OuwqIz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B59F84E42409;
	Thu,  5 Feb 2026 08:52:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 873C2606FD;
	Thu,  5 Feb 2026 08:52:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F4E1119A865B;
	Thu,  5 Feb 2026 09:52:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770281530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cAHuDZGdOHCkluE1sGpfz5BKQPev5pDJI3SbYCQhk/g=;
	b=V/OuwqIzGrMg16RK410fZ8NV8UB+SC8qXojKVuRT8brgx53s3SX7ZwCfi7PAcW/2JHIutf
	iP2WJOXeobyqbR08j0nlsZ9gn0awlNelWyoC+0GSqoCMfY7GjBIv1mEDo8X9s0PTQ+67Q4
	OJhfTxhZC72c5jAS/KG6hP83m5HTp8jaBeCaS4a3c7vo+i9vy8HgUCggTYW4Dy2IvOWXAg
	IbW4iE3RaOjukwR79O2XzAZDOMpgqnd/D95pr7vMSU6nen8QtJiw/DoGU3/ig/SC+hLo9a
	nFuBMTP8tV0eD2ryZHQ8gs+LIH6udPj2qI4ymiFWJNgdUUFFIKphgf/IG4uc1g==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 09:52:04 +0100
Message-Id: <DG6WFD0WCCMQ.2AT7S8YHVLH7@bootlin.com>
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
Subject: Re: [PATCH v5] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-0-66bda8d617b4@bootlin.com> <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-1-66bda8d617b4@bootlin.com> <8d8e678b-bd3f-441e-9496-e1461a1289ea@nxp.com>
In-Reply-To: <8d8e678b-bd3f-441e-9496-e1461a1289ea@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Liu,

On Wed Feb 4, 2026 at 7:27 AM CET, Liu Ying wrote:
> Hi Luca,
>
> On Tue, Feb 03, 2026 at 11:35:25AM +0100, Luca Ceresoli wrote:
>> This driver obtains a bridge pointer from of_drm_find_bridge() in the pr=
obe
>> function and stores it until driver removal. of_drm_find_bridge() is
>> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
>> refcounted and use bridge->next_bridge to put the reference on
>> deallocation.
>>
>> To keep the code as simple and reliable as possible, get a reference for
>> each pointer that stores a drm_bridge address when it is stored and rele=
ase
>> it when the pointer is overwritten or goes out of scope. Also remove the
>> intermediate selected_bridge variable to reduce the refcounted variables=
 in
>> the function. The involved pointers are:
>>
>>  * next_bridge loop-local variable:
>>    - get reference by of_drm_find_and_get_bridge()
>>    - put reference at the end of the loop iteration (__free)
>>
>>  * pl->bridge.next_bridge, tied to struct imx8qxp_pixel_link lifetime:
>>    - get reference when assigned (by copy from next_bridge)
>>    - put reference before reassignment if reassignment happens
>>    - put reference when the struct imx8qxp_pixel_link embedding the
>>      struct drm_bridge is destroyed (struct drm_bridge::next_bridge)
>>
>> Additionally, split the somewhat complex if() for readability.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>
>> ---
>>
>> Changes in v5:
>> - rewrite commit message after Liu's review to clarify the per-pointer
>>   get/put idea
>> - split the if()s involved in selcting the bridge
>> - remove intermediate selected_bridge pointer
>> - removed Maxime's R-by, patch changed
>> ---
>>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 17 ++++++++++-------
>>  1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/g=
pu/drm/bridge/imx/imx8qxp-pixel-link.c
>> index 91e4f4d55469..e29e099b893a 100644
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
>> @@ -260,7 +259,6 @@ static int imx8qxp_pixel_link_find_next_bridge(struc=
t imx8qxp_pixel_link *pl)
>>  {
>>  	struct device_node *np =3D pl->dev->of_node;
>>  	struct device_node *port;
>> -	struct drm_bridge *selected_bridge =3D NULL;
>>  	u32 port_id;
>>  	bool found_port =3D false;
>>  	int reg;
>> @@ -297,7 +295,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struc=
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
>> @@ -305,12 +304,16 @@ static int imx8qxp_pixel_link_find_next_bridge(str=
uct imx8qxp_pixel_link *pl)
>>  		 * Select the next bridge with companion PXL2DPI if
>>  		 * present, otherwise default to the first bridge
>>  		 */
>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-px=
l2dpi"))
>> -			selected_bridge =3D next_bridge;
>> +		if (!pl->bridge.next_bridge)
>> +			pl->bridge.next_bridge =3D drm_bridge_get(next_bridge);
>> +
>> +		if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>> +			drm_bridge_put(pl->bridge.next_bridge);
>> +			pl->bridge.next_bridge =3D drm_bridge_get(next_bridge);
>> +		}
>
> Can you drop the intermediate next_bridge variable to simplify the code?
>
> -8<-
> if (!pl->bridge.next_bridge) {
>         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
>         if (!pl->bridge.next_bridge)
>                 return -EPROBE_DEFER;
> }
>
> if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>         drm_bridge_put(pl->bridge.next_bridge);
>         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
>         if (!pl->bridge.next_bridge)
>                 return -EPROBE_DEFER;
> }
> -8<-

Potentially calling of_drm_find_and_get_bridge() twice on the same node,
with a put in the middle, looks poorly readable to me, even though it still
looks correct code.

However I think we can do even better with an 'else if':

  if (!pl->bridge.next_bridge) {
         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
         if (!pl->bridge.next_bridge)
                 return -EPROBE_DEFER;
  } else if (of_property_present(remote, "fsl,companion-pxl2dpi")) {   <=3D=
=3D=3D
         drm_bridge_put(pl->bridge.next_bridge);
         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
         if (!pl->bridge.next_bridge)
                 return -EPROBE_DEFER;
  }

Looks OK?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

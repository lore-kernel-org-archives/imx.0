Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B190327F010
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464667; cv=none; b=CTAJHK3eF/jPb/MbX0TwDKcSnx/munKh6yCFHgfmDEZT9tHIb5sd3/f8yH4f6VPjX6BiZPEne3S+WsR+RoH/bJcPHegV45pm802Aysv97L2NmNyHr6OD/e6rLbUr+w8M/Mmr1ajQp1FPoPRM+pjMBEV5+vhv65qPNgKM5VvXIAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464667; c=relaxed/simple;
	bh=GjExBGcw5vL693eu2oaJsHTFaxubdOlrE7pw2INIqd4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=AyO1vTDCxMd5geHrCA1xeqPDbLgy9Njhh4x3EIUsk7p25npHu40k1J/PMcHmFUgIeadQqGxZzdjwpMsWdHS5gD1f1Ikwhs0eAH4lOGUXlxzKJzlyf3G6jnfsxjobGiICeum9rjh1efubfL3njUE1uat+nLm7zo5GRgGvMIp+hW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LCXGMY+Z; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LCXGMY+Z"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 47492C214D3;
	Mon, 26 Jan 2026 21:57:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5396260717;
	Mon, 26 Jan 2026 21:57:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 874EC119A8652;
	Mon, 26 Jan 2026 22:57:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769464662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JPwZyDe4OThoaY1OrbYDXoRov92xdqHIGYafSht4NfM=;
	b=LCXGMY+ZTWlhL1gecMErzIScZDyGU0NQZPJmDtsoIaTKfhqkz/dw0BOfPXjNi+zRc53RN8
	gZ+HMhMCK7t8zArJcfx9ysmuPANr0TGU5iT6jyyteXZr5mQmCEBvtCMI/wCpXK+vQUIKBh
	5JLvSGLcyi4iik+iFHZW7TpDhBmqiOi6mrVxtIN5dTlqJChxN05zbgtWK5qhl7N6N1XpTm
	jQchp++A4t4Hg+f7SR55Z6Gm+pcNUUMp4voqvkFZS5eaggk+kqMygbagGhGI92yko1Iq4j
	cZqCoDJ/KgHtQpjNEDADwc/TP1VB2/DSmujZ6JyRxeObbxSWkCA1a51BafitOg==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 22:57:35 +0100
Message-Id: <DFYUVCNVLBND.3MHWLTF20L4TS@bootlin.com>
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com> <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com> <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com>
In-Reply-To: <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Liu,

On Mon Jan 26, 2026 at 7:18 PM CET, Luca Ceresoli wrote:

>>> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(stru=
ct imx8qxp_pixel_link *pl)
>>>  {
>>>  	struct device_node *np =3D pl->dev->of_node;
>>>  	struct device_node *port;
>>> -	struct drm_bridge *selected_bridge =3D NULL;
>>> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) =3D NULL;
>>>  	u32 port_id;
>>>  	bool found_port =3D false;
>>>  	int reg;
>>> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(stru=
ct imx8qxp_pixel_link *pl)
>>>  			continue;
>>>  		}
>>>
>>> -		struct drm_bridge *next_bridge =3D of_drm_find_bridge(remote);
>>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
>>> +			of_drm_find_and_get_bridge(remote);
>>>  		if (!next_bridge)
>>>  			return -EPROBE_DEFER;
>>>
>>> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(st=
ruct imx8qxp_pixel_link *pl)
>>>  		 * Select the next bridge with companion PXL2DPI if
>>>  		 * present, otherwise default to the first bridge
>>>  		 */
>>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-p=
xl2dpi"))
>>> -			selected_bridge =3D next_bridge;
>>> +		if (!selected_bridge || of_property_present(remote, "fsl,companion-p=
xl2dpi")) {
>>> +			drm_bridge_put(selected_bridge);
>>> +			selected_bridge =3D drm_bridge_get(next_bridge);
>>
>> Considering selecting the first bridge without the companion pxl2dpi,
>> there would be a superfluous refcount for the selected bridge:
>>
>> 1) of_drm_find_and_get_bridge: refcount =3D 1
>> 2) drm_bridge_put: noop, since selected_bridge is NULL, refcount =3D 1
>> 3) drm_bridge_get: refcount =3D 2
>> 4) drm_bridge_put(__free): refcount =3D 1
>> 5) drm_bridge_get: for the pl->bridge.next_bridge, refcount =3D 2
>
> Here you are missing one put. There are two drm_bridge_put(__free), one f=
or
> next_bridge and one for selected_bridge. So your list should rather be:
>
> 1) next_bridge =3D of_drm_find_and_get_bridge: refcount =3D 1
> 2) drm_bridge_put(selected_bridge): noop, since selected_bridge is NULL, =
refcount =3D 1
> 3) selected_bridge =3D drm_bridge_get: refcount =3D 2
> 4) drm_bridge_put(next_bridge) [__free at loop scope end]: refcount =3D 1
> 5) pl->bridge.next_bridge =3D drm_bridge_get(), refcount =3D 2
> 6) drm_bridge_put(selected_bridge) [__free at function scope end]: refcou=
nt =3D 1
>
> The idea is that for each pointer (which is a reference) we get a referen=
ce
> (refcount++) when the pointer is set and put the reference when that same
> pointer goes out of scope or is reset to NULL. "the pointer is set" can b=
e
> either of_drm_find_and_get_bridge() or an assignment, as each of these
> operations creates another reference (pointer) to the same bridge.
>
> Does it look correct?

Based on this discussion I thought the commit message could be clearer, and
rewrote it as:

-----[no changes from here...]-----
    drm/bridge: imx8qxp-pixel-link: get/put the next bridge

    This driver obtains a bridge pointer from of_drm_find_bridge() in the p=
robe
    function and stores it until driver removal. of_drm_find_bridge() is
    deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
    refcounted and use bridge->next_bridge to put the reference on
    deallocation.
-----[...to here]-----

    To keep the code as simple and reliable as possible, get a reference fo=
r
    each pointer that stores a drm_bridge address when it is stored and rel=
ease
    when the pointer is set to NULL or goes out of scope. The involved poin=
ters
    are:

     * next_bridge loop-local variable:
       - get reference by of_drm_find_and_get_bridge()
       - put reference at the end of the loop iteration (__free)

     * selected_bridge function-local variable:
       - get reference when written (by copy from next_bridge)
       - put reference at function exit (__free)
       - put reference before reassignment too

     * pl->bridge.next_bridge, tied to struct imx8qxp_pixel_link lifetime:
       - get reference when written (by copy from selected_bridge)
       - put reference when the struct imx8qxp_pixel_link embedding the
         struct drm_bridge is destroyed (struct drm_bridge::next_bridge)

Do you think it's better now?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

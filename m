Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53E2331EC7
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379969; cv=none; b=KzC7r0GaynicDrqW1TlbCYmreYanOq+w/6qDDRpIPqpT3wwuvWUvYeUtg7wojNS3MIjm4++zh88EAowlt8bMqXj5NLDfJyuQpfM+QEyPJT5Xn0MszUMmamsMYuUK3oraOKbr7ll7JawiwCY5Ig+XKP12/FV8VOrxl39HRUrVhdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379969; c=relaxed/simple;
	bh=qAWKLj/rSvIMKFR+M0lyvRH0Z5e0F+cetIOOra9vnsE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=WtI21aoY9nIjdOd+M27ZDJVlM/uPn0sTiwzAoOqEG2TTJK7dSHksIu/HOb0kDZEtD9wVQU0UMZgbAawMFLzTRDcF7Urdnp6lKZLhmkX4V4qPRoH4YN5an6B1duhJE/q/Yn32wg5ln7VxGnQo2Wy2NVCoLiUg0mpR9SWSKf+d8As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NVv/0kRP; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NVv/0kRP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF6481A0997;
	Thu, 25 Jun 2026 09:32:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B48175FF03;
	Thu, 25 Jun 2026 09:32:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A91F8106F07A6;
	Thu, 25 Jun 2026 11:32:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782379962; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gzklC7KBIiORDiPpvxIA/RiOGT5I3aaT1J/z+yclQsw=;
	b=NVv/0kRPnXsXfA3t4Z35KoZxhi4rXMP0NjvjCK7e+pUAiE1yEzWyFjHOzRXycBAokON8Km
	3pEjntsgnjJQaztyKwn6+D5BW99kYL2b1WXbBFKqvBxnOWgtIZwd4Nkx7v05NP2C19M9lc
	xJxlbR8NOherY2tXngy74mGDJltt/mAITbaBccIKy+8ddeapqXKAlnyGVB6FXpxsau/BRv
	jsf9pbdO1NuJHTjsl8ltGwX1z4NWZ4NP7+WC2q4hmM+2UVF00gWaW8w9IP+OrSXp87vftB
	xGkQFopFQjmI55oD9do6bpHlZXV65REQHvcrdLz5aULQrJiUb5qxvuXVFmgm7g==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 11:32:32 +0200
Message-Id: <DJI0YM93PKAM.TMLLL1394R5D@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maxime Ripard"
 <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 15/37] drm/display: bridge-connector: allocate the
 connector dynamically
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>,
 "Stefan Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-15-45e2bdb3dfb4@bootlin.com>
 <20260608-rustling-infrared-turkey-e09af8@houat>
 <DJ72WOUW5FA2.G1MPCAHJQ13F@bootlin.com>
 <20260624-judicious-enigmatic-hippo-b13ffe@houat>
 <DJHE108R7TU6.35ECAUQ8ZX041@bootlin.com>
In-Reply-To: <DJHE108R7TU6.35ECAUQ8ZX041@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Jun 24, 2026 at 5:34 PM CEST, Luca Ceresoli wrote:
> Hi Maxime,
>
> thanks for the feedback.
>
> On Wed Jun 24, 2026 at 1:48 PM CEST, Maxime Ripard wrote:
>> On Fri, Jun 12, 2026 at 02:44:43PM +0200, Luca Ceresoli wrote:
>>> On Mon Jun 8, 2026 at 1:46 PM CEST, Maxime Ripard wrote:
>>> > On Tue, May 19, 2026 at 12:37:32PM +0200, Luca Ceresoli wrote:
>>> >> Currently the drm_bridge_connector has an embedded drm_connector, so=
 their
>>> >> allocation lifetimes are tied to each other. This is insufficient to
>>> >> support DRM bridge hotplugging, which requires the connector to be a=
dded
>>> >> and removed dynamically at runtime multiple times based on hotplug/u=
nplug
>>> >> events while the drm_bridge_connector is persistent.
>>> >>
>>> >> Moreover the drm_connector is exposed to user space and thus an ongo=
ing
>>> >> operation (e.g. an ioctl) might last for an arbitrarily long time ev=
en
>>> >> after the hardware gets removed. This means a new connector might ha=
ve to
>>> >> be added when the previous one is still referenced by user space.
>>> >>
>>> >> In preparation to handle hotplug, allocate the drm-connector dynamic=
ally,
>>> >> to allow:
>>> >>
>>> >>  * creating and destroying a connector multiple times during a singl=
e
>>> >>    drm_bridge_connector lifetime
>>> >>  * creating a new connector even though the previous one is still in=
 use
>>> >>    and thus still refcounted and not yet freed
>>> >>
>>> >> This commit does not introduce the actions in the two bullets (it wi=
ll
>>> >> happen in a later commit), it only moves to dynamic APIs for connect=
or
>>> >> allocation and init.
>>> >>
>>> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>> >
>>> > I think this patch should be split in half, with the switch to using
>>> > destroy first, and then the actual move to the dynamically allocated
>>> > connector API.
>>>
>>> Is it doable? drm_connector_dynamic_init() mandates a .destroy callback=
,
>>> drm_connector_init() forbids it.
>>
>> drmm_connector_init forbids it. drm_connector_init mandates it.
>
> Something bogus in my reply, sorry. :)
>
> So you mean splitting in:
>
>  * first patch: move from drmm_connector[_hdmi]_init() to
>    drm_connector[_hdmi]_init() and add a .destroy
>  * second patch: move from drm_connector[_hdmi]_init() to
>    drm_connector[_hdmi]_dynamic_init() +
>    drm_connector_dynamic_register/unregister()

Ah, no, there's an annoyance here. drm_connector_hdmi_init() does not
exist, so it'd have to be created just for the sake of splitting this
patch, sitting unused after the second patch.

I don't think it's worth implementing (and maybe deleting) it just for
that, so I'm leaving this patch as is unless you have counteraguments.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

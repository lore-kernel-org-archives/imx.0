Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317DD28FFF6
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097863; cv=none; b=MRxfoM0CwsBN/mubhcfujIYlAHhPR8MewR9yvHdNrzXac/+qtiTYNfPlYAOEWzmk/lauOWUlgTVI+qwRA7OlfCmyg95aMZrrqm94qs56dCIELjdvKjF0496ceRAPbNZQ1BQ+a7fjNUSWIXvAFLVEi91UJRmHznSz6JSauFeKXcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097863; c=relaxed/simple;
	bh=OcHuYl1Ph7xqh0+3RaFaNBCyc+ymRl0R70y7qlkaKXg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=OU79vf+p6e+WxczJIcBGXIwk9NXJZ134wJ/CEPeqPQsckK/zpTnKQvLxyDfn/Y0dCL9EAbm+++Ukg3VROXh/+Y2jt1MwuZIOAff/P1ycuLnwbFZJMbf19r4MC+raqoHEliHOIKOj4ZWcIDWm1uGxRo0ORAFiRRHMv8dmEEr9Xsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0nTSHjKz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0nTSHjKz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 81FB61A0A4B;
	Wed, 10 Jun 2026 13:24:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50B7D5FFC9;
	Wed, 10 Jun 2026 13:24:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E75DD106B9316;
	Wed, 10 Jun 2026 15:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781097858; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HuYHe/CNiuZeBGy3PDq0TYt7SKGdMlrug+s3F+qMfDc=;
	b=0nTSHjKzxPXZBVWqZua8Og2r0GBdYG6BhajQL/lmUmUjp58ymKJerN5mf+51bhppUBAFpY
	2BdrrSrR6oj/8HPUvEVUYM9+Igt3YQ0+W4RUxJiGqcpKeZgp+B2Ij22lTxLyYpvBorGBF0
	artzSGZunjeHxpZ1oq6SwUrGWy20wnyzhS7eLtiI6E0j/GjIOCshPOSek6WV2wj5MSkLsq
	Op6ANk/axXjMD8NpmlRuUzEbZ/aEcwUL6/1J5Q722QMpLQFC0TGVKDVV6gMlAr5BmgmM/7
	vjy1lMVcayXJp8rcKTyQ4BgHJRaQd09JL94n9Vu0DvEiTaUpsSoXsX94yXqNxg==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 15:24:10 +0200
Message-Id: <DJ5EHSOPNQZH.22I96C6QXN9KJ@bootlin.com>
Subject: Re: [PATCH 18/37] drm/bridge: samsung-dsim: remove the panel_bridge
 on host_detach
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
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-18-45e2bdb3dfb4@bootlin.com>
 <20260608-nano-kangaroo-of-piety-b5ab3d@houat>
In-Reply-To: <20260608-nano-kangaroo-of-piety-b5ab3d@houat>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Jun 8, 2026 at 1:53 PM CEST, Maxime Ripard wrote:
> On Tue, May 19, 2026 at 12:37:35PM +0200, Luca Ceresoli wrote:
>> In preparation for DRM bridge hot-plugging, we need to handle the dynami=
c
>> lifetime of the following bridge in case the samsung-dsim is always pres=
ent
>> and the following bridge (next_bridge) is hot-unplugged.
>>
>> Based on the 'if (!IS_ERR(panel))' check in samsung_dsim_host_attach(), =
the
>> next_bridge could be A) a panel bridge created by this driver via
>> devm_drm_panel_bridge_add() or B) a pre-existing bridge obtained via
>> of_drm_find_and_get_bridge().
>>
>> For case B) we need to put that reference when the next_bridge is remove=
d,
>> which is already handled by calling drm_bridge_clear_and_put() in
>> samsung_dsim_host_detach() and in the samsung_dsim_host_attach() error
>> management code.
>>
>> In case A) we additionally have to remove the panel bridge. Currently it=
 is
>> created by devm_drm_panel_bridge_add(), which adds two devm actions with
>> the refcounted panel bridge:
>>
>>  - drm_bridge_put_void() via devm_drm_bridge_alloc() on panel->dev
>>  - devm_drm_panel_bridge_release() via devm_drm_panel_bridge_add_typed()
>>    on the consumer device (samsung-dsim)
>>
>> The first action is OK: being tied to panel->dev it will happen when the
>> panel is unplugged.
>>
>> The second action is bound to the consumer device, so the devm semantics=
 is
>> not useful here when introducing hotplug. Indeed we need to drop the
>> next_bridge in samsung_dsim_host_detach() anyway, before the driver .rem=
ove
>> function, in order to support {add, {attach, detach} x N, remove} hotplu=
g
>> event sequences.
>>
>> Thus move to the non-devm drm_panel_bridge_add() along with the matching
>> drm_panel_bridge_remove(), so the lifetime of the panel-bridge is tied t=
o
>> the host_attach/host_detach cycle and not the whole samsung-dsim device
>> lifetime.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>
>> ---
>>
>> In a previous discussion with Maxime he mentioned a plan to make every
>> drm_panel always have a wrapping bridge. With that done, all the code
>> handling the panel and adding the panel_bridge would become useless here
>> (and in many other places) and could be entirely removed. This patch is =
a
>> temporary solution until that happens. The best pointer I could find to
>> that discussion is [0], but there might be more recent material I could =
not
>> find at the moment.
>>
>> [0] https://lore.kernel.org/lkml/20250218-faithful-white-magpie-da9ac9@h=
ouat/
>> ---
>>  drivers/gpu/drm/bridge/samsung-dsim.c | 17 ++++++++++++++---
>>  include/drm/bridge/samsung-dsim.h     |  2 ++
>>  2 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bri=
dge/samsung-dsim.c
>> index 5b799619e07e..2af287221e22 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1951,14 +1951,16 @@ static int samsung_dsim_host_attach(struct mipi_=
dsi_host *host,
>>  	if (!remote)
>>  		return -ENODEV;
>>
>> +	dsi->panel_bridge_added =3D false;
>>  	panel =3D of_drm_find_panel(remote);
>>  	if (!IS_ERR(panel)) {
>> -		next_bridge =3D devm_drm_panel_bridge_add(dev, panel);
>> +		next_bridge =3D drm_panel_bridge_add(panel);
>>  		if (IS_ERR(next_bridge)) {
>>  			ret =3D PTR_ERR(next_bridge);
>>  			next_bridge =3D NULL; // Inhibit the cleanup action on an ERR_PTR
>>  		} else {
>>  			drm_bridge_get(next_bridge);
>> +			dsi->panel_bridge_added =3D true;
>>  		}
>>  	} else {
>>  		next_bridge =3D of_drm_find_and_get_bridge(remote);
>> @@ -1989,7 +1991,7 @@ static int samsung_dsim_host_attach(struct mipi_ds=
i_host *host,
>>  	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
>>  		ret =3D samsung_dsim_register_te_irq(dsi, &device->dev);
>>  		if (ret)
>> -			goto err_remove_bridge;
>> +			goto err_remove_panel_bridge;
>>  	}
>>
>>  	// The next bridge can be used by host_ops->attach
>> @@ -2011,8 +2013,12 @@ static int samsung_dsim_host_attach(struct mipi_d=
si_host *host,
>>  	drm_bridge_clear_and_put(&dsi->bridge.next_bridge);
>>  	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO))
>>  		samsung_dsim_unregister_te_irq(dsi);
>> -err_remove_bridge:
>> +err_remove_panel_bridge:
>>  	drm_bridge_remove(&dsi->bridge);
>> +	if (dsi->panel_bridge_added) {
>> +		drm_panel_bridge_remove(next_bridge);
>> +		dsi->panel_bridge_added =3D false;
>> +	}
>
> This is a pretty big abstraction leak. We don't want to have that in
> everything driver. The removal path should be the same for both cases,
> and it's not something the driver should take care of.

Yes. The comment after the '---' separator was meant to discuss this
concern:

> In a previous discussion with Maxime he mentioned a plan to make every
> drm_panel always have a wrapping bridge. With that done, all the code
> handling the panel and adding the panel_bridge would become useless here
> (and in many other places) and could be entirely removed. This patch is a
> temporary solution until that happens. The best pointer I could find to
> that discussion is [0], but there might be more recent material I could n=
ot
> find at the moment.

Do you have any update about that plan?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

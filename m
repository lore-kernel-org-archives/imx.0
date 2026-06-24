Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996B83C6A43
	for <imx@lists.linux.dev>; Wed, 24 Jun 2026 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782317223; cv=none; b=OV7JncTT2DrvdVZ/pEmYPvRh/LFB/xvkuGhAYNA6qMSH9JS2U0GZdI3mpRhDQKBykm3jjd3MM6Fx7XTevDghDpsYG9k5TtfNf6+ByF3ViMG7lBSV0cjAkF4sYV9qAq56U0gYCqdtcMOAyb6xUvln52MXdmhN8SNtIeXcxHG7UNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782317223; c=relaxed/simple;
	bh=oMy12p5Cih8EbVR2+wU0ADk5pQIyI7dlCiDdxBA85ko=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Gy4VGSOmtY/miDtmyZOnM7p9s+EbTXbwLeEtyae9/QF37ui02FCs3Kl7fyRb1TnjGKt18zq0W/3Mqp0mY59qFYZLcqOHWuiP7opiJaw7D4uLz3JY8skd0woDJlwS+pk43JNbA30d//xD0RZZvTUtTGZLQ5HEaHVnAMT9MqP/UXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RjmT+un4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RjmT+un4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D48791A0923;
	Wed, 24 Jun 2026 16:06:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3C69601C5;
	Wed, 24 Jun 2026 16:06:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 502E1106C8468;
	Wed, 24 Jun 2026 18:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782317215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N3v36YslEFTvIe9aSboloVtZTLcZwXqsmCLNtL+8QuI=;
	b=RjmT+un4qnnBjmGoKLf/boh6gu+rTh4ct3BN5juGXqgOv7bgnvX9vEWv3HUtBp+QuzJD5Q
	N6vRla5R96P4XxouiUhAdC1HzU5C4ileLGLhhO+vxj2PB3zdepND0Fu6fyhHaKGIe2Ku8Z
	DsWzrXMd/nqD0xS+lLv8vZrf2rrg+kz0mJZ9Ojb7zCXHExHam5OZsbEeLNZWrV5+UUAQRQ
	Ue1+yCqg1OKk8ghIpB+KxGaSy3evpBqIWgzGFLWS0HhHotZcB3KbL7lSv4CbEf5NBC58at
	T6WLbK/qhE2i8Gacrjtc7yinm3pm+aC4JaMPb/LLS/JSyTkS6L6ebzc+kO+bDQ==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 18:06:47 +0200
Message-Id: <DJHEPXMBL9N8.10GN58K6CAULK@bootlin.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 30/37] drm/bridge: add drm_bridge_is_tail() to know
 whether a bridge completes the pipeline
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
 <20260519-drm-bridge-hotplug-v1-30-45e2bdb3dfb4@bootlin.com>
 <20260608-shapeless-opal-ferret-c8b105@houat>
 <DJ4DGYZ3GQZH.3AZOC0Z69W92S@bootlin.com>
 <20260624-vagabond-neon-gorilla-cd6487@houat>
In-Reply-To: <20260624-vagabond-neon-gorilla-cd6487@houat>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Jun 24, 2026 at 3:04 PM CEST, Maxime Ripard wrote:
> On Tue, Jun 09, 2026 at 10:23:24AM +0200, Luca Ceresoli wrote:
>> Hi Maxime,
>>
>> thanks for the review of this long series!
>>
>> On Mon Jun 8, 2026 at 2:34 PM CEST, Maxime Ripard wrote:
>> ...
>> >> --- a/include/drm/drm_bridge.h
>> >> +++ b/include/drm/drm_bridge.h
>> >> @@ -78,6 +78,19 @@ struct drm_bridge_funcs {
>> >>  	int (*attach)(struct drm_bridge *bridge, struct drm_encoder *encode=
r,
>> >>  		      enum drm_bridge_attach_flags flags);
>> >>
>> >> +	/**
>> >> +	 * @is_tail:
>> >> +	 *
>> >> +	 * Returns true if this is a tail bridge, i.e. it does not need a
>> >> +	 * next bridge to work. E.g. a panel_bridge is a tail bridge, a
>> >> +	 * DSI-to-LVDS bridge is not a tail bridge (no matter whether the
>> >> +	 * next bridge is present or not).
>> >
>> > Why a DSI-to-LDVS bridge isn't a tail bridge? It only needs a panel
>> > next, right?
>>
>> Uhm, good point, but I'd say it can be a tail bridge or not: in the
>> ATTACH_NO_CONNECTOR case it will need a bridge (a panel_bridge most
>> likely), no?
>
> Yeah, I think it cannot (always) be a blanket statement from the driver.
> For drivers that do not support ATTACH_NO_CONNECTOR, then it's always
> going to be a tail, but if the driver supports it, we should use a
> helper because it's going to depend on the DT, basically.
>
>> However this is possibly irrelevant as the whole .is_tail is meant to
>> disappear in v2, see below.
>>
>> >> +	 * The @is_tail callback is optional but it is required if the
>> >> +	 * bridge is part of a pipeline with hot-pluggable components.
>> >> +	 */
>> >> +	bool (*is_tail)(struct drm_bridge *bridge);
>> >> +
>> >
>> > I don't think that's the right way to think about it, if only because
>> > you never really know at the driver level if you're supposed to be las=
t
>> > or not. A DSI-to-LVDS bridge might just as well be chained with an
>> > LVDS-to-eDP bridge, or feed the panel directly without any additional
>> > bridge.
>> >
>> > I *think* that what you're trying to find out here is whether the chai=
n
>> > is complete or not.
>>
>> You nailed it.
>>
>> That was the main point discussed during the Display Next Hackfest 2026
>> (see the report [0]) and we all agreed the .is_tail along with the
>> -EPROBE_DEFER changes (patches 20+35) are not a good approach.
>>
>> This is actually the most crucial aspect of the whole work still not hav=
ing
>> no well-defined solution.
>
> Ok
>
>> > I think you can get the same information by checking
>> > whether you have a connector for that bridge chain. If you don't, you
>> > know the chain isn't complete, and if you do, it's supposed to be.
>>
>> There's a checken-egg problem here. Knowing whether the pipeline is
>> complete or not is needed to know whether we have to create a
>> connector. See patch 36:
>>
>>   +  if (drm_bridge_connector_pipeline_is_complete(bridge_connector))
>>   +          drm_bridge_connector_add_connector(bridge_connector);
>>
>> So the question is still open, what I need the most right now is comment=
s
>> on the overall architecture of this aspecs. Maybe replying to [0] can be
>> more effective than here.
>>
>> In a nutshell what we need is:
>>
>>  * when a bridge needs a following element (a bridge, or a panel which
>>    however might/should have a panel_bridge), but that element is not
>>    present, instead of deferring the whole card probe the card should be
>>    allowed to probe but without a connector
>>
>>  * when something is added to an incomplete pipeline we need to know
>>    whether the pipeline has become complete (in order to create the
>>    connector)
>>
>> How to implement this is still an open point. I'll welcome proposals in
>> addition to the ones in [0].
>
> Thanks for the notes, I think I largely agree with the discussion.

Good! :)

> Reading through it, I thought it would be nice for a new callback called
> get_next_bridge or something that would return either an error, NULL or a
> (refcounted) pointer to the next bridge in the chain. And have some kind
> of special error (ENODEV?) when the bridge should be there but isn't
> (and thus the chain isn't complete).

I initially preferred exposing the fwnode of the next bridge as discussed
with Dmitry during the Display Next Hackfest, which looks simpler for
driver writers. But then I realized it would be tricyk in cases such as
dual-LVDS output bridges (ti-sn65dsi83.c) which have two output ports in
DT, none of which is mandatory. So I've come to thinking a callback is
better as it should be flexible enough.

Picking the best errno is probably the only aspect needing special
attention now.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

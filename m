Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461E63D5640
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 08:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993419; cv=none; b=aR5BpLNxaaKsFK/mr1C0dgb44AbtNEQjwyoxF3P39Ql4rtefBKxUXvhPmyqc6qasxXDTsYg0cpAX0dh9HbAQiwfgXd2oGIrNiFgFgSbEAfMpoVbUMfYNQlC9SesDweNfM3bAPm218oQac+PyPt6F0y3jEYqt27wbhzZ82jyPTNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993419; c=relaxed/simple;
	bh=O4oZhSTEkmi6JBd17IkQvDtyNDirtPqGeVV1eyAJTlY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=IC9COijgyLOWPqTMOfefcPmq99xqnj4rb+TybEeIbLT8jtHWjnHg8hTKgEYB0Q1LWcVKJTTyWLUHP1Ahgmp1LcsaFfHZd4UeKZS6/MVN3z697jtYpsyis4gk2YBJPdJrGR1G79ajHsw5ucrscUWb8ti99pClRiLvV64K9XDMPX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hBvKze0J; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hBvKze0J"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E931BC4FED5;
	Tue,  9 Jun 2026 08:23:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88A575FFC1;
	Tue,  9 Jun 2026 08:23:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A6E7106A2A9D;
	Tue,  9 Jun 2026 10:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780993414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zHx7IH4CQnKVKKiwpqK0zhDBHfLiKLUyXdppF6LNFCI=;
	b=hBvKze0J9N8/PmsSE6wYyE0e6AUrZ2far59k3pTSOl2RKwQor+bVUthTqYbZzuGRC/LqUy
	XEtovmur3V7GsJWjLsQPdA4/cQnjZRRpq3BRdCj7AHlZsPO4vJ3HMd0pMVjkoa8bot+yZq
	LFfie0S6ftflFFnNPOtYWsJxBk2JgQRBT9NzJIrvDOhZ2NxHcQGletZrbMTNalwFH9wKN/
	8MxgXYJ97sakzc/ZnElRG4JexPstQoQhZik71MXWLzyV6Pzz9mjBLw3BqxUDvTi+ToftvT
	fLjB/nO/tKgurtlMQxRP5TWpzQQTooBZCawYuuYREldkQdfoNHDEoxYhf2B/6A==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 10:23:24 +0200
Message-Id: <DJ4DGYZ3GQZH.3AZOC0Z69W92S@bootlin.com>
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
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-30-45e2bdb3dfb4@bootlin.com>
 <20260608-shapeless-opal-ferret-c8b105@houat>
In-Reply-To: <20260608-shapeless-opal-ferret-c8b105@houat>
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime,

thanks for the review of this long series!

On Mon Jun 8, 2026 at 2:34 PM CEST, Maxime Ripard wrote:
...
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -78,6 +78,19 @@ struct drm_bridge_funcs {
>>  	int (*attach)(struct drm_bridge *bridge, struct drm_encoder *encoder,
>>  		      enum drm_bridge_attach_flags flags);
>>
>> +	/**
>> +	 * @is_tail:
>> +	 *
>> +	 * Returns true if this is a tail bridge, i.e. it does not need a
>> +	 * next bridge to work. E.g. a panel_bridge is a tail bridge, a
>> +	 * DSI-to-LVDS bridge is not a tail bridge (no matter whether the
>> +	 * next bridge is present or not).
>
> Why a DSI-to-LDVS bridge isn't a tail bridge? It only needs a panel
> next, right?

Uhm, good point, but I'd say it can be a tail bridge or not: in the
ATTACH_NO_CONNECTOR case it will need a bridge (a panel_bridge most
likely), no?

However this is possibly irrelevant as the whole .is_tail is meant to
disappear in v2, see below.

>> +	 * The @is_tail callback is optional but it is required if the
>> +	 * bridge is part of a pipeline with hot-pluggable components.
>> +	 */
>> +	bool (*is_tail)(struct drm_bridge *bridge);
>> +
>
> I don't think that's the right way to think about it, if only because
> you never really know at the driver level if you're supposed to be last
> or not. A DSI-to-LVDS bridge might just as well be chained with an
> LVDS-to-eDP bridge, or feed the panel directly without any additional
> bridge.
>
> I *think* that what you're trying to find out here is whether the chain
> is complete or not.

You nailed it.

That was the main point discussed during the Display Next Hackfest 2026
(see the report [0]) and we all agreed the .is_tail along with the
-EPROBE_DEFER changes (patches 20+35) are not a good approach.

This is actually the most crucial aspect of the whole work still not having
no well-defined solution.

> I think you can get the same information by checking
> whether you have a connector for that bridge chain. If you don't, you
> know the chain isn't complete, and if you do, it's supposed to be.

There's a checken-egg problem here. Knowing whether the pipeline is
complete or not is needed to know whether we have to create a
connector. See patch 36:

  +  if (drm_bridge_connector_pipeline_is_complete(bridge_connector))
  +          drm_bridge_connector_add_connector(bridge_connector);

So the question is still open, what I need the most right now is comments
on the overall architecture of this aspecs. Maybe replying to [0] can be
more effective than here.

In a nutshell what we need is:

 * when a bridge needs a following element (a bridge, or a panel which
   however might/should have a panel_bridge), but that element is not
   present, instead of deferring the whole card probe the card should be
   allowed to probe but without a connector

 * when something is added to an incomplete pipeline we need to know
   whether the pipeline has become complete (in order to create the
   connector)

How to implement this is still an open point. I'll welcome proposals in
addition to the ones in [0].

[0] https://lore.kernel.org/all/DIXTUCXAU68V.1T7X89LMEUF2F@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

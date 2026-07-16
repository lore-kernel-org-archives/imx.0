Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC6A3B9DA1
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191061; cv=none; b=c9AUT06Sk1lwDTuPqJmhcOyj5PMGR3N0CNTDw8/cM3gLHAdsrlMY3FDtTqf32LHJNiMvQWWnUCbz0UiyDmPjnt537oq3H99Cnl6XeMb4OD1r2yQwSU9UIBxCKhmsv3fgdgsgbaO2j4dlcTu2odrUlWRQm0Ghu6wJPJvaADwbCWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191061; c=relaxed/simple;
	bh=4y8LR69pmPuVbvz7+BCR9cYoNgSmoLCf2lnSjseoRFU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=k3v8mvaMREnGIH9JyKY31SJ3NWUxiy5DB1CvFhgjF/po91uk38pDthrGSSofbxq5EDY2oSscrUtfj/QrB+g3umxjLu0bA3xwAPkrMtMwWEG5iBlX9f2nyYm1m8ThuobrNrM7jqvZDdduwQ1XH4xqbNliAuI8sC204ZNDLb261S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=umlSJpL4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="umlSJpL4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3500E4E40E02;
	Thu, 16 Jul 2026 08:37:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04800602B8;
	Thu, 16 Jul 2026 08:37:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2A5311BD39FC;
	Thu, 16 Jul 2026 10:37:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784191055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=51Grhzs4J/AFDPyUowVuD4CPAJKfF+m68stnN1IxSsQ=;
	b=umlSJpL4AIbsgAirTydRVbGpf5107Ii+GVjOI8QitEF2dkyJuaiECJesJxtJG20O7h1k47
	AZzwstqTauowTH+yizoGHwCmb3eBPK+0U7ld637Jw+ewzd9sdJllgbj6qcSqnCqbS2s4Lz
	e6eW6TvGnxPbW+kxe8J8Ic72akzbbqhgxWdgMSydSDeWWharfscuamENZrXsXX89bL02Xy
	I6bWtB2YJ158MZfbdVGtg5bpVY09ySZeqEJoeVj30xpJ8+xR2qhD8qd0xENz0DUVo/pSf3
	o4bIEOLmEFGmqTin47ONTWv74aSUZ4IrDqIU5H83+MwBQaNyDu19idYFAYk7pw==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 10:37:24 +0200
Message-Id: <DJZUXUBO8DI4.2J2NI3S0KYNUE@bootlin.com>
Subject: Re: [PATCH 05/37] drm/display: bridge-connector: split code
 creating the connector to a subfunction
Cc: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>, "Stefan Agner"
 <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Maxime Ripard"
 <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-5-45e2bdb3dfb4@bootlin.com>
 <20260608-mindful-heavy-frigatebird-be9faf@houat>
 <DJ735MTNMYD1.3LPNV404V8PIU@bootlin.com>
 <20260624-proud-unbiased-pony-ecc3c3@houat>
 <DJHEAWSEZR79.19UFIKS8QJBQ7@bootlin.com>
 <20260626-polite-hairy-perch-25e1aa@houat>
 <DJJ1MPCEJGZD.UZM9183V6ZE5@bootlin.com>
 <20260626-classy-nightingale-of-romance-1cacad@houat>
 <DJJ4X22CJ3FG.5EYF84LVRNOG@bootlin.com>
 <20260707-warping-goshawk-of-swiftness-beea4a@penduick>
 <20260707123205.GB211515@killaraus.ideasonboard.com>
In-Reply-To: <20260707123205.GB211515@killaraus.ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime, Laurent,

On Tue Jul 7, 2026 at 2:32 PM CEST, Laurent Pinchart wrote:
> On Tue, Jul 07, 2026 at 11:55:54AM +0200, Maxime Ripard wrote:
>> On Fri, Jun 26, 2026 at 06:51:14PM +0200, Luca Ceresoli wrote:
>> > On Fri Jun 26, 2026 at 4:38 PM CEST, Maxime Ripard wrote:
>> > > On Fri, Jun 26, 2026 at 04:16:39PM +0200, Luca Ceresoli wrote:
>> > >> On Fri Jun 26, 2026 at 12:09 PM CEST, Maxime Ripard wrote:
>> > >> > On Wed, Jun 24, 2026 at 05:47:10PM +0200, Luca Ceresoli wrote:
>> > >> >> On Wed Jun 24, 2026 at 1:41 PM CEST, Maxime Ripard wrote:
>> > >> >> > Hi,x
>> > >> >> >
>> > >> >> > On Fri, Jun 12, 2026 at 02:56:24PM +0200, Luca Ceresoli wrote:
>> > >> >> >> On Mon Jun 8, 2026 at 1:40 PM CEST, Maxime Ripard wrote:
>> > >> >> >> > On Tue, May 19, 2026 at 12:37:22PM +0200, Luca Ceresoli wro=
te:
>> > >> >> >> >> In preparation to introduce bridge hotplug, split out from
>> > >> >> >> >> drm_bridge_connector_init() the code adding the drm_connec=
tor into a
>> > >> >> >> >> dedicated function. This will be needed to be able to add =
(and re-add) the
>> > >> >> >> >> connector from different code paths.
>> > >> >> >> >
>> > >> >> >> > Same story here, explaining what you need later on that cal=
ls for that
>> > >> >> >> > change would be nice.
>> > >> >> >>
>> > >> >> >> Here's a more verbose version:
>> > >> >> >>
>> > >> >> >>     Currently drm_bridge_connector_init() does two things:
>> > >> >> >>
>> > >> >> >>      * allocate and initialize the drm_bridge_connector
>> > >> >> >>        (which embeds a drm_connector)
>> > >> >> >>      * initialize and register the embedded drm_connector
>> > >> >> >>
>> > >> >> >>     For bridge hotplug we need to separate these two actions:
>> > >> >> >>
>> > >> >> >>      * the drm_connector needs to be added and removed at any=
 time based on
>> > >> >> >>        hotplug events
>> > >> >> >>      * the drm_bridge_connector is designated to create and r=
emove the
>> > >> >> >>        drm_connector, so it must be persistent for the card l=
ifetime
>> > >> >> >>
>> > >> >> >>     As the lifetimes of drm_bridge_connector and drm_connecto=
r become
>> > >> >> >>     different, we need to create them in different moments.
>> > >> >> >>
>> > >> >> >>     In preparation to support that, split out from
>> > >> >> >>     drm_bridge_connector_init() the code adding the drm_conne=
ctor into a
>> > >> >> >>     dedicated function. No functional changes, just moving co=
de around for
>> > >> >> >>     now. A future commit will make the drm_connector be creat=
ed based on
>> > >> >> >>     hotplug events.
>> > >> >> >>
>> > >> >> >> Looks good?
>> > >> >> >
>> > >> >> > The message itself, yes, thanks.
>> > >> >> >
>> > >> >> > However, I have questions now :)
>> > >> >> >
>> > >> >> > Do we really expect drm_bridge_connector to stick around when =
a bridge
>> > >> >> > gets unplugged? If so, how does it cope with having, say, an H=
DMI
>> > >> >> > connector, and then swapping out the hotplugged part for an LV=
DS one?
>> > >> >> > Does the HDMI connector sticks around indefinitely?
>> > >> >>
>> > >> >> In your example, the HDMI drm_connector would be unregistered an=
d put on
>> > >> >> hotunplug. Its allocation will stick around until the last put b=
ut that's
>> > >> >> quite irrelevant. Then, on plugging the LVDS addon, a new LVDS
>> > >> >> drm_connector will be created and registered.
>> > >> >>
>> > >> >> > *Especially* if we're using overlays for this, I'd expect ever=
ything
>> > >> >> >  after the first hotplugged bridge to be destroyed, no?
>> > >> >>
>> > >> >> As said, it would be unregistered immediately but might be freed=
 later on
>> > >> >> if still refcounted.
>> > >> >>
>> > >> >> This is visible in patches 36+15, the path to follow is:
>> > >> >>
>> > >> >>  drm_bridge_connector_handle_event(event =3D DRM_BRIDGE_DETACHED=
) [patch 36]
>> > >> >>  -> drm_bridge_connector_dynconn_release()                      =
[patch 15]
>> > >> >>
>> > >> >> Does this solve your concern?
>> > >> >
>> > >> > Not really, I'm talking about drm_bridge_connector. The fact that
>> > >> > bridges are destroyed make sense to me. The fact that
>> > >> > drm_bridge_connector sticks around doesn't. It's supposed to be a
>> > >> > connector for bridges. If you don't have bridges because they got
>> > >> > destroyed, and connector, drm_bridge_connector doesn't have a rea=
son to
>> > >> > exist anymore, unless it's drm_bridge_hotplug in a trench coat :)
>> > >>
>> > >> It is not a hotplug-bridge in a trench coat, no :) The code is clea=
r about
>> > >> this.
>> > >>
>> > >> I'd say with this series a "drm_bridge_connector" is just becoming
>> > >> something more (perhaps something else too). Somewhat as "a drm_bri=
dge is
>> > >> either a bridge or something else". :)
>> > >>
>> > >>
>> > >> But let's leave names aside for a moment. If just looking at the cu=
rrent
>> > >> code, the drm_bridge_connector is "a handler, owned by the card/enc=
oder and
>> > >> having the same lifetime, which takes care of drm_connector
>> > >> creation/destruction at card probe/removal".
>> > >>
>> > >> What we need now is just the same plug " and on hotplug events" app=
ended.
>> > >>
>> > >> So in both cases there needs to be "a handler persitent with the ca=
rd".
>> > >>
>> > >> Do we agree so far?
>> > >
>> > > Ish. If we go for that, then we need to update the name.
>> >
>> > drm_connector_manager?
>> > drm_bridge_connector_manager?
>> >
>> > > drm_bridge_connector for something that is neither a bridge or a
>> > > connector is not great.
>> > >
>> > > But even then, I'm not even sure why we need to have that "manager" =
in
>> > > the first place. You want to make bridges be aware if they are the l=
ast
>> > > in the chain or not. Use that property in attach to either create a
>> > > drm_bridge_connector instance if you're last, or attach the next bri=
dge
>> > > if you aren't.
>> >
>> > What? o_O
>> >
>> > Several encoder drivers have been painfully converted to create a
>> > drm_bridge_connector.
>>
>> I mean, it was done at a time where bridge hotplug wasn't a thing and
>> the assumption was that the bridge chain is static. You're now breaking
>> that assumption, it shouldn't come as a surprise that it might break
>> other things.

Sure adding a new requirement (hotplug) breaks the existing design. Still,
this can be solved either by adding a new software component or by
extending the existing software component (drm_bridge_connector) as this
series proposes. None of the two ideas is wrong, so let's discuss which is
best.

>> And I know that you have experienced it already, which makes your
>> reaction even more surprising to me :)

Sure, the drm_bridge allocation was not refcounted and needed to be. And we
didn't ditch the drm_bridge to create a new thing, we instead extended the
existing software component (drm_bridge) to also be refcounted.

>> > Now if the bridges start doing it themselves we should go back to
>> > those encoder drivers and ditch all the drm_bridge_connector from
>> > there?
>> >
>> > I must be missing something. Can you elaborate on this?
>>
>> drm_bridge_connectors bring together a (complete) bridge chain and a
>> connector. If you don't have either anymore, then we shouldn't keep it
>> around.
>>
>> What I was suggesting before was only a suggestion. I guess we could
>> also make the encoder own the hotplug handling code and create the
>> drm_bridge_connector when the chain is complete, and remove it when it's
>> no longer the case.
>
> That's an interesting option. We don't have to keep drm_bridge_connector
> in its current form, but I don't think we should go back to individual
> bridge driver creating connectors, especially now that we have bridge
> chains where the connector ops are implemented collectively by multiple
> bridges.

I definitely agree we don't want to add burden back on the encoder.

>> We can discuss alternatives too. But either way, we shouldn't have it
>> stick around.

Bottom line, I roughly see three ideas mentioned:

 1. (this series) extend the drm_bridge_connector to create the
    drm_connector based on bridge hotplug events [+rename it]
 2. - keep the drm_bridge_connector (mostly) as is
    - let each encoder driver add/remove it based on bridge hotplug events
    =3D> more burden on encoder drivers -> no
 3. - keep the drm_bridge_connector (mostly) as is
    - add a new component (what name?) that will receive bridge hotplug
      events and react to them by adding/creating a drm_bridge_connector
    - modify encoder drivers to create this new object instead of the
      drm_bridge_connector

In principle option 3 is the same as option 1, except it is split in two
components.

I _think_ you both are discussing option 3. Correct?

If that's correct: any name suggested for the new component?
drm_hotplug_manager? drm_connector_manager? drm_bridge_connector_manager?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

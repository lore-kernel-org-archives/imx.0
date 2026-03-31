Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794463DCD93
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973096; cv=none; b=CR0agXFpfRoytTzSi+57u+uvUoGe1t2IA+dfQpsQXG+lpD8xNSO5asnDNSpUTQ/qTuaJQbt8oHe7XoUz+JGkXeZOQy96I4XBRdfhNwng0QeIAAY3b8UjmrehiNAWI8rDxbGDbKl6/JSuDSjFbLR9QW4dIAbCFFkUMruab7Bg5u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973096; c=relaxed/simple;
	bh=dAd1WB+xI91F88CwqUSYddH1MQfSyW11jxpWraO3wLo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jkFuP0cKiO3uf+lyPWxzhobr9VpLDPmTuVUPVVpYSPcqwBw2smoDRIQ/5N/Udo/OKA8JKw8IKriGh2NzP/+7pF8O/Oaz7IaF9+z03FpxuytsL98RZIj8TWg7QYxlaayRh2xBmeN2iMpn+8+WUkbThRniM8g8P8esFBp+GQlW+jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1w7baE-0005BL-TH; Tue, 31 Mar 2026 18:04:50 +0200
Message-ID: <3b221a4997c367df716bf107a7e98ce10cd6860b.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] drm: lcdif: Use dedicated set/clr registers for
 polarity/edge
From: Lucas Stach <l.stach@pengutronix.de>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Marek
 Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof =?UTF-8?Q?Ha=C5=82asa?=
 <khalasa@piap.pl>, Marco Felsch <m.felsch@pengutronix.de>, Liu Ying
 <victor.liu@nxp.com>
Date: Tue, 31 Mar 2026 18:04:48 +0200
In-Reply-To: <acvllbRTHyVFTgmS@collins>
References: <20260330224619.2620782-1-paulk@sys-base.io>
	 <20260330224619.2620782-3-paulk@sys-base.io>
	 <f5b628f50def756da356184ff6febb11cc9aaa68.camel@pengutronix.de>
	 <acvllbRTHyVFTgmS@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Am Dienstag, dem 31.03.2026 um 17:17 +0200 schrieb Paul Kocialkowski:
> Hi Lucas,
>=20
> Le Tue 31 Mar 26, 11:09, Lucas Stach a =C3=A9crit :
> > Hi Paul,
> >=20
> > Am Dienstag, dem 31.03.2026 um 00:46 +0200 schrieb Paul Kocialkowski:
> > > The lcdif v3 hardware comes with dedicated registers to set and clear
> > > polarity bits in the CTRL register. It is unclear if there is a
> > > difference with writing to the CTRL register directly.
> > >=20
> > > Follow the NXP BSP reference by using these registers, in case there =
is
> > > a subtle difference caused by using them.
> > >=20
> > I don't really like that patch, as it blows up what is currently a
> > single register access to three separate ones. If there is no clear
> > benefit (as in it has been shown to fix any issue), I would prefer this
> > code to stay as-is.
>=20
> Well I guess the cost of a few writes vs a single one is rather
> negligible.
>=20
Yea, a few writes don't really hurt. But I don't think there is a very
good reason to set this register this way, see below.

> I'm rather worried that there might be an undocumented
> reason why these registers exist in the first place and why they are
> used in the BSP.
>=20
> But yes this is only speculation and I could not witness any actual
> issue. My setup (lcdif3 with hdmi) uses all positive polarities which is
> the default state, so not a good way to check.
>=20
> It would be great if somebody from NXP could confirm whether this is
> needed or not. In the meantime I guess we can drop the patch. It'll stay
> on the list in case someone has polarity issues later :)

The separate clr/set registers are a rather common design feat found on
Freescale/NXP IP blocks from the MXS era. On some of those IP blocks
_all_ registers are presented as a base/clr/set triplet in the
registers space. As far as I can tell they are mostly useful when you
want to set/clear individual bits from a register without having to
remember or executing a readback of the current state.

In cases like the one changed in this patch, where the full register
state is set in one go, directly writing to the base register is the
right thing to do.

Regards,
Lucas

Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6921D259C8D
	for <imx@lists.linux.dev>; Tue, 25 Mar 2025 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742911996; cv=none; b=RnMSrNTqbDzhup5hzoOyHJ7bhzix0bwCGTVFzX6zwDpimsEjDjk1cGssH6805M9W0tXBMLvVNlIfUBUNXSDQjvMV2rvZeLVdTXux4ULONT6WXcqp5wENlI1DO3i1IAEuExh2MPBpsq3vPYQs/xiTDLv8u29UEEkgJLbNExlwjPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742911996; c=relaxed/simple;
	bh=3ibx6d4yM2MoiN1t0RPNZFrXus11zZWaJYS8q+8eFhw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DZDy7r+YGTVtYZGnOl93Gn4qGMk9/aMZCFVk4+vH7vngtyVuiSwAgz+CeWnknM3+C7oQqFEq6JJZrXp1KBPY+etXRZ98wc1ETr/NxypPjOb2H/vDHbJdbVfxmHDkyCZb8DpPX+ZVmrUzI5d9VkL97bif7jyCUycv9ndeM0h5pfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tx51E-0007AK-RG; Tue, 25 Mar 2025 15:12:40 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tx51D-001avt-0e;
	Tue, 25 Mar 2025 15:12:39 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tx51D-0008wN-1h;
	Tue, 25 Mar 2025 15:12:39 +0100
Message-ID: <13376dff8d861389464b7ecdb2f82fe211638500.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley
 <conor+dt@kernel.org>,  David Airlie <airlied@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring
 <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel
 <sre@kernel.org>,  Shawn Guo <shawnguo@kernel.org>, Simona Vetter
 <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,  Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  imx@lists.linux.dev
Date: Tue, 25 Mar 2025 15:12:39 +0100
In-Reply-To: <22187ae5-7486-416b-b612-53021bfca11e@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
	 <20250321200625.132494-5-marex@denx.de>
	 <20250324094333.7afb17a1@collabora.com>
	 <22187ae5-7486-416b-b612-53021bfca11e@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Mo, 2025-03-24 at 20:05 +0100, Marek Vasut wrote:
> On 3/24/25 9:43 AM, Boris Brezillon wrote:
>=20
> [...]
>=20
> > > @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
> > >  =20
> > >   	panthor_devfreq_suspend(ptdev);
> > >  =20
> > > +	reset_control_assert(ptdev->resets);
> >=20
> > Hm, that might be the cause of the fast reset issue (which is a fast
> > resume more than a fast reset BTW): if you re-assert the reset line on
> > runtime suspend, I guess this causes a full GPU reset, and the MCU ends
> > up in a state where it needs a slow reset (all data sections reset to
> > their initial state). Can you try to move the reset_control_[de]assert
> > to the unplug/init functions?
> The reset on the MX95 is not really a reset, it is clear-only=20
> set-never-again bit which goes only one way, the "unreset" way, so I=20
> don't think this has any impact.

This sounds like the bit is initially set to 1 (reset asserted) and can
be cleared by writing 0 (once, to deassert the reset). But in the
reset-simple patch it looks to be the other way around (active_low =3D
true)?

If the reset control can't be asserted again on this hardware, it would
be better to have custom driver that doesn't implement the .assert()
callback at all.

regards
Philipp

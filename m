Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C66825F78E
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 10:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738853; cv=none; b=QXlc0IV1CfzEWHfxGIMeHUk17D9nkrWqaDJiPw6IpKuyYEgN+yuYrJYP2BYLEhN2K6BHY7LYA3v0JbZvlswYAsM1a4WoXvzoyVCBYXXTemgI83fMvxQ92LGljJ2Cq1vJezdYBf1nq33v79hX9tpYqNSK7UhZNkn/FqOhsL5Zzg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738853; c=relaxed/simple;
	bh=hnPptsT5gj49gGy5mQ72uEfh7eF/V0FdGBkSA2qdLUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFz7U3lbUIkBkqMlDwHzJz5KWQfdDAo+D/rC6hTQ3hnrVukwapVrPsBxXiE/lU1etY1j/iTcy4HO+t2pQm6A7nEsr++zU6kRxWTKHPw8Noge+hbXWlCZxdRtr+0yuuvMgJ2lor/6r5SSOtYjo9qA4lIzMKvxWgaQowm/0jOj4wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnxgt-0002as-BF; Fri, 28 Feb 2025 11:33:59 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnxgs-003HHx-1G;
	Fri, 28 Feb 2025 11:33:58 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnxgs-005Gvf-0k;
	Fri, 28 Feb 2025 11:33:58 +0100
Date: Fri, 28 Feb 2025 11:33:58 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
	Sebastian Reichel <sre@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Steven Price <steven.price@arm.com>, imx@lists.linux.dev,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
Message-ID: <20250228103358.tbcqyrtzzsgacxbm@pengutronix.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de>
 <20250227201709.2diz57xv2tntw36q@pengutronix.de>
 <8bc7e55d-7a8d-436b-ad6f-f7cb8caa28a0@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bc7e55d-7a8d-436b-ad6f-f7cb8caa28a0@denx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 25-02-27, Marek Vasut wrote:
> On 2/27/25 9:17 PM, Marco Felsch wrote:
> 
> [...]
> 
> > > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > > index 06fe46e320738..2504a456d45c4 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > > @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
> > >   ATTRIBUTE_GROUPS(panthor);
> > >   static const struct of_device_id dt_match[] = {
> > > +	{ .compatible = "fsl,imx95-mali" },	/* G310 */
> > 			  ^
> > 			 nxp?
> > 
> > Can we switch to nxp instead?
> We can ... is that the current recommendation ?
> 
> Why not stick with fsl , is that deprecated now ?

Nope I don't think so but I do see patches adding 'nxp' as vendor
(mostly external chips) and some with 'fsl' (mostly soc internal ip
cores).

My hope was that at some point we could switch to 'nxp' only and make
use of this vendor-prefix. Of course NXP should start with that switch
but this seems not to happen :/

It's more a nit but maybe this triggers NXP to make use of the 'nxp'
vendor-prefix as well once they upstream a new base dtsi.

Regards,
  Marco

Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C5B285C9F
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039151; cv=none; b=d/CniZno/XTp+Xxw1p2UHjF9dDHBBQ2Dii+bajr7hkocmWqaTFId23wjjdzu76VsqHfmv+8SE+YuhY5ObaSc2vO3c/Jn4Lnh6x6vDHFToN3YFrspYGJzTSNOTM7MfnoNrf+4Ob8wqBSk5VNSAsBSG61mpBLmHb2xgf2zJbq2hsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039151; c=relaxed/simple;
	bh=BS+8jvv2hnhJcsZQrv6FY3QrasBPQnLs1PnQ9kutfQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYPOyzTZs+mvWijmq6T/TGIvf5x4Qi5k1R1f8ZJp9a3/LPpczZMnyL/mVu3V3aox6D64r8k/cLsTovAX6lDElnUhEUSOfCI5JltGZ+Q8B0LcPO2MKkMrP0a7CjcI5jiVmLFsAZLArlVLCfSHnwR+1llEDsPHYbmBwUVrzapkDLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vvIKL-00010T-QT; Wed, 25 Feb 2026 18:05:33 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vvIKK-002avE-0S;
	Wed, 25 Feb 2026 18:05:33 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vvIKL-00000004yoK-1Zi3;
	Wed, 25 Feb 2026 18:05:33 +0100
Date: Wed, 25 Feb 2026 18:05:33 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] i.MX SDMA cleanups and fixes
Message-ID: <4srixmuzaay4tetvlgribjtri5rm7akycy545vrg3d62ifmjsg@iflrkv65u3k5>
References: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
 <aZ8cVP7E-BOEJKFu@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ8cVP7E-BOEJKFu@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 26-02-25, Frank Li wrote:
> On Thu, Sep 11, 2025 at 11:56:41PM +0200, Marco Felsch wrote:
> > Hi,
> >
> > by this series the i.MX SDMA handling for i.MX8M devices is fixed. This
> > is required because these SoCs do have multiple SPBA busses.
> >
> > Furthermore this series does some cleanups to prepare the driver for the
> > upcoming DMA devlink support. The DMA devlink support is required to fix
> > the consumer <-> provider issue because the current i.MX SDMA driver
> > doesn't honor current active DMA users once the i.MX SDMA driver is
> > getting removed. Which can lead into very situations e.g. hang the whole
> > system.
> 
> Marco Felsch:
> 
> 	Can you help rebase these patches?

Sure, will do.

Regards,
  Marco


> 
> Frank
> 
> >
> > Regards,
> >   Marco
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > Changes in v2:
> > - Link to v1: https://lore.kernel.org/r/20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de
> > - Split DMA devlink support and SDMA driver fixes&cleanups into two series
> > - Make of_dma_controller_free() fix backportable
> > - Update struct sdma_channel documentation
> > - Shuffle patches to have fixes patches at the very start of the series
> > - Fix commit message wording
> > - Check return value of devm_add_action_or_reset()
> >
> > ---
> > Marco Felsch (10):
> >       dmaengine: imx-sdma: fix missing of_dma_controller_free()
> >       dmaengine: imx-sdma: fix spba-bus handling for i.MX8M
> >       dmaengine: imx-sdma: drop legacy device_node np check
> >       dmaengine: imx-sdma: sdma_remove minor cleanups
> >       dmaengine: imx-sdma: cosmetic cleanup
> >       dmaengine: imx-sdma: make use of devm_kzalloc for script_addrs
> >       dmaengine: imx-sdma: make use of devm_clk_get_prepared()
> >       dmaengine: imx-sdma: make use of devm_add_action_or_reset to unregiser the dma_device
> >       dmaengine: imx-sdma: make use of devm_add_action_or_reset to unregiser the dma-controller
> >       dmaengine: imx-sdma: make use of dev_err_probe()
> >
> >  drivers/dma/imx-sdma.c | 181 ++++++++++++++++++++++++++-----------------------
> >  1 file changed, 96 insertions(+), 85 deletions(-)
> > ---
> > base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> > change-id: 20250903-v6-16-topic-sdma-4c8fd3bb0738
> >
> > Best regards,
> > --
> > Marco Felsch <m.felsch@pengutronix.de>
> >
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

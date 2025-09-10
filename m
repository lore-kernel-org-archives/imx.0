Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01808311C32
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497521; cv=none; b=RbHTNeTd41c3+/+Gxlt6taRV1czzTdkGo9UpPNff2b2rj0M9yPcuyv+cbGmCGo5ypCQDWkqywS6jVG998klmgCgWTqpRoNHvjptYZinlxIq+HkYFCuuyS3p+UqB8FOZjopKO0wLMSToMb1ZdIORwqM8HGGeuwSQNkhZmPPRuPr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497521; c=relaxed/simple;
	bh=3zQu35m1C6YPImywyjnt2q1c7Rr8khcAX2jfPUML1h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsgItSJe79rgGUFNuTgxPK0/D1TN5eXq6DNIrelOcvf/Ma9MNJESCh9oC/7yzDge0tPzb22L0A98e13K9V5JPe/lWtRHNz85o+tUl9bkw3Mpyxu6D7wCYdscUnoBrk/2elcx9BO7oETPzYRykOyAJ42QhoKgcjndXLb8tL5vG1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwHO6-0000Ts-30; Wed, 10 Sep 2025 11:45:14 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwHO5-000ZMU-2h;
	Wed, 10 Sep 2025 11:45:13 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwHO5-00GDN2-2E;
	Wed, 10 Sep 2025 11:45:13 +0200
Date: Wed, 10 Sep 2025 11:45:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] dmaengine: imx-sdma: fix missing
 of_dma_controller_free()
Message-ID: <20250910094513.eawc5n6zbddtg5c5@pengutronix.de>
References: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
 <20250903-v6-16-topic-sdma-v1-8-ac7bab629e8b@pengutronix.de>
 <aLhZ2zfh5bnNoH8X@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLhZ2zfh5bnNoH8X@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 25-09-03, Frank Li wrote:
> On Wed, Sep 03, 2025 at 03:06:16PM +0200, Marco Felsch wrote:
> > Add the missing of_dma_controller_free() to free the resources allocated
> > via of_dma_controller_register(). The missing free was introduced long
> > time ago  by commit 23e118113782 ("dma: imx-sdma: use
> > module_platform_driver for SDMA driver") while adding a proper .remove()
> > implementation.
> >
> > Fixes: 23e118113782 ("dma: imx-sdma: use module_platform_driver for SDMA driver")
> 
> Look it is hard to back port to old kernel.  Can move it to before cleanup?

I know that fixing commits should come first but this commit dates back
to v3.18-rc1, therefore I thought that backporting this commit would
cause more troubles than it's worth it.

Anyway, after checking the current LTS and stable kernels I think that
the commit could be backported without troubles because the APIs used
do exist on all these kernels.

Regards,
  Marco

> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/dma/imx-sdma.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > index e30dd46cf6522ee2aa4d3aca9868a01afbd29615..6c6d38b202dd2deffc36b1bd27bc7c60de3d7403 100644
> > --- a/drivers/dma/imx-sdma.c
> > +++ b/drivers/dma/imx-sdma.c
> > @@ -2232,6 +2232,13 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
> >  				     ofdma->of_node);
> >  }
> >
> > +static void sdma_dma_of_dma_controller_unregister_action(void *data)
> > +{
> > +	struct sdma_engine *sdma = data;
> > +
> > +	of_dma_controller_free(sdma->dev->of_node);
> > +}
> > +
> >  static void sdma_dma_device_unregister_action(void *data)
> >  {
> >  	struct sdma_engine *sdma = data;
> > @@ -2370,6 +2377,8 @@ static int sdma_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "failed to register controller\n");
> >
> > +	devm_add_action_or_reset(dev, sdma_dma_of_dma_controller_unregister_action, sdma);
> > +
> >  	spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
> >  	ret = of_address_to_resource(spba_bus, 0, &spba_res);
> >  	if (!ret) {
> >
> > --
> > 2.47.2
> >
> 

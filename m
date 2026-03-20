Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198135CBC4
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773993867; cv=none; b=oSaZuoBGL/p6xXD3LBTS8QmW7abRyLpMgf0Wq2VYpn8kDXUpQhFOtvXVD44ToaQhMOet4PeDdCgXI5ZO/uhfC+vWXHvdCO7/IkgKWtT1rA8EK0WUiZL9dmaZiFFMQsvXYk2Bfl/GEMid1VSKkujsCZY4/PdLgf5/O17FPxfpwf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773993867; c=relaxed/simple;
	bh=LaRIfHouqlPpqA2mhA+qymNcFCUw3ShVW93q+lSbLPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEsbzWcjHWZaxBXwnir4Q0ZQmKltpXom5RMAYaT/otJenfojjNYY8W/fky8CUwUwjG1livU65fqXMiB2pOf3VzK4tuMYzf6DQp3tyfFS77RI+dXRB6OzGpP3Cv2zrGpCDi4DOeyyWHGhbbhwnRepJtuxvAm0mO6NI8T0r2NrB9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1w3UqB-0007ax-Uy; Fri, 20 Mar 2026 09:04:19 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1w3Uq9-001Csl-2L;
	Fri, 20 Mar 2026 09:04:17 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1w3Uq9-0000000Cpgb-2SMG;
	Fri, 20 Mar 2026 09:04:17 +0100
Date: Fri, 20 Mar 2026 09:04:17 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marex@nabladev.com>
Cc: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, 
	Stefan Agner <stefan@agner.ch>, Liu Ying <victor.liu@nxp.com>, Simona Vetter <simona@ffwll.ch>, 
	imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX8MP: Fix HDMI LCDIF FIFO underruns
Message-ID: <m36pvjbo4xy2rtdymshjpmwu7icl3wlyiwcmmjaozo7jpe5lqk@zt7byx7iwmym>
References: <m3ms04caaj.fsf@t19.piap.pl>
 <32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 26-03-20, Marek Vasut wrote:
> On 3/19/26 12:45 PM, Krzysztof Hałasa wrote:
> > Running (and terminating) Weston on i.MX8MP sometimes produced black
> > or grey screens. The LCDIF3 INT_STATUS_D0 register showed a FIFO underrun:
> > 
> > 32FC6024: 1000002
> > 
> > The PANIC0_THRES register was set to:
> > 
> > 32FC6238:  AA0154
> > 
> > which apparently meant low = 2736 bytes (0xAA * 16 + 16), high = 5456 bytes
> > (0x154 * 16 + 16).
> > 
> > With this patch (based on NXP's driver) the watermarks are only 16 bytes
> > higher (register values increased by 1) and the underruns are gone.
> > 
> > Tested on Solidrun Hummingboard Mate with a 1080p60 HDMI display.
> > 
> > Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> > 
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -353,8 +353,8 @@ static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
> >   	u32 reg;
> >   	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
> > -	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_MAX / 3) |
> > -	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_MAX / 3),
> > +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, DIV_ROUND_UP(1 * PANIC0_THRES_MAX, 3)) |
> > +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, DIV_ROUND_UP(2 * PANIC0_THRES_MAX, 3)),
> 
> I am starting to wonder, whether this should be configurable in DT, because
> it seems there might be users that need to tweak the watermarks one way or
> the other for different video outputs ?

+1 to provide a override mechanism via DT.

Regards,
  Marco

> 
> +CC Liu
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

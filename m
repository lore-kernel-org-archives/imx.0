Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED8E1DA313
	for <imx@lists.linux.dev>; Sun, 17 Nov 2024 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731881334; cv=none; b=gB34ULKvMOIXHYu44mDSxXyHCqY+zoCMvKzK6RV6oe72Rza2kh4KQAs9O/R1uZ8Pl9iYNWSaNYnS5znMm8Oxrfx9JpAYTd/tLX11khCgpRL1gYrs+zw+y5JKBDwfTNtE70Ym/bWGsvSaD10Xl3ZMfd7npmKQv85rwG1J1GvtNco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731881334; c=relaxed/simple;
	bh=yJoEY8Dhl24L2RKgI/GDHFbZxhRjEaxJSRk78zfDT8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPzUrWX9NUvvDCYEW+/fgMMmowyREYl5Ek5UdakCnpC7FrUvsbEorXad2UOIl+975fEAk5KGlnke3VrgomusXF3JXffM3seczZ83/58SuZxJx5whE5+wSKzB69EvUsZ7esdpw4ZC+BJFjlD7aFWoldfGdgpriY4qkuLPnAyFsBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NkupL3KA; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NkupL3KA"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61C51240004;
	Sun, 17 Nov 2024 22:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731881323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGJ5GG2606gKy4mBZVJZhX7DW4jyjCrmU4DyUUU3wEY=;
	b=NkupL3KAugLscihNPgBOM7JboMZzNMYVcNHt8vUxOlvzyq7QIeUvHwpev+UjSiRSijOhd+
	xxmNw0SkhozDT8nCvLqyovCW5f+H9DH52socU93jzQEe5xiizY1pprQCtr1BQyqElWR/qQ
	QoCkaBvnekiv95me9dQSEoQJP8MineUD3VELYERi+vNgaxyIaPMvuqvcTXpm/0cphDcec/
	OTaHb21gi13tNOndKO5ZiT5Wbr9YrlHt4wH6n1t2zAe6Gg7UzwGixurkzX5lkTIXNy/CPn
	nTs5kSJxGYsfkev4lfpC3XzbA2YzaJqMqIIcPX3q1zKpX3QnL1X9L0Yb+VT9ow==
Date: Sun, 17 Nov 2024 23:08:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] rtc: bbnsm: Enable RTC by default to fix time read
 failure
Message-ID: <2024111722084384333dcf@mail.local>
References: <20241115194858.3837298-1-Frank.Li@nxp.com>
 <20241116193652a13b3081@mail.local>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241116193652a13b3081@mail.local>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 16/11/2024 20:36:54+0100, Alexandre Belloni wrote:
> On 15/11/2024 14:48:58-0500, Frank Li wrote:
> > From: Jacky Bai <ping.bai@nxp.com>
> > 
> > Enable the RTC by default even when no valid time is set to ensure the
> > RTC's time read and alarm functions work properly. Without this, running
> > hwclock results in the following error:
> > 
> > hwclock: ioctl(RTC_RD_TIME) to /dev/rtc0 to read the time failed: Invalid argument
> > 
> 
> 
> What is providing your hwclock and which version does it have?


This is a bug in util-linux that needs to be fixed.
> 
> 
> > Fixes: eb7b85853c38 ("rtc: bbnsm: Add the bbnsm rtc support")
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/rtc/rtc-nxp-bbnsm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
> > index fa3b0328c7a25..6610db2f75125 100644
> > --- a/drivers/rtc/rtc-nxp-bbnsm.c
> > +++ b/drivers/rtc/rtc-nxp-bbnsm.c
> > @@ -189,6 +189,9 @@ static int bbnsm_rtc_probe(struct platform_device *pdev)
> >  	/* clear all the pending events */
> >  	regmap_write(bbnsm->regmap, BBNSM_EVENTS, 0x7A);
> >  
> > +	/* Enable the Real-Time counter */
> > +	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, RTC_EN_MSK, RTC_EN);
> > +
> >  	device_init_wakeup(&pdev->dev, true);
> >  	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

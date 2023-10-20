Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1326249E6
	for <imx@lists.linux.dev>; Fri, 20 Oct 2023 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lmMEKHcO"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6A9CE0003;
	Fri, 20 Oct 2023 20:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697833520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sfiWF1djQwW183R/n1Ql11Gvhq6s/Znqmh+4YVfuGWU=;
	b=lmMEKHcO4Kfebn4Ds5bXoJ7JSSdHmrZVL0PjwehYTgvNmjc0wbpbssC5t6ldsPBp7LuHKt
	hwu2U9DK6qnP1764Y3xC+dEUESkCTPTjHEWANuEofysAwrEZWB9Ztm3hzbnSaoWSisDl85
	Knb7vG4qL9rZ+gqij5IqasMyIYBnheXqXN1TAEbsOLZlxm35tNxXmBuj4Caus2EVjMrHrz
	QL78DZXcXfbAmF5VHe3diLW6dxyHQ8oyTdJZVD5+VQCwlkYvjHXi2GOEHieXEl7CSsM0nd
	5P5OUbDVxXNeEIupFx9uPcFeTokOY+ABWFENSlsxCr6QG+osKNzGNDbSMIp1NA==
Date: Fri, 20 Oct 2023 22:25:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.li@nxp.com>,
	conor.culhane@silvaco.com, imx@lists.linux.dev, joe@perches.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] i3c: master: add enable(disable) hot join in sys
 entry
Message-ID: <20231020202519b2449707@mail.local>
References: <20231018205929.3435110-1-Frank.Li@nxp.com>
 <20231018205929.3435110-2-Frank.Li@nxp.com>
 <57efe6de-cf65-32ed-fd1e-a388e1676c70@linux.intel.com>
 <20231020154528.2f5f68f5@xps-13>
 <ZTKMyW939rB6sSKq@lizhi-Precision-Tower-5810>
 <20231020163348.1752167d@xps-13>
 <8a7ac52e-f102-6f5e-35ab-217e6ecc6ba5@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a7ac52e-f102-6f5e-35ab-217e6ecc6ba5@linux.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 20/10/2023 17:12:53+0200, Zbigniew, Lukwinski wrote:
> On 10/20/2023 4:33 PM, Miquel Raynal wrote:
> > Hi Frank,
> > 
> > Frank.li@nxp.com  wrote on Fri, 20 Oct 2023 10:20:57 -0400:
> > 
> > > On Fri, Oct 20, 2023 at 03:45:28PM +0200, Miquel Raynal wrote:
> > > > Hi Lukwinski,
> > > > 
> > > > zbigniew.lukwinski@linux.intel.com  wrote on Fri, 20 Oct 2023 10:55:27
> > > > +0200:
> > > > > On 10/18/2023 10:59 PM, Frank Li wrote:
> > > > > > Add hotjoin entry in sys file system allow user enable/disable hotjoin
> > > > > > feature.
> > > > > > 
> > > > > > Add (*enable(disable)_hotjoin)() to i3c_master_controller_ops.
> > > > > > Add api i3c_master_enable(disable)_hotjoin();
> > > > > What is the use case for having HJ enable knob in sysfs available for user space other than for debug stuff? In other words, does user space really need to enable/disable HJ in runtime for other reason but debug? If it is only for debug maybe it  could be move to debugFS?
> > > > I don't think hotjoin should be considered as a debug feature. The
> > > > problem here is the power consumption which is higher if you enable
> > > > this feature (you need to keep everything clocked and ready to handle
> > > > an IBI) whereas if your design is "fixed" (more like an I2C bus) you
> > > > may save power by disabling this feature.
> > > > 
> > > > A module parameter does not fit here because it's a per-bus
> > > > configuration.
> > > I agree. sys entry is more flexiable. and let controller choose better
> > > power saving policy for difference user case.
> > Maybe it's not the first time this case is faced, would you mind
> > including power management maintainers in this discussion? Perhaps they
> > might have pointers or even have the solution already.
> 
> I did not mind HJ as debug feature. But enabling / disabling the HJ sounds
> to me like debug option.
> 
> So the flow you are considering here is like this:?
> 
>     1. system boot with HJ enabled, so HJ works during initial bus
>        discovery
>     2. some entity in user space decides to disable HJ because power
>        consumption?
>     3. some entity in use space decide some time later to re-enable HJ
>        because some reason?
> 
> I am just wondering whether there is real use case when you starts with HJ
> enabled and than disable it
> 
> in runtime or start with HJ disabled and enable it in runtime. If you are
> taking care about power saving
> 
>  let's keep HJ disabled all the time. Default state for HJ could be
> controlled by DT entry.
> 

This would be HW configuration and not HW description.


> 
> > Thanks,
> > Miquèl

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

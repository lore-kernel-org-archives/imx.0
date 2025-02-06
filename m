Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2A322B8AA
	for <imx@lists.linux.dev>; Thu,  6 Feb 2025 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842145; cv=none; b=diGEhz4rHtfICW+CkYGc/q+Z33nydB48yX3GX9lgb1P/gpCsu2dmCOli1pYlx1XPrcOfW0tvjxDLzx4ROfFfcRO8t2Qh9vjiBI+QKMG0k/8hBszICyrMtu2WyX2gQNRMMjpo44egOBhTOFLwWrsyz1U/8NTpm7YCH/Iry8K6qTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842145; c=relaxed/simple;
	bh=sOOmhwy+J1qZi9TOm0FkP1go4xhTQfUCsddsa6kNIzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dguSGbEDXIumwUszM5L0j2UdO08c9L7xisgPiLgvCFk8VMQtUHPPiLS3AaoGP2Uh5oVOoeXK8lTnp2XwJXod9+l4JfHQNF+7DBLlYyishdq2M0dfv5hNAJR9LDpT8KU/WFLBJ0MMX4W8jKmmWMl44+Bk46OUgWOqwKl4ueD8kMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09E5112FC;
	Thu,  6 Feb 2025 03:42:45 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FAD53F5A1;
	Thu,  6 Feb 2025 03:42:19 -0800 (PST)
Date: Thu, 6 Feb 2025 11:42:12 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z6SgFGb4Z88v783c@pluto>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
 <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain>
 <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>

On Thu, Feb 06, 2025 at 02:31:19PM +0300, Dan Carpenter wrote:
> On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> > On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> > >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> > >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> > >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> > >> --- a/drivers/firmware/arm_scmi/bus.c
> > >> +++ b/drivers/firmware/arm_scmi/bus.c
> > >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> > >>  	device_unregister(&scmi_dev->dev);
> > >>  }
> > >>  
> > >> +static int
> > >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> > >> +		       int protocol, const char *name)
> > >> +{
> > >> +	/* cpufreq device does not need to be supplier from devlink perspective */
> > >> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> > >
> > >I don't love this...  It seems like an hack.  Could we put a flag
> > >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> > >because that's what we're passing to this function).
> > 
> > This means when creating scmi_device, a flag needs to be set which requires
> > to extend scmi_device_id to include a flag entry or else.
> > 
> > As below in scmi-cpufreq.c
> > { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> > 
> 
> Yeah, I like that.
> 
> -	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> +	if (scmi_dev->flags & SCMI_FWNODE_NO) {
> 
> Or we could do something like "if (scmi_dev->no_fwnode) {"

I proposed a flag a few review ago about this, it shoule come somehow
from the device_table above like Peng was proposing, so that a driver
can just declare that does NOT need fw_devlink.

Thanks,
Cristian

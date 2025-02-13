Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E4923F40C
	for <imx@lists.linux.dev>; Thu, 13 Feb 2025 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739452118; cv=none; b=oYyrsWuObCsKLiBmFbHrA8sQ7xMkHWa9Ddw6RNdk2Qudz9gJa7hTgcxlPNkiyl9IIO+iaCl1dFzRLqJhxidNZIXpe383XnjSjFhATNXE1KjBZYN10IPWdJQTH/nbEjQb1Vbcrc4T3hkbsyOQxSgByBuWgotCtId80lxoqLc7sPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739452118; c=relaxed/simple;
	bh=66HnS2WU7zn4HR8Ta71sxVZqxMt8cAFKsInmnCjPJwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdAer+fpdSuDSw8Yo5KR82moEnpsff6TPQqffVbpF5M+Fn1arD9LsqoKRiNWQuJDFrOQ7MBe7gUh/jXdbaxYlcABegOsYZ0Az6feMynSYiut8tZV8DPt14rswBNGrqnvKGc+xFTre6y8KkCC25qVw5KCl1XQzYalPLpTUeR7fcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3D1E16F3;
	Thu, 13 Feb 2025 05:08:54 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18FD83F58B;
	Thu, 13 Feb 2025 05:08:31 -0800 (PST)
Date: Thu, 13 Feb 2025 13:08:19 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
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
Message-ID: <Z63uttFGqXx4kqNr@pluto>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
 <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain>
 <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
 <Z6SgFGb4Z88v783c@pluto>
 <CAGETcx8MXpLntMu4=9qECdZJzJLJbWa8ziH8XcW=yJNDAgD=Vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGETcx8MXpLntMu4=9qECdZJzJLJbWa8ziH8XcW=yJNDAgD=Vw@mail.gmail.com>

On Thu, Feb 13, 2025 at 12:17:06AM -0800, Saravana Kannan wrote:
> On Thu, Feb 6, 2025 at 3:42 AM Cristian Marussi
> <cristian.marussi@arm.com> wrote:
> >
> > On Thu, Feb 06, 2025 at 02:31:19PM +0300, Dan Carpenter wrote:
> > > On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> > > > On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> > > > >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> > > > >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> > > > >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> > > > >> --- a/drivers/firmware/arm_scmi/bus.c
> > > > >> +++ b/drivers/firmware/arm_scmi/bus.c
> > > > >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> > > > >>          device_unregister(&scmi_dev->dev);
> > > > >>  }
> > > > >>
> > > > >> +static int
> > > > >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> > > > >> +                       int protocol, const char *name)
> > > > >> +{
> > > > >> +        /* cpufreq device does not need to be supplier from devlink perspective */
> > > > >> +        if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> > > > >
> > > > >I don't love this...  It seems like an hack.  Could we put a flag
> > > > >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> > > > >because that's what we're passing to this function).
> > > >
> > > > This means when creating scmi_device, a flag needs to be set which requires
> > > > to extend scmi_device_id to include a flag entry or else.
> > > >
> > > > As below in scmi-cpufreq.c
> > > > { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> > > >
> > >
> > > Yeah, I like that.
> > >
> > > -     if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> > > +     if (scmi_dev->flags & SCMI_FWNODE_NO) {
> > >
> > > Or we could do something like "if (scmi_dev->no_fwnode) {"
> >
> > I proposed a flag a few review ago about this, it shoule come somehow
> > from the device_table above like Peng was proposing, so that a driver
> > can just declare that does NOT need fw_devlink.
> 
> Sorry, looks I replied to v1 series. Can you take a look at that
> response please?
> https://lore.kernel.org/lkml/CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com/
> 
> If that suggestion I gave there would work, then that's the cleanest
> approach. This patch series is just kicking the can down the road (or
> down an inch).

Thanks for the reply, I will answer on that other thread.
Cristian

Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB2F166312
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724838489; cv=none; b=i10besulr39P0HbedILaQ1I3Zfql7gHmtvOQkF80/D8bb4vBiJ+V46vKJfeVLAPFXClew7ike1Yp0GmG7pd647dopgjJTWxa3fS49ZOa0Uw5SJ32+og21xn+1cXuzvSCX8uL8grt1S1bQB1GG3RUCRNFMGZA/DgGw1BgXUCjQ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724838489; c=relaxed/simple;
	bh=8q/gYqjocLmPeNq35vGug9tVt5L5rHQ7RsGfDd7nid8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TT+aepyP1YoFxHnBAeKOTNGb0msVbSd/MZPduXXuZ24SftRd5KFSFTeo1MaGFUNdlYv7xgHjfHtyN1Ip3S7l+QJVI/5Saf1ZuiAiKKmMPycEfUFZsArrRUvEpqu31n284l/AoaqwG31hiM6RxeWJTZHTrwyVIqguCAbVUwtAgVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E4CBDA7;
	Wed, 28 Aug 2024 02:48:27 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6E543F73B;
	Wed, 28 Aug 2024 02:47:59 -0700 (PDT)
Date: Wed, 28 Aug 2024 10:47:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH] firmware: arm_scmi: imx: add MODULE_LICENSE/DESCRIPTION
Message-ID: <Zs7yTYSb1OeV2dc1@bogus>
References: <20240828014746.1713728-1-peng.fan@oss.nxp.com>
 <PAXPR04MB84595AD3A570948EA8593ED488952@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84595AD3A570948EA8593ED488952@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Wed, Aug 28, 2024 at 05:17:27AM +0000, Peng Fan wrote:
> > Subject: [PATCH] firmware: arm_scmi: imx: add
> > MODULE_LICENSE/DESCRIPTION
> >
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Add missing MODULE_LICENSE and MODULE_DESCRIPTION
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >
> > Hi Sudeep,
> >  My bad for not build this as module. If you need me fix the previous
> > patchset,  please let me know.
> > Thanks,
> > Peng.
> >
> >  drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c  | 3 +++
> > drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c | 3 +++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
> > b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
> > index 0df7ca135c34..ad8734d2aeab 100644
> > --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
> > +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
> > @@ -377,3 +377,6 @@ static const struct scmi_protocol
> > scmi_imx_bbm = {
> >  	.sub_vendor_id = "IMX",
> >  };
> >  module_scmi_protocol(scmi_imx_bbm);
> > +
> > +MODULE_DESCRIPTION("i.MX SCMI BBM driver");
> > MODULE_LICENSE("GPL");
> > diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > index 9ee2d204d607..1d339cfa6ecf 100644
> > --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > @@ -313,3 +313,6 @@ static const struct scmi_protocol
> > scmi_imx_misc = {
> >  	.sub_vendor_id = "IMX",
> >  };
> >  module_scmi_protocol(scmi_imx_misc);
> > +
> > +MODULE_DESCRIPTION("i.MX SCMI BBM driver");
>
> Just find this Typo. BBM->MISC.
>

I was about to ask the same. Please take time needed to push out any
patch, no point in rushing and churning unnecessarily like this.

Anyways, I did hit the issue last night and fixed it locally but
didn't push out as it was late for today's next. Please check if
https://git.kernel.org/sudeep.holla/c/for-next/scmi/updates
looks OK.

--
Regards,
Sudeep

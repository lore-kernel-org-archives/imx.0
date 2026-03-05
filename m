Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CEF36B07F
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707720; cv=none; b=Fvw8Mjrl+EfJs9Rf+DTr32kWTss+0L2zb2GTCD/VLNm28ZfCeKs8jvqyoIh8YzLWV0+fI6JzhUaKb/D2UfY9MmqC9Ngv2Mmnxa0L/v7aXRDNowF5mV4pj3eDxltXKqs8/joQLkMHpQG7U6HoTS2eNzwsp1coOBm6c0HZHYpyL0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707720; c=relaxed/simple;
	bh=FgjIUp7K7TwMgun3wRj1gl+S1an/wKR+ibx8DQAeqJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EA358JcQP98ndbocojDQDwArjrTyVg6qYguqkCG6PjRtL2841KXK93WC+KLs5uRTO1gspjzQ0r0wXNPQuinxCQpVus68pNkfB0sUbUp/LG9L1BsZ7pxc7BHh98m6nvXd9RQd10CMvvR5EfbjUA6HgR2XDegvZe44b1dMkCgjp6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vy6Fs-0000TS-L0; Thu, 05 Mar 2026 11:48:32 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vy6Fq-003rwV-20;
	Thu, 05 Mar 2026 11:48:31 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vy6Fr-00000001aVY-3j3z;
	Thu, 05 Mar 2026 11:48:31 +0100
Date: Thu, 5 Mar 2026 11:48:31 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: imx: sm-misc: Print boot/shutdown reasons
Message-ID: <aalff2CtcIeln0NG@pengutronix.de>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-2-18de78978ba9@nxp.com>
 <24409695.EfDdHjke4D@steina-w>
 <aalZV981HAneFWiC@shlinux89>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aalZV981HAneFWiC@shlinux89>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi all,

On Thu, Mar 05, 2026 at 06:22:15PM +0800, Peng Fan wrote:
> Hi Alexander,
>
> Thanks for giving a look.
>
> On Thu, Mar 05, 2026 at 08:44:26AM +0100, Alexander Stein wrote:
> >Hi,
> >
> >Am Donnerstag, 5. M=C3=A4rz 2026, 02:56:45 CET schrieb Peng Fan (OSS):
> >> From: Peng Fan <peng.fan@nxp.com>
> >>
> >> Add reset reason string table for i.MX95 and introduce a helper
> >> (scmi_imx_misc_get_reason) to query and print both system and LM
> >> (Logical Machine) reset reasons via the SCMI MISC protocol.
> >>
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> [...]
> >> +		if (boot.valid)
> >> +			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
> >> +				 system ? "SYS" : "LM", rst[boot.reason],
> >> +				 boot.orig_valid ? boot.origin : -1,
> >> +				 boot.err_valid ? boot.errid : -1);
> >> +		if (shutdown.valid)
> >> +			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %=
d\n",
> >> +				 system ? "SYS" : "LM", rst[shutdown.reason],
> >> +				 shutdown.orig_valid ? shutdown.origin : -1,
> >> +				 shutdown.err_valid ? shutdown.errid : -1);
> >
> >Is there a way to query this from userspace programs instead of printing=
 into kernel log?
>
> I not add sysfs or debugfs to get the information in this patchset, since=
 our
> customer only want the information could be shown in kernel boot log.
>
> But I could add also sysfs interface to allow userspace get the informati=
on if
> you need this feature.

I started to working on corresponding framework:
https://lore.kernel.org/all/20250618120255.3141862-1-o.rempel@pengutronix.d=
e/

but it is stalled due to devicetree decisions. I wont to respin the
discussion tomorrow

Best Regards,
Oleksij

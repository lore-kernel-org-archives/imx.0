Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C8A28750C
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622364; cv=none; b=fHJOygd2O19GEtGOwRHShOSBb+zWzB0uS8keMvefOQDtsIFM7k0N5vnuj5K74N8jCy62FJ0A+UuSREC0o4qZoWaJcQURot3t7yeTi0CoNecD17hXwRVD5c+2fRhBMQ0OxjtuHM7VGw+YTfih4VpPVXuVG7rLQUHyPPqXVBXCp20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622364; c=relaxed/simple;
	bh=dzvMQdTS3fmP55HtLzeCh2WTdEYR5YaYqxUOeJvU5S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPSuXVNAGJ3TMNzn8HyvaCLYkgNqb0w/asxEvknwxCs7aNHAAVEl9ShKp6hgstoniNpvBEoRCX2WKFIc9UKrlzEghZigkTcjPTjJ05gjpzMzqDVsUzz+hwxBv4avdsBYgS93kZZ5zaDK06tJREV2SC4kSDh8z7+OHFphVePKRqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27F8B152B;
	Fri,  4 Jul 2025 02:45:48 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28D6F3F6A8;
	Fri,  4 Jul 2025 02:46:00 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:45:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Message-ID: <aGei1YOnwjqqznrW@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>
 <20250702-berserk-paper-uakari-74a8bd@sudeepholla>
 <20250704102802.GF4525@nxa18884-linux>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704102802.GF4525@nxa18884-linux>

On Fri, Jul 04, 2025 at 06:28:02PM +0800, Peng Fan wrote:
> On Wed, Jul 02, 2025 at 04:22:47PM +0100, Sudeep Holla wrote:
> >On Fri, Jun 27, 2025 at 02:03:50PM +0800, Peng Fan wrote:
> >> Add sysfs interface to read System Manager syslog and system info
> >> 
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  drivers/firmware/imx/sm-misc.c | 97 ++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 97 insertions(+)
> >> 
> >> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
> >> index fc3ee12c2be878e0285183e3381c9514a63d5142..55485a3c4a5c615102a377f41025a6911d746770 100644
> >> --- a/drivers/firmware/imx/sm-misc.c
> >> +++ b/drivers/firmware/imx/sm-misc.c
> >> @@ -44,6 +44,100 @@ static int scmi_imx_misc_ctrl_notifier(struct notifier_block *nb,
> >>  	return 0;
> >>  }
> >>  
> >> +static ssize_t syslog_show(struct device *device, struct device_attribute *attr,
> >> +			   char *buf)
> >> +{
> >> +	struct scmi_imx_misc_sys_sleep_rec *rec;
> >> +	struct scmi_imx_misc_syslog *syslog;
> >> +	int ret;
> >> +	size_t len = 0;
> >> +
> >> +	if (!ph)
> >> +		return 0;
> >> +
> >> +	syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
> >> +	if (!syslog)
> >> +		return -ENOMEM;
> >> +
> >> +	ret = imx_misc_ctrl_ops->misc_syslog(ph, sizeof(*syslog), syslog);
> >> +	if (ret) {
> >> +		kfree(syslog);
> >> +		return ret;
> >> +	}
> >> +
> >> +	rec = &syslog->syssleeprecord;
> >> +
> >> +	len += sysfs_emit_at(buf, len, "Wake Vector = %u\n", rec->wakesource);
> >> +	len += sysfs_emit_at(buf, len, "Sys sleep mode = %u\n", rec->syssleepmode);
> >> +	len += sysfs_emit_at(buf, len, "Sys sleep flags = 0x%08x\n", rec->syssleepflags);
> >> +	len += sysfs_emit_at(buf, len, "MIX power status = 0x%08x\n", rec->mixpwrstat);
> >> +	len += sysfs_emit_at(buf, len, "MEM power status = 0x%08x\n", rec->mempwrstat);
> >> +	len += sysfs_emit_at(buf, len, "PLL power status = 0x%08x\n", rec->pllpwrstat);
> >> +	len += sysfs_emit_at(buf, len, "Sleep latency = %u\n", rec->sleepentryusec);
> >> +	len += sysfs_emit_at(buf, len, "Wake latency = %u\n", rec->sleepexitusec);
> >> +	len += sysfs_emit_at(buf, len, "Sleep count = %u\n", rec->sleepcnt);
> >> +
> >
> >Why can't this be individual files and values ?
> 
> The System manager firmware provides a command "syslog" to dump
> all the information, I just follow same.
> 
> With individual files, some values may not be consistent, because
> system behaviour may change during reading two files.
> 

You definitely need to convince Greg if you take this approach. I am sure
he prefers single value sysfs files.

-- 
Regards,
Sudeep

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F3D4189DD;
	Sat,  5 Sep 2026 07:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595195; cv=none; b=dMiafosaSp7tFJH1CNyyLJVy5bwmcGOsvP9YDGQ4WKJUkFZ/4TpZoYpGtXMoYUeum7g4m8EJQqzvC+a/gwtIeV0B9oTcLDVkWdeC47nErCLpQlTQaoHe3QXBkTW8yMAd98aPaoEskKXCWzjsBsm+3yhCwa6slDheKeEcHMCOPb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595195; c=relaxed/simple;
	bh=pbA6rvFYYarR8MxJYGq5cw/7vkB61rDNf7lyNAo93QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/nYjsQpWaDBOJkLI0xLEI7I3JJK+oxD1korwV5Scx3KHbhpncboYWJoIFxnMU6tfRb3GvnI6e4bZlGeew3X4IYawvj/1WGQTgGGu2zX2FwEyohj0lE+0LIbH987a3rIoT2GQXg2V0FyCUBhptME2nQEkHuvHIhu19B7Ipl1gjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/4512z5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/4512z5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788595191; x=1820131191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pbA6rvFYYarR8MxJYGq5cw/7vkB61rDNf7lyNAo93QA=;
  b=T/4512z59vhOa00P1gTXWX7FoXKm2lsVpG7WXlJHCG4kYNJL2l127VV6
   e7vHCU8nALnMvoSKCmVpuvo4csFOKwLmmYj++/kRpDlBfEaxtrdeLRgmK
   mdcV9/cLOL1OOadQbIpk8uMGWx/pCq4pMH7tuzInd9sOLGJORCSeUlRy0
   gMM2hiLTD8z/e8FouLzn0pOde/Q8+xw1TQEixtlqBtGHWBujVc3XkzfyV
   iXBCDpwgSejp93DITwn8WkbUgPvGtcJDPlXJjqjtJAfVD7b/TQzD82JeD
   SbHNzAndncpgPPKeSNUAGi5ikd04khGxun5OJtfINxFimGLvzHAiLhZU1
   g==;
X-CSE-ConnectionGUID: kqMluoNdTAWS8OPspuwqmA==
X-CSE-MsgGUID: bbe8pqzKQoqBNxii3WZIXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99682090"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="99682090"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 00:59:47 -0700
X-CSE-ConnectionGUID: Xf5I0G4OTMOcp1QBaOOGYQ==
X-CSE-MsgGUID: ynFtavY4QxibRVi+CHkcdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="295125461"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 00:59:38 -0700
Date: Sat, 5 Sep 2026 10:59:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 4/4] dmaengine: add union chan_dev for dma_chan::dev
 for clarity
Message-ID: <apvL5yXKGHrEyp9Z@ashevche-desk.local>
References: <20260904-dma-chan_dev-rename-v3-0-685601b0b788@nxp.com>
 <20260904-dma-chan_dev-rename-v3-4-685601b0b788@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-dma-chan_dev-rename-v3-4-685601b0b788@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 04, 2026 at 05:49:46PM -0400, Frank.Li@oss.nxp.com wrote:

> The current dma_chan structure contains both "device" and "dev". So
> 
> chan->device->dev refers to the DMA engine device.
> chan->dev->device refers to the per-channel device instance.
> 
> Their similar naming makes the distinction unclear and increases reader
> confusion.
> 
> Add union dma_chan::chan_dev to make its purpose explicit and clearly
> identify it as the per-channel device. After all user switch to chan_dev,
> union and dma_chan::dev will be removed.
> 
> Update the kernel-doc accordingly. Besides its sysfs usage, the per-channel
> device is also used by some DMA engine drivers for IOMMU mapping and
> therefore deserves a more accurate description.
> 
> No functional change intended.

I was almost ready to give a tag for the entire series, but found a minor
issue here...

...

> +++ b/include/linux/dmaengine.h
> struct dma_router {

>   * @lock: protect between config and prepare transfer when driver have not
>   *	  implemented callback device_prep_config_sg().
>   * @chan_id: channel ID for sysfs
> - * @dev: class device for sysfs
> + * @chan_dev: class channel device for sysfs, some device use it for per-channel
> + *            iommu mapping.

IOMMU

>   * @name: backlink name for sysfs
>   * @dbg_client_name: slave name for debugfs in format:
>   *	dev_name(requester's dev):channel name, for example: "2b00000.mcasp:tx"

> struct dma_chan {

>  
>  	/* sysfs */
>  	int chan_id;
> -	struct dma_chan_dev *dev;
> +	union {
> +		struct dma_chan_dev *chan_dev;
> +		/*
> +		 * please use chan_dev, dev will be removed after all user
> +		   switch to chan_dev
> +		*/

Something went wrong with this comment style. It also need to respect English
grammar and punctuation as we do for multi-line comments.

> +		struct dma_chan_dev *dev;
> +	};
>  	const char *name;
>  #ifdef CONFIG_DEBUG_FS
>  	char *dbg_client_name;

-- 
With Best Regards,
Andy Shevchenko



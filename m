Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2A93B0AD8;
	Sat,  5 Sep 2026 08:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595256; cv=none; b=us9vf6IM8SdKpGgWBIE495cHWDwGdiY8ULNUa5C9JxspiCavSZaofi+x4JBKKkzGDaeiJZLqZ3Ac2wZFiD3G9tYciF8GNg/cwGix0uR4m72YnxMmBA0gV5oTPo/94jeDXEnbtpbKQ/nd/NxWxLyCfsgi99u5Ebnww1M8OE8Sduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595256; c=relaxed/simple;
	bh=DZFfBMrRtiY/73SGDh0XULVSppgU/RJ7ThjUIl3cq4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tY1d+ev/FCKitFIka0sy3Zu1AZZ+SON0sDBYVQ5lqEVwhJmRlTWj/8Ow5MB8jkaDunMj/zf3L8GzuW2Jxe9iQocUKMOakbSCTt9z0KALrF4XXLp/xpay9jpcfEipEv704VdO05KdE6C7pwcbfRHRBkQwineHyATxwmrAIGFLxWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIkyxALR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIkyxALR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788595254; x=1820131254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DZFfBMrRtiY/73SGDh0XULVSppgU/RJ7ThjUIl3cq4s=;
  b=BIkyxALR4zJV487zRVPQ/VyJp9G8DmH5xOKTqKibkcKUXMfq+GR3bq/1
   nnRkTdyDLjqbdeUGWZeExgDXF2IaJpwFvdq60AABVs6wvbvCiXWsyGM8z
   2uvQ2wcKUEZ5ZWyOdWvFL667aGW8+WFyTGtsrrLGit9mcXe0cp5EWhnFv
   nCqNXZ7EeGN3AmP4R7FVy/Kp/dHgCL34JT/vpX+2DZAD6WLM60hp4DyIi
   0Wvr27tyry9+lDcOq8mazSVzDU6/5zs9s8P6Y8FNgTEJASzWRBcZSTu9x
   uZvRgf/BJTpcWUVM+JoUseZ+ZrtoHni4U7yzSOev8OGsmLQq7ga42J8wR
   A==;
X-CSE-ConnectionGUID: QWCD3EXLQwG7DpDiI5YPPQ==
X-CSE-MsgGUID: bOh23kbHRO2FNb99cNZ6UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89119567"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="89119567"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:00:52 -0700
X-CSE-ConnectionGUID: 9JbBadgHQ7SEjpVvHYYgmw==
X-CSE-MsgGUID: bwhdz7ZKSjWLvCde1OANJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="270230591"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:00:43 -0700
Date: Sat, 5 Sep 2026 11:00:41 +0300
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
Subject: Re: [PATCH v3 0/4] dmaengine: rename dma_chan::dev to
 dma_chan::chan_dev for clarity
Message-ID: <apvMKWQhTn5Kf8Sq@ashevche-desk.local>
References: <20260904-dma-chan_dev-rename-v3-0-685601b0b788@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-dma-chan_dev-rename-v3-0-685601b0b788@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 04, 2026 at 05:49:42PM -0400, Frank.Li@oss.nxp.com wrote:
> The current dma_chan structure contains both "device" and "dev". So
> 
>     chan->device->dev refers to the DMA engine device.
>     chan->dev->device refers to the per-channel device instance.
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
> 1st patch add help vchan_chan_name()
> 2nd patch use existing helper dma_chan_name() to reduce rename difference.
> 3rd patch add (dmaengine|vchan)_chan_dev() helper
> 4th patch add union chan_dev for dma_chan::dev for clarity
> 
> Need following patch to clean other dma engineer driver, which is not
> in drivers/dma
> 
> After complete all rename work, dma_chan::dev can be removed.

Nice work!
I have one comment against patch 4/4, after addressing that feel free to add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
to the entire series.

-- 
With Best Regards,
Andy Shevchenko



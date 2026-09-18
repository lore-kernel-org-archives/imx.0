Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF1D199E89
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714055; cv=none; b=L0KFm8nvWXoqNq1qbM/U/lufMmrX6/bWIPk05ylQelbfJWAZ96t6adjyqX8IYMiGKukee5Drz19mq606gjInSTTHdIf5WogUwfXbXhlj7v+7B6Tjw11BBEeDjOmUaHWUf8NJFT2NQA6+tP4CUll4gLpDa/P+btTvFYQ4g/WPs+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714055; c=relaxed/simple;
	bh=6YanQ4j2axnNmAVMCsCzfrwlvp0zLxWMQEBqbUI0jaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9HNTGfpF0+eC5TkhtAsJiD7Zn+tbPocIf42Lej380rx4n3wntZZXNwPPSksJbD/+PClW/Oh+x7auCh+kykdT4RgRp/+82uG44KHAntigyppdeOl+3ZiI2OmZ777d36CmKdruv15stAhZZo3jX019mcN4u/sSRTI8lWzOTuXZpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsNithr3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsNithr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789714054; x=1821250054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6YanQ4j2axnNmAVMCsCzfrwlvp0zLxWMQEBqbUI0jaA=;
  b=lsNithr35OB6dlco6vZuBhg4KsNMgYIAz6INaMgr6332YWGcptjTtEGT
   NUReX/KxEBsVlbs0YRF8TkBuf4l9D84B7MZ4xZ3QgqDKUvis/LBZCeOXw
   TYiucbOTH4vDZinOOuTAqF3kHd6CPiwkbuosBlIMGgbP2Yycglt5xc8ZM
   nljPnASh3tve4NkSJ0Ih99tm6fKwjIlPlIcCMY972kBZP/43ONv/8nZQ8
   31YqWRL7/gmu36r5qYNO5CPu/CcKkXQXLoPXPUbJUikAFNYBl9hoVwC/F
   ZHd41Fn4lC2dBp89zhyiHPS6sCTinwgmkISLO2h0Hn4BAnkulpM0Bpr8v
   Q==;
X-CSE-ConnectionGUID: V28mDBOkQRSVOR39ChIAYw==
X-CSE-MsgGUID: FFU2JRi0Ty+VjcV+igawyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90218036"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90218036"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 23:47:33 -0700
X-CSE-ConnectionGUID: G7IZiRvjTG+wDabJyYvZwQ==
X-CSE-MsgGUID: apAPhVFURX+XHpRIfNXygw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2435704"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 23:47:27 -0700
Date: Fri, 18 Sep 2026 09:47:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank.Li@oss.nxp.com
Cc: Eugen Hristev <ehristev@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Felix Gu <ustc.gu@gmail.com>, Stepan Ionichev <sozdayvek@gmail.com>,
	Shuvam Pandey <shuvampandey1@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Frank Li <Frank.Li@nxp.com>,
	Piyush Patle <piyushpatle228@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Pei Xiao <xiaopei01@kylinos.cn>, Shi Hao <i.shihao.999@gmail.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	"open list:MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER" <linux-iio@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH 1/1] iio: use dmaengine_get_dma_device() instead of
 chan->device->dev
Message-ID: <aqzefLjkj6VrLR1b@ashevche-desk.local>
References: <20260917203652.1279059-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917203652.1279059-1-Frank.Li@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 17, 2026 at 04:36:26PM -0400, Frank.Li@oss.nxp.com wrote:

> Replace direct dma_chan::device::dev access with the proper
> dmaengine_get_dma_device() accessor in IIO DMA consumers.
> 
> chan->device->dev is not always the device used for DMA mapping.
> Some DMA engines support per-channel IOMMU mappings, so different
> channels may use different DMA devices.  dmaengine_get_dma_device()
> returns the correct device for each channel.
> 
> This also prepares for making the DMA engine provider data structures
> private. DMA consumers should not access DMA engine internals directly.

...

>  drivers/iio/adc/at91-sama5d2_adc.c                 |  9 ++++++---
>  drivers/iio/adc/nxp-sar-adc.c                      |  2 +-
>  drivers/iio/adc/stm32-adc.c                        | 10 ++++++----
>  drivers/iio/adc/stm32-dfsdm-adc.c                  |  4 ++--
>  drivers/iio/adc/ti_am335x_adc.c                    |  4 ++--
>  drivers/iio/buffer/industrialio-buffer-dmaengine.c |  5 +++--

Strictly speaking this is two patches, one per ADC folder and the other against
IIO core. But this one is not a big one, so up to Jonathan.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



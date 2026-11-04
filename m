Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782073;
	b=QErtyr060e+JCrQ7yVoNa9jCLUeWBzt7QBGU0XiwG5mmL2RT39n9gHDUm470QNPXtz+W
	 Zx4nh8ANtkMIQD9EFJZSxQ+Ixyx7zftGeo1g2GCdXtmKdd/bRiPo3QIx+6thOaM3l43aI
	 8JCv1goCI6gh1++pO6weMUNVahNiPEypwdOSPLLAnm9KLHf6befrtv3sbWeaXFTXD+pr3
	 bwn/1AUhcS6jzQYOmjG8BYg+bCotIf0l29L/yzsz2PXuIF+qjC/6ne6eqT7jJjykHoVV9
	 pXV+WyFKcXBfYI+M5SiZBvpY0JlDqE6RfkhGrCYe1p3TpCr4u/NNC37atmEJUdZiJeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782073;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=gINtp91EmSyPeKHcy9B70GgiKnQ1Mr6rYAdlWmCMvg0=;
	b=eYBWbCobGDikHCVtaIkfqHeUAyg6986D6RXyB4JSsCqiciLPT4FoRx8TUECZNQ9Usv0c
	 rSOERrsja2OpOPDc29oiHvKDmER5Ko4jUBc8OACyFGwuaeZ6vQoyjdEWdvGbAT1XmdtJJ
	 CxIIArvrNxur9G4dTz+oazHt0eQFRZS3W73NONNO5BSznVd4ev+z+U+Et4tHPzdhq+SK3
	 gYW25LM1/n/MGTFQWlKX+1eDmtfTkl0c/EfUF267CYTHdiPiV/vGgisYLnuxoHwmToaoO
	 NW4Vju7HK6eFsr99aNJQBylNPrpVNFA5ZUoYwiKv225N6YwXDztKpO6wEgeHSUQ/vwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UrSeuk+E;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BE6606A326
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 08:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39BE6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UrSeuk+E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793782073; x=1825318073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sg3KXue8VKK8i5UA15Wz4XJnv1FMQwcpmP18U2pXNVU=;
  b=UrSeuk+Emvbu2SbuXW7zdmXy2p4QGwEddivQaVIJQ4MjggSeP0mYOrZe
   D3AcSAL0GBotYyB4N6P1jW5Hk2lNYHZBQmqtBMi0syciOkA3xbjHj+crd
   zXb1vjKDhcfB7OsknfYLe9nhZ2buURQz1J2inzEPbkBkPpUxDdAQzMZ1J
   AynYHcWRdBy7NaMblVS1AMM0PD4DxgSpBT6tSx9mzXzwJ256PQBiivc0x
   Mo/IA7UA8C6gYqAm2j9gW2dW10V4DubqB9ngKWbZCvEmuT4JGSq0CflSt
   ZgkKy3HPV+HDezTLEQ+70xbvOmIj2XEs5EwTtziqHCj44s9yJt3JrTHEh
   g==;
X-CSE-ConnectionGUID: 7esj+ShBRVCmtH2e7kcehA==
X-CSE-MsgGUID: bS1R5xhrQtCa2ot0WtvV7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2632305"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2632305"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:47:52 -0800
X-CSE-ConnectionGUID: CZsbyOWITqOYdLdmyUgq3A==
X-CSE-MsgGUID: 1TVbOk0wSj6xjXfpnJ8grA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6684559"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:47:45 -0800
Date: Wed, 4 Nov 2026 10:47:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Zhaoyang Yu <2426767509@qq.com>,
	John Ogness <john.ogness@linutronix.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH 1/1] tty: replace chan->device->dev with
 dmaengine_get_provider_device()
Message-ID: <aurxLlfOa1fAa19U@ashevche-desk.local>
References: <20261103215949.1827937-1-Frank.Li@oss.nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103215949.1827937-1-Frank.Li@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 04:59:45PM -0500, Frank.Li@oss.nxp.com wrote:
> 
> Use the dmaengine_get_provider_device() API instead of directly
> accessing chan->device->dev to get the DMA provider device.
> 
> No functional change. Prepare make to struct dma_device private to the DMA
> engine.

...

>  static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
>  {
> -	return param == chan->device->dev;
> +	return param == dmaengine_get_provider_device(chan);
>  }

As mentioned in SPI patch, with another helper this function will gone.

...

>  	if ((chan->chan_id == param->chan_id) && (param->dma_dev ==
> -						  chan->device->dev)) {
> +						  dmaengine_get_provider_device(chan))) {

Fix indentation while at it.

	if ((chan->chan_id == param->chan_id) &&
	    (param->dma_dev == dmaengine_get_provider_device(chan))) {

>  		chan->private = param;
>  		return true;

-- 
With Best Regards,
Andy Shevchenko



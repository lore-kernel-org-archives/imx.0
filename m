Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781974;
	b=RYtgMCWXVwggRwp8LCW67sLWEoIopx5W0BpE5dR39jmuudv6YLI/5laZuNV9vK+n8sgP
	 GY9Ix+FZA56oUV8vsugqXwMwTMpXUScB+NPCfZgFMND5nrRjH2XfntyPsMCVUjKooF244
	 eVRXhCPFDB4KM7Cw88UXSlpFhuPd5g/lrqKp6RRnGXiaUJGEr4pDgT09AJTdpTYf/T/JH
	 Cuxzb8PeV75I8H9oa4keZkgGrrY2J0A1Yi8Ec82WH54MQuuK0CzKbNVqtHI0twmdWhkIg
	 yc3fUmGJEMX7ewdEobJ/2VZfRuZdw+mp9LohPMiUuKzBwRpduxpUF2edvDjuoH6Z57Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781974;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=rPktWRiI/JgjZXOK0VV9UihgCUHb9+RZLQKrRxQgIkQ=;
	b=Reno7O7MUnHZ/tF//gsJARH4thA4XT6DBZzIWDcSSxyEpDNhdo91qLs+jZcCpAVQJz2C
	 4e7P7Fks5IOs770DHTFN0gXZRTm9fCcG3sKDB18/8Pv0+ce7EuZwLfFq4qKV7Dxm5Ldw+
	 BunAXiY5vM9Z1bpdbZCPvzvrvfLPZmKpgS2QOgq07LGHbMgF1g+6X5T8vd+Wrlg3vezpY
	 BXiUU3iiKmrFZgd5cpQwda/I/XIUfEMj099ImubAK5JoIAkuYQh7AIQLy20LwogafUO/+
	 055nYLnTwTJPni6smBW3NFM/+P/JKNNTzjRwidrcE3wI81T3GHy8bxV/3zjGTabZQQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6AB606A331
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 08:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C6AB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793781968; x=1825317968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fyw4gM5AV8XJVm/D6q+MVFyu67HewixU8i9L8I15X1c=;
  b=iWWgRzl+G9UGeLaaOSMKwUkTg0tPIFathBLyox5WuC67tvWB9dNBLxpj
   /gb+oeiLV300/eeoiT/9u4jsjoAbme2qzeCFw33Pa71aDXVtAqglZxZqM
   p1yHNgYCRe3eIJzBAKml6LQbe0OVBa/B+HbsW5NKVLfwN3tFzU961whgp
   eZtLBinlkQCN25xlHz7D0B3WmK4ZqOXriNDgJdcvO9q8rgpOCUBjxiVej
   k8SvJLa5GCbApCgIy1T3NXo1zDyCGI+9MLOTq8iQCWxRe3ADMfEtBjWs5
   exd7+80viJXd+9picluUNdgWY3Ju2X0oTzWETCfURR626wr3BM4o0z1ba
   w==;
X-CSE-ConnectionGUID: YxQv6xDDQtqp2VUk6jTyQQ==
X-CSE-MsgGUID: hh0wt0ApRaS9ZR6g3lhkOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2623323"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2623323"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:46:08 -0800
X-CSE-ConnectionGUID: DY0+xHzSQB+42gN643B25Q==
X-CSE-MsgGUID: /SZ9wx83SOqE5CZm7dzfJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7219588"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:46:05 -0800
Date: Wed, 4 Nov 2026 10:46:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:PXA2xx/PXA3xx SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	imx@lists.linux.dev, vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] spi: replace chan->device->dev with
 dmaengine_get_provider_device()
Message-ID: <aurwylnNpkKi_Bx-@ashevche-desk.local>
References: <20261103215824.1823272-1-Frank.Li@oss.nxp.com>
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
In-Reply-To: <20261103215824.1823272-1-Frank.Li@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 04:58:23PM -0500, Frank.Li@oss.nxp.com wrote:

> Use the dmaengine_get_provider_device() API instead of directly
> accessing chan->device->dev to get the DMA provider device.
> 
> No functional change. Prepare make to struct dma_device private to the DMA
> engine.

...

>  	struct dw_dma_slave *s = param;
>  
> -	if (s->dma_dev != chan->device->dev)
> +	if (s->dma_dev != dmaengine_get_provider_device(chan))
>  		return false;

It's obvious that we need another helper to match.

// void * and EXPORT to be able to use as filter function
bool dmaengine_match_provider_device(struct dma_chan *chan, void *dma_dev)
{
	return dmaengine_get_provider_device(chan) == dma_dev;
}
EXPORT_SYMBOL_GPL(dmaengine_match_provider_device);

...

>  static bool pxa2xx_spi_idma_filter(struct dma_chan *chan, void *param)
>  {
> -	return param == chan->device->dev;
> +	return param == dmaengine_get_provider_device(chan);
>  }

With that being done this function is gone.

-- 
With Best Regards,
Andy Shevchenko



Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B0F1E0DD0
	for <imx@lists.linux.dev>; Tue,  8 Oct 2024 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728407342; cv=none; b=OQOFljIBhXd1qGQdCyDYTIG6BQvV0Ma3rDTUhl8dzxxJliaYi7VWyngJdrDl7MWq+3NzPHQx30Akl0jEob/x/FtCFjvdy5aYg+AA0ylHn5vNki6zTvHrnFj5egr7PYOfkfRYsxlKGhdYJDRH15R5IprGNXdwqHiA/KOL+NSFIwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728407342; c=relaxed/simple;
	bh=1at/Cmreu+1nGtOh763pSQQTzVt2a3e35+RaESMYeLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvsxRgl6Wc/s1TUrnKPo/pF/j1SPEPWUdHZcb3dXoh7fwVukWWT/T+CByEhFmHY7uJ197Dm8tePl7HImmuNOwT7KYkOD1wJiw83jLMxGaJksdQLMNaLPHrx22iZvhxA5w2BNmKLLpvP83A+NzTfjC5peIF4p3q6YG3DXMCKGExg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnsM8VUX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnsM8VUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728407340; x=1759943340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1at/Cmreu+1nGtOh763pSQQTzVt2a3e35+RaESMYeLo=;
  b=VnsM8VUXkzdouPsCSLiHd/lLhBzVvbFugFmdQFbZvAcw8GfJV5T/rSc8
   GIxH2PIol6ZKJrwbU00n+FsVmAAsTibzvyjA7QeDtmxqi5NqJt4/L34GY
   IvtIz0Yk3Jm0keSM2zOSw9Bv7GjQOjmvjB2fY5XeltVVM+igzsWnV2hmv
   EW0s5ukdvzMdvT73M0/xao2zsR0OsJEKOitoAsTW1TtDRsNTsU/Rc65ZM
   Vl1osoj7FfobHRbrABOCHK4AWgzFPCUFPWb3Wi0PkC7CgtHOr2u05x/8L
   M7nvxTi8jTAubxAAmSRgpskgDvqNoa/ZZKVSuYvVQRmLKzLhcCZkDvWgX
   g==;
X-CSE-ConnectionGUID: RTURcXHmR+q7ps4ZJgoGFw==
X-CSE-MsgGUID: FqAa2d43QnmGXQEpSDHb8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27083409"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27083409"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 10:08:55 -0700
X-CSE-ConnectionGUID: zTnGbDG/Tc2uyNQJMY6POA==
X-CSE-MsgGUID: KnBTbYCxSHWZ406V5oOVfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="79886196"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2024 10:08:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 885A220F; Tue, 08 Oct 2024 20:08:51 +0300 (EEST)
Date: Tue, 8 Oct 2024 20:08:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/4] dmaengine: Replace dma_request_slave_channel() by
 dma_request_chan()
Message-ID: <ZwVnI5ri_999mMpW@black.fi.intel.com>
References: <20241007150852.2183722-1-andriy.shevchenko@linux.intel.com>
 <20241007150852.2183722-2-andriy.shevchenko@linux.intel.com>
 <ZwQDtYYCyPyY9yPO@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwQDtYYCyPyY9yPO@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 07, 2024 at 11:52:21AM -0400, Frank Li wrote:
> On Mon, Oct 07, 2024 at 06:06:45PM +0300, Andy Shevchenko wrote:

...

> >  	 * Please note in any other slave case, you have to setup chan->private
> >  	 * with 'struct imx_dma_data' in your own filter function if you want to
> > -	 * request dma channel by dma_request_channel() rather than
> > -	 * dma_request_slave_channel(). Othwise, 'MEMCPY in case?' will appear
> > -	 * to warn you to correct your filter function.
> > +	 * request DMA channel by dma_request_channel(), otherwise, 'MEMCPY in
> > +	 * case?' will appear to warn you to correct your filter function.
> 
> It just change comments, why combined with dmaengine.h change.

Because this comment is related to what is done below.

...

> >  	struct dma_chan *chan;
> >
> > -	chan = dma_request_slave_channel(dev, name);
> > -	if (chan)
> > +	chan = dma_request_chan(dev, name);

Here is no more dma_request_slave_channel() calls as in the mentioned
comment.

> > +	if (!IS_ERR(chan))
> >  		return chan;

-- 
With Best Regards,
Andy Shevchenko



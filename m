Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825385;
	b=EsE2CP1WdPjO18FjOoMUHIDHTXqgHSAqXNKZkbmAv0gOKlZO80ZEPmqzs69ksS8q4KXS
	 hlCGQQ+BYZICiZJR9kGSMUT055/me7EQLXJhhwpXokf1OV9dDRQ1EFxLFNhEFEeBs5Yno
	 e5Mjbdd/BQ8FV/ScOnq1YoTKkPmAVotCh49iKoz2Cl02uXDQrTT24PL8nqi4Z5UH9Jmip
	 gELdUD6BECWfeERo/f38C+qk50+zImz2sx1EXdfHISz4jsbz9lkD6Jld3SYLNZosP3Be5
	 j/ltG2pl9IU0A6AQ5Dz3IhIiBgnn3fYiLsMqscA5ZqcNPkXAbyZFLi8McwrYxWseEag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825385;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=UMblCDkeaLJ4fgfQ6iI8HG5CBwVvaHr3bsDOTNNKxfs=;
	b=tNZUpGoy82+arS5lvys9hn4qJci7txC0O8Ot6J/USCbPRyRs+7OHHy4dj+dakXDwDsQ+
	 llAwFBwm3djHyRwx+G/mvDthBtb+s5X5lIVe2ZpIw2mmEap28As8TM6n/ducd2DBXrAZu
	 4h0liPci/Jf3OKmbXDTAgwq4RF9bgx+as3tJ/TjNHyKSiwWmkIk9IWaFuAisVX2H+0gzD
	 UPHaE6Grfd6fyOJRYzegbOBY1hD7TJEjyBeegZJrik7rwJpl7oyVKPxe6zFFoJqBwyjbP
	 DtAUTsS0UUZ4CJQyPxgG6CdIFfGYiDIt73F3dFENQtlzkzHlJukWa/KZNuY/1Tt8LNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BmTArU4P;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D945D606CA09
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 20:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D945D606CA09
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BmTArU4P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793825385; x=1825361385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JTdqZrMRPi6WcLGmJnwa/CJMl4RUCZus4mIGMek1G50=;
  b=BmTArU4PLciQsuQaWsj83LMbIlvlugcIi/qan22ZNk4144OEvVJ3s0aQ
   zua/n0ChL0NXCRh7fomWDWJipXWH8Ec/gps/7dk8wYihZlf8Fu0djxPpM
   85Ld71j/HpPlSSpNikhcaotx5Ick1Sb7WjSIivuM3lh1nFyCioZo9KoKO
   sJBj3aGYXAkUcjnNQFWvnxSm5LI54S4YX/cbyj7AtwSLVKMkoFLk0ZHhF
   NXIa2tnFKb6Xuo8uWFmoZq+/+dhkOvZs0nBJUhL+HZ1BUnECsZjL2Tjqz
   wx36QzrSeZ+q8QV2QeMxMuLGoyBhA1DUiVj5gpMV2oR82c6RWQADWrrHZ
   Q==;
X-CSE-ConnectionGUID: XPYPnNCYQi+4o8QIOiNIow==
X-CSE-MsgGUID: bm62ljWaSbaGScHkarHKig==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2635594"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2635594"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:49:45 -0800
X-CSE-ConnectionGUID: OcTARpEbSGOe3Qh4k5qXIQ==
X-CSE-MsgGUID: TWlF8PfzSsqQNcZHM0fkZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="8676414"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:49:42 -0800
Date: Wed, 4 Nov 2026 22:49:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank.Li@oss.nxp.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	John Ogness <john.ogness@linutronix.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Zhaoyang Yu <2426767509@qq.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] tty: serial: pch_uart: replace chan->device->dev
 with dmaengine_get_provider_device()
Message-ID: <auuaYxoZm2T25cU5@ashevche-desk.local>
References: <20261104145211.3209669-1-Frank.Li@oss.nxp.com>
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
In-Reply-To: <20261104145211.3209669-1-Frank.Li@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 09:52:06AM -0500, Frank.Li@oss.nxp.com wrote:
> 
> Use the dmaengine_get_provider_device() API instead of directly
> accessing chan->device->dev to get the DMA provider device.
> 
> No functional change. Prepare make to struct dma_device private to the DMA
> engine.

Krzysztof, this patch was a split from the bundle by a reviewer request (not me
FWIW), and author obeyed. So, you can do the same in cases when you got something
you want to review independently on other content which most likely is a noise
(to you).

-- 
With Best Regards,
Andy Shevchenko



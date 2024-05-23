Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108E921362
	for <imx@lists.linux.dev>; Thu, 23 May 2024 17:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716485539; cv=none; b=msqFi9hIMEXGNeOFn51yad+osBOzu+yVfUlD6Z/wZp1J+en73vdmau6xgHhs5vzJoRShgEjSEMdBkcg3PTpgx49gLdKjjPsXuAEeBU2d0HRGZ5KpSfuZ2Wi17UTfms86uVkfG/jbDloB2b6qIkdJK/D5p8Rz4C3jakN8E7cxQ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716485539; c=relaxed/simple;
	bh=uNcIGozZvpEAmR27nhSWVo+xVUOftbExVLTNqebYqjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiPG2kAJt3nhoTtCgFW3T9Qi0nbg5Vq/47P480ZoIFNoWQs1JPVWglnHxDBZOUKUmtn72eZNr4NzgyKKB4QxT53y7pUXBx8pXGpoRRcSI8kOAg5ZdXJ0rFWxgrr2tzZoVmRwAvhJote5d2MbMHsKRWBU8atVaZZTO6OFdMGhy5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dS+ek4Ba; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dS+ek4Ba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716485538; x=1748021538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uNcIGozZvpEAmR27nhSWVo+xVUOftbExVLTNqebYqjs=;
  b=dS+ek4BaPs5JM8tuCQ8BzJ7ryUTei2riwxUgU8OlspKfz0Vr0VtubO4F
   BbSetM5BPG+nooUs/anvm49VyeMXpPII+uV/6jVMSS4ZFRYz/nmOPt+O9
   CRJBgjrjl0csLiZsmQ9IjKzoLABLSeXGnJzOaJ/LQqI5kd22DFNCU/fwD
   Uz6D/dU5628D5Uhv+KNvLV3UkiNKR7pJHD2wRu8MZm0thxPoikcOWZTus
   83UIjtDV/gJZ66vThWi1uVDwBUmdzpeGBtaXiIXXBwVbbiRTlkiP+eqO1
   3kozLCnX/bZVHHPj/OQt5ulFALQGLR1OV9YYbHpQUcyk4KYB8h9XiAdS/
   w==;
X-CSE-ConnectionGUID: kk/w6qdUSgOmtm9M+mR+Hg==
X-CSE-MsgGUID: xoWkiB2lTSWEV0/2qojgWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12673170"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="12673170"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 10:32:15 -0700
X-CSE-ConnectionGUID: xt+TKiz4TyavmPMvRJ7mUQ==
X-CSE-MsgGUID: 9Eeg2aYeSdigM9bHUEo3oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="33712668"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 23 May 2024 10:32:11 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 23 May 2024 20:32:11 +0300
Date: Thu, 23 May 2024 20:32:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/4] drm/imx: fix -Wformat-truncation warning in
 imx_ldb_probe()
Message-ID: <Zk99m4i82XnQPeKQ@intel.com>
References: <cover.1716479340.git.jani.nikula@intel.com>
 <c257c4174743f35bafee8492ec60e1d2734450cf.1716479340.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c257c4174743f35bafee8492ec60e1d2734450cf.1716479340.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment

On Thu, May 23, 2024 at 06:51:08PM +0300, Jani Nikula wrote:
> Enabling -Wformat-truncation yields the following warning:
> 
> ../drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function ‘imx_ldb_probe’:
> ../drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:57: error: ‘_sel’ directive output may be truncated writing 4 bytes into a region of size between 3 and 13 [-Werror=format-truncation=]
>   658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
>       |                                                         ^~~~
> ../drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:17: note: ‘snprintf’ output between 8 and 18 bytes into a destination of size 16
>   658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If only the compiler could count to three...

> 
> Silence the warning by checking the snprintf() return value.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> ---
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
> index 71d70194fcbd..46f779fe60ee 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
> @@ -654,8 +654,12 @@ static int imx_ldb_probe(struct platform_device *pdev)
>  	 */
>  	for (i = 0; i < 4; i++) {
>  		char clkname[16];
> +		int len;
> +
> +		len = snprintf(clkname, sizeof(clkname), "di%d_sel", i);
> +		if (len >= sizeof(clkname))
> +			dev_err(dev, "clkname truncated\n");
>  
> -		snprintf(clkname, sizeof(clkname), "di%d_sel", i);
>  		imx_ldb->clk_sel[i] = devm_clk_get(imx_ldb->dev, clkname);
>  		if (IS_ERR(imx_ldb->clk_sel[i])) {
>  			ret = PTR_ERR(imx_ldb->clk_sel[i]);
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel

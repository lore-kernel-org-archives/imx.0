Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121633;
	b=5KlxoVAFg3wdvQfdA65K3cW3RAlK194HXVB2FYxMBiO84nzoBtD616GkEfERGxL8/wQ1
	 EgeQ8I/T1X8JgkSA4DVE5/hiAQr3LRUVYrNxN4yrMiqF//eKk3nMTjI0aQUm31YGN6N+J
	 yoqAVss+Xg1GDu1OR0TLA7CvxuADBOf4G88NlyUsSesuFvOUOWhwR+gJzf1fAtUEG+F04
	 ZCZPDyDPLtxmpHhNT92qgamTnQco8t9t0tSkgvhrOGGI2MzU9XA5/L9x0MYIRGi0+P9kE
	 8UfvhqenJJAYCl38SWWT+RwpVlvNbRnvvxeRX+4+kmWoThBxBa8yzta+zfHCEaPe04Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121633;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=/zyFtue2Pu27Krmvp0xJdBDSYvJgKl9E6IP3y2DGTns=;
	b=AYZl5mVz6tyYCj8tOAN8j83PDeOE3JKqs15vGnPFcExQKM+2Zq3iy38OykGnWIvGDA3i
	 XORS+XnY0ufFh4ZA0573ugWg4LPezSGh4p5/IEstY1Ro19T7xUadkTJDFG/pjn8M7diXF
	 1oV/P9lbCApfj+S3n34sRMBDB4ssNr0gCAeUuZB/xYOOu064YuJLNPSHoSu25k7PI1L6l
	 U4Nbez/xIYkYudAxc3ncgC2e2xoSjUcVCQsOx/aI16YwBn0n9Ui87H5j1tQMhi3zHjEHw
	 NGU5WX93DMt5i3XGThehfp4sd4fMBykuvS5XGH7Po9kBUu5kGoPLUy3XdUY7KHv5Ayw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ICYjvFQN;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33796606A901;
	Thu, 19 Nov 2026 20:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33796606A901
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ICYjvFQN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795121633; x=1826657633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hxtu6n6hjdoIS8OVHUKESNiwIThZujrt8bph7b+Fd9s=;
  b=ICYjvFQNmGXLKT8lJzORh2ddjFYCo9FP4DQi6xU3/yJUAA/EVDMMwtnW
   Z3/qGtN6wfv3hNHInCrrHBmZeBxwAtlvuf+8f6gz+X4HCtTiOKzpuVEfh
   MmNVbUecTZS2dUj41oFJTL9H7XC2ItuUq1b5EAit17eO29kmAi4LQ/qz/
   LyS82lTZ+XLfHSzYb6N387rBG8eHTySMRX3ZVI+l2mCOyDE8wvhpeLgJn
   5+sKf+hr7thOFFFEYADMmchY7Vdqx2MX2K9KIabNiAhCp9lEJsB+zrwco
   rkffzx4V4xW4Oy91L5VF2oDyJwuVsjH8LrZcxCp1q2ftOUFYujfRSSBbL
   A==;
X-CSE-ConnectionGUID: 5Po2nrPjQBSNI2rivwI4XQ==
X-CSE-MsgGUID: uknPEPSwTOqIFk6fWppdhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4030861"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4030861"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:53:53 -0800
X-CSE-ConnectionGUID: hWs8F2miRDaxOkKoxt/sNQ==
X-CSE-MsgGUID: XLcUR0atQcuadVeix+2yww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12511975"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:53:49 -0800
Date: Thu, 19 Nov 2026 22:53:46 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>, lee@kernel.org, maz@kernel.org,
	andy@kernel.org, jic23@kernel.org, dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org, mfd@lists.linux.dev,
	linux-iio@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, crofts@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/4] mfd: mxs-lradc: Convert to devm_clk_get_enabled()
Message-ID: <av9h2jvAwBPXdNmX@ashevche-desk.local>
References: <20261119134041.16611-1-festevam@gmail.com>
 <20261119134041.16611-4-festevam@gmail.com>
 <av8gvfhOJ_2PdEMr@SMW015318>
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
In-Reply-To: <av8gvfhOJ_2PdEMr@SMW015318>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 19, 2026 at 10:15:57AM -0600, Frank Li wrote:
> On Thu, Nov 19, 2026 at 10:40:41AM -0300, Fabio Estevam wrote:

...

> >  			dev_err(&pdev->dev,
> >  				"Unsupported number of touchscreen wires (%d)\n"
> >  				, ts_wires);
> > -			ret = -EINVAL;
> > -			goto err_clk;
> > +			return -EINVAL;

^^^

> >  	if (ret) {
> >  		dev_err(dev, "Failed to add subdevices\n");
> > -		goto err_clk;
> > +		return ret;
> 
> If need respin, return dev_err_probe()

And above and who knows how many more. That's why I haven't commented on this,
if ever we do this, it most likely should be a separate change for the whole
driver.

-- 
With Best Regards,
Andy Shevchenko



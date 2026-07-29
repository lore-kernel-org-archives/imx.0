Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2342512C8
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 22:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785363404; cv=none; b=pWIwr+q4lovHTPG8A6EsXQq9xte2OvqkQ+2S3I0CQnOK5izZ40B0FonFAiYz0ouos1LhbELcMo/kC9p+soETMrbtY12a9PDAJCRsx4fXjRYKwPXBUcrnsdkEOzOSwRUm8S7Oy/5Wfprkhse85EcnXQb0wjisTJ2x77VAb35ohHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785363404; c=relaxed/simple;
	bh=b3JRQnveXzP6UUjUquq9YW29KWaKGru+yPHH4nB42m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNj7Hyalzh1Y3vGNaLL4Q6gmRp2zj3eYrhzBG3ifE7/pjc0ot5ZnYYrBjUMP6YnPuYgQdLULkj0wzAZUurAkXBaJNGwm6x9yaW5Iuxp77H55c/L4jRiM6Iz3GudsX1cRArof0w46PR4roaPZVccEbxkMsVYtQENHB97YCoZbPdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=En3vxeBy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="En3vxeBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785363403; x=1816899403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b3JRQnveXzP6UUjUquq9YW29KWaKGru+yPHH4nB42m0=;
  b=En3vxeByBzvlcGcGTOmQ6UyEv6GBpoZxcge5v+IuJmMh03zcAqBvftFv
   bNmelifaDhXjYaucCsq896pWpg/kFsaBenBIMqI29bPy4cs61nvrqLlfa
   uTvw04/G1NvjQtTXBQY7TMlH6gFbpir0NaoT3iBQm/1z64Doi0VL3feIz
   1W7zbpU4nOHs4Q8EaSc69YFgc95GA9lNz1/ZH93LGxzfJcXoM1/ZADLWY
   +oONlXiNrVdLd/UTyaMZabIgbx8AcPCpQXTCCp+Pszs7MdWLL7D7ZF1XV
   xO/mg0LDQ3MEt91iuZueRy5WBPfASiEaNzv0YqUBQuJPiJDvplDVPuM9G
   A==;
X-CSE-ConnectionGUID: qxziD1NjQuO8wYF3RgAazA==
X-CSE-MsgGUID: s3Zjw3s0QE+Kam3M4toefg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85854180"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="85854180"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 15:16:42 -0700
X-CSE-ConnectionGUID: jEFDDnlUTqCiqv9htaeRcA==
X-CSE-MsgGUID: MeOVygYKT06ki+q1aZl5zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="283470014"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.90])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 15:16:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A490D11F8BD;
	Thu, 30 Jul 2026 01:16:38 +0300 (EEST)
Date: Thu, 30 Jul 2026 01:16:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Frank.Li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, hverkuil@kernel.org, imx@lists.linux.dev,
	kernel@pengutronix.de, krzk+dt@kernel.org, martink@posteo.de,
	mchehab@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
	sebastian.krzyszkowiak@puri.sm,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: hi846: Fix hi846_write_reg_16 handling
Message-ID: <amp7xqJGfhOeKaoU@kekkonen.localdomain>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
 <20260712115553.92564-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712115553.92564-1-mitltlatltl@gmail.com>

Hi Pengyu,

On Sun, Jul 12, 2026 at 07:55:53PM +0800, Pengyu Luo wrote:
> hi846_write_reg_16() does not clear a positive *err value on success.
> pm_runtime_get_if_in_use() returns a positive value when the device
> is already in use. When hi846_set_ctrl() passes &ret holding this
> positive value) to hi846_write_reg_16(), the function returns with ret
> as is, the positive value propagates back as a return code, which
> callers interpret as an error.
> 
> Fix this by resetting *err to 0 only when it is positive.
> 
> Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/media/i2c/hi846.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index a3f77b8434ca..7f069aca0fce 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
>  	if (*err < 0)
>  		return;
>  
> +	*err = 0;

This should be first (or at least before non-fix patches) in the set.

Can you also add Cc: stable, please?

> +
>  	put_unaligned_be16(reg, buf);
>  	put_unaligned_be16(val, buf + 2);
>  	ret = i2c_master_send(client, buf, sizeof(buf));

-- 
Regards,

Sakari Ailus

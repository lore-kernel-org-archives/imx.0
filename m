Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF912D73B0
	for <imx@lists.linux.dev>; Mon,  3 Nov 2025 08:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762157034; cv=none; b=olnjZb9JbFf6uaPOSD9ZIs7HEvOwzdFl4BpdR10BqEFl9RQr020nYvxCo3Imz9OPm3nFuRRH8RR2Rk1giTMThNC2BVYPG/6ZZOJxCkecr1/Btudh6HoGihpiDBhd5UKObQHBUBOu6hajG98UQFCvRCSLeNXeyBoUkk0cTYiavzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762157034; c=relaxed/simple;
	bh=5pXyRXIxVt0Iau8mWou9oXadjFJmaZdgpbKlkoLVbSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUXaCZtYhiWEbqoW01lh2j2f9eM2qTyTZMksau9KaQBZfMKQaquiIC84cCxZFOCpxhusqfF2XMrAV7VQCYWZDz7+JphBgbD7kWU21PZBtTJGHKOewwaf6uIz8HY9RyVoX8uaBjdXsqD6vFOjdWcNFpuRf8fjLt8/cL7DVKO2jjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLzwhkf6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLzwhkf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762157032; x=1793693032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5pXyRXIxVt0Iau8mWou9oXadjFJmaZdgpbKlkoLVbSU=;
  b=DLzwhkf6JVtn5aygnbhHB9zYbfO9dnSoPkNSp1SpCq4UGOTRGGCPwhGH
   U2ux0/j0ZbeBeaOv3AdzrxHACPQP65Vwsxq+CZhR6l0QkHoHTzicNrhXR
   shg3KEjxQ6cuSwt8em6lMjP9nt1sbLhx3SchVWNi0m3no/95/y5zsAqey
   bn6O2BFEt0KWmd5ugh7mpZWFy9zWlyh0nifVBezZfupI0/VURnXo5z1S8
   Ok+YdKx8t9xue71f8yLwPfjTVBHP5+EydkDgOodmgCd0oDrx6LrASTTvK
   riiEeWGsS6MDPj/Qrm4/CTpeAJfQQEyIkRP/KktXa1+yldfeoi9CjZGl9
   A==;
X-CSE-ConnectionGUID: 0EwRBFzNSpqUy/j+U2nQ1Q==
X-CSE-MsgGUID: 9mdA9SoGTP6OuDjOh2FIxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64143994"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="64143994"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:03:51 -0800
X-CSE-ConnectionGUID: W2KynLE4QPibqsxiZlCTFg==
X-CSE-MsgGUID: x44oWC41SpWrm2y4Xsghpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186042022"
Received: from smoehrl-linux.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.216])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:03:47 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vFpXQ-000000055GF-3PTd;
	Mon, 03 Nov 2025 10:03:40 +0200
Date: Mon, 3 Nov 2025 10:03:39 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org, linux@roeck-us.net,
	Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v9 4/6] i3c: master: svc: Add basic HDR mode support
Message-ID: <aQhh2zZVxh1oVuJz@smile.fi.intel.com>
References: <20251031-i3c_ddr-v9-0-f1e523ebaf78@nxp.com>
 <20251031-i3c_ddr-v9-4-f1e523ebaf78@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-i3c_ddr-v9-4-f1e523ebaf78@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 31, 2025 at 12:39:16PM -0400, Frank Li wrote:
> Add basic HDR mode support for the svs I3C master driver.
> 
> Only support for private transfers and does not support sending CCC
> commands in HDR mode.
> 
> Key differences:
> - HDR uses commands (0x00-0x7F for write, 0x80-0xFF for read) to
> distinguish transfer direction.
> - HDR read/write commands must be written to FIFO before issuing the I3C
> address command. The hardware automatically sends the standard CCC command
> to enter HDR mode.
> - HDR exit pattern must be sent instead of send a stop after transfer
> completion.
> - Read/write data size must be an even number.

...

>  static bool svc_cmd_is_read(u32 rnw_cmd, u32 type)
>  {
> -	return rnw_cmd;
> +	return (type == SVC_I3C_MCTRL_TYPE_DDR) ? !!(rnw_cmd & 0x80) : rnw_cmd;

This seems confusing. Either !! is redundant (which is actually the case) or
I don't know what the idea behind this.

> +}

...

> +static void svc_i3c_master_emit_force_exit(struct svc_i3c_master *master)
> +{
> +	u32 reg;
> +
> +	writel(SVC_I3C_MCTRL_REQUEST_FORCE_EXIT, master->regs + SVC_I3C_MCTRL);
> +
> +	/*
> +	 * Not need check error here because it is never happen at hardware. IP

If you move 'IP' to the next line it will be better to read.

> +	 * just wait for few fclk cycle to complete DDR exit pattern. Even
> +	 * though fclk stop, timeout happen here, the whole data actually
> +	 * already finish transfer. The next command will be timeout because
> +	 * wrong hardware state.
> +	 */
> +	readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS, reg,
> +				  SVC_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> +
> +	/*
> +	 * This delay is necessary after the emission of a stop, otherwise eg.
> +	 * repeating IBIs do not get detected. There is a note in the manual
> +	 * about it, stating that the stop condition might not be settled
> +	 * correctly if a start condition follows too rapidly.
> +	 */
> +	udelay(1);
>  }

-- 
With Best Regards,
Andy Shevchenko



Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ADE2ECD1B
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761207829; cv=none; b=uzvHxku1lL3VgRITdDNs/KtLfuZ70WYEe1YRXZ5OhJ0XmSFOPO7T9sItgvAove3/ARU5hJXoTm2mISAt4eJ3dFUCTSvo7A0hAvT2AVuKMR9d/vJloR3cXhiiu+jFgx3qs7G1mMtG034/GA/XvtIzg82ux9FEPAckLRPS88sEwLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761207829; c=relaxed/simple;
	bh=ptxKv8x6ylevA5yI5wa4vryf/6lVRy0gbUbnxJJtU2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnT3KEs10TQkod9lQEYvjGLL5QLWqVip/v203k393DW/fpWxqoZE/U3AeYxKmNwP5owW+nZLHrOEYigWWCP0VxVYlj3NGk3GQPflKZL2HLzxOc5fwj8JTGSXik7m2ztzqfEWft9MQm0PB79niqRj6ct9iCVD+5lAeNp25+t5Zlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Of4HBJfI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Of4HBJfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761207828; x=1792743828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ptxKv8x6ylevA5yI5wa4vryf/6lVRy0gbUbnxJJtU2c=;
  b=Of4HBJfIEpYWgSFXoOz/5dGOwwalc5BxtKMulosS5zXxYYMBbV++Fj3n
   tU6cIkGQS3Ln4CjYPGIIIdrjcude0K0p48fAmrH1dFJ559MB//mgo0GpT
   9E6Itfc1hKhR6ou/7RDinZecSabpJpIuaNF9bBDa9WU11csOoBbebrKjU
   c0joU5uoxjlgwDDfMTmdU14F+ILhQS4kXFYYUPnLgdNqciS9iRl4eO0oq
   hn2g2dW0p/Y/GHMmeF+BGlEwSdh0KGmCLNUbU/sfAspoyXzDAkNJ+BfYV
   mSyEpFjPC07UCiDD+fcpuspz9e4aw/Y39uS5lVnLkSKjkiyJco0xCmPME
   w==;
X-CSE-ConnectionGUID: HaqQFBJWTT2aBYFQ/y2C+w==
X-CSE-MsgGUID: DXPoDjh8TSenYkBL1PlepQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63408197"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="63408197"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:23:46 -0700
X-CSE-ConnectionGUID: xewb7CYnSHm2QYHap8wVgA==
X-CSE-MsgGUID: lpfHCmtBSPKbcNs6POSKHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183270380"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:23:42 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBqbj-00000001tXy-1owL;
	Thu, 23 Oct 2025 11:23:39 +0300
Date: Thu, 23 Oct 2025 11:23:39 +0300
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
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/5] i3c: Add HDR API support
Message-ID: <aPnmCwwZVZ5egqkP@smile.fi.intel.com>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-1-3afe49773107@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-i3c_ddr-v6-1-3afe49773107@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 14, 2025 at 12:40:00PM -0400, Frank Li wrote:
> Rename struct i3c_priv_xfer to struct i3c_xfer, since private xfer in the
> I3C spec refers only to SDR transfers. Ref: i3c spec ver1.2, section 3,
> Technical Overview.
> 
> i3c_xfer will be used for both SDR and HDR.
> 
> Rename enum i3c_hdr_mode to i3c_xfer_mode. Previous definition need match
> CCC GET_CAP1 bit position. Use 31 as SDR transfer mode.
> 
> Add i3c_device_do_xfers() with an xfer mode argument, while keeping
> i3c_device_do_priv_xfers() as a wrapper that calls i3c_device_do_xfers()
> with I3C_SDR for backward compatibility.
> 
> Introduce a 'cmd' field in struct i3c_xfer as an anonymous union with
> 'rnw', since HDR mode uses read/write commands instead of the SDR address
> bit.
> 
> Add .i3c_xfers() callback for master controllers. If not implemented, fall
> back to SDR with .priv_xfers(). The .priv_xfers() API can be removed once
> all controllers switch to .i3c_xfers().
> 
> Add 'mode_mask' bitmask to advertise controller capability.

...

>  static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  {
> -	if (!ops || !ops->bus_init || !ops->priv_xfers ||
> +	if (!ops || !ops->bus_init ||
>  	    !ops->send_ccc_cmd || !ops->do_daa || !ops->i2c_xfers)
>  		return -EINVAL;
>  
> +	if (!ops->priv_xfers && !ops->i3c_xfers)
> +		return -EINVAL;

I would find the logically coupled proto-based xfers:

	if (!ops->i2c_xfers && !ops->i3c_xfers)
		return -EINVAL;


>  	if (ops->request_ibi &&
>  	    (!ops->enable_ibi || !ops->disable_ibi || !ops->free_ibi ||
>  	     !ops->recycle_ibi_slot))

>  }

...

> -enum i3c_hdr_mode {
> +enum i3c_xfer_mode {
> +	/* The below 3 value (I3C_HDR*) must match GETCAP1 Byte bit position */
>  	I3C_HDR_DDR,
>  	I3C_HDR_TSP,
>  	I3C_HDR_TSL,
> +	/* Use for default SDR transfer mode */
> +	I3C_SDR = 0x31,

Why has this a specific value, while the rest have not? If it's HW mandated,
the all of them has to be assigned properly to avoid potential bugs.

>  };

...

>  /**
> - * struct i3c_priv_xfer - I3C SDR private transfer
> + * struct i3c_xfer - I3C data transfer
>   * @rnw: encodes the transfer direction. true for a read, false for a write
> + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
>   * @len: transfer length in bytes of the transfer
>   * @actual_len: actual length in bytes are transferred by the controller
>   * @data: input/output buffer

>   * @data.out: output buffer. Must point to a DMA-able buffer
>   * @err: I3C error code
>   */
> -struct i3c_priv_xfer {
> -	u8 rnw;
> +struct i3c_xfer {
> +	union {
> +		u8 rnw;
> +		u8 cmd;
> +	};

What field is used to distinguish the union member in current use?
In another word, union must be accompanied with a selector.

>  	u16 len;
>  	u16 actual_len;
>  	union {

>  	enum i3c_error_code err;
>  };

...

> +/* keep back compatible */
> +#define i3c_priv_xfer i3c_xfer

How many of the current users do this? Can't we just rename treewide?

-- 
With Best Regards,
Andy Shevchenko



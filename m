Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353751;
	b=p887ukLrl4EbitDvX4kcjS7xZl/bqwOW6GX2V/uy44Lfr2oG+Ww5hKZQwby5X/v64/UV
	 IuiTFl7Hmg8dMTlfZJFiVJRwk+mtM+vU6PMpVdYjd1FlFOHPgFWBW3P4DM2JZ/aXACiGu
	 1yTeAzYlTWoZhpL2F+/vfrw3QadNirRW+qgZGmRhmaVUKXvZQCpKfe90Iom8UU8G0JR5P
	 GyhaokdkAcyaYfkbZe5UEfEFEk3GUWbGPg3XgQuod4v2MRAsXLkIAzyWdhMpBKIKiKHRW
	 EShgOdTIeKxvq8JnyWYdS7RO+TMP+9nGsP2WQzJmQo5I0PmTbWsIbtUfxhLsEwytsoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353751;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=6ZOljdu8PCNHDLPQ7ccqFPbKaSthLFzVQZs1PlArnbM=;
	b=n7RboRU+9hUO5C4iBqwr8/PbrtNMk0G8s50h1lVrck0Cy45mg24VbHhBt2aW255V3kQS
	 G4wifrzkm2rhdkPrPJQeOvX9PvGyXMZsoAk7svPKhEho9ZCNAXj/Xiw4kTAf6E/FSDeHU
	 YEtGNGTrfY1KZZqSnIN8O+QY3fbedSvQS36MQUlDF5Mwl7XOXvlAFU9X4I/ivosbbzZdY
	 FpPEFwxSViuegaFZDa3tPLtdyn+ueQZj771vbnsttuLAidw0JV9vKQ9/Reo94XXE8JtW3
	 bUSU22FxGabYd5rRRHzWRJuLWQINUD5JqwRhsAKf1Wacnrx9SjJsSasC/SbRu4W/9Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MO3gD3bq;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C6606A33D;
	Fri, 30 Oct 2026 09:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 834C6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MO3gD3bq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793353751; x=1824889751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fOyskiLXbaCfkBWt175bxZvK8XJFZ16jsOxbYDqe0W0=;
  b=MO3gD3bqhoqbZEpunGBxUIdWnv0SZdtMvVWvgwLV1f66YsRn/ICUvLcy
   i5bs0FuDnj4FIDB9ARQxATPnVZUQKdXHFpqHxvgGecucGWjvKqzxsrT7A
   ASxua0l+TOZWPB2ND08tq1Hsxk+2DotkxWJGVfgRqK+VvmrTmXgoYG6jw
   QXjtvbTGXlT3KVBO4sQ9JI+h8cs/LyuYKzbzNJckSizgSLVtNcjeIc3Hs
   Ji2aod6pT22WJaeOugAY5B7Ovjixrj7YIHdhD2Ia4ahzhnfteThEpNHDh
   lbJTU7yL0CEhKPPXsK8c0Ua5APaKW9QxaoIGme6Fhgvfj2m97+s/dd968
   Q==;
X-CSE-ConnectionGUID: LgymQRafRpOn2XAymZ7v7Q==
X-CSE-MsgGUID: LBhccRyqRS+9FxN+w2m4nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2144612"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2144612"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:49:10 -0700
X-CSE-ConnectionGUID: MM6DeHpZRfq954A8xK+Xlw==
X-CSE-MsgGUID: +7g8jGl5TraXtiM2AUHwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5733794"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:49:05 -0700
Date: Fri, 30 Oct 2026 11:49:02 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Andy Shevchenko <andy@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 2/2] mfd: cgbc: Allow compile testing
Message-ID: <auRoDuFUMLsjgIvo@ashevche-desk.local>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 30, 2026 at 08:11:39AM +0100, Krzysztof Kozlowski wrote:
> cgbc-core.c driver does not use any X86-specific headers, so looks like
> it can be build tested everywhere for increased build coverage.

Yep, good one.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



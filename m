Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535662D249A
	for <imx@lists.linux.dev>; Mon,  3 Nov 2025 08:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762157725; cv=none; b=svA46D0V7XNrUyxCwyDInNRqGZqTNI0fjEkZn+c2E6qyciCErqZ0cofg1LfEoWEsmUnzRt50SKqfO9cs7ErYo+KKqA5Si1AidlXd2to05f22bNXZa6g76h2c1+gvjhIPwf8N/dqVJ1Zy7M4IBTDM02tnm9juvnXR6KowOJYwTn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762157725; c=relaxed/simple;
	bh=VufkWrtuA/KSjpuq1x6sOOrO8BVr8XELL5F/FJgAris=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqLqxgKcYKi8tjNzr6yxZ50F0oE0e2R10zcT5/23VJjnb3GZx3qY+PMZOwRYxwGDhYMrwudlX9Zb1g6KuxfT62bwREghdxb+l+ih95D/2XKwYPkpKUhBgXu00XBirMosgA7TaS9GX72VNSFnF0VczqdlrQoHiKFXBgVrtKU2Cf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdMTjMM/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdMTjMM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762157724; x=1793693724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VufkWrtuA/KSjpuq1x6sOOrO8BVr8XELL5F/FJgAris=;
  b=KdMTjMM/rsvbiB3ygy1NfkWkNEH0xvktl0toKV1+N5MfoU6S2iWWW4dB
   wxRZCashaKLOinfGAMXf2CUKMXYYvFhh69rZswifPeowQUv7DGl46C4LR
   hIVGfrxXeC6qDljvnMJ0waGYgPz0vNJM1z1mQcA4hBQZzDKPosJi61v4S
   GZJAU1JSfGSjakpCo5d7sltFWm7D3z3gf5s3WPUepkh+7tv5/5e+22qr+
   +Rkg1aM+4qM/2zDCsyHUKToABsk4aOqPwm6jyGAjieMyEmIzQ63uetrGz
   ddCLrZQxInW44IDXMCBRsD2+pucQ6MtTN+/JpJt5tl7vMsSLTx7NSIY+j
   w==;
X-CSE-ConnectionGUID: go+i0vD7Q62JkQS8ytEyDQ==
X-CSE-MsgGUID: WmqrAO0rSziFWEGlnfndzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="63432657"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="63432657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:15:23 -0800
X-CSE-ConnectionGUID: xxrSDRuvS4a2Km8/zCjM/A==
X-CSE-MsgGUID: jgG0tFbES6C1Q/WdN6bt/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="191914908"
Received: from smoehrl-linux.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.216])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:15:20 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vFpib-000000055PN-1HjE;
	Mon, 03 Nov 2025 10:15:13 +0200
Date: Mon, 3 Nov 2025 10:15:12 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org, linux@roeck-us.net,
	Carlos Song <carlos.song@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v9 0/6] i3c: Add basic HDR mode support
Message-ID: <aQhkkEh5C6vl2nbT@smile.fi.intel.com>
References: <20251031-i3c_ddr-v9-0-f1e523ebaf78@nxp.com>
 <20251101162525.44c9862b@jic23-huawei>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251101162525.44c9862b@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 01, 2025 at 04:25:25PM +0000, Jonathan Cameron wrote:
> On Fri, 31 Oct 2025 12:39:12 -0400
> Frank Li <Frank.Li@nxp.com> wrote:

> Assuming everyone is happy with this version,

Almost. Some nit-picks, but the main comments are:
1) arrays out of a single entry;
2) seems unneeded calls to regmap_dev_attach().

-- 
With Best Regards,
Andy Shevchenko



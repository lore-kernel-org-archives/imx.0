Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A4231BCA6
	for <imx@lists.linux.dev>; Mon,  3 Nov 2025 18:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762193464; cv=none; b=OdnbpAGZRUvmnRrIBjVO/BhPY80SGMkYCDGoOSAiMLqH8LAaevdTqGNioEJpjlA+uMvRopAQ5hHFWUNijmS53fXbK3lqfyuhC+BN6EAvdvEqCCaBWFbyxO7FlVSwImOKD3kaUP0SWCYhZc81SzxNn5cldS98WeWwdK8eH3o7fWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762193464; c=relaxed/simple;
	bh=va05Mvt1eD6PFtFEKUpfUa5jMNLoaEZADG41u4Ql/M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7i/r3mVqUqiPGFAyT0M1Jhca6wH2JtGGbVuA+smuqT8w506PmXcJq7Q4AAlg8MbtgZdYMHMJ79n1qQ0dRrIKr8bI8Pywx8ljItP0A6TMGJo8d3qwM4HzLQw56k54fOgnyl4LedSuAnjckynDJWd9BZ2h83rFGnUxr+mXIEE9C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwdAN9F7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwdAN9F7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762193463; x=1793729463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=va05Mvt1eD6PFtFEKUpfUa5jMNLoaEZADG41u4Ql/M4=;
  b=FwdAN9F7nalUZA8a282GtOuyq/+iuBPoTDVgDAEYdp+nUV6mlCY0yHvQ
   qvvAx4H1UgHdaiXRIo2LyaTptALI7vEE0U+nM4zVE0z4TOLveLQ023VGi
   hV0F9l4oLEPdrTjlQa1yQnlt7MbFwqhPjWwHpz49Xj+hPefELIGJAWSDj
   kzAp6soXiPwwfGtvlhAZ8iedMLU7sG2BrmHggXrU1UJuAx+ItbZPxzCzZ
   4nuNBlWo1VuVuVLkr4K9PB33VH6O1Ml/hf5AOCOKCTLbv2e8kuYAm+BKp
   waDcs/Z4uvhL8TmPGcgye8NwIHrGuGkqX/a2w02KbORdQp3DY2YOsICLG
   A==;
X-CSE-ConnectionGUID: fFKPjS70Qq623ya8AT++Bw==
X-CSE-MsgGUID: wgOYI+RpQzCrhtI7AjaGlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64195552"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="64195552"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 10:11:03 -0800
X-CSE-ConnectionGUID: lYK2nm35QX+me1Q/Ii1pxg==
X-CSE-MsgGUID: c/gQnkyGRYa3OAlETYavtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="187083144"
Received: from smoehrl-linux.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.216])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 10:10:59 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vFz12-00000005ERt-0H0D;
	Mon, 03 Nov 2025 20:10:52 +0200
Date: Mon, 3 Nov 2025 20:10:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.li@nxp.com>
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
	Carlos Song <carlos.song@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v9 6/6] iio: magnetometer: Add mmc5633 sensor
Message-ID: <aQjwK2IC1NML2w5F@smile.fi.intel.com>
References: <20251031-i3c_ddr-v9-0-f1e523ebaf78@nxp.com>
 <20251031-i3c_ddr-v9-6-f1e523ebaf78@nxp.com>
 <aQhkRmtJMoB7vv8U@smile.fi.intel.com>
 <aQjQ4jsG6Gc2u3n+@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQjQ4jsG6Gc2u3n+@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 03, 2025 at 10:57:22AM -0500, Frank Li wrote:
> On Mon, Nov 03, 2025 at 10:13:58AM +0200, Andy Shevchenko wrote:
> > On Fri, Oct 31, 2025 at 12:39:18PM -0400, Frank Li wrote:

...

> > > - 1 -> ARRAY_SIZE()
> >
> > Maybe I missed the answer, but why are the arrays to begin with?
> 
> I3C/I2C transfer API required pass down one array. Keep the same coding
> style with existed one, like
> 
> source/drivers/base/regmap/regmap-i3c.c

I can understand why it's done there (there are read and write and they use
different amount of items in the arrays). But here in your case IIRC there
is only one function that uses predefined arrays out of a single entry. So
I do not see a justification for having an array. OTOH it's not a big deal
and I leave it to Jonathan to decide.

-- 
With Best Regards,
Andy Shevchenko



Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B512749EA
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761243910; cv=none; b=UPSfPjPRVDvN1Exq3bFEBDliiOD+n9DbOY7tFIfxhWhVnyEWE4DayPvLfWPvMd4yDbVecMJNYmVW/uC/QphBSdOdH1AP2QgiZVXyKUjhRhf1wBGnx8uduHYews7Gkw3F7ZMGpFNLJMbq0GXlL4t2lwVekoNup+AXSzaFJlarE0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761243910; c=relaxed/simple;
	bh=zwCmN86sqMbHXrITH7YOhA0fPI1EnrI6nXVZagQBh7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMQmKbVv2BQ9FDzfzDkOnQt1yT9RnWJtwGou+o2x+hCOknsei1e0ZPFGecQt/FnMFnoel3+WkjHL1QU/vC492qOCESLl4rbzCQw9rWpG+z0TPz00SBYx5JNmSDvod6bk4b/LkLct/3QHDdWvfPbAFCax8PakYI1qsy5xsy7z4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyxVmd0w; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyxVmd0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761243909; x=1792779909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zwCmN86sqMbHXrITH7YOhA0fPI1EnrI6nXVZagQBh7I=;
  b=cyxVmd0wnxAeY2o5Ao4cRe2A3PCFaQ7FtaKIbnwaPbro5t5fXGaPTsTt
   IAM10u+C3+UNeDtAzlz8Xgcyw4Wqpeue4hK6NKhiRHkLEH32cluVDG0Rd
   FjG4+pqbAl+hmg5UTsOr+rCZx2dnTOkDkhKnhlyiDTpLse1UzN1i00Q57
   WAZobOrymrqz5YxwdRYn06+A0pF79kuP1JVxYNpOGiF4KiPaJpbpPtgbz
   YppahVxdWQ6bFpYGa1jvvmBAe5LWl5EL7KSElY2sUmea7wQdN9lTIjdBV
   G7/pwQ/4z6y0KUwIpMbUApbkQ6bAqU2PTHPFTsOWk1aBOLkzFmx+qu+iS
   g==;
X-CSE-ConnectionGUID: p2Hf0V12SU6m9XZU1mgHJQ==
X-CSE-MsgGUID: PRkcx5GjTmero5TkZTODeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63461193"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="63461193"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:25:08 -0700
X-CSE-ConnectionGUID: rZGXvA+rTRisloNEidpLPA==
X-CSE-MsgGUID: 4eRJcodlREGrhOmUXQuDVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="214884102"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:25:04 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBzzg-000000020qc-1HGR;
	Thu, 23 Oct 2025 21:25:00 +0300
Date: Thu, 23 Oct 2025 21:25:00 +0300
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
	devicetree@vger.kernel.org, Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v6 3/5] i3c: master: svc: Add basic HDR mode support
Message-ID: <aPpy_FNh0DB_1x-w@smile.fi.intel.com>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-3-3afe49773107@nxp.com>
 <aPnngQdwEqHgPc7R@smile.fi.intel.com>
 <aPpIkqjeWsi7xAAn@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPpIkqjeWsi7xAAn@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 23, 2025 at 11:24:02AM -0400, Frank Li wrote:
> On Thu, Oct 23, 2025 at 11:29:53AM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 14, 2025 at 12:40:02PM -0400, Frank Li wrote:

...

> > > +	readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
> > > +			   SVC_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> >
> > No error checks? Why is it okay?
> > Why is the first parameter 0 while it's not an _atomic() call?
> >
> > > +	udelay(1);
> >
> > No explanations given. Also is it really need to be atomic? If not, use
> > fsleep() and it will choose the best suitable API under the hood.
> 
> It is in atomic context. I will add comments.

Not only, the call that's used in the code from iopoll.h is wrong in such a
case. Haven't you tested this with debug atomic context?

-- 
With Best Regards,
Andy Shevchenko



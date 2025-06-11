Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E012356B3
	for <imx@lists.linux.dev>; Wed, 11 Jun 2025 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631059; cv=none; b=Y08sS4DWdIWaUskc1URLG+6bbn0pGP2/g4HoqrftA4VHf3mMiQI8OpSR8w2aMAH/6GXzqvOkpb+QFMl7wPEVooZMehqQOGQJFuxV300yH5uHLht5cAdRIKrw8QwZjfmJzaKzc5UG2X50OqqvhTZteZJDmMeMkz031ZXz8bgkASI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631059; c=relaxed/simple;
	bh=2kinzhlmz4ZC51GgMVeRamrxVg5pzwaLxW8qfc0MaDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c01CyxVPnRUu1LB2Y63wXhzbe4eaa9s+0RwHTbs6oM4UIJhenSsTB3m/Hs+KziGdeaAMWAPKhr5fGwj+BxzfOl3Ykur07KPg4bhXvmjDbj+2N9adhHiVA5nos+Po5QnjcmK15ek4pQm8mixO57vqvSpWeWjnyDj8QOfcKw4yDxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdNvndDk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdNvndDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749631058; x=1781167058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2kinzhlmz4ZC51GgMVeRamrxVg5pzwaLxW8qfc0MaDM=;
  b=CdNvndDkP0b7COAUHx0Z00lP+Dx10MJLDcGu7LP/waYvOzHFaZ6zRUwb
   tB4qio/H7utrMKNzeSgS982jBHUn/XzF1puSHUgr82XNbZLWYoKdQGa+B
   SO5b32a2Hin937JVyEA7on4sUhliOFp8mWX3voOe5mrixFGCId+pJvgk8
   QWPTpIgRxsgU/n5pdNk/YdYPLmdizfDEw5/oTcNBP6Kx5CLdfqzZKrO7P
   R2bPjQobHJUa0GLcZeolYTH9dbjqRacohhvvRLWXwad86RBv09MJWpDXZ
   y4l/jTmLbQY3TAP1FpNEw2lHo3z8bZ7KBXorkxTZWNwdXWRMEtDRdUWxT
   g==;
X-CSE-ConnectionGUID: 9+5g2U5xQ9uTPdf5QM1xrA==
X-CSE-MsgGUID: OxjYJWUOQnKH1vNVaHizog==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62418526"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="62418526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:37:36 -0700
X-CSE-ConnectionGUID: WUkEGOYpTlWF1DvX0mYXGA==
X-CSE-MsgGUID: FopgQGVwQVO8ZzHiCd1LqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="184332570"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:33:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPGtX-00000005aOn-1tE9;
	Wed, 11 Jun 2025 11:33:15 +0300
Date: Wed, 11 Jun 2025 11:33:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	Will Deacon <will@kernel.org>, Han Xu <han.xu@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Andrew Davis <afd@ti.com>,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 1/3] spi: spi-nxp-fspi: check return value of
 devm_mutex_init()
Message-ID: <aEk_Sx2qht6WK6yQ@smile.fi.intel.com>
References: <20250609-must_check-devm_mutex_init-v6-0-9540d5df9704@weissschuh.net>
 <20250609-must_check-devm_mutex_init-v6-1-9540d5df9704@weissschuh.net>
 <7afc214a-affd-4a99-8528-c58c31fbcc59@sirena.org.uk>
 <aEgBkROmEV2df4rA@smile.fi.intel.com>
 <d8d1ee94-ee95-461f-a5d8-040bb2a1cfee@sirena.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8d1ee94-ee95-461f-a5d8-040bb2a1cfee@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jun 10, 2025 at 12:46:12PM +0100, Mark Brown wrote:
> On Tue, Jun 10, 2025 at 12:57:37PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 09, 2025 at 09:59:46PM +0100, Mark Brown wrote:
> 
> > > I don't understand the comment about leaking here?  We might end up with
> > > an unitialised mutex but how would we leak anything?
> 
> > In case if the mutex_init() allocates something that needs to be freed
> > (in the future).
> 
> I don't see how checking the return value impacts that?  The management
> via devm is still there either way.

I see now what you mean. Yes, this is more likely applicable to non-devm case.
Thomas, can you adjust the commit message(s), please, for v7?

-- 
With Best Regards,
Andy Shevchenko



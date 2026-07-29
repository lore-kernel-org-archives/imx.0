Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4578D3D4112
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 22:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785363481; cv=none; b=JTmnupht0HqDVcKUnd+P6IJj5mbrh7RRuLp2k+ZU5IBknVDr/HL4K9pETZ0LtEmRcnK2ZyFFGuONPEHNt8C48cVUe9Iz1YM7WW0+67eipSrCitYgi73cLd5nhXGiBli73WuoAbIi5ZZw9RPR9KZ5IFTTtODU0iAkCgW+Qe4oU18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785363481; c=relaxed/simple;
	bh=hzgPOTIkadimHJsYARjf7bICbVJT4Trp2C5AiJ4gD2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dO2KcqSH/G5B5e0F47v2iaR8R52+zmTyIRpEOj8T7NFiBTwhi6GbTYPhA89vGAMDZBlw6bQGJHae7Y2PiGAlWsyy3ao5J6WdwfNmGJQNRV0ZzEJIPktWPbtUtq1dII7Z4lSjUSepUUYJRLB6jPFCgbVpRfemvEpifF+AJfT65lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzavrO8V; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzavrO8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785363480; x=1816899480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hzgPOTIkadimHJsYARjf7bICbVJT4Trp2C5AiJ4gD2w=;
  b=GzavrO8VC7JUUoQFYBjC6Iy0fzonJXmWkEt6VpN6mdsTDo9I9UM1jY1z
   Z0oQi6XbvOnbFgY6FXBb6IlPfFT6wrwDYTGqQrO0wbPXHkoJKwLM8NoAr
   iNe9jqtu3opIty+R03kaWOigO7MPW+6MqdwIB0K6EgBKha2Mw3sSV94/O
   nzR8unU3wE/6Hppe70BnARLjQqOWBhpZCGcCFApPfgY9sHS3yRw7Y5v5X
   /KENX4PsjNG5CH9HsXvp3OZh9sPjGRmbd3K2uDxyW/C/D4qdA9UbxH0c8
   sJP0XOyzQ/9zuMaAmBe1m57Tu5tuBAvwwtO3w5Ey/EN4eytYmwg7czqGD
   g==;
X-CSE-ConnectionGUID: T2s3FosPSHe2XVoc4YhrkA==
X-CSE-MsgGUID: mp7VedDlQkeNuGcDkCkYwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85996955"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="85996955"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 15:17:59 -0700
X-CSE-ConnectionGUID: V9mhva2mTfmwIT3YakpQlA==
X-CSE-MsgGUID: xKo/5c+nR9aHOB0l4mMLKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="255815767"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.90])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 15:17:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1246A11F8BD;
	Thu, 30 Jul 2026 01:17:56 +0300 (EEST)
Date: Thu, 30 Jul 2026 01:17:56 +0300
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
Message-ID: <amp8FBFx2jmiCIqU@kekkonen.localdomain>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
 <20260712115553.92564-1-mitltlatltl@gmail.com>
 <amp7xqJGfhOeKaoU@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amp7xqJGfhOeKaoU@kekkonen.localdomain>

On Thu, Jul 30, 2026 at 01:16:38AM +0300, Sakari Ailus wrote:
> This should be first (or at least before non-fix patches) in the set.

Ah, it's already the first patch. Somehow the ordering didn't work this
time.

-- 
Sakari Ailus

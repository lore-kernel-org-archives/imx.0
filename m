Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ECA27510E
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 08:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768464536; cv=none; b=TYrBMMG03/EwNxwAOtl5KH88zWSWezBP+TK3j9bBveBEaieSDwCtx4SvTWzOP1itvm0O4lmA0/l9c7tQ1wJxlDo20FbZ4ifVADGf49DbdA7RdrouSHWfMSWxmnH0KXvMU1XLpdT+K7W6VWVZn1GBNT2Fx/yLV8S8ver+I67P0dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768464536; c=relaxed/simple;
	bh=4J1FcG4dxmkP5PoBZ0hZyfoKYhf61kzQ7mIPLm/KVhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKeY8WH6W85QlXRVl2XH9JOQ0czdPYLVmx7WCgtse1guPxFGRAu98nBkPdZV4phXgjyS1AOwCQzdCli7oiudDQUKSphj0WlqqpKz6ZCz8Ma9k19+tiIQdTn2mPbfjR+mR12B0wQHDzFfxtwmSFvURExw6PErcBovuUOei7SSiTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LirNzOIb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LirNzOIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768464535; x=1800000535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4J1FcG4dxmkP5PoBZ0hZyfoKYhf61kzQ7mIPLm/KVhs=;
  b=LirNzOIb9joWxlIb/T5wTtFyfWl1tQnlL57twzYGhOfyGWj7osyWmeT5
   HnLSN2hXrPaQFQR0E17r/Ka3Rg5kfczpyN3ogjVlyrL8KHsIv1JtqAGPu
   IL7URSXk1cL8Vez5jQQ2oVzdQwsjILf5gVU4x9oe8JgvyrlLsop8+QTYz
   mCSafo+qX9gjB32kByW5NGH35FPRabc9+yXtm/jPtZnR8fmv8TeXk5Whb
   uT2LZbM1V/xa2XTQmnkqKiHCZ6AoURf5V/bG9xeB3wBnVOuqoGbKbBl5Q
   lyCDQEx7IKfvMkeFUVlXLP91tD9Kyj+YH7GpyzTfBgg86OZ+2XyZ7GWrl
   Q==;
X-CSE-ConnectionGUID: Dy0isclHQw6IvuMGEGRUzw==
X-CSE-MsgGUID: XVppqg13Q+WZ8DI2UZnPww==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92437286"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="92437286"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 00:08:55 -0800
X-CSE-ConnectionGUID: J6vCKZaCRcK0EcN3RPBO2g==
X-CSE-MsgGUID: hlrtToK9QmO45010/8J97Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204103732"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.216])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 00:08:50 -0800
Date: Thu, 15 Jan 2026 10:08:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Sherry Sun <sherry.sun@nxp.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, hongxing.zhu@nxp.com, frank.li@nxp.com,
	l.stach@pengutronix.de, lpieralisi@kernel.org,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] fsl,imx6q-pcie: Remove the deprecated
 "reset-gpio-active-high" property
Message-ID: <aWigj011i0pGgTRi@smile.fi.intel.com>
References: <20260115071816.115798-1-sherry.sun@nxp.com>
 <20260115073418.GA4366@francesco-nb>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115073418.GA4366@francesco-nb>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 15, 2026 at 08:34:18AM +0100, Francesco Dolcini wrote:
> On Thu, Jan 15, 2026 at 03:18:13PM +0800, Sherry Sun wrote:

...

> And , the property is still handled, see commit b8b80348c57b
> ("gpiolib: of: add polarity quirk for Freescale PCIe controller"), the
> DT compatibility was not broken as you seem to imply in this series.

This is a quirk and not a 1st class support. There must be no such property
in new DTs, it's only present for the backward compatibility.

For the old ones, indeed the property is needed. The problem of reuse of Linux
DTs somewhere else is orthogonal to the Linux kernel. If this is a real problem
the DTs should have been maintained outside of Linux kernel and, if needed, be
synchronised from time to time.

TL;DR: we must discourage people to use deprecated and (historically) wrong
properties.

-- 
With Best Regards,
Andy Shevchenko



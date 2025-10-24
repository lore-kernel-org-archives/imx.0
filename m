Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA58C141
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 06:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286416; cv=none; b=KJjJbmbb2ueL3MLuWL7xYMnW8w8B5yIXDe+Ay6aDun8V6ymoSyDZNO1zUZbS35aiLcNwLwzLoo8Fj2og2SD5VF9YN9k6Gy2J8Oflc543DALnJ4c9qjJ0N2SMc5gdMcqFHgGvxcv5E7+jAgUD/HjetTEyQfgBv4d1qFwVRoD+ZPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286416; c=relaxed/simple;
	bh=pPg4tGMDdSKgzOhv/19H1ClKHTpBCPpph/N7jY8PuY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1ZKmtc3EDNxmQRjF3YU9ylBu+hvHDKe1zpmNxNqyZdPrpRVH2m+HgmT2rmwRKJtgriL8MtgffbUF14SqECTzg1J3w2LwBcxHx/Ts+OYDbiiy46bqbge2k66+5IYWBHTAtQ0m6xl7onqrulFsW58BdnVkEb83pIrKi6W65N4VHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPv2pniG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPv2pniG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761286414; x=1792822414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pPg4tGMDdSKgzOhv/19H1ClKHTpBCPpph/N7jY8PuY0=;
  b=EPv2pniG8MvQyRz6fGu3jLmgcv1lm0ibkZOw3OiHYa90SiZk38MnYhiX
   h+H86VIJHsXiM8FppuW09A2cPlN4aQY7CBJHSHetLuD+EguY3VtNmrAuT
   /BKnlFW7u8m55RFGDuK2e3DKSKCfsInnBPtV71qop5pZp2Km6rNIPsUFq
   LeCwTtkUhMLEQP8rcDBwH0B8l3ZROSXWlNR3sUSabuY+h4z+aiKBvE7Ye
   CSWq+hKt/cslETjg3s/RdabexkCPzPCKH8vOo6i29lSFOR9A4Bd9zC/vO
   mfal3a4udwt5f7eyetcpj7DIKCorL6zdHsDUVK/5ONPGAG/3vg5Q+pBZB
   w==;
X-CSE-ConnectionGUID: KGUqbexOSJiT6PXDGJxNFw==
X-CSE-MsgGUID: Kodr57jYQTCBIuT8+u655A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62674529"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="62674529"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 23:13:34 -0700
X-CSE-ConnectionGUID: EDZuUWOTS7iZKdMy7RFhHw==
X-CSE-MsgGUID: zgPfV1+5TsCKMukpOqL70Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="188740617"
Received: from opintica-mobl1 (HELO ashevche-desk.local) ([10.245.245.60])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 23:13:31 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vCB3H-000000024n3-3VVz;
	Fri, 24 Oct 2025 09:13:27 +0300
Date: Fri, 24 Oct 2025 09:13:27 +0300
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
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/5] i3c: Add HDR API support
Message-ID: <aPsZB44qXR77jNHF@smile.fi.intel.com>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-1-3afe49773107@nxp.com>
 <aPnmCwwZVZ5egqkP@smile.fi.intel.com>
 <aPpHTej/vKfiN68k@lizhi-Precision-Tower-5810>
 <aPpyf1xPmU_koEXH@smile.fi.intel.com>
 <aPq/6/+63sHuq/qy@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPq/6/+63sHuq/qy@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 23, 2025 at 07:53:15PM -0400, Frank Li wrote:
> On Thu, Oct 23, 2025 at 09:22:55PM +0300, Andy Shevchenko wrote:
> > On Thu, Oct 23, 2025 at 11:18:37AM -0400, Frank Li wrote:
> > > On Thu, Oct 23, 2025 at 11:23:39AM +0300, Andy Shevchenko wrote:
> > > > On Tue, Oct 14, 2025 at 12:40:00PM -0400, Frank Li wrote:

...

> > > > > +/* keep back compatible */
> > > > > +#define i3c_priv_xfer i3c_xfer
> > > >
> > > > How many of the current users do this? Can't we just rename treewide?
> > >
> > > git grep -r priv_xfer drivers/
> >
> > `git grep -lw ...` is a better approach :-)
> >
> > > drivers/base/regmap/regmap-i3c.c:       struct i3c_priv_xfer xfers[] = {
> > > drivers/base/regmap/regmap-i3c.c:       return i3c_device_do_priv_xfers(i3c, xfers, 1);
> > > drivers/base/regmap/regmap-i3c.c:       struct i3c_priv_xfer xfers[2];
> > > drivers/base/regmap/regmap-i3c.c:       return i3c_device_do_priv_xfers(i3c, xfers, 2);
> > > drivers/hwmon/lm75.c:   struct i3c_priv_xfer xfers[] = {
> > > drivers/hwmon/lm75.c:   ret = i3c_device_do_priv_xfers(i3cdev, xfers, 2);
> > > drivers/hwmon/lm75.c:   struct i3c_priv_xfer xfers[] = {
> > > drivers/hwmon/lm75.c:   return i3c_device_do_priv_xfers(i3cdev, xfers, 1);
> > > drivers/i3c/device.c:int i3c_device_do_xfers(struct i3c_device *dev, struct i3c_priv_xfer *xfers,
> > > drivers/i3c/master.c:   if (!ops->priv_xfers && !ops->i3c_xfers)
> > > drivers/i3c/master.c:   if (!master->ops->priv_xfers)
> > > drivers/i3c/master.c:   return master->ops->priv_xfers(dev, xfers, nxfers);
> > > drivers/i3c/master/dw-i3c-master.c:static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> > > drivers/i3c/master/dw-i3c-master.c:                                 struct i3c_priv_xfer *i3c_xfers,
> > > drivers/i3c/master/dw-i3c-master.c:     .priv_xfers = dw_i3c_master_priv_xfers,
> > > drivers/i3c/master/i3c-master-cdns.c:static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> > > drivers/i3c/master/i3c-master-cdns.c:                                 struct i3c_priv_xfer *xfers,
> > > drivers/i3c/master/i3c-master-cdns.c:   .priv_xfers = cdns_i3c_master_priv_xfers,
> > > drivers/i3c/master/mipi-i3c-hci/core.c:static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
> > > drivers/i3c/master/mipi-i3c-hci/core.c:                       struct i3c_priv_xfer *i3c_xfers,
> > > drivers/i3c/master/mipi-i3c-hci/core.c: .priv_xfers             = i3c_hci_priv_xfers,
> > > drivers/i3c/master/renesas-i3c.c:static int renesas_i3c_priv_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *i3c_xfers,
> > > drivers/i3c/master/renesas-i3c.c:       .priv_xfers = renesas_i3c_priv_xfers,
> > > drivers/i3c/master/svc-i3c-master.c:    struct i3c_priv_xfer *xfer;
> > > drivers/i3c/master/svc-i3c-master.c:     * at svc_i3c_master_priv_xfers().
> > > drivers/i3c/master/svc-i3c-master.c:static int svc_i3c_master_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *xfers,
> > > drivers/net/mctp/mctp-i3c.c:    struct i3c_priv_xfer xfer = { .rnw = 1, .len = mi->mrl };
> > > drivers/net/mctp/mctp-i3c.c:    rc = i3c_device_do_priv_xfers(mi->i3c, &xfer, 1);
> > > drivers/net/mctp/mctp-i3c.c:    struct i3c_priv_xfer xfer = { .rnw = false };
> > > drivers/net/mctp/mctp-i3c.c:    rc = i3c_device_do_priv_xfers(mi->i3c, &xfer, 1);
> > >
> > > After this patch merged, I can clean up it at difference subsytem. After
> > > all cleanup done, we can safely remove this define.
> >
> > I counted 9. I think it's not a big deal to convert all of them at once without
> > leaving an intermediate state. But this is a call for the I³C subsystem maintaiiner.
> 
> There also are other cleanup works. The key point is that everyone agree my
> HDR solution. Cleanup these is not big deal. I am not sure how to avoid
> build broken at difference subsystem.
> 
> After this patch merge, cleanup will be easier and safer.

Then leave that renaming to the cleanup series. No need to use a define, just
use the old function name.

-- 
With Best Regards,
Andy Shevchenko



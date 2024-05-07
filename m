Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAC315DBD3
	for <imx@lists.linux.dev>; Tue,  7 May 2024 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087573; cv=none; b=jmWiJsTDv+TxtOdFZwaHBPSeVpGZB0fheMvfhLAzZUR31ah9PxGsT79lI52fmeQJpIMgXhAR4At82i99x2jQzZp69fVdW43V8A8tL6p+GlNTfa3GwgJJBXeGNaJSUiihRa9m9IrypYlHvIjd6BWAwUTd+n+QjHdKfLk+wUYE+Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087573; c=relaxed/simple;
	bh=a6gSLSNzkB7vq5lvXJKxfEYqY5Zj8C4OuyJc6Y6NlXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9hNJfdXln31FspazTLLbLZa++asUlZ8zHinGpBI6ufJDsuJs2lfLF2d2h1h8bkomSI3v5ztUwgRnKTCGlVv7nPW2+GQCReeIxc8Mgv349bRPL8D0WpBazUjJCZ/JnoJ4DJCi4haufQsyp25jI13VDGmNr6lG8FPwvVDIGTeSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUJfugUj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUJfugUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715087572; x=1746623572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=a6gSLSNzkB7vq5lvXJKxfEYqY5Zj8C4OuyJc6Y6NlXY=;
  b=NUJfugUjLIR6NPcmhniWaqizLAc3dKQoFsdRdvQaK3dNsxJz4coQjclh
   P3hePDfN47vy+qvEgFhk09AnuRFiWdscjOn03+FA1rqGCzRq8m7BAW6U5
   ZDF/tEdBNnGU0ryeLWI9FaINzXJkZWwNf6EpFma2BUm7F7e7QQrW71lNA
   Ghvk8hr4pDNWFJdpNHOPNZZGq+jAGROYimK5gAkLDieT+FqJJD8T2DbY6
   L/CttRzhFAY5IawUtvgI4rcWbXaqBwNePE9Z1PQL5GVLl+VoE8ZwLH6Iq
   WGRiTQwR1ndEdaGY7IxzmKAOmtngU2vx7OfTZum0zgU1CmFuP0emVNiLc
   w==;
X-CSE-ConnectionGUID: C30irS7JRm22jnQVxP+5cg==
X-CSE-MsgGUID: YG0zBPc4TTKWs/YdVs2aPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21483950"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="21483950"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 06:12:50 -0700
X-CSE-ConnectionGUID: Fu6nYwQcTgeZWSY044wYqQ==
X-CSE-MsgGUID: MsXTeSYhRgedCqb9bG/apQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="28920705"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 06:12:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s4KcY-000000052fm-0iB8;
	Tue, 07 May 2024 16:12:38 +0300
Date: Tue, 7 May 2024 16:12:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v4 0/5] PCI: controller: Move to agnostic GPIO API
Message-ID: <ZjooxTO3wb2ItvGv@smile.fi.intel.com>
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
 <CACRpkda=a3X=jyZKQoOFrfgzpE2C+rZ9UC1VDnCvGL7QP4x4BA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkda=a3X=jyZKQoOFrfgzpE2C+rZ9UC1VDnCvGL7QP4x4BA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 07, 2024 at 12:03:50PM +0200, Linus Walleij wrote:
> On Mon, May 6, 2024 at 4:22 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > In v4:
> > - added tag (Mani)
> > - fixed a polarity bug in iMX.6 driver (Linus)
> 
> Looks good now. The series:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you!

> Perhaps the use of  _raw accessors could be avoided in 5/5 by some
> elaborart polarity quirk but I'm no perfectionist and it can be fixed later.

After your comment I was thinking the same, and came to the similar conclusion,
we might fix this later as in comparison to iMX.6 case this requires an
additional code to be added to gpiolib-of.c.

-- 
With Best Regards,
Andy Shevchenko



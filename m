Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118940;
	b=XwZUf4Vror2m80CjdDR91nIpkMtyrqC1IXEHtN3XR5ho7BuQQDK0jdxSV/ArR/jM73rb
	 u/aqWIj2IGYNFYeRYktRL5haCptAYmbVvI/mD2Vm4XRg0sNp9xLEWNQv1P4wCOEaBflNV
	 yxfo3phr1ReudIGCvO3W17syaq1Ossw62/xelS1uZtGqo5OGAyHMQ0PnoXd7jsQDa0k5d
	 R/I3OlUGDV5GfuR8Fr70SeUKhXCkPKh/qMMdjULI+/c2yF330tINhxhi8Zl9hnvWTOKDz
	 CqBW+1Is/fsA43NP8DrMQJM9h2EynxzHL1lM7mFnRvdp8JSP8gRrgS2oZAu7Xv2FLXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118940;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=o/9wK8ypPDBVfzWamrLQ9Cbs+itMuvLYD6oeTJnRkog=;
	b=y3Zsow4F1mSVL7GTw7q3RnYbkfh6oymVdLD45RWBXG71LWaezARATjsbUwxYe6ukruNh
	 Q+vE3H7PQPtF8kZ+IV0X3xOnNF98Zg5uBF7jzyJjhXDGv64/t7zS/EsRxANybDuLvmojE
	 V1iSP1X5rClPim8xRJ8ZKGyU9Qa4GHVEJKWo9kWeK3nhEzyHJBf1QlZ+ZscjLonJyhH1q
	 duhZ5u6a8xbnjtr9dp051G6JE3bCoIAAK2ZBXsguAdknmE6UDi78WKTIzKT0nQTvSggKk
	 txdj7V31C1K6lff3N31qxVfWaTPDPmKHtC1LZZaB0OVDAShKgSOQ3FXJd12nAuU2GOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="AG/jofRC";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8609E606A33B
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 16:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8609E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AG/jofRC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793118939; x=1824654939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Utev8fXbgts7UcDCdj3uyCBF4API0Y6uebtPL9YZJpY=;
  b=AG/jofRCwhvlzzbJztJSJBPFamqUU1/oR7/uIjuXJ7cem2D/iESvDG9Z
   UHCN+4AaKtALNypaGkz12rJsWywxtRy+uRR5MewgKF0Im2Hg2FhmcV/nH
   t2E+GS5aHgRUpNKUGquMqk1bej+vZf9Pl16mTpDAueQI6hy14lgmV3ao3
   dQcAvzTNc94XHpHp/1N7DrrtD5SbH/k1FmxIgqTyx7qO+Rd9Q4ubxRxUe
   K6wCliMJmJnZwIWn0c5VrTi17AXFBrVm/9mVMXY0JVQs2aa+XXB6fQbX7
   cqpHmdEelewVDsNDLm2kRPGmhPlZZqAQeAZ+/8JmEWI2KjHM5XWSOUfs6
   Q==;
X-CSE-ConnectionGUID: sp1hMOvKTRy7eT1lIta2OQ==
X-CSE-MsgGUID: O0Y1RhehR4yTUGJwodciGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1701102"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1701102"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:35:38 -0700
X-CSE-ConnectionGUID: s49YAcbWQDyVutQPsQymtw==
X-CSE-MsgGUID: qDTWBopHSNi+M/18y/ykAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6461434"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:35:35 -0700
Date: Tue, 27 Oct 2026 18:35:32 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 02/12] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
Message-ID: <auDS1FpY-kQhP1C6@ashevche-desk.local>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
 <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
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
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 08:09:29PM +0800, Peng Fan (OSS) wrote:
> 
> Use for_each_set_bit() to iterate over the enabled wakeup pads instead
> of checking every bit individually.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



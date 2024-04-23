Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3413E057
	for <imx@lists.linux.dev>; Tue, 23 Apr 2024 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713892943; cv=none; b=Z6+P5iu9v91rYY8ZST3sJQLTHAwFDBZ0DKyHCk32jM6w7ofIstkNpMg8fCaJ7t0rU60TG4YgiX5J29SCkg/c1PW/RRbcovGE99Vv6wT2GZk6Vm0noP4AvRwZurVS0jzPSiGopYdxiLuWd8zjL7W5fSYgfvJ6cYocHQGRKCRSu1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713892943; c=relaxed/simple;
	bh=I9lQl747AQ4na6Zt0ksciPJQq6pP+rhmX/P2rnY3q9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FkSkxxqJi3mEmSVaakD2kq29rlrahVrMpf7dyRxI52rNobMGJ69VC56paWNdE0xUR6FiorBpPyeBKSxq04ERtfBI9IkvXDLbvMJZqdq6VhvVesKs0RhundDdztDDFGgHSgsFKHeduYz+fhw/qXdj87vIGri8wa7Pp1aISXA3vyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJWuL4+3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJWuL4+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713892942; x=1745428942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I9lQl747AQ4na6Zt0ksciPJQq6pP+rhmX/P2rnY3q9Y=;
  b=JJWuL4+3xAYzrdG3JHdf3RffwgFyKAHDkTHDLgyjdODZBYFokuoh9VaT
   mkIe/SoAyx+siShb05HsD+5rY91KP4IFUV754LZyfyay4lNOgqLOukxrz
   h7gRMwxyFtlKfFysG9NVz6m9P85UiWyGDrknV0rzo+wilzPmuuXj8POY7
   /sBcq6Cfkx6/LRs3iN3j1PyfLlBpT3cfDxlZyjr6VOBJ3xO2mmpCzdU4x
   QSCKw+Z4pwzv9I6d3v5OsnWawWZw9LBYK/X374T2FCGjakxnwkt1FlUFs
   ilgCGZJVg6XY3PBsphZEwVV/HKVynk1ETFVWNs37+jpRKzZqPXC3Lquhl
   Q==;
X-CSE-ConnectionGUID: G3XPBVEaRPurlGjWXaSRHw==
X-CSE-MsgGUID: z78r/jIHQb26jSP5Kvx1Xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20911818"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20911818"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 10:22:20 -0700
X-CSE-ConnectionGUID: o2rJLffkS1CBqE8lbiB5bQ==
X-CSE-MsgGUID: WgwC+y48QFe7URdjs4igrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="25051427"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 23 Apr 2024 10:22:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7FB74142; Tue, 23 Apr 2024 20:22:10 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v2 1/4] PCI: aardvark: Remove unused of_gpio.h
Date: Tue, 23 Apr 2024 20:19:04 +0300
Message-ID: <20240423172208.2723892-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_gpio.h is deprecated and subject to remove.
The driver doesn't use it, simply remove the unused header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pci/controller/pci-aardvark.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 71ecd7ddcc8a..8b3e1a079cf3 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -23,7 +23,6 @@
 #include <linux/platform_device.h>
 #include <linux/msi.h>
 #include <linux/of_address.h>
-#include <linux/of_gpio.h>
 #include <linux/of_pci.h>
 
 #include "../pci.h"
-- 
2.43.0.rc1.1336.g36b5255a03ac


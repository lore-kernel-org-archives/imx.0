Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BE439FFD
	for <imx@lists.linux.dev>; Mon, 29 Apr 2024 10:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386325; cv=none; b=Pcs2CS9cJ24JhjBqyLtLLtgcuYeBSb40d4TJMkUdeVkrW/wfIxVF/2yhSYK6c6wuEztFxI0QbwovZDgUxw385RCxtmGYcGQIImdwnRxUkAcxmyaRJCpvTkFvGsbL1IYoIRYKGViz49oJDDun3WPqd9XcpV0J9OSQ8px9bhiVLx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386325; c=relaxed/simple;
	bh=mnVWFiBfYUU2lpuKyQVuWsMjv4lrzOkciv18t8WSb+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjlPp44z0yoZJ7z0iKW9l4keFAOrDSGe3N+pyh/T+kof9KGxdmXXt6G6OelwnInCo2gYlXIxQpgx918V6eFkY9x+qFn0HF4B486qKXNX21pOwNAW/up1C1mAMXsA43wbH4kzRTl4Mf+Kc4CZ+j3Eti0dzXnDGF/EhPwz0BHGZvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCuHiJrL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCuHiJrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714386324; x=1745922324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mnVWFiBfYUU2lpuKyQVuWsMjv4lrzOkciv18t8WSb+Q=;
  b=QCuHiJrLfsgKdbO855tOCouzBSska7MQ8yP/2V/Z1zLkeYKrbAd+u5Xv
   KD1e5NOX8vy/+b6pK0Dw8VB+PNy9cboDMzhptz+BD2eUhEgLUgd4ePDTz
   QYmn6BlFvqiDQP8T7RjFIFX8x+9x5VjmbSB4ZS/Qq+rJebdDRpdwcWFE0
   a324IHgMPDIyANjI9E4KYGNhARyzkoBRZq0BpuY74kEaHAznNkPZOCbr4
   hgqa0Hb3KbXWzRTGYtAArAF3esmZ4Z/WVBM9FjIi+CPFNdfvYMKR6aK9l
   Fqr7OS5Shq5YhE3NhboKgXUV/6T4RQSepUt3eSw81rDeZlnOsooOYPFWz
   g==;
X-CSE-ConnectionGUID: gVBn7GDuRhyOHDcZ8jLCRQ==
X-CSE-MsgGUID: rRp7RbaATHykIrPMwD/Qmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13827920"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="13827920"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:25:21 -0700
X-CSE-ConnectionGUID: KDY/1w+iSwiKi9y57mrB/g==
X-CSE-MsgGUID: HKejN5CvT+q1pdsGY7VemQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26475173"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 03:25:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A849B1A0; Mon, 29 Apr 2024 13:25:11 +0300 (EEST)
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
Subject: [PATCH v3 2/5] PCI: aardvark: Remove unused of_gpio.h
Date: Mon, 29 Apr 2024 13:23:19 +0300
Message-ID: <20240429102510.2665280-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_gpio.h is deprecated and subject to remove.
The driver doesn't use it, simply remove the unused header.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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


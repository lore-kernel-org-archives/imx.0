Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F78813DDC9
	for <imx@lists.linux.dev>; Mon,  6 May 2024 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715005316; cv=none; b=kEJKo5oYm3hm7iIZtDGH15IVQ0rpBZ5psWDKM9iPBYibmoeN2dkDiKh7RcUhsSL8bW2PGEz6/LZ+2KOMY0H3DQAfP8lq49Vgc3FhWIAPhXnpg2RmRr/2n7QR00Sluni74tjZ2xpQwOANPSEoEB7n7w2iFdWXTeEDcOfQhGYgttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715005316; c=relaxed/simple;
	bh=CNszT9zdbvvsTrnr/o0AApgAShmBR0yidgvxQsMHIno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hnaEAY7P8qsFnXNiqoMRqTZ+xr8OPZElve5hQKR7Y758vaZWEO0bocdn+C69xT6RHzZDjUdgcydiPusZmcd50TYcA/j4BQtg5ZkTr3FvaZhnWChuD+eEpWx2e3hP6MyF/NA+Xh8j7ui0AmocdT8KJp2okTK62JIL11r69WQtP8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HiCFBATA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HiCFBATA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715005314; x=1746541314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CNszT9zdbvvsTrnr/o0AApgAShmBR0yidgvxQsMHIno=;
  b=HiCFBATAx7p22DQd4fI2FAYlYwngpYVCKinfWvd3xUwUpX8u+MeauWuI
   TL2jzZEoEzQx0pq+olM2in2E5bg5wv0QVKsbBoCfOf5QLdLpevlSArZ4u
   k81Yr+DTv3L/SuehprLH9pUICv+YxGyZGNDu+ejj++JUN5ASPj5TnUzvG
   ukmgS+qti3OYTBrhrcgXC8yTfkFF6xTCN/hLmul0tfQlSfhEZsbJY71JE
   MjOKJt0vndql+Yzvi+SVkVrk/Z+MFu/RRyuODaO22RXbcBrVuFcm2OSPt
   JhltsBqyIhHB4fUOj/LalHhSnPr+EDM52qCJa2qlNPkF/fbSGwAXDqkLI
   A==;
X-CSE-ConnectionGUID: AHvZQAA3Qjq7+qrkihsKtw==
X-CSE-MsgGUID: ygiVhFHZTpeS6SuLPOyjqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22155541"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="22155541"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 07:21:53 -0700
X-CSE-ConnectionGUID: tzhk4GXGSGuSvrL4IdOFhQ==
X-CSE-MsgGUID: vhTfbuHiTc29wrruM+hkgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="32988756"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 06 May 2024 07:21:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0E48F68; Mon, 06 May 2024 17:21:43 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 1/5] PCI: dra7xx: Add missing header inclusion
Date: Mon,  6 May 2024 17:20:37 +0300
Message-ID: <20240506142142.4042810-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver is using chained_irq_*() APIs, add the respective inclusion.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pci/controller/dwc/pci-dra7xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index d2d17d37d3e0..b67071a63f8a 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5A137719
	for <imx@lists.linux.dev>; Mon, 29 Apr 2024 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386324; cv=none; b=i7DJuNpdS+ocsOQJcpCN7I1LHmQ+eew2rbBJSQnOTdSabk0Kt23R22CdF4RDcCRazYZmQoOCwKtI8qnZlLgt7geuailIcVrJ45l5UKbseT/leRsZSIJYntSddT7xeaRVWOu22qVmt5WHfyJyNDBDhkODeJApgqTXWeKTU670CXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386324; c=relaxed/simple;
	bh=BSxkbBdK70uPefLrVg5yOQ3KIh93f8UTGSR+QBBryx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmGxjUquE8dED+8Y84Hsl300FG6iFgXXPHC0K5ntKEKXZv+FyGx0UPONZ/SFcimLQ69isLdmzVGGNM7MCgE8N5xxZyGNpxcsKnbcM+FBp3qdrQpdYnwu7XeB81LihRhcCySRQhyVfrSHeJkuZoLHKk1She3Bwff/e3hnZ+f0Kb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvVWq2Zt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvVWq2Zt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714386323; x=1745922323;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BSxkbBdK70uPefLrVg5yOQ3KIh93f8UTGSR+QBBryx8=;
  b=PvVWq2ZtmKbucLWwJo+/g8wgj8mAgtRo7eG9Wci3P3WAPxJH9HajZ3+6
   o4z/SrH2a26wzrn5KGmYH1jB/MehRObn6BkIDKtqVwPoQFqT1yToaZLo8
   VJegWtJptFA3Ygs4rWgeOTiEpBNyWQwV+O396SojOzDDuJmM/s8TTm0bK
   UoDTaxfMBCZWtEBLU52CY4vUmsXIO4AKgA68jK/WuGuBBfyxVVLQpP26n
   BCiA/ph0VplCnj5j6IsUg8QlfTTfpNtcdV2GwxJotek+Jq3iXb5wFHTIB
   2GEt4VMCYQn+ubKwYZQoe74e2nEACYbe6jrO3hcsY1mC8rEcdlFcD5EPa
   w==;
X-CSE-ConnectionGUID: lE1+bGn6RT+KZ2Fs9/dfWg==
X-CSE-MsgGUID: DdHq+xYJRleV0iK0Ei2vaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13827903"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="13827903"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:25:21 -0700
X-CSE-ConnectionGUID: eTitjhPcTPOhtWqwOYqo5Q==
X-CSE-MsgGUID: kiuwJZZ9SPKgOBlYns0TzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26475172"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 03:25:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 827C115B; Mon, 29 Apr 2024 13:25:11 +0300 (EEST)
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
Subject: [PATCH v3 0/5] PCI: controller: Move to agnostic GPIO API
Date: Mon, 29 Apr 2024 13:23:17 +0300
Message-ID: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While at it, remove of_gpio.h leftover from some of the drivers.

In v3:
- added precursor patch 1 to avoid build errors (LKP)
- used GPIOD_OUT_LOW instead of GPIOD_ASIS (Mani)
- added tags (Mani, Frank)

In v2:
- combined previously sent patches into a series (Manivannan)
- added tags (Rob, Manivannan)
- converted iMX.6 driver (Manivannan)
- dropped leftover in aadvark drivers (Manivannan)

Andy Shevchenko (5):
  PCI: dra7xx: Add missing header inclusion
  PCI: aardvark: Remove unused of_gpio.h
  PCI: dwc: Remove unused of_gpio.h
  PCI: imx6: Convert to agnostic GPIO API
  PCI: kirin: Convert to agnostic GPIO API

 drivers/pci/controller/dwc/pci-dra7xx.c    |   2 +-
 drivers/pci/controller/dwc/pci-imx6.c      |  37 +++-----
 drivers/pci/controller/dwc/pci-meson.c     |   1 -
 drivers/pci/controller/dwc/pcie-kirin.c    | 105 +++++++--------------
 drivers/pci/controller/dwc/pcie-qcom.c     |   1 -
 drivers/pci/controller/dwc/pcie-tegra194.c |   2 -
 drivers/pci/controller/pci-aardvark.c      |   1 -
 7 files changed, 50 insertions(+), 99 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


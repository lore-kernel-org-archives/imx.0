Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3809213D26E
	for <imx@lists.linux.dev>; Mon,  6 May 2024 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715005319; cv=none; b=FYBzPsUbES7YxPQJPLQh4M0eZcjE8O8imiXMUufU3+2ZiYZW5FM70PB6NMm1avsde/ttHS1D3XAwsZHUw2tQV70+W2q9OluFKFDki1VHwv8TlD1EJLw1jKKn8iw6RF6zUawX+/N9HsuUfjESW2mraUsXSkNEKeNpYp/HlBiZElc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715005319; c=relaxed/simple;
	bh=Q6wvxPR0ih++7Mokt01obdSM7aO9GEPlMf6UMIVpETA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hs4GWNhIEXQh661fbh6+5AsD+CXvhMlDuyPv133juotXQKymDB2bYNJ5dlpuakdBGwfj/4k/L286zU4JFENM/m1typp4AXSG72OHeev12u2nCIC6vmz4w+KPGgLagxaAUSxgVE7Q3lHhIxySuSxvUDQxVxXbUWluRr4Q/dFsvbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1wYMaqp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1wYMaqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715005318; x=1746541318;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q6wvxPR0ih++7Mokt01obdSM7aO9GEPlMf6UMIVpETA=;
  b=k1wYMaqpMYKjy1hhBnDA8i42Re6QvApxqitdVsrjfj5j58fNsAeplQzZ
   F6zWsczYhpvGo2NQIc1Ez3Pgg2A+hKOVshB/WjjO/t5UJvVg8/m8m/RXB
   3cPrZ2KcvCfAyCeH6HKx93P60/ipJrkdcCvkRcM89a5171sKcPnr/Vwxn
   1x271TP/viO2KRPDAAnh9dFK3NfQqD5ep7IdIDKBbHwNl3AzI3EoAxFDO
   BWxj3oiEywgvb0Xv8+ygNytrn/Cp5/UrlKLxh/7pmlwRtYGafB4/E54s/
   hE4jpJkaT1ofDqGQDeiyOefwS4yhODjbsx5+ZvYb9QHRM6HNI0RVdijyw
   w==;
X-CSE-ConnectionGUID: Wn/QpjoQRrm0UIx8wAg/hw==
X-CSE-MsgGUID: vpXFu88hQhaytJAUg6mB9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22155553"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="22155553"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 07:21:53 -0700
X-CSE-ConnectionGUID: qvt0cQ2DQUCIlIa75LChlA==
X-CSE-MsgGUID: 6EhTFntRRUmP7O47GmpzcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="32988757"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 06 May 2024 07:21:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 00749161; Mon, 06 May 2024 17:21:42 +0300 (EEST)
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
Subject: [PATCH v4 0/5] PCI: controller: Move to agnostic GPIO API
Date: Mon,  6 May 2024 17:20:36 +0300
Message-ID: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While at it, remove of_gpio.h leftover from some of the drivers.

In v4:
- added tag (Mani)
- fixed a polarity bug in iMX.6 driver (Linus)

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
 drivers/pci/controller/dwc/pci-imx6.c      |  36 ++-----
 drivers/pci/controller/dwc/pci-meson.c     |   1 -
 drivers/pci/controller/dwc/pcie-kirin.c    | 105 +++++++--------------
 drivers/pci/controller/dwc/pcie-qcom.c     |   1 -
 drivers/pci/controller/dwc/pcie-tegra194.c |   2 -
 drivers/pci/controller/pci-aardvark.c      |   1 -
 7 files changed, 46 insertions(+), 102 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


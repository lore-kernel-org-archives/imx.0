Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3C3A63E4
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633802; cv=none; b=czmCv5bkkYblPf72BnK2IlAjm5h7vzUUv2mjC2fTXyYoo0IgjGr+SfI4l5aAB0t8sxdXLZuhNju5K++MBnuM7Oa7N9NRTfbdPxAEUD7nFJko4BWZ0gLqCPQQCcN3JEQVC3ODdEuBctC5xyeKJ+C0XBb0pbcEVvdTMKTu151hjVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633802; c=relaxed/simple;
	bh=AAR1uDouR8gmyuDZeOFLpxM99huHX4k3NzQIgrMbcCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXnAB7lkmYZ0pOqn6p2zs9sXp9mCLYurfOb50anK/m+hXyOdcp9Xmskck9c9ChNwVwd+PApzdU00ZZnAGQUdUNfQDV5sU2SOAorg0XcQE/KLu5K3/ue5VrbKEq4WmhVezzwUseIp8Qvz+Sc3DPJps6Y5Z84HwvoVx99GaGYRCh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5YLSARx; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5YLSARx"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8274843810cso3972105b3a.3
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633801; x=1773238601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDjBy/zS51mD1PxaQ7mIKoDOiKAIHa799oQhdGW8t+4=;
        b=J5YLSARx8NANnT/g2IOeX6k3gX7fU5NBLU/1imlKFDZu1vdJbYmRmHo3w/AmMyPtzJ
         Luf21z9G35Ti9sNXKtG+9ip2mmXCR+PUQ7PtCgBxqDmr8EKl+GE/6OxSGqMaPokz5twa
         fL25grC+wibnmFgbHt7qvycG8ENKXx9HnsVaZEcS4KSFDrHAYcdb8pGazYx8vs3AsFCf
         8uVG2TUgczYD5GMhLbeKMIEbStL7Gnuy00EL59AccN/DEQy5mn6IMaHGDfz9TXGHz4gI
         1YPKytN2JxQKmrGSNqEAvZq2OBHubOZO0o/0Ih+430OrtVX8O1fo6IUSFVw5Xh6yij+8
         cthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633801; x=1773238601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KDjBy/zS51mD1PxaQ7mIKoDOiKAIHa799oQhdGW8t+4=;
        b=d4+OO07vBypLrrPaXIQNjkczROXrSXTSlwlKUmv/uJAzARBEZFEOVWe+hxW3UrAsqq
         Y4T4QNUuR83nF4lKU8kJbduY2Ucr/qtlGDoxEVrB6NHIT9viIue3qmuU8/FNCZBmm65l
         X4bxgdWwy0sZzq8ePp4xFMBk/d2gXVUqO065b2UxJ/rewyQT6Bqu54DtUYzD69FlXF/B
         az7kkkB1cbqWW9sDA6gxm3NpQ0muxWigwHZcYyJ/RULcWUVQXMEK9Bbah27jR1iSLxOA
         RqNzMo6OlWBluR2yNNOrsbzPs53QW4BlYJVY+UNp7Cub1lSBPrFqrIN3XPcrMgRXoMy4
         kqVw==
X-Forwarded-Encrypted: i=1; AJvYcCVXNASDV1XwQmKH4cR3aNazDnOXYy1x+z8XmXVDlD+YIcXKVhvzMY1kJx1otndYHffkAko=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+RtRWTX8/K0BZlEdHHmcCdxPE0pZEIdPr8P5jU/BJKyCNnN35
	uo4jkLKOqXDFRb+ODALFzqX1JfnlHNjOYKfLJkSChBdHMiNbllSWPHwo
X-Gm-Gg: ATEYQzylmTSfGVk0PIh4XDv6Me2tiqBaptc4I+0EEEyh3GZmi5lNhMYPW6c+UZZkv02
	/B+MowEV63xrzdeIp4htC4n1Ar9n5d9GsGfFOvCf2O0S4QignpVReGZp0HXKcIjnObRzBfYlWJ8
	TMH3/5aXjGZQ7V9GWfe5DSwZdsDg3Rnro7C/ON5bqQyskakvCfzbSjNO6PBk32sN+fpS6xYPCC3
	8TxYheHBq6O3yDR02XYoxmefN/U3Fl1/bv6UdO6Qwp0ZFHTqv201l28bjJ62aX+1U1Iz4F55ZZJ
	EuWE/1JbcTQkmArVZ3ELg008c+tpKWmiB+ZbcRKc37orf6pR/AvVC8uPWwtHAQTbs9NBLl5NXH8
	J6i9TfFV2BDBcn+NaNyWpQhM0qxI/5mXRDJ0APJarGD9tcDJ4B2xcAftCXY0OEUJuOdTDwQ8Y7U
	sCwRkhQfseUyUXQxB73roB
X-Received: by 2002:a17:90b:1d4e:b0:359:8f84:ad8a with SMTP id 98e67ed59e1d1-359a6a88709mr2213203a91.33.1772633800980;
        Wed, 04 Mar 2026 06:16:40 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:16:40 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Niklas Cassel <cassel@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Hans Zhang <18255117159@163.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list),
	linux-samsung-soc@vger.kernel.org (open list:PCI DRIVER FOR SAMSUNG EXYNOS),
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	imx@lists.linux.dev (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-amlogic@lists.infradead.org (open list:PCIE DRIVER FOR AMLOGIC MESON),
	linux-arm-kernel@axis.com (open list:PCIE DRIVER FOR AXIS ARTPEC),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS:Keyword:fu[57]40)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 16/18] PCI: tegra194: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:59 +0530
Message-ID: <20260304140329.7089-17-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Establishing a PCIe link can take a while, allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 06571d806ab3..7381d0019d24 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -2493,6 +2493,7 @@ static struct platform_driver tegra_pcie_dw_driver = {
 		.name	= "tegra194-pcie",
 		.pm = &tegra_pcie_dw_pm_ops,
 		.of_match_table = tegra_pcie_dw_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(tegra_pcie_dw_driver);
-- 
2.50.1


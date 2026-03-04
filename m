Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B873B95E5
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633221; cv=none; b=nWeSFl9tLhcuPlcYa5RCXruAfx8BqM7wdA04oG7JYmhwRLnpCbDmxCzeNb/n4MHhtxpAYWIMMri1iA3C00Mo1zH6em0m2K8bvdiv9lht08H96GvsHXaf7YkUFyAooX4HFDY3AP+y/feng8Hcv1Ksvm/mL1yoN6ActMfNNBy7YXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633221; c=relaxed/simple;
	bh=emXK8/tfYDDxa1P8iYWbMlLlPlfkDwMG4hmrO9QaGWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKFACWERSMF7Ih1AuQaSRinur3hUFB+1SM3mXRynw1wYHFk+AVa2VSeFh99lOYyst0m3FhRn5wGjjFCmRSPKcYV2uPLz0Hcw5R/9izVxYbdAJAkD2ACvD5B1z9n71WqThEERSPG7SRdzGKStWIELWLzFqAEPXjHqPSzKe5QJnZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuV/TVkC; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuV/TVkC"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-359894e17b8so2379245a91.1
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633219; x=1773238019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GDiK7aQGiQOGUD0oRaiplszyhTYrKMycTga1oNn5ks=;
        b=YuV/TVkCCwrigTeef06d8hc6aEwK8rCjur4UF7yID0rPMOxM90sdzm1BHDwrPToJuy
         wJFk1q5FkEMPGPNNZFxOxeSHDmLzsdu1U/u/3btceLMeYrCjR7Wgj2q6lwkAOVtfC+R2
         tv+6vRvzC1D6NkOkM2guyzyoTrrUbbBiF3KoQk++7gtPnbqQ1NtLehkaoMG1WEcnL6Ya
         yZElwRtotJgndExOSQ5QgwDPGlHVh5AcMkJYvry7PCflRlF6p83k7P+89r7CLsAtM2tZ
         78k27zem+atk0AOmw6f/0w4C8i78bIwc6LBw+BcWGWE/xFvB9IZ0ks68Z0wPsy3i9vfT
         wrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633219; x=1773238019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9GDiK7aQGiQOGUD0oRaiplszyhTYrKMycTga1oNn5ks=;
        b=KpcHdRL2ot4Qj1oWpiBpWVPQ05JLEkHnVsFGCfA7CvJ6YPspq8UuJXsVRU+4EjgB3g
         qWzx27EnUvFSnylCgXFxjRJ+CYquMZ0cacFagWR7FCyZKK40G/mYJ1w8IQJkxfVE1vi7
         BWfGk4mK6PsBQYyyXjzg6/OTCcN3A0d3lDJ9lJHAQZMpnjcN+m2Ko9sJQEDLzKSn2ALd
         jCct6PFGEgbgVflP2FTBDwyQVp/RkAZwk8BYb+4poLzeElakqcxezrQt6HDyhC/pYaBC
         6GvQ0aVam8QYRpnFxU8WHsdIap2xY5P1Ea7tRUWHhNXGRk4c0hh+IqZVmiWHWxwWYmwM
         7PKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfIfr4jLfv+IGjAbL0ytRb6i1/N8Y0chytJP0wAtCspMNL58YenVMuUwG0bs7USE/a/kM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPRh1NGUiWE04j2wKUDKNVQkDEZyKfFFLiKvzLLegK1FVpT2Sx
	/qjkvDe8ZRwXQ9yCS197fDfqrGffBY9K8B7Fd1SBj6lVRR+/3/BWKZU7WRBZvgJq
X-Gm-Gg: ATEYQzz3D9r53p8YX63aF79hHo1XwJJ+3sOtLjb87a22ToB4K9cUATESVfbpwY2W+bD
	7qvx/isjFgatUh4D3thaJuugwlWcb71Q0FJ7ZG6tdUAC/RiDqqI5kgQCbDuLjLwNBYNgJyymvJz
	VNq+r2wd0ik/WzirEnfTNhUQ4XU6qrFgFhnpg6Ys0sD0CQ4YY+5Kco+SWna767sp9AYZ7sP7sLf
	mYC7wiD77nSicENZWZWWua2LlpYAEKOGXHDSKMBj2ud5eYNuiTfpuO7jLGyhpMQ0XJAzFfh90lO
	Q+sPOs0MEiaatJDSV0fMIUssqoHwPy6FA0rptJmI56HiAWUte1gsKoBWyuwz64UkG6qjdqM3nqS
	lSqAWeeqfuAff4jinpp7aWigROmV6YPXk8xZMA5YWtWYJeQzOutdoZp0TULO1nIAftqSwZC3jiM
	XzJT+wOm3cWpLO2+0HoEls
X-Received: by 2002:a17:90b:5547:b0:359:7c55:c166 with SMTP id 98e67ed59e1d1-359a69a94e9mr1892448a91.7.1772633219172;
        Wed, 04 Mar 2026 06:06:59 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:06:58 -0800 (PST)
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
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Koichiro Den <den@valinux.co.jp>,
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
Subject: [RFC v1 04/18] PCI: artpec6: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:47 +0530
Message-ID: <20260304140329.7089-5-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-artpec6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index e994b75986c3..d8b827926b85 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -520,6 +520,7 @@ static struct platform_driver artpec6_pcie_driver = {
 		.name	= "artpec6-pcie",
 		.of_match_table = artpec6_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(artpec6_pcie_driver);
-- 
2.50.1


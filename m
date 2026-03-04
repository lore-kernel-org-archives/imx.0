Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3D33AE195
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633850; cv=none; b=i2PoTdTUzh4YTePK3FapIjHXh3QGd4yqC+k/GSvK93sc1SX50Zn90UAazGBYfM5aFZtcmszguYxgmcMP1XbIBpEZOgrlfw4HNuU+uB8FHpHSXkjkiKsIIgpXAMQfjHFYKqfiNtRzAfvvFPYw4IoAW8KoB56jZdQppV1ljbMwr00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633850; c=relaxed/simple;
	bh=PwMzJDaYmT2axJpaHt17C/g7mT2QkkzcDRg3A4Uz6ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WAeLcRGR4HYKcRsnqmkpA6j5Yx3cUkY7Rvc7rMt9GoCXQooSbgxxzY2YNYHDK1SAAEc4/RR3EaEAcgKTJgoEhPG7x2/rfJBgfFNF357ziE81A9bvInRuwPDEHEnH9x6iRfA9g1kuDpJa1F2qLmfzamsOevjQn+gplZey7Z39aZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAySyKSw; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAySyKSw"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so4076443a12.2
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633849; x=1773238649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srUiyLQpcPURMgpIQ/orm3Jjpyz5IeQj0sKin7gLX5c=;
        b=mAySyKSwmKaCgNy6PbP0iHNpuBemu1bn8pU2NRLcC+iXkmYSINV3lVBXExa12lLotx
         pndY5FBX5JuDFGLUppjL9oL/6UDVqo9z/ZHwlAcLy1xcDqkpV1s5votL7bLQQd43KfNV
         0rdGdYpZ+MI5Ij+6SOnnfAIVYipKfuRNWdITFAQhiKgCU/jKywG+GGN9CD0j8L5nd+iU
         NjeLJcYrX6vpIF7w/uJYgWvwOq4BbO3FtmrCqvZOwRGdhlWzERKPBHn/QhqHQJqAR8zq
         8vgC9IUZUVp4uIty8wrV7llS3PlKjYXgF7EPtCTBOh6E7MsU7Q9nEBRyWu5641Uym2HO
         TsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633849; x=1773238649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=srUiyLQpcPURMgpIQ/orm3Jjpyz5IeQj0sKin7gLX5c=;
        b=M1w5MX5lTpm6JKxbqhPLtUjF+HQmTpkD6FhMYuGsgHS6ZvKjPb6H2D2dz2JQ6eJY9s
         0WTgyPhZLgU3hHSyzE7cVET/IJMQbljbrqZh48dU+KN5OqVx/0jxlmghvO1dk3FfSKbT
         XoqXE8NUCKm+m5pt/QoWr0RLuOS5tGyXk/xDraYfzj4Gco/+8SXtDOSWAToqUIW/oLAH
         ZQGFBD6HApuuvSx71pvTtQ2xdK1Zbh5UQVCrLg5BN6TFwP/HbbdrC/M0rJYRQTL5/cQe
         xtPQYjI+R+P4fy+UAvVI1NaHPmxH+6ATw5fevlgcj7t72pyctOEGJyhoaQPK6DEvFL5D
         vOrw==
X-Forwarded-Encrypted: i=1; AJvYcCXx1igpM52pX7c5+1Bb+nl/inNwLu61QbNfBysosa0LaGkL6UyCYoJxDfD1RqnfXDRDISk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyiot1k/1NFDDyPmBWAKncyqF6vnvVIhFtB9655rd7GYpKRHUPw
	h9KVTU37qpEkTd+jffYv+n3LwXVfFQBN2BIaTqhNojqMRYq/Z9Pa0nNu
X-Gm-Gg: ATEYQzzH9joGivwaopIbm60V2rUeGteZT/HGLXvFv+MPvKJfhE+0B27S40ATSS/MUAh
	M6Y4rAoaEjjwUX8knSPj5raPqRJWWBTiv/Wsegw49tCPzYiTgzOq+uSx8Q+Eih/9/Uz5JM1SjbD
	oo1CMFcl4DXCBYUE2NukRGvNjAlMNJNr+cbFuHd6TljKVdq0/olFkwPTlXBia18qNlG0RkEEgDr
	qY2ww9AlarOcYibCb8QP2gZUgPf3uyi1+7cwAILQHIY41iKgfUobB/TFahvh3i7wmcxvC+cjuE6
	DbnSpvbbgmnYxKkWAL6mEhd9mhVWnT0agQOlnJImXo16HjtyIOF1Qd/zWf9BTAgcPPRpY5+HORq
	Swo3IgW7kVSE8aCO6LEKA7gENnXrWkAazdoNVKADXe3DaQQzzxBRstpzBpJ+SBDw4Th3Va0Beu9
	kNb/yD1bQ5HKUWDcZKqNmP
X-Received: by 2002:a17:90a:d2ce:b0:359:849a:7357 with SMTP id 98e67ed59e1d1-359a6a3bc3cmr1764561a91.20.1772633849089;
        Wed, 04 Mar 2026 06:17:29 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:17:28 -0800 (PST)
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
	Koichiro Den <den@valinux.co.jp>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [RFC v1 17/18] PCI: uniphier: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:22:00 +0530
Message-ID: <20260304140329.7089-18-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-uniphier.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 297e7a3d9b36..53f3bc9f5ba7 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -404,6 +404,7 @@ static struct platform_driver uniphier_pcie_driver = {
 	.driver = {
 		.name = "uniphier-pcie",
 		.of_match_table = uniphier_pcie_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(uniphier_pcie_driver);
-- 
2.50.1


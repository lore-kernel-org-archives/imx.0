Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B104A3AEF2D
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633464; cv=none; b=trX3GTm55mwiva/kXBHxS27kdUWDJIebxo4f/ap5gjtPPjc1XaKvLBPU5J0EZWrF5aIQ6+V7uIbrPzlr43rUkRygJGA58wsDUldDnrnPKsWaBHqz6ZF8xst6Em8z0A0zTfr31BQP3yp48zY5ckmHeGuNEIKe+2NdkQzkHYo6mmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633464; c=relaxed/simple;
	bh=dGHDNG1M30BMwVefPBCW8ENkGd1Eu9rEV3i7SZBHTKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qoCo9wKT+S8k/xISeGtb+NjseZWMbz1y1T/l9BDHBMLEL3BjS2wF9CMcwDefDCU/b3HURVojOhZLXvyh9XOg7xA+v9qec4F8Qv9dP4kBl0AHvjScspIC5eBC8BE1RRDMZV0VaCO4nVCDACTbGFM+JkMX0UN7kpwRIdJZAKMP9AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBSNerdD; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBSNerdD"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c7350fd4efdso1466296a12.1
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633463; x=1773238263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eksk2NaSU09NJtKXet9GHYtfaMBPJpP6oyy4wD9BvXA=;
        b=XBSNerdD2rGeEkZDODBsn6UgPs/anyMb+g08/L3DANquYyqvd05oAC/aMIIRNkj28U
         f1V0iZ5zZbNDaXtm1v/nuS/vEv73frOp+d5cf/3GS1Ea3IakpTp15fAxV9sdPsvypTPy
         Nju2mGVUKNdM6d3scWTscD8IdEozplwwPNXAH+KH7Qcl3+yvPEgi9idHRz76bn3++Uew
         z9vieK5pJ8OU1/o5WISqJ+evlE+fVTBOYaADeoXCURT7sgExFOBN5Pzur2u0/tBNZ3TU
         n1gicNcPLUnH0IBULQyJNU/DAT/cROC43XqYI3JTJamEGAw+VojGV9EOPLDxmf2D0aAZ
         b2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633463; x=1773238263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eksk2NaSU09NJtKXet9GHYtfaMBPJpP6oyy4wD9BvXA=;
        b=iK9jSXyROWJHIB0Wfv6UNcUm6U86A1e/TdfqDnkoppzK9/USGLc0GA/FLk17hbh/dx
         60Uq8VISaWZhXoOgsbOfHd8NI8OVB907MoFehY9ejPZGccD9OTZ4uTP2r4/aYFtQ/LF7
         IlNL92zW4w37H02WAIOAvi6FCMq+Dg52HeeObqEzaL6R4FSWK20QPap/74qQRwxmboMf
         fi7EFxjueE5gSLXRsf+AcYuPiBUPGS6iEuTTfAe1M67GrXfs62r/ccyBLWedyU+0Ktj/
         +lwk9BWa7QEo1xx3vYXS1Uq3f+8WyaVOTokdmaaWSkGKp2GT4oPYDVGMYT6iO7YFo+VM
         7LoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYGR5sWJKesIc6jWDwXlRa2yaZqDYm0TwzwMx4rUFHoPjaPp3OMmr335wfQ1gFBCYk2cI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyepRKYrNlk4qnRcxKESvWrNYjkpTRJIN6lslex9mpJlB25cXyr
	2HzWp36DmLwzQ/xlB6X5+/PT1T6p4lSQ/MLQHZIUZGWwWdDJ+FMfV7C+
X-Gm-Gg: ATEYQzwt0pykL0XgoOqfO5rim4W8YuTVZunaBszzpDT36VywLGNQFgvW8dy5dc4Z/Xx
	KdNM2telfrIAP/y9I42zOwoz1IJGoR+TA+55vgHhbcWlHIcdUb+ji43jBV7rSwWXKtbirVFQx0J
	1USmPJjUwV0XnnjW46Ya2KFvSwuuUx4+gR+T8OMtiHFuvlJxyqSeDgIairQtRfd2Qg9n+ddCHpJ
	Ik5pa4Qu6WCQ41N7KeUh1Q9rax1ar0RjNSXrVkv3X4m5iBWyT+hk6PTkO2oYBH1IXrqR3XfpBZd
	1N2bWrYzb24mPwDaRdhi1vac22seAOuF4uiSkOPk1YrdBOJIBR9SnGx4gwv8pzwObxLMNL9Q29b
	KDgES4j7EwSQ9mRyPQCIlT3Gm3xDNXXq5rzrNmZZIw4u9hwNnVAi8a+sM3e43VyCLNoxZC39bLM
	qKfQn6cA/n/hYygm7HAj3GkuoN4s7UWuQ=
X-Received: by 2002:a17:90b:510d:b0:359:8c63:8ff2 with SMTP id 98e67ed59e1d1-359a6a4f880mr1548752a91.22.1772633463114;
        Wed, 04 Mar 2026 06:11:03 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:11:02 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
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
Subject: [RFC v1 09/18] PCI: intel-gw: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:52 +0530
Message-ID: <20260304140329.7089-10-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-intel-gw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index c21906eced61..bc5d96dc12bf 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -442,6 +442,7 @@ static struct platform_driver intel_pcie_driver = {
 		.name = "intel-gw-pcie",
 		.of_match_table = of_intel_pcie_match,
 		.pm = &intel_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(intel_pcie_driver);
-- 
2.50.1


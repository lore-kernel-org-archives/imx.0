Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7983B5835
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633318; cv=none; b=WlM26ygPhFFyZyAiPDT0hHwL+MBG7RRbcK4XCWpF2lgeqxbJDQzvoAIDFva3iCuBeEMWsd8ieM2AO/pSLGbhuSykKUsHzKAu/bjNOSRrUhsNgt9RNCeP6CMcXAXg/tr1pDsHLz2VSDMUG3Zs15i1DvOgzPvVtEzXYbp76PbIb2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633318; c=relaxed/simple;
	bh=mXK/wuVbL2lWEcp+yVdrQP9dP9C5hBIvBbQ4WfvEi58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxL/VsEr3fMBrYdymwAoF5I1kgQO0x0q+8SZN5KXh/5+xKa9/dBxzXjjuH8zOBj672Qi+KrOmuGnscsqgYJ1GtkapzJ8a0iGtgn51eJ2AVqcjiIj9ZrkaUoR8m1NvQxvoGrazm2oRApjV+SQqQV60dIYBRR9ma4Wz+u43eLHVOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlPQD7V9; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlPQD7V9"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3598cab697eso1997527a91.1
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633317; x=1773238117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zjKUEALhh3sKzrRVkbw1XSt9/jPsMcJZY5h9AuldV0=;
        b=ZlPQD7V9sJsMuJsEyreC1fjQTPQDvi2JRS6dPUPMIp3u3le1MWTxY0gO3awXdUoMJR
         rV4vsCqCKK8ixe6tN+gcYVnTxVh8UbQpzd2/XzWpbFKLA9hgh3EaPBF1NUta3exSdks8
         r83PFdXg6VXENv9u6SJh8td7l0TseBJZ7wdBh32lVVwZ7vEbXHc7GZPziYgl6NQV4qVL
         8VozizF9+XLvvoy5+I3e23U9lAyo+IelUPGSSFKgXMZ7SkpltPJDyWbhF1Diw0GyjU1c
         cMNV9dMs+LTaFyvXXYQo1Nb824H42TZYIHmoQMK5HKUEnCArqD2jFoV3cf7DHm+SyU7W
         6Lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633317; x=1773238117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6zjKUEALhh3sKzrRVkbw1XSt9/jPsMcJZY5h9AuldV0=;
        b=V9LEV57D9b5rdxfvv1P9I3w4AYhlNkZ0L1IklhD8L5qjZc3Geuxe03PXIr+BrvfFl/
         I94vDr72Hx3ducSNaNQfrQ8fkJsl33aH9P6sQo+QIHff+JoHJOayLvVu8GWdrq5OgPVk
         catlk79kbDE+4WwB+6juYoX7M1H1lTPXCn2seQlp7j/hCD4PBfaFJ3WaPDM8I1qS3RmH
         Mir8EJM6YvLeXMSoxSpQva95xTSJAXWhUoeAfCIf/LZsanVS+mL7Kz7hZbJtGg9E+Msb
         za0conJvjs7QiodEqrTO1AIV71hLXepjTvZYbu4xRflQpdX5juCl/kKky8EnZsaYTXue
         G6Lg==
X-Forwarded-Encrypted: i=1; AJvYcCW7grHjMhqkHuTW0Cl9fhrnZm7ZAO5+YxynLTXKRBQ6VNX1ZNEd5lUs18tVXzsepKInTUw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCSB6EbUk7PWMICt3Yg1vSO0NJx8WoH7c6HCvUmOZzVmNuMPV0
	o8m9v029+q7dW9d+SA6n4J8CUTSBELXtfNsBYqamvSKIjPL3U95P+uz2
X-Gm-Gg: ATEYQzy6LigdZbz07AFKGkLwNb7h6D9RPz33N0diEiInAi62mC+k9z6UIaNOQdeCYZ4
	RBp7Qua4+3Ca4CVfQI/qXB7vfv5MZof/jXBBwqttp3Zhr6GptSxv2QN+cGNI5Xu9zh5JJeEm6TN
	6e8op6Y92p3ahvrGeHbkn696wNwrfoT3AHLY3F0bwiOQIOb0i34LoHZu0njjdIQ8sx3b8syRrQq
	gHxv3shuEe0z0hb5T9NwJyE5tD0S4EOyw+1hLRUrnPYd9Zlg1bXN30BI3ymE5P1LSnbw188Pz4X
	/Fzs1cEcoa+szkrGKaodPRZRNo3o1KzSzyjwg1rD4O7ij6dTvYoBBK8FvUnDd+qYe/+RPTC8MrE
	VRPuvbBxGmt0wpDPtfR93FtSMcnIV9x+zGxpT2LtK1H23jMWqTDejMBhvHTRt9LfP9PivSUAvfU
	Ac3WWQdLlHlfsO9nuvkzxC
X-Received: by 2002:a17:90b:2d8f:b0:359:8df1:8553 with SMTP id 98e67ed59e1d1-359a6d8521amr1962255a91.9.1772633317107;
        Wed, 04 Mar 2026 06:08:37 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:08:35 -0800 (PST)
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
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [RFC v1 06/18] PCI: dra7xx: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:49 +0530
Message-ID: <20260304140329.7089-7-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pci-dra7xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index d5d26229063f..be470d54b2ee 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -951,6 +951,7 @@ static struct platform_driver dra7xx_pcie_driver = {
 		.of_match_table = of_dra7xx_pcie_match,
 		.suppress_bind_attrs = true,
 		.pm	= &dra7xx_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.shutdown = dra7xx_pcie_shutdown,
 };
-- 
2.50.1


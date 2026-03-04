Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1003B531F
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633077; cv=none; b=F7YGZygIK8gkXnF1pfVpJ+8Vt18b3e9SzcdyNnuia9vIfypcAyaodYWq3RIFNlVoAy8p8GwaJc32+oZavi/yfdxZz+5SUWlaKTEwCOhKdqByLN2qxZinDw5mMhtRGeA8HOc2qTo5F5I8CJLTcTRqsy5n9HMtq/nawYO2noVZDNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633077; c=relaxed/simple;
	bh=fysw4+7uigVqwi3HpSXPiZOY0cBAcQNqSX3ljElSVyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/fvHRC39TgZsOtKWlLYB662uQ1KsIpegbvvnWzr6V4MGC0A0BGz8pG/X6tw15GMEsDJUbdcxF+i+8cK3BL6ROZflOirI0TOWnPsTBMpSWZ0g4xqOB9wogk8gV95Korv80Y+5QE6yPHPGwU+n/ZrMkmRohqo7Rw9hwFsTI6K3z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkkRGzMn; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkkRGzMn"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso3047597a91.0
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633075; x=1773237875; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HTAseI2RZvMiSq6piqVCjZa6XAi6fGRFqwpnmtjoWI=;
        b=ZkkRGzMnhxcVniyKAsghQps0xV3hdAoMHFMWM/WdqBstAkK7JiG6bhdRYQkOi5b3W8
         aH0rHg+7n4Ia9YiinZHSr4ZVNdffRiGhPKe0PYx6z/9LkIDn5QckfnXezh4unjWpFnuj
         ZUmG3RnCU4x3/ywWJOB99w7cBcjV6u2td1vEcFqivMqddE1gZVXyhglk6GqdezYv0/u9
         qDft8H4W6F1c/u67a1RhL3t4qMwZLH+gNeARHSRxsOW0V93rvdal6Odbm72jOqDxT4ha
         l4k6J+U6pRlLsl/itjPFF5G4mNMgrtaI85Q9HpuDZHtPSmo5DGUa5npvokHbGSDN6Pxq
         pZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633075; x=1773237875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9HTAseI2RZvMiSq6piqVCjZa6XAi6fGRFqwpnmtjoWI=;
        b=ufIbWIVIOs99F2/AdyR265F7VABJECc5uEIL0QgiUm3WjTkgdZvk9cTPyVpOdz+F5b
         r1HEB2dN7NZ8zXzoo7dWN8gfpA4dqdQMQRdIznUtBRq8eNGrfKffriMXzTEVsiFwygEn
         4NbUsompfqNldjZ9E1KS0VZ8E17t55RPkU/hPPhu+/Dz6RGsXHzAL7u2qGQSceb25FoR
         nRrZQqUzSNtyYMrCHjVTG4ZNunYFd4kLbHEX6DZ1f7scGrVjLnBjBoFxFaVi7Z3akHMi
         l7b5JtOGhkdbie0R1yIhmAR4zc6IMZcXkeSimbG7RO+7v/uyLy1zMICWEp6XXBxHMGYA
         vDYw==
X-Forwarded-Encrypted: i=1; AJvYcCVeSnagEHWEakWzCJ+3QBjxferQlT88E9mn86HxRtQ6mEGW6029yJW1EpC6bl8QbEk7vUU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwU7xZzILfK802FG0An2Hjqth5ODADXxlemVR1xvw5k9EXJvQG+
	IhInU45b0qaVXZS1PMEm4FGvReLMmUT8WeLSfSpYycwhrz6bJqaQ3ns0
X-Gm-Gg: ATEYQzwdzlUzanOynKUaKtslFK2H0lwbQT+hicOb0ZAWMKt+wZNgWeLMom1FMju9NHz
	66by61/JkhLz4bJZWE4PEQLLd/Yap5EHoL+B9lAWGqDlHkXTwZ985VXmO/0HT4gOkesS6wShJfY
	1FOyfR2EBfb3ptCAwLpNlc3Q41TqrMA2k5svBVQtmrSFIgQevk4AN0dR71cnRvsuBpdPze421d6
	VFNj85UpoQh2TmnEwvxKOsq5W6ZmMr21J38+A08MApSAkk/txgt9oO1C562NQeKHU9fI7KGhmAs
	eqE6wi4CSRpXkNlivqVfBQjgePjM1nvVeyXxOyM7la+OjPuZHeqkPb7zPW0mxO4scaSwjMIa6XS
	mcRZvAxGSjlmeBRSA8jLGJYwnGkf4FXXq9Ddbz0OppqtuECLDcl5KUr3tw45+YE6EyAx6nousKq
	+NI5JVXWsm3Owk2lZ0XJAcdmvGa3s0/Ik=
X-Received: by 2002:a17:90b:4ecd:b0:359:120f:d3aa with SMTP id 98e67ed59e1d1-359a69e5682mr2092330a91.14.1772633074556;
        Wed, 04 Mar 2026 06:04:34 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:04:33 -0800 (PST)
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
	Koichiro Den <den@valinux.co.jp>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Hans Zhang <18255117159@163.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
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
Subject: [RFC v1 01/18] PCI: al: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:44 +0530
Message-ID: <20260304140329.7089-2-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-al.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
index 345c281c74fe..6e3f52ccc1fa 100644
--- a/drivers/pci/controller/dwc/pcie-al.c
+++ b/drivers/pci/controller/dwc/pcie-al.c
@@ -383,6 +383,7 @@ static struct platform_driver al_pcie_driver = {
 		.name	= "al-pcie",
 		.of_match_table = al_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = al_pcie_probe,
 };
-- 
2.50.1


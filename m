Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E633BE15F
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633125; cv=none; b=jO4rAXHYxE34c/mEZv6JcB7ULVzhkliUTzMaPa8nkPzRvwu19xw30G7gwv0iR0+P/D+12XoFIWqvxWHWIgRGUaWEkuUuozs7NXe33Wc4T21sShUyNZK+H3MbEO/LiVRVeoz12G8MP9IZ6UlaMABsutEnaAddtNjpWrHWfhmKdVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633125; c=relaxed/simple;
	bh=/QAQrcofSkdcYW60taE/H4BsrBOpxsnZfDRYlbchvt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruUWNPrUJJCkShQKYcd0/Tkhh8FrEMQS0M4VKsVvoRDbqEi6Z6lBHLh7VycK5V8x+wUwif1rrbeGUVYzmfIas5yOuXG5atWOJnmUOJ4hprCV8G6JaMzdJ2KhpITy5HXuxxMVIytAmkmDtt+ExjnATgkpcmpRn113MIjC2RI89l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9TxQkyV; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9TxQkyV"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70b69ced09so1872860a12.2
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633122; x=1773237922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stXnR5qjp5uF3thkM7E5eM57o30r+czgE7QYCN26U3c=;
        b=f9TxQkyVuFbJFswoBxDrU6m88nZ5QKLr1kqoonckWGEqswgQ39F7+L6t/J70TxLfey
         akbM0rH9fPuDADmxJCkqpphHdjC7hoXAeheJq+yHKOfKsSlPDurFlwWeJlr69DFGJX8m
         r5z4Fy1/x+6ZBBseeRSBsXwvf8C2cCfXZnWlLXM+lVaWGeeh9mu598mW3N4SVkStsYMX
         aNip4XjdkOp5BKTu7NEiNDvEWCdpKdkwMFv/aELWPLDnkDzORcxij+5hRN+FWwY/ucEr
         VMIvuHRpumSOZrrhMnQ//ps9CPycJoF85REPwmbrxg7I4hDtPq1DpBZpLZ9gvbzw6gbY
         D6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633122; x=1773237922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=stXnR5qjp5uF3thkM7E5eM57o30r+czgE7QYCN26U3c=;
        b=AXhXq+djzPcyxWd0KXMbcXFSv7HPlQStAM7D+dh+U8p2QXJMTnR1ThHyyKij25D3mf
         ES/yjXW33aNmyyGdP0qSd1Bi1j5XTUuWNHFdUMPWEtZLiJqGAzDUfV/z09p2oY+goo94
         AGzvkabmPTnN6ApFo3TlyPau4/UMRRDYkMRvDS28qtTDsmq6Et9n3i+AAxlPb4DmDGJk
         w3DBGwVlESEO3phtS44eXnQsHFsPQfGdVCYOmYIHE+Juflf/L3Tb3BsalwVN0RqcjTmI
         dXGD0d8fc4UjPPHAGywogBJAMpiV3ihS5oD7DQ72yzJVtwveiOlVIGlZ6Op1uQhVJpzH
         BRuw==
X-Forwarded-Encrypted: i=1; AJvYcCW2R5FcCOSVE1iuZyu5/zLUD61AGZcmFDln+a/Rnba6JPFsbNocVBZj7ZDlQHVnJgw6uCM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhbOoaIDi8ly7XSiFTTqREhFwEj3lfbWzcUahURjfN/oSlM6yj
	HWetdAmRMfXueIRDbe4saw2tmxns9ys71WQaZDmP4Ko9+RgCXL1LFITk
X-Gm-Gg: ATEYQzwkB3m5u3SdJspc2xtJP0qFAm+111mXEm9MHg6xozee/NOhNoN/gS6rc8GpEZi
	ej8fgRokVyGtTDPd0StaoP4rY6LL9uPxtZahLNqTKs4GiAuRi03BvIHdQ7z/RSP4WLXBpIGwMa/
	VUo2iELhWnTvrClkNeXt1YQxttVgik83LbT4inzVlBZOSisYTmsEtaJP/YNRFu5e/TqKrqDb4Jj
	p5flwxvHx608u66ShL+FX5jIwvLkOTbsTF4CRzpPMEhT2zxheOGVh1BbzDJ76tcnFdrebBn1YPa
	35fic++Sz8DzrILh2a4D+ekChY0GvrImxoJ+gAxOEAkmdwQ/dIYRnPOGB+hXlGrZ9Cb5gbBBy6d
	FhIuLpa2mY6UUFPi9H/ZEklm+NEuG4m0rJ6mKDzOup7Lmy9rwuHLAxqaHFqvjObnMcYu+XPQjCX
	UYqYRi1nmvwIZ3RwByDr2sphITwAbmEFY=
X-Received: by 2002:a17:90a:d405:b0:359:8f4b:6ed5 with SMTP id 98e67ed59e1d1-359a69d424cmr1769092a91.15.1772633122198;
        Wed, 04 Mar 2026 06:05:22 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:05:21 -0800 (PST)
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
Subject: [RFC v1 02/18] PCI: amd-mdb: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:45 +0530
Message-ID: <20260304140329.7089-3-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-amd-mdb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-amd-mdb.c b/drivers/pci/controller/dwc/pcie-amd-mdb.c
index 3c6e837465bb..3da5ceac9b6a 100644
--- a/drivers/pci/controller/dwc/pcie-amd-mdb.c
+++ b/drivers/pci/controller/dwc/pcie-amd-mdb.c
@@ -519,6 +519,7 @@ static struct platform_driver amd_mdb_pcie_driver = {
 		.name	= "amd-mdb-pcie",
 		.of_match_table = amd_mdb_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = amd_mdb_pcie_probe,
 };
-- 
2.50.1


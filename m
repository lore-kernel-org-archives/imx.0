Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADC33B4EBD
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633561; cv=none; b=HrWCYFdiyQy+RoFU1Vpdfz5Qta6ZBq3M9YEedDvdboIykMNz0Ij6NQSR3E0FWjBHzimj9hkaQIm5JNiFyTCso/qhhdhXgpXcEsIhVDkEqRdMAUGQC0lP0D18jc8xavnsT9GYdZiUsoRdkIIWaf+i8UhZ9+K7Xevk19NP93O7CrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633561; c=relaxed/simple;
	bh=uNokBxxuyt+zPVO0vcOQK89zVSyGR0Yqq+jATpwqTR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amBYUis2MLSqp0kl8tBTcVgsPM/tYZl++Hw6764w5FTOHmkByXOqL+0e5xeD688pRLuBGfJO6CDbD3Ida4w5wSUQZkEGah1kD0Wc+PBHl7ImtHYR5lqKm71uRAfKRBV8r5s5SHeJFSKocJiLStS/WhaSBWldy2qemUMk3RXIG5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPGrRjpD; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPGrRjpD"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c6e1dc5c5edso2627181a12.1
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633559; x=1773238359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvXorwNx3S8EJD2J965xM8gci4hmlt6ydwx4B/ML9So=;
        b=dPGrRjpDR7nma9tY4eBGytKXVcaD79BaADjIstgTZECjbgJ4ZHgghcr0JYF9wZcnrF
         GJCo7lzyzsW7sWND5uo5mA5LkbeoONnSpf+Kv98YmjD4agkRheYsPLUN8v1YqhAx2yx9
         qSyWcBHXLZ+YqsErpCoaFZHuNs6He2xQUbMvRQmOi/0Bttjs0LNU4sbdiC2WXBxJ6gKA
         IRD6br268Q4zHWZ4fgiQWnKIFXTnRfws7buxJbVjTn/s8JYdFGAUahTbARZGGa5/SrtB
         txk6cmXCxIMTlZkKeUSYTdgQmUkKy6y1m2Nk7ENGH56VcjDJWScz3m9ZNSVkf+l5F9Hl
         SOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633559; x=1773238359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wvXorwNx3S8EJD2J965xM8gci4hmlt6ydwx4B/ML9So=;
        b=vrPJ8lOcWGTwXSyQEawx+Itp+ehmSOdrhZAqYaczPvYGD+SzYptySsPymm0oZ24yml
         eJPjZLq+QkfOnCACrwh0wEsMlGwXGhJxpnh+ZZr7R3gR5rVWVAmREoCFpTyRN29ne1z8
         CNjZG88UlLE4xiUCTEcPdyTLtKK2qjNMwj5cJSMnK2WZfeknkj7fPDpBiQxJIkhAAUWa
         F2V5qSOaXdm/ljj5OFA1HXhiB6bAyAP+OQOFgv2elpLOiabBgzMGElnPPCCIC0XGRkmj
         ze7CCN1RLtoZkx6ky0oCkNpog/0ZNFi7mSo9B3rjAybXhk37GScgv+f45wBEhROYmST5
         CimQ==
X-Forwarded-Encrypted: i=1; AJvYcCUViRCBUV7rbZHrT6ANRps5fB8VKlKFPRUqNiQN8O7Fal5HQm2/xg47k/GXl0uxfZUjDss=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDm/7CNrNSGy4huxp9q9TB4gQK+I8COLUZwpAdPMAH/PqSwoZf
	GtOaT8/7CtalLH9BgpZU2zWua2/eDqrktiKf38uiTqxlWjEMubESy69B
X-Gm-Gg: ATEYQzzfl1nkjV/7kF7TE2h4WbwloXSkgx1NutSGJu9zrQ7Of6v7vMibpomAxNXNDnS
	IM4rXggR4CML6qyR3NALJE7wPYI5dSEUE36IaCknY8gcIYIym052zxAqdWQH8CS16/tUTGZ9LYM
	nm2Xq/bRdY7+MyRbWQbD4ZWYSnV8IwcimDr5HC+fzZBhhmnX4EB22N8YtCeszZ2Z8Pkcj/pa7S+
	bF7Ma5N6nG0cWHB+nebqeOO2Gl3qE7DxOre1fvfS736SLGitDrJ34hPpW5hrf1px0sE1I6RkqQH
	ZzoVISHRsKo32GBVeFjCwXW3n0R5CVoSAM7cog4n4jA9rY2fYt1X378BGUUNnlca6lRGhPY0pCo
	vzKdN3xiEylVT6cBnTpqTDC5xRSx6rfO5uKZQ7KI1d6/0qSnLUNRXkbXvMfpYDcWViy6wEjx79n
	JJvwKBQauzyXpiXVwXgiB2
X-Received: by 2002:a17:90b:3c46:b0:354:9b26:cdf8 with SMTP id 98e67ed59e1d1-359a69c774cmr2111843a91.10.1772633559439;
        Wed, 04 Mar 2026 06:12:39 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:12:38 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
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
Subject: [RFC v1 11/18] PCI: keembay: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:54 +0530
Message-ID: <20260304140329.7089-12-linux.amoon@gmail.com>
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

Establishing a PCIe link can take a while; allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-keembay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 2666a9c3d67e..a82d69b37e4d 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -478,6 +478,7 @@ static struct platform_driver keembay_pcie_driver = {
 		.name = "keembay-pcie",
 		.of_match_table = keembay_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe  = keembay_pcie_probe,
 };
-- 
2.50.1


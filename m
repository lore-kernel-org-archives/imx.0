Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1F62D73BD
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761154994; cv=none; b=AzPQEO5LjB/K3FWkzBbPi7E2YgWJmW1icQ3Zmc54aTYooGORlQ6m39izbVuBH3Dbtc6tO/e1SUXT23iB1LxOjQ3px7yIGu8cribEucEoRcnX+c5fsd/Ez3EjJ1TZ+Fe8WuTzytFmJ8mSKA3ziMKbEXegY4qeuXFuAy6UuNtUi6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761154994; c=relaxed/simple;
	bh=x4lBM6MALnsKTkLEdOEjnhf0UotUJbGi2ScacjBBP/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lixl4TEt5syHPt5r3nWEgOs6Hh5a9r6uGfzbUEBbK7hNp4nS9qLkksMWWgamLH5KK5yjg+Sy5StU8U69sd0BLPmQXiK9w93Rv3589/sy3988rVvI9SiEkqj8FILRdr46INQuo+k9Yu1Gzc2CytEs5I+83/sIX2TReZbyChASwbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TbqpdYiW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TbqpdYiW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4711810948aso50972495e9.2
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761154991; x=1761759791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEGDYb1h2mzgB0PmHyauQaDh/tQllsTXIY8VSU+TUKM=;
        b=TbqpdYiWKTXIBHJItDRFLR3TA1rk1fS0U+6tdc4LqpByw27d9pK6CSaCqM2ZCSprMq
         JAKgP998FS3ZBzlFWSb4nXOWNDY6rGMCbBl0ajerpPa/REpwE1k+5eWG4G3FHaBrZVRM
         qUAxQ8fyrv16WGdJ+EVSyKNJoCjzn4MqOITsaPhMlG0wPIqa3EktYwge2DXtz/q6PmS1
         0kw5hq93Q6x+O58bnjh7ZZhCywG1YLcFrL8iE48x1Z9xPPV+hpS/PPTsakFdOu6kjjVz
         XFeeBU+D1tnsm7B5u0rxPtFZOLIZvyKFiRzHPUB2bHpRF1s0o/Ur0y6cYCHfY1ZuoGep
         xqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154991; x=1761759791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEGDYb1h2mzgB0PmHyauQaDh/tQllsTXIY8VSU+TUKM=;
        b=vIANYP9GD6xaDmOsj60vdBTjrlcn+kG20uZpCYVpy/rB99xPiyVI60cPh9YyUPfeJb
         WO/RFq49+GWm3XpHqdO2L9upmOSICoLJWbV3L7tmaqTYZJgaV6lYVFviK5Kng6rf4NU8
         OP6toqZa3vDW4WXkZjxn/qvwsuYDfCdAMyNrfpvZXhbaFEKXrScy+0PJh1eMbdt5udvT
         +PIvP7tFvs5KK1xm9qkAc0vetsK3nPruRux9xnOkuWh+AQX9DraAKbvD+EJSkCS/Xb0r
         J9hidbb0Vs1SmXh/WbSg0NWvRk1W1Lro2cNQ7WCvV63+0IqmypcRdJbFipJV0fUhzxvg
         VtpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNTeH7wUPzZLrpc90exDlUB8OCN19PXL28S3Br1EX5yGv3EJmu61mZSVYe7A2cZl6KYlQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGy2qtrKKLlKAF2ndtI4rRinFaDlEUnQNrGs0wugi8L/xwxFh8
	Qd8HoIpOOIMcfhhQqapONRkoqobB++lYGoJTn14jwTmK4r6hbIimimGqko1IC7mS72o=
X-Gm-Gg: ASbGncu87XEsvTIilSSwdOkY51jfDpYgQZoQQleIBPq2XLaCfz7eyVAgqLIleHQpMcQ
	2mmLZdQCXuv0VDt/qOpaRrnwmofy50LXLCCDU+PXOmoVx7GRZ85x6kdcFaw789hBu6uQFmLcop4
	HXri3krnYlgTM5uq/dSNuDXV/LDDWIAYMiujGQxa7jYySH1xxeHsOyYJl18VXHFvu0OvocAeL5f
	pm+AW2hTHfEov3WVrxREiRy1sOOSiKTvZxL+sq0GvjXs+19Lhe8Po4uX3fzanR3DWDFYG05HLxC
	YSrnqYTey464KuOEgYCLhn5v8o8idq60XDSaIF4MZLUrEdN9AzhrWqLUCSH++V6WFLyiu9ZAkXp
	PhveFU1fcohAfio1hyi4Xcg8jMEkbowO52VfDEjKpLgbRS+2eTlmzXHfCm9pLVQo33UcS0//btS
	+WD3Y6wO88gOWf82MO1+E=
X-Google-Smtp-Source: AGHT+IEMDLmd+T9rXjtLSXLZLP4aZjdA4r3I2RlDm4L8/0x4vSRk561EjNsJMCQhfMdzzPOvzd0FsA==
X-Received: by 2002:a05:600c:3b05:b0:471:d13:5762 with SMTP id 5b1f17b1804b1-471178761bemr151131135e9.4.1761154990718;
        Wed, 22 Oct 2025 10:43:10 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:edfc:89e3:4805:d8de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494aad668sm43434755e9.2.2025.10.22.10.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:43:10 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 0/4 v3] PCI: s32g: Add support for PCIe controller
Date: Wed, 22 Oct 2025 19:43:05 +0200
Message-ID: <20251022174309.1180931-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The S32G SoC family has 2 PCIe controllers based on Designware IP.

Add the support for Host mode.

Change since v2:

- More cleanup on DT binding to comply with schemas/pci/snps,dw-pcie.yaml
- Added new reg and bit fields in pcie-designware.h 
- Rename Kconfig PCIE_NXP_S32G and files to use pcie-nxp-s32g prefix
- Prefixed s32G registers with PCIE_S32G_ and use generic regs otherwise
- Use memblock_start_of_DRAM to set coherency boundary and add comments
- Fixed suspend/resume sequence by adding missing pme_turn_off function
- Added .probe_type = PROBE_PREFER_ASYNCHRONOUS to speedup probe
- Added pm_runtime_no_callbacks() as device doesn't have runtime ops
- Use writel/readl in ctrl function instead of dw_pcie_write/read
- Move Maintainer section in a dedicated entry

Change since v1:

- Cleanup DT binding
  - Removed useless description and fixed typo, naming and indentation.
  - Removed nxp,phy-mode binding until we agreed on a generic binding.
    Default (crnss) mode is used for now. Generic binding wil be discussed
    in a separate patch.
  - Removed max-link-speed and num-lanes which are coming from
    snps,dw-pcie-common.yaml. They are needed only if to restrict from the
    the default hw config.
  - Added unevaluatedProperties: false
  - Keep Phys in host node until dw support Root Port node.

- Removed nxp-s32g-pcie-phy-submode.h until there is a generic clock and
  spectrum binding.

- Rename files to start with pcie-s32g instead of pci-s32g

- Cleanup pcie-s32-reg.h and use dw_pcie_find_capability()

- cleanup and rename in s32g-pcie.c in addtion to remove useless check or
  duplicate code.

- dw_pcie_suspend/resume_noirq() doesn't woork, need to set child device
  to reach lowest state.

- Added L: imx@lists.linux.dev in MAINTAINERS


Vincent Guittot (4):
  dt-bindings: PCI: s32g: Add NXP PCIe controller
  PCI: dw: Add more registers and bitfield definition
  PCI: s32g: Add initial PCIe support (RC)
  MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver

 .../bindings/pci/nxp,s32g-pcie.yaml           | 102 ++++
 MAINTAINERS                                   |   9 +
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-designware.h  |   8 +
 .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  37 ++
 drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 439 ++++++++++++++++++
 7 files changed, 606 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c

-- 
2.43.0


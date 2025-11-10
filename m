Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38302D879C
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 17:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796021; cv=none; b=aPkgQksQgNbF2cvG2ZvK/PGo2MNvfzZ4Fxe7ybvCiAEMOiRInNMyupmPKGhY3as87yJ1OZduM1K7TIqQ8JhhhfWjtSuHIZXx4/tbyvytEp/7Y0w7t3psaUwrgkBLTYDF9MY6v7blRJOyR1pHiO5iI7ZdmElZK6IlW4dM1OPki/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796021; c=relaxed/simple;
	bh=Nkg2h47lxF2qO8Gx0H85hCwngK8s040aUkwhgf7L8jU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tSrExcRtdG22r11PWGp4qUM5EoXDa6EfE1Qjrfe4Oi33VQpC5c9CuQ959HFyDtMuewjsCIgiMacUFMDEIJ7CK6MIqioSSnW/1q7kqecPjECNGViDQNuK7cHVQzxkMiic91ieRdEhNYzcw9n3Q7tHVEATHuwQz+78tn3WMHpbZz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gok4qwlN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gok4qwlN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47777000dadso13689035e9.1
        for <imx@lists.linux.dev>; Mon, 10 Nov 2025 09:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762796016; x=1763400816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OF8+BNFL4niPqRVyKe1lX6yisr96vvFu6A5/iDrFJwc=;
        b=gok4qwlNslA4kTDKCRfkFG2m1hL8NeN9yEe+UlLTqElVDHgI0PGU6aWKONOkU7DAQ2
         7cEnbU1wMlySz/OB31kA8KkjHqnzJzJlp8h5du4GPvmY6QcKuZd+Kg5saIH13oMYmCK8
         lG6hUkEd7e0jhzvnuT069LZFX8QLwBQjvDfY3pjJaA9KM2S6sGhGlJNWndacOyVgzZNV
         xr2abjOWVdNAY9BIaQ/PD82l5DJJZNyHaDhTqv6xPQaS8bfXpKBqNonvN0t6HwfGg/+w
         fJgVTUUNjLBQn6nQVEkZedMGp3Vg4cUx/lZjvZ0RPtqJ77HZWN9qHvK8hsM9ZHrf3YNc
         pYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796016; x=1763400816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF8+BNFL4niPqRVyKe1lX6yisr96vvFu6A5/iDrFJwc=;
        b=pj4zGPByIPD05CE9sa0QAylV8DRI6vJARWdfk+ts5L4og2qJ8FKElDRiHsx9tLp3QB
         uUJEQN6F35t/TekSmGdURJoENk9UP3kJ0bvVwh6TGyORCYxY6KiHZRjArrinmaeSbKP9
         kcmguE2vKDTURvtkvnt4gYwG3zW+c6F5WUapVSqZtWR4NMhEn0zH5VzG4LCzgKAW87mU
         2SZkGdpdZTNn3SmCPR1ud9dn6umKCLKbW5cf01J2VKn0Wave1/Kr0wgWveUwZEmpcgCx
         g9MGEkPHtOdOg304evBGpt+QeWZG74W2qpVrZRGxZ2bnrOe8b0S9vmTCI9LIaiJCYedm
         5YnQ==
X-Forwarded-Encrypted: i=1; AJvYcCULwskc0wP+TdVlcuyy38bZZ4n4ngFmBuUY5O16/nE7sPDehNEqeLRftBR/HPdw/GYcFmg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXvyfoAErdVnN9a3lx4M9/OM5G/hYm1EYjEfduzCUsn4Dffnnl
	6o1FUFVCstYhT4CF5RA4Zygs3FQR10I7f9Y/7Yi+klOM+qJrXw7JS50oANoN+7YnTEA=
X-Gm-Gg: ASbGncsnWjBjuLQagE3BPcxdb6t61ONjEKDlqfy8dL3bcgaJgAKcqjLMp5RI35BrPZB
	nrOM52PCSnjc30J1O3PdJoGA08Rfd7Edj1cQIyWr9YuNqEdSAAnvNJY9NWfeOMYtdmkStWjhLR5
	FDHukQPuf0i3OJ9/8ic1EjOWZ+ZbD7I1aKKVuOJisksJKToK16FiKpS4732pYbAiyHk/N5ZEXet
	PUL5CvhuY/drcdQkaQH9FlAJTl2sl4sM1XdDlPa/43y6YPbjBgiWgQTkmoWNt5Z4BpLBkph7PWY
	1VNII1AV+RTX8zdTc2a3dMuZ3BvZx/bRULwqrOMfx3esgHnFdZH/ZHRkIkWgPCjM8U1ePKgcDHG
	XeTOb+tpjuq7xcywivdUTpxEbzeXQ58f9yj/liRPnv04syaO0COqEbnBfA3BkVZHLjwrlVSeqIY
	iAZv73swQX
X-Google-Smtp-Source: AGHT+IFsBQQnkCxj/ZdeAOfnyhkqLUTn/qNT58RuOTuk9hbm4fBeIAtaCNjX2ecmWX+ye2/aVLU4cA==
X-Received: by 2002:a05:600c:3493:b0:475:f16b:bcbf with SMTP id 5b1f17b1804b1-47773237269mr64531415e9.14.1762796015765;
        Mon, 10 Nov 2025 09:33:35 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:d5ec:666a:8d59:87fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47774df2d80sm140111375e9.14.2025.11.10.09.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:33:35 -0800 (PST)
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
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 0/4 v4] PCI: s32g: Add support for PCIe controller
Date: Mon, 10 Nov 2025 18:33:30 +0100
Message-ID: <20251110173334.234303-1-vincent.guittot@linaro.org>
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

Change since v3:

- Added Root Port node and reorder irq in binding
- Added Root Port management in driver 
- Fix Kconfig PCIE_NXP_S32G position
- Use default pme_turn_off method
- Use ops->init() to simplify init and suspend/resume sequence
- Fix some typos.
- Removed MPS and ERROR config. Let core code configs them.
- Removed s32g_pcie_disable_equalization() from internal team request
- Removed dw_pcie_link_up() from suspend/resume functions with [1]

- I'm still waiting feedback from internal team before removing
.get_ltssm() and .link_up() functions.

[1] https://lore.kernel.org/all/20251107044319.8356-1-manivannan.sadhasivam@oss.qualcomm.com/

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

 .../bindings/pci/nxp,s32g-pcie.yaml           | 130 ++++++
 MAINTAINERS                                   |   9 +
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-designware.h  |   8 +
 .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  27 ++
 drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 435 ++++++++++++++++++
 7 files changed, 620 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c

-- 
2.43.0


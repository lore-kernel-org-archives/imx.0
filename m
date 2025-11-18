Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C459636405F
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481771; cv=none; b=t9di2bdy/IbLO6w1C6k1gEOoy4oy1ruPH5uv4kT5dh+cenKW3akGg2B8WpZNLw3i8IfZUY5/XK8pnnTE4LNzX/Ml43HRzOgp9E/oas5bUaEaf+JCZpIHRZX7S6U6XaueNEOSuVmfx8cGD40++r7w291HBy/aWl2227/1QkbZPnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481771; c=relaxed/simple;
	bh=gdhjhWdICuQVp55O/pWQj35TDTisalZ3FdFeGppf0jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g1YvVixDDIRBgxvcR/5deDbJaoNCj1cfHVYzuDsHvstUkI0qtxalxixXGTjnI+K+N1/kGPX5M9wJQphq63+/lvQwEBByuQkDknSQWHw94Q8rl5QEvuTRuCbRDUsZ0S12Aacny1eDZp7zqVzSeizjEJ+4jU3OUjUuKtQlOlQVUEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PmH1jph7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PmH1jph7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso36924375e9.0
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 08:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763481768; x=1764086568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZolYxKyR2TKNDHC7G73SjkM6m/AelgK287SOoaUodeI=;
        b=PmH1jph71Cl6Hi1i7ixcpgOBPkIDLCKmfU85lWMvxO0VHl0x9/rJFt7UzCuFmyQWzs
         ZRYchi1vtt9ZS7anOH6LHriMgX4/JiJDKMzAoqsRHP4LVL+jRHpoRHV/5IVM++i4eihQ
         wP27unv6YCt6q2P1qTFo6MrZv72MSBTKrSOIoEl8zRhM/66RCBqc0HtZOI0TiU9OffhE
         pwvnvdyjXuencDPrXB1Bu/gaaRENe3fM8NAb5w1XeN+1G7xg9j01BNY8ETR/CVzqClB1
         8DjLj9O+PxdZvIzXBCaAtcp5ozxUT4KC/ilzroFqRGimOlPlm3/dLvLvMxmq8Tqq2pQf
         D7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481768; x=1764086568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZolYxKyR2TKNDHC7G73SjkM6m/AelgK287SOoaUodeI=;
        b=mn52K3IliufR22B8R/bpt1qI+B4yo+j2r2qHespibSHY/r0bLsoGIEFzKrYQy744wv
         Rjg1TJ/mKnxBN8S5xTVajr9PEHcmdGYdAK7UogRfqROD4+HaATZqXr1pcy7NV5aitszf
         /Oi3W5EDLVTvj49aajEvwlZwj1Lma1GB94RDlUbQeHeIgunS3jO4BQQzDfylaQHienxy
         dhbaCWwnaljiIP0yi7mELtr+5G036EWdTgJojpaPSgQz2nMoG34QH95bz98M9znjhRk8
         VlxoEL9GiSySH1P2bS8qRm/UTVEkiX5ooSsjuvMH3Z3LVsjZ/HHFilZZj1S5ZFcOGT/2
         yuLw==
X-Forwarded-Encrypted: i=1; AJvYcCWL5svxNOwa0IKs/sFVrQ7KO4pZWa9jhnyAisSpK3UNxfr2h6C7WmHtoAP/lUq7L82LHYc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwuW1wwDrg8hlz5GTD8h8yYHlMP4t7U/5yEmAHWCax2r5NIyKk
	JNNphVuAs+mq63WEg46zT9vJiwPw3E311d9jH7Tiqs6l5+sa3f95Y0tLBzDMWlNWpFs=
X-Gm-Gg: ASbGncs78D7CnWwdB1ci0KocwkVDn+HTYje7c3ZsD8asP0Zd4vkdbpx4g2XLBzmAupU
	boriTItQU+RhZyLn9XrZlJDiU7+dygYZP8vN++SLKuBajuOyyJdWIGcpB3Bbkdu3kgELVbA/CvU
	9nwCYALM0kvxP1yPMjjcrHzxclS1+GF5hipo12pTp8vK42D8JUPPf7BsgfLCw5gaTQRh7sYwtDD
	1Ov8CnGVXW/EjjagXGVoQ3Pp8Abmvi5JC7Vi3OoEGPVNSzEN2ond05Pgly9P4v5P8mx1b0xV+t1
	le1ouuDlUexDPj4/ZIj8rMciaOw4T28Kw+Jn+pXLK4A4ivN4QwDlr8Vg/5G1PWSTscd3FO9e4kq
	WR/wzqupw6a7+jR+i08QII2npDumRdm71vrIBVoSfz8STw4o1VKk2SNLAmKa7xxDANfU5QaBusx
	aT6mTfIvzE5waRUuf7vic=
X-Google-Smtp-Source: AGHT+IHU3f+2VnZb17HyfN3q7vH0maabvSkwzyf6Chngf7ZnCh4C8B1MIKZ3LBGCUAyWOLacnrXL3g==
X-Received: by 2002:a05:600c:4505:b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-4778fea8810mr178621825e9.30.1763481768019;
        Tue, 18 Nov 2025 08:02:48 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:76db:cf5c:2806:ec0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fc42f25sm171954575e9.6.2025.11.18.08.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:02:45 -0800 (PST)
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
Subject: [PATCH 0/4 v5] PCI: s32g: Add support for PCIe controller
Date: Tue, 18 Nov 2025 17:02:34 +0100
Message-ID: <20251118160238.26265-1-vincent.guittot@linaro.org>
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

Change since v4:

- Moved allof position and added interrupt-names' restriction in yaml file
- Removed PCIE_S32G_PE0_LINK_DBG_2 and instead use PCIE_PORT_DEBUG0|1
  after receiving confirmation that they are the same.

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
 .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  21 +
 drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 391 ++++++++++++++++++
 7 files changed, 570 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c

-- 
2.43.0


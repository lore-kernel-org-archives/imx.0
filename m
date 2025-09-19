Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76A231E0ED
	for <imx@lists.linux.dev>; Fri, 19 Sep 2025 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758297506; cv=none; b=Ok1uFj6ogGx1g69qx5U9ZXre+TGox+e6wqjnJseEUWlKTV9s4OYIWsDBWIyNxQ+dxdlSb4J4+5AQbtwCXKmcyfDXgTNG4qvC1N2cD8mAF1/yE2njDvv2YJJZ0EqvXo1yKzLyR/WOUdA9RUkZgEIJJGn5ox2ATiI1rIyGVWR/Q3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758297506; c=relaxed/simple;
	bh=N7YR47rPh9IYgAs1yBMwxo0aIg9W+HiNLeVlSehJYuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dp1nV/W6Hc8yutByloMGL93TnqiZlRsYqeuCb0RMtU7uTAD8nl9lgvqtOUXCZzpgEOvTfj6g90bERhMeBfrnk1VDRns/hrs3x6NuZ4e+m2Fm0hgCrADWmElPMpnfTqXkpQ3DXnLpu65sX+c5y7+781UiJt9rwTJVwJzl5lvsKQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FulY8YCt; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FulY8YCt"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso1355817f8f.0
        for <imx@lists.linux.dev>; Fri, 19 Sep 2025 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758297503; x=1758902303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vtPW98rgBsi1AXsCtSgCobaGSpH9VMGiOKrsL1cwC2U=;
        b=FulY8YCtLYomC/AreLXAGyzoIw0vO4OP+OqaYuLz/YfNuMN4sfhpJozIG2rHm9In5w
         qy1gZ/ZZUi7DJW414haVhqd1xd7NjxPVNDSuuif5/Ye8xMyRzDdpRhRSJGYm5ul0eVsC
         bRjdAGdf1dgnFYiIm2KLgLGX7u3mv+1T9CXSduAb3CjRO1gJdAt8XOLcknYCtbYPfjuA
         ByJA3XKdIlhak0SzSd8xyAeNpF0EiC18xZ6OqtX7nN7pRJUYMr4ZmrQTawTdd8EMdkiI
         27ZlrieiLbBzOnvVrWC92iM0fJ1S8MdzIcDmUuR3aCG03t3/bDZAk+twCJoZE+k/1YDU
         xVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297503; x=1758902303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtPW98rgBsi1AXsCtSgCobaGSpH9VMGiOKrsL1cwC2U=;
        b=hdpHHaQnPYPIUfqJejU1Prbur5rwTAeBk5FFAEmGlM3zEeHCDJ4FO8fMpKSM8j3tz/
         AjBYhmGyVRfGiSZQHOfAqDyVx6pXrgANQXVjeg3ui+/JIEytrpscbt6MtyNVQRwl24hd
         4mXS579XnQubizQW1/X8GEzGLRDonBTLlyTLbYvIqFsU9wT/rBEgcornl+ng97IsjLkr
         wDwWaKP042qvnIHBT2Kb06H0Oa11xwdPp35+V9jrrF+IWiYsGUg0j7yfa2dD9r6YKP4t
         dvqdWHrbpy06swjK/odVuCL0eZZ1gEsM9GqUnn2Lrfs3W+4ZJq4QCbGViFym3og+XpJ0
         awuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmH0aHodSLTxyzIjkvlQwPmW7kb73bPnA4xT/WqvcsqUaFnA4nBvPoLq4brU1VVS1gxy0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmo60qMilbx/XImlO6ZlawhcmqSGcqXNsPq8VL39sIm9RYB49o
	dGuAeSqE9gDmso9uxgv2Db4YEhCL1ooIS3gvqD1FXRYmM4OQuQAAX8zhGI2CHiZGdE0=
X-Gm-Gg: ASbGncvn+TxbVYKXxqN6RXu2bLfgVqdPcR7tpDs4ag61CXugElLo4QwVNgLLTH56pAk
	6liU45+NbpmaUJ/n2eeMCPyNGexYED2QI1lfJU8jUJrpF3r4YxphQUgRXZQ3BMPXVAK47cex/nZ
	wJ77aOtQjRvk4LGVm5Mu+pneqAmTU3AK7CpE/fS0bTQCkORsyuiRe2TQ1NVE+qZcMdw1VFwZYaS
	MorWNgerZoTgBV1ZyJNPegOeGlws57JLrvlxIWyO+gEh+6K3udimOwytmVu2BJVuFDKjuKl7DAf
	3dM2H9HPAUhEABCgT6rwsIV7hTdA68oydCnE5jqh13e2x7aHYHQ+qgI4sHUnivUpqyRupnkGF3p
	b7RPUdsBeAO32bnooC39MExdQEZuwt+w=
X-Google-Smtp-Source: AGHT+IFYUaAn9i6Eqk0wNZqPapSoDfpti615G8HPJJeCq6Zt6cdqWx78zxKqOQok9+7kvdNqxLGyAw==
X-Received: by 2002:a05:6000:144b:b0:3ec:3d75:1310 with SMTP id ffacd0b85a97d-3ee205def16mr3262070f8f.30.1758297502881;
        Fri, 19 Sep 2025 08:58:22 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:9dd0:62bf:d369:14ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07407fa3sm8367224f8f.21.2025.09.19.08.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:58:22 -0700 (PDT)
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
Subject: [PATCH 0/4 v2] PCI: s32g: Add support for PCIe controller
Date: Fri, 19 Sep 2025 17:58:18 +0200
Message-ID: <20250919155821.95334-1-vincent.guittot@linaro.org>
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

Vincent Guittot (3):
  dt-bindings: PCI: s32g: Add NXP PCIe controller
  PCI: s32g: Add initial PCIe support (RC)
  MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver

 .../devicetree/bindings/pci/nxp,s32-pcie.yaml | 131 ++++
 MAINTAINERS                                   |   4 +
 drivers/pci/controller/dwc/Kconfig            |  11 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-designware.h  |   1 +
 drivers/pci/controller/dwc/pcie-s32g-regs.h   |  61 ++
 drivers/pci/controller/dwc/pcie-s32g.c        | 578 ++++++++++++++++++
 7 files changed, 787 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-s32g-regs.h
 create mode 100644 drivers/pci/controller/dwc/pcie-s32g.c

-- 
2.43.0


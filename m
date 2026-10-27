Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104147;
	b=BB50u+bfxQs8enRTMZaWbuIpOZ182gvKYqJB8o/w06mLxDWGoGjlOWp1NXk+TsH2y+bK
	 6VoML5zzfurS3iugAQ1ti8XaDEK3TkNZlbINBMygSekExPpeokO9IJ/nVsaN0re6B9mpE
	 wMsX/LLDetevB7Od+478ZM3iJYpRpBN3cf44p0TrqnxXIkAGL031c3MlevQ0w/YC1j4v5
	 MdfbVqmw95fXY5T5PxncvHUgCV/5w5UjjUfCvuWFXDOTYAzdTej/M9t/KprKROZlapYdL
	 8f0eBgPDY6zr9G8dSKDPWTUKWGyFi2VAgeOgRLxFCfnSRyrFqp4QxbDl6QVguCfGT8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104147;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=0E0HXMHxntdmn/G6mGMUdp4+CCgYjO2PeXWuZbaHpuw=;
	b=BIHQgvw1o0QlXlvxDXZ/X4aXToukXAAVKCLkMkrUf5HToMwThlNlg60WdjxrD3AMUyF6
	 CVcKyXsx33Jn3oiBe/6Y1Y120qMcbIL/4WGAyPoesWgDTKUxU1BSw4lAmecvxPJv3Obqp
	 1A29786X0XT5iDnvWjCJGq3B+x8rfRZGX5oRN03RvrMU1fz6tGEMNBY2ShLDvanfx5xnq
	 0sl4rOKIWyoeZXSWbztw89DWJnGjf5QbubH8P2A0Svwj21P//iX5EhNCbb8RHNlGjJ/qP
	 QSZMqJ7ZxpWUzj3O1Dot1r5D8H3aiCVh2cwN747vjZsAEooUspnC32K6xE8hmF3ymwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="lWte/eGw";
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A07B606A321;
	Tue, 27 Oct 2026 12:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A07B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lWte/eGw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=0E
	0HXMHxntdmn/G6mGMUdp4+CCgYjO2PeXWuZbaHpuw=; b=lWte/eGwFwLXFxIMEn
	ro8tIqcnEyR5kbUp72aNSZ1uOclBfxH3ztEgSno1b2SuBCcFsqcYB4Lu8lL7r+SH
	Y2X+xpWv87SYCku8q8zR/PApzwEjo6pTEMR/6CoUWcpNwmvFjWjEMAPCUk4oTGV7
	vM/ry+YYbWzCwOgvB/bG8F53M=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnz2v5mOBqYaUSDA--.46182S9;
	Tue, 27 Oct 2026 20:28:49 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	jingoohan1@gmail.com
Cc: imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v4 15/16] PCI: dwc: tegra194: Use cached PCIe capability offset
Date: Tue, 27 Oct 2026 20:28:26 +0800
Message-ID: <20261027122827.2725643-16-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027122827.2725643-1-18255117159@163.com>
References: <20261027122827.2725643-1-18255117159@163.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnz2v5mOBqYaUSDA--.46182S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWruryUuF43Kw4rGrW3ZFb_yoW8CF4Dp3
	yrXrWFkr1UJr4aqFsFya1UZrnFyr9IyrW7WanYgw4avF42k342grWqkrW5tF17CFs2yryY
	kr18tFy3Gr15JrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pil4EiUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AI53GrgmQIbCQAA3I

Replace the two dw_pcie_find_capability(&pcie->pci, PCI_CAP_ID_EXP)
calls in tegra_pcie_dw_host_init() and pex_ep_event_pex_rst_deassert()
with dw_pcie_get_pcie_cap() so that the driver-private pcie_cap_base is
filled from the same cached value.

tegra_pcie_dw_host_init() is called from .start_link, i.e. after the
controller has been initialized, and the PERST# deassert handler runs
after the endpoint has been brought out of reset with its clocks and
power enabled. The helper therefore performs its single DBI read at the
same point as the open coded search, and the private copy keeps working
unchanged.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 63a0f56cad8e..965e15f55e22 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -905,8 +905,7 @@ static int tegra_pcie_dw_host_init(struct dw_pcie_rp *pp)
 	pp->bridge->ops = &tegra_pci_ops;
 
 	if (!pcie->pcie_cap_base)
-		pcie->pcie_cap_base = dw_pcie_find_capability(&pcie->pci,
-							      PCI_CAP_ID_EXP);
+		pcie->pcie_cap_base = dw_pcie_get_pcie_cap(pci);
 
 	val = dw_pcie_readl_dbi(pci, PCI_IO_BASE);
 	val &= ~(IO_BASE_IO_DECODE | IO_BASE_IO_DECODE_BIT8);
@@ -1889,8 +1888,7 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 		dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
 	}
 
-	pcie->pcie_cap_base = dw_pcie_find_capability(&pcie->pci,
-						      PCI_CAP_ID_EXP);
+	pcie->pcie_cap_base = dw_pcie_get_pcie_cap(pci);
 
 	/* Clear Slot Clock Configuration bit if SRNS configuration */
 	if (pcie->enable_srns) {
-- 
2.43.0


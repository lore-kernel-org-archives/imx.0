Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104143;
	b=x9lAwSAtI+WtVtlp1cmJ+wvebocGZ7U8SbAkvHuaRBOFO5BOR2mOy6XHhutUhklmEAO0
	 Fio0Nw+riOlfHz645r4dwXM3DzoE5tQtjhWzAIQyN3agF5vOfxv3+hw2hbQc0FPGy76QR
	 ymF2xfLnT1hFIuZ4tVI74mOvbkGmhbvAJBdyTGiRgqxYLzBRD/oTW93lOpDVQeiqUZNRj
	 urvruVZU/qbKr6sqtGxQySpzUKUr0Kr8vv/nE8ruApGJaJ4HUxfXAg4XJEOHfvXPPx23X
	 qvaGDI7ZGd0CfCk5DgtgK1uv/CerMf/8p0BHqIjKBfnznndW2g5n3eMlbyYeyU3M4oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104143;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=tJKsjbxpCgR/MpuZ6mXUaOQY924DVgW1gFjR2gL0Omg=;
	b=dxskjpGKQwVpcISoXj0aRTeUhw0l2YzbeSyc4w3yFok1VTGam1FcQDUU8XkVhi10UjyD
	 O2Hi/QfgQ9fWoi3sUU9OjumaaeyqENMHA02qqjme2rC+yTdSCZUmErY8zEnBHGMWd/Hpm
	 xrffLY0SCZNM/qt2ai9axzQWTLnDzWxUOfofhuhFCTosAGuyLFItr54EQWK+AjZzc7Jlc
	 /m9J5/2PKqKnwzkOBP5HXC5947x3GIJYTw5v4UdOZwk2p4gMTDZs4CxyOvaNhRPF1TN3i
	 hmGtUAJggrAPHiqxGhVxO5Mmlr1zDobyFKl9GDCtpN8JxInSVSJwQ5iPRYzO88aGI+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m7ZY+dLc;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D94F606A327;
	Tue, 27 Oct 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D94F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m7ZY+dLc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=tJ
	KsjbxpCgR/MpuZ6mXUaOQY924DVgW1gFjR2gL0Omg=; b=m7ZY+dLcUEYc2TGiO1
	IlPXXho+HNCCQCnBvx4vEAizikJPinHmprvmSdpDKXPUajAxbG6N1yhz8EYI1yYc
	20mDQmvgHvoeSz3j/nmK0Ec0+xpIOnZbeyHKODlHxnrRnVzyrjvCB17RrjXSdHh2
	qKu49tZkMIbdqtxGX+of9Gi94=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3Dz_umOBqUsqlCw--.64541S6;
	Tue, 27 Oct 2026 20:28:35 +0800 (CST)
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
	Hans Zhang <18255117159@163.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 04/16] PCI: dwc: layerscape-ep: Use cached PCIe capability offset
Date: Tue, 27 Oct 2026 20:28:15 +0800
Message-ID: <20261027122827.2725643-5-18255117159@163.com>
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
X-CM-TRANSID:_____wD3Dz_umOBqUsqlCw--.64541S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXr45GF17AF43Cw13XFb_yoW8WF1xpF
	Z8JF1Ykr18JF4SgFn29a1Dur13GF9xArW7Ja97K3WavFyav3yUG3s0yryrtFn7KFZFkF1a
	v3y5tFW5uw4rAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pimLvJUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xM12GrgmPMXzgAA3t

Replace the dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) calls in
ls_pcie_ep_probe() and ls_pcie_ep_event_handler() with
dw_pcie_get_pcie_cap().

The probe reads the Link Capabilities register to save the values
configured by the Reset Configuration Word anyway, so the offset is
cached there. The link down event handler runs in hardirq context and
can then simply reuse the cached value instead of walking the
capability list every time the link goes down.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pci-layerscape-ep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 527c57114dcf..113be247b01b 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -84,7 +84,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 
 	if (val & PEX_PF0_PME_MES_DR_LUD) {
 
-		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+		offset = dw_pcie_get_pcie_cap(pci);
 
 		/*
 		 * The values of the Maximum Link Width and Supported Link
@@ -268,7 +268,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie);
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	pcie->lnkcap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 
 	ret = dw_pcie_ep_init(&pci->ep);
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104148;
	b=uj5uPlaSp2rKUQln7BR8q7mnV+H14Q6Xs1XcTQ+uaXUQknFNnf9+HdRc20lQj2vaMela
	 I5syf5MHrl2rsps0QwNowVxuWg9v3/G8sOLgLovcXqSb9qM6LjJBXtJbPegB1q9MoOc6X
	 I/fLfx3mL9tQ86OiGUIM0waLCMN0D1997phXWA+20dKhY8E8DAx99UPYp5l/LFK6dJz1t
	 EbqBmGhuqByuquvxGWWIscsX6gql32Nh8iidcw5Z4t+qPx9wa9gb4mnX13ceoHcSNnaTo
	 36cxYXkDz/ScUeqOAqnehWXFrs/kVCaQLCtJRRgpDzqksz5wTEB6rzFlbjhKIBf0hEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104148;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=CHVlxFB+rkFY6mvk/w3InMw7zFlwCmfuUZnOgIf7lko=;
	b=26CUb7U1zCJjbmqz4uJ1sr9rANk/cixqZnoor+2vZiJnG+mxMse3chs9NuELRIgbzozd
	 7UzbAPUL8nolBAuEVAsahpuPswk0DE71WrlTJBry3AzIsHbyWd+cKjH1lc6gqGj2m5+WJ
	 C6JUu4uvD2RvjsPlaQS9p9UG832BZCQJj2eCRWxQKJ1scf2aS2lrZJ3Vv+69CKtL6Jsyv
	 y8MHM5OdRY8vYmwcuTbLxYJG6O842eHuFke9ym49Q3JP0pos4UoSSDlMioiKiTjfZhwPC
	 qdbJllIwnfGh/WKBgtTFClWZHRIaMwpMjBQebshpzBlyqFX9lsTUHk1Zuxi9qlKwbhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mgQH3SR7;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E19D606A339;
	Tue, 27 Oct 2026 12:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E19D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mgQH3SR7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=CH
	VlxFB+rkFY6mvk/w3InMw7zFlwCmfuUZnOgIf7lko=; b=mgQH3SR7Pljcvcia+b
	Zq12DuefKgSJwhYoV1+DIOj7hhseAdpUN8WeKyTCdOvFNElFJDbzqwT1N5xQjYey
	1QaU+PYpZCnt9dKq6geZHc6JV9P71qjgXjNSm/CbbM+smJF8wsvXpL98xw4Rtdqn
	vGzqjjCi1fGu07iak2Yx49wWE=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnz2v5mOBqYaUSDA--.46182S4;
	Tue, 27 Oct 2026 20:28:44 +0800 (CST)
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
Subject: [PATCH v4 10/16] PCI: dwc: qcom-ep: Use cached PCIe capability offset
Date: Tue, 27 Oct 2026 20:28:21 +0800
Message-ID: <20261027122827.2725643-11-18255117159@163.com>
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
X-CM-TRANSID:_____wDnz2v5mOBqYaUSDA--.46182S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZryxZrWxGrWfGFWrKw1ftFb_yoW5XFy7pa
	90qF4YyF18Jr48Wrs2ya1DXF13W3ZxAry7Ja97K34avF9F9wnrtayjyryftr1xGFZrKryU
	Grs5t34xu3WYyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pESfYNUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7B0422rgmP0aEQAA32

Replace the three dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) calls in
the qcom-ep driver with dw_pcie_get_pcie_cap().

qcom_pcie_perst_deassert() is the point where the controller resources
have just been enabled and DBI becomes accessible, so the offset is
looked up and cached there. Both the L0s and the L1 exit latency are
then programmed using that same cached offset instead of walking the
capability list again.

qcom_pcie_ep_icc_update() may run from the global IRQ handler, which is
requested before the PERST# IRQ. The helper performs its lookup at that
point of use, i.e. exactly where the open coded search happened before,
so this change neither adds nor moves a DBI access and does not
introduce a new race with the PERST# handler.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 56184e6ca6e6..413a1582f300 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -307,14 +307,15 @@ static void qcom_pcie_dw_write_dbi2(struct dw_pcie *pci, void __iomem *base,
 static void qcom_pcie_ep_icc_update(struct qcom_pcie_ep *pcie_ep)
 {
 	struct dw_pcie *pci = &pcie_ep->pci;
-	u32 offset, status;
+	u8 offset;
+	u32 status;
 	int speed, width;
 	int ret;
 
 	if (!pcie_ep->icc_mem)
 		return;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
 
 	speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, status);
@@ -397,7 +398,8 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 {
 	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
 	struct device *dev = pci->dev;
-	u32 val, offset;
+	u32 val;
+	u8 offset;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(dev);
@@ -492,13 +494,12 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	dw_pcie_dbi_ro_wr_en(pci);
 
 	/* Set the L0s Exit Latency to 2us-4us = 0x6 */
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 	FIELD_MODIFY(PCI_EXP_LNKCAP_L0SEL, &val, 0x6);
 	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
 
 	/* Set the L1 Exit Latency to be 32us-64 us = 0x6 */
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 	FIELD_MODIFY(PCI_EXP_LNKCAP_L1EL, &val, 0x6);
 	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
-- 
2.43.0


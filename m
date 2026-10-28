Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156874;
	b=TtMwBOxcwTUw1cUUI00bQ0BNT9/iPbjAQcMusprTIgw89OUiNZhtpAaMF5XMTJQ3I85x
	 cuW+2Tm/PVcfoe+Wvg9kwzVBWtj4X80gLG+2ZUAabZJVmMAbRQ5ihS2nwp9QjVzNmXg/Q
	 GA+nfnIJL474adyBLnLMCMCUZ7BKYAkELTXBjlC9xZg2v1isb9afyil7BtGQ+fj2x5Yb+
	 T+fk4s1f35hZPhtCGgPm77upTLMZRj8huYeXQl/CMU5KGOquuvAFvKQB3i64WLIK4H3Gm
	 QzfKWqoSAsBUY13G2oMUs8R+d4LIu1Ff8NM7/TU8GnEm703J5f4al7kTVgspGHXDr0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156874;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=uGOww8cTZ+dmcRduWhvlBtmVa5S9Xqh7rcDtCCMSFaU=;
	b=ixzyMNG1NhKQe2a/DW7WghfxBFJfHgQTq8pfFjBCzsAvZjZX6z6yN3O60V5qhHsVysNo
	 iXLTHjTpIsg6OpJAFaj4lboGTcXLaBj7dUfBaTftGTUIAKbR1/sU0g7DXzx2LvWzbrVrF
	 uH6nv4gN1/siOn7mX3LYz6Y1d+//ajsQRmypeW62e5nTeIlA8E3DG4szJjcUa9a06pHRV
	 CIUjJIhh/IUam6ZwujCNqRAE61ynMMmFwW8ZPu5s2HnEMQw2oBGvxb2EqT0MF4PoKyW9G
	 bZN/d5pJBY/utLeo1rXG+wSO0ksoEBMMQaEnLUIYZ37iWBdFMasgsMb9E1CkyMtMNnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RSwjLMSz;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C91660731E5;
	Wed, 28 Oct 2026 03:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C91660731E5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RSwjLMSz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=uG
	Oww8cTZ+dmcRduWhvlBtmVa5S9Xqh7rcDtCCMSFaU=; b=RSwjLMSzAQnxak8cmk
	7cG9+kuYA6fM6xiN80akLhw8s7Dr7paowbfmps8cOdj+m4q4E3/iC+HYPXjScxR7
	CJJfX/W9z09f3QH56i8pO5ywPoHHyAS3UdLaxVepcGDglSHUjPxK4SmXu7KmviBi
	lwzcQRd5cGDFhgdUvc+MwLEC0=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDXT8PnZuFq9rwVDg--.12376S2;
	Wed, 28 Oct 2026 11:07:20 +0800 (CST)
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
Subject: [PATCH v5 16/16] PCI: dwc: ultrarisc: Use cached PCIe capability offset
Date: Wed, 28 Oct 2026 11:06:52 +0800
Message-ID: <20261028030652.2917756-17-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028030652.2917756-1-18255117159@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
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
X-CM-TRANSID:_____wDXT8PnZuFq9rwVDg--.12376S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr18Aw18ur17KF4rWF47XFb_yoW8JFy3pa
	yaqr1YyF1kJr4Yyws2ka4DWF12q3ZxAryDJan7Kr13ZFyakrWUX34vk34rtFnFkF4UKr1Y
	kw4FyFy7G3WrXwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pirWriUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AnmimrhZunUcQAA3o

ultrarisc_pcie_host_init() runs from the .init callback with the
controller already enabled. Replace the capability search with
dw_pcie_get_pcie_cap(). Since the lookup is performed lazily at the
point of use, the driver no longer depends on any earlier caching step
and the offset is always valid here.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-ultrarisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-ultrarisc.c b/drivers/pci/controller/dwc/pcie-ultrarisc.c
index 523f454c6c524..915305bd88df4 100644
--- a/drivers/pci/controller/dwc/pcie-ultrarisc.c
+++ b/drivers/pci/controller/dwc/pcie-ultrarisc.c
@@ -56,7 +56,7 @@ static int ultrarisc_pcie_host_init(struct dw_pcie_rp *pp)
 	FIELD_MODIFY(PORT_FLT_SF_MASK, &val, PORT_FLT_SF_VAL_64);
 	dw_pcie_writel_dbi(pci, TIMER_CTRL_MAX_FUNC_NUM, val);
 
-	cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	cap_exp = dw_pcie_get_pcie_cap(pci);
 	val = dw_pcie_readl_dbi(pci, cap_exp + PCI_EXP_LNKCTL2);
 	FIELD_MODIFY(PCI_EXP_LNKCTL2_TLS, &val, PCI_EXP_LNKCTL2_TLS_16_0GT);
 	dw_pcie_writel_dbi(pci, cap_exp + PCI_EXP_LNKCTL2, val);
-- 
2.43.0


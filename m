Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104152;
	b=M6FaAqv63x8Wbq4X9sAyrKih6ZU/E+uBaxZXQ0YNGPHDJR9I82S/p0LfQ721h6+ZUYk1
	 fo/QSMdGh3gCgfP5DR7hIePWdD0/aD1oSqLvoPIdxNSgJdO6vQHPq6D6iBfXlyYhwybqI
	 dZcfAfOG+oP4tL1pSlTBtEIFJuCau+xo4MTRo10l+BBdCLEWUJ9rvrBnX9ma9D/BtwKrp
	 wDWthKhoYs7eHVU2xdQgn8Icg4bt/LcAk5XwHyff7+ODEM/wEpDPKcQQcfIxYVN4zqFwR
	 wG4yqS68JSEnSIy0SI2e9catm+VgS3leemSRjX9wzuz18g0/do8dxYCz4zd23dpjVWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104152;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=5rTEfJyH8+8TFmlvfs8UtpwLKWhfbVwPgm8PGgqTxGU=;
	b=kM13lOY9Jyy/C9sniDuuu/msV9UBUg0CGniMJ7l6O0yNKdKgEnR7LYSl3ay9WefmOXMP
	 r433uicCb7DevM+DjLs2Ol8l34mL/FPCk14rHqblMJgNSG1IIQOVp0r7IS+957k8c+FBr
	 GlzY7Iq6zfzJMZGdNHil2AE+D8jgZvVUTJR4QyNDTF5pkVBUkHMCdXCJnBFNd1uSZkjXd
	 CZa8oTUljXQTm2P6qAy7f91FIU4q/4lBfXfbzsFsIcJ8qTEQMWjeyVxn9ajxiFPc5FOeA
	 fSh80oJR7eLW7jfEKwQqKoCf3iagXgxhIFe6lEbPykD1OW+iwtTJaKjBQlnZoagtAlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ie8Q0fCu;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF52E60A261A;
	Tue, 27 Oct 2026 12:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF52E60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ie8Q0fCu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5r
	TEfJyH8+8TFmlvfs8UtpwLKWhfbVwPgm8PGgqTxGU=; b=ie8Q0fCuq74BxlHMKN
	rqVQbExiWDMoqUzfp8O3Y/hWetwXPiAFKAyLO7FSIdPsoisDrRl7PnIb2yafKVk3
	DbNld+Q7sGWlFp+SoTnJwMlWHEZm6yZ/CQkjgXae2uC+mH2aUYyoRXtP7kZskJqB
	qEm607T+lG8JRwT/TzissUwC4=
Received: from Precision-7960.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAH_5wFmeBq67qCCQ--.31668S2;
	Tue, 27 Oct 2026 20:28:53 +0800 (CST)
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
Subject: [PATCH v4 16/16] PCI: dwc: ultrarisc: Use cached PCIe capability offset
Date: Tue, 27 Oct 2026 20:28:27 +0800
Message-ID: <20261027122827.2725643-17-18255117159@163.com>
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
X-CM-TRANSID:QCgvCgAH_5wFmeBq67qCCQ--.31668S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr18Aw1UZr1xJrykur4rKrg_yoW8JFykpa
	yaqr1YyF1ktr4Yyan2ka4DWFy2qFnxAryDJan7Kr13ZFy2krWUW34vka4FyFnrCF4UKryY
	k3yYyFW7Gas5Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piFfOwUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wY63WrgmQYa+AAA39

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
index 51e89180490d..85373b479b64 100644
--- a/drivers/pci/controller/dwc/pcie-ultrarisc.c
+++ b/drivers/pci/controller/dwc/pcie-ultrarisc.c
@@ -56,7 +56,7 @@ static int ultrarisc_pcie_host_init(struct dw_pcie_rp *pp)
 	FIELD_MODIFY(PORT_FLT_SF_MASK, &val, PORT_FLT_SF_VAL_64);
 	dw_pcie_writel_dbi(pci, PCIE_TIMER_CTRL_MAX_FUNC_NUM, val);
 
-	cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	cap_exp = dw_pcie_get_pcie_cap(pci);
 	val = dw_pcie_readl_dbi(pci, cap_exp + PCI_EXP_LNKCTL2);
 	FIELD_MODIFY(PCI_EXP_LNKCTL2_TLS, &val, PCI_EXP_LNKCTL2_TLS_16_0GT);
 	dw_pcie_writel_dbi(pci, cap_exp + PCI_EXP_LNKCTL2, val);
-- 
2.43.0


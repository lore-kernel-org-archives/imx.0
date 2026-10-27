Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104143;
	b=Uit7EywIjFaHNyImQ9G7F9i9U5EyjuvGrpAo4nC3eKGCF4BK3eN7FTfGV3WZaX4Ut1Xx
	 7+p4bSST5/ahZNu9h1OVuCVQ4wsR8ipG4DQJKAYWgheLhPBQAyjUzbz1G1MZcTDM0E0pk
	 VCdvdrXHfQdv7gIzrMgvl83q8N0JEekkTsvMUcLwlqc/Sf0Wlztb43Utr9hfeghEqF9gv
	 7zZjWMM4lrzU6FdOIMI4zhCUrx3i2EqdjchnonHlSDuHlV9Ku5UMCG9revaxLuhgEKtAe
	 20f/uc05tsUSODeAZc2yAJyfxv+4WD1Oltsd3iy7v4hC8WzCEitm5VJ6+zgpQ75zHiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104143;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=P+DOek8Xwg8mr7X23MpvL+sXMtJB3TD1T1b5Qii+fWc=;
	b=k+xn9sMULqrk+ESIDS+AWcfhyDbRq7sqNNt+6tpIi43Fl18Q1KDh5Gg1XSZYg+BYBrtq
	 oeaHj2SshRiXh6mKdMEVQBg25Bg2L9wnqlNOHeyjOYs1W+ggG/Oc7q4VEg5bd2FUdDaba
	 WGaBpRkdo1BqC7jyvZpMQJ2KGtZuCEYOUqRLtBeFYBEProSqcqgfIgJJCw24g0W2edX+V
	 ooIUzVxfLkl5x1JY8ZkkRwhutumiBscfAdIr4aIwbq2XHGEeWlK4sOeqDbE8L+jje8Yw+
	 JFJ0+4bzjX8m55hA5G5S9G1tkxGV9ONh7lGAQtNkhDQCX7Hx4Sc2FYiid8AP4NxP8WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QKekTN4t;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A7606A31F;
	Tue, 27 Oct 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804A7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QKekTN4t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=P+
	DOek8Xwg8mr7X23MpvL+sXMtJB3TD1T1b5Qii+fWc=; b=QKekTN4tJdi67oKu9j
	LRsqgdFXZd7kF1vm5qva+c7fRRqBpySbrVj7LJK3nKBnmBcwYJOW16NNe0vcfPpz
	yYpGoE07/S2RyPAd7BQs+1Hd2wXWMGKT6s5OyEDFu+GkMbKfhsKCAFfQPRkmDHLM
	o3ohd1bt9LWQsKqZBS/hrIu7g=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3Dz_umOBqUsqlCw--.64541S7;
	Tue, 27 Oct 2026 20:28:36 +0800 (CST)
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
Subject: [PATCH v4 05/16] PCI: dwc: meson: Use cached PCIe capability offset
Date: Tue, 27 Oct 2026 20:28:16 +0800
Message-ID: <20261027122827.2725643-6-18255117159@163.com>
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
X-CM-TRANSID:_____wD3Dz_umOBqUsqlCw--.64541S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrtr45Xw1kZr4rZFyxXwb_yoW8WF1fpr
	WYgF4Fkr1rAr4YgwsFka1ruFy3Jas8ArW7Ja9xKw1S9Fy7KanrGa4akFWSka4xWFsF9F1q
	9Fn8tryUZws5JrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piQtx-UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xQ22WrgmPQX+QAA3Y

Replace the dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) calls in
meson_set_max_payload() and meson_set_max_rd_req_size() with
dw_pcie_get_pcie_cap() and store the offset in a u8, which is the type
used everywhere else for a capability offset.

Both functions are called from meson_pcie_host_init(), which runs after
the controller clocks and resets have been enabled, so the first lookup
happens exactly where the open coded search used to happen.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 8559d132dcde..03dd1282f3f3 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -277,7 +277,7 @@ static void meson_set_max_payload(struct meson_pcie *mp, int size)
 {
 	struct dw_pcie *pci = &mp->pci;
 	u32 val;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = dw_pcie_get_pcie_cap(pci);
 	int max_payload_size = meson_size_to_payload(mp, size);
 
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
@@ -293,7 +293,7 @@ static void meson_set_max_rd_req_size(struct meson_pcie *mp, int size)
 {
 	struct dw_pcie *pci = &mp->pci;
 	u32 val;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = dw_pcie_get_pcie_cap(pci);
 	int max_rd_req_size = meson_size_to_payload(mp, size);
 
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
-- 
2.43.0


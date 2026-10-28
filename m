Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156845;
	b=o9qcdi7GlD3uU4LurKuiJyxoxJP+5iYO+gkhqew110Urbph3KJ8pRN0PSQzOXPGd/jXH
	 guWkHR5p0gFaYOdp7o88hAJ3Riz1fjydcjkMcplHb2BSfkE+NPq0hlQuz8j7vD5BNI0Uw
	 GKBMqGgrOltHGKzePO+KcfEj5yuANg4p5WS/OW5jU5RSK9i1UbLPJ/aLOPvoJLuyNOkWi
	 Dj86AocSQeDm1ehNryPJDwu1Qx81T6S10hnOCXz42mEmccFFRplr8U+soN37y8HWvZPIS
	 +lJZQpA+2qcJgdPwADctu61FZPH4bXDF+4SRXRCIqpYVTxBvLEq4CvIoYd9P7hufHcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156845;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=z/0/W91UT1Vwlpm+eF8iJgUejxlxvh3iRjeFAbR8/Vg=;
	b=ShvPblULu03mgcS/X2a4IRVYs3wcL0cmzXdE9FLV3m+0PnZpurgyePaR/QOjRsAE1qf+
	 his6oSjNwagLMQljOkHqtFNW2DQL4eviGUrAPDj9t9OKNZURCHTotUD/qwnkDM6c7kXEH
	 6eeXN/WuOFiORGQBOF29oU0vO803evGeOtaYBHul2Zx1Y4hx1w6lp8ApusQVLY7TnXSn9
	 fSR7f+8hcNJA/bJ1vCWyb2Ndn/RNfrkMpCCRiPLGk7HarDQKH3mmSvdK0shsWyPpJ7hAE
	 zsKaNJxJvQZJ5aXMcRbj2OHTeqIDHiHmyGVVFdcjIjGPbVT0gqAcUWBSDlU3PuF6MGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=E4Txy1Ri;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348DB606A31E;
	Wed, 28 Oct 2026 03:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=E4Txy1Ri
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=z/
	0/W91UT1Vwlpm+eF8iJgUejxlxvh3iRjeFAbR8/Vg=; b=E4Txy1Ri6ZRV5/0N3h
	ALQPC8XqSOXEzWdWCT/LGIOz49B2mIz+SlnEJKxeXP2kihEPLe933v6fAPM89yo6
	esKy4C28U7hICmHY/qlBei+N6NlIO26MWDGzqsXm8imDr9LFzgQnaFnaQQndpWJh
	zvPbgXDM8K5aeLSocyXz8UHXU=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnD07QZuFqZiY4DA--.60713S7;
	Wed, 28 Oct 2026 11:07:02 +0800 (CST)
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
Subject: [PATCH v5 05/16] PCI: dwc: meson: Use cached PCIe capability offset
Date: Wed, 28 Oct 2026 11:06:41 +0800
Message-ID: <20261028030652.2917756-6-18255117159@163.com>
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
X-CM-TRANSID:_____wDnD07QZuFqZiY4DA--.60713S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrtr45Xw1kZr4rZFyxXwb_yoW8WF1kpr
	W5Kr40kr1rAr4YgwsFka15uFy3Jas8Ary7Ja9xKw1S9Fy7KanrJ34akFWfKa4xWFsF9Fn0
	9Fn8tryUZw4rJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pip6wNUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xfhhWrhZtfEWgAA38

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
index 8559d132dcde8..03dd1282f3f32 100644
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


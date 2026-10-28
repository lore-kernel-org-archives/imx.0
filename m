Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156854;
	b=RtLb/kLJ7FMwKFOivgBvHsQgeIuRZdjj1PnKcRDctIiMDzOMhAZpb/N6qtKK6IB+yH6O
	 hciYbUbUiY96JobYgs9x+AXlNRMEYnWF9Wk2yHMlX3d2Zqe3VnPbs8VJqU44Xv1W7PBsu
	 NbnvU4dJwJz/s0GgTAeE8OecPJ3LQnc7H+u6s4tadxcqqwuWKaoH4h5RCBBs6itF27vgZ
	 xjSMvjMDk3euYdbU0YeDAmE2SPhwhO9NyHPwTFak5yEmkzgUrkuaKoE+UGtAs0H5dom88
	 YZEPr+HxuoJQi8+b6EB5uM5LBV5rPPGrM6tMBieVDGd8E4k5B5XWnIUtLNLKYhjuZzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156854;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=o/IRs6JzA5LFZdnsRQ+spSM1tkDMabFMzmbDWv96JLM=;
	b=2sIpIP8yp2t7Szw7ShOrPJr4AbhtuOqWfKnnr/2bLKMcJIZrQxedIWzzotK7+g0liwHC
	 jRY3kPpOtOFvmDUoXPYI6dOVtiYB8c0oMmhcWmGDEfDCHJ8Eche718ajcNsGv85zd2IbH
	 CVkZ8gJxumAO1X9KzS8YqAzHtDx3+Cg0qYEnIciye+qWDp8N305ukBXIvXPXwL9SxUd6l
	 Nr5SY48xrxgURf94m5zaHZ6tsFR/xzR8WRIRZaHRTyqgwrhLomn7kkKCC0NMx/Vdv9Ree
	 oCvrwr2FnnXvIErw6b8Jgq/HbOzuAeYACUhCkDvLd7wdTKRxxgcJb7rRhLjugEm4acw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GoamCqJY;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A494F606A322;
	Wed, 28 Oct 2026 03:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A494F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GoamCqJY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=o/
	IRs6JzA5LFZdnsRQ+spSM1tkDMabFMzmbDWv96JLM=; b=GoamCqJYHM933HGiPB
	ypqZ4tGSvn84jILo/LfRPAfsqKV6PV5Hx3NHfKM/w6HK7jxgOIIvp7LSh84gwXrq
	Rq4DKgtb7JLCSIVjAyF+LeMLqoC2SzYmXA7UyCc9mxN2wpviFAIe70HvX5D0g//8
	oVFzf2KK8i5Zm3x0LwBuvvfhc=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnVwncZuFqLzE4DA--.33198S6;
	Wed, 28 Oct 2026 11:07:13 +0800 (CST)
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
Subject: [PATCH v5 12/16] PCI: dwc: sophgo: Use cached PCIe capability offset
Date: Wed, 28 Oct 2026 11:06:48 +0800
Message-ID: <20261028030652.2917756-13-18255117159@163.com>
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
X-CM-TRANSID:_____wDnVwncZuFqLzE4DA--.33198S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFW8tFy8Cry5CF1DZr4DXFb_yoWDWwbE9r
	9rCFZ7ArWUCry5K3ZFyw4rXr90va47ZF1j9ay8tF90vFn7Zw18tr9rZrZ8A3W8Gr1DJF97
	Jr1qyF1rArW7JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRM89NtUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wHkiGrhZuHHSwAA3G

sophgo_pcie_disable_l0s_l1() runs from the .init callback with the
controller already enabled. Replace the capability search with
dw_pcie_get_pcie_cap() and store the offset in a u8.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-sophgo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-sophgo.c b/drivers/pci/controller/dwc/pcie-sophgo.c
index 044088898819e..39703d2b7b5f2 100644
--- a/drivers/pci/controller/dwc/pcie-sophgo.c
+++ b/drivers/pci/controller/dwc/pcie-sophgo.c
@@ -164,9 +164,10 @@ static void sophgo_pcie_msi_enable(struct dw_pcie_rp *pp)
 static void sophgo_pcie_disable_l0s_l1(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	u32 offset, val;
+	u8 offset;
+	u32 val;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 
 	dw_pcie_dbi_ro_wr_en(pci);
 
-- 
2.43.0


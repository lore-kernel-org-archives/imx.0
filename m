Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC5943440E;
	Mon, 20 Jul 2026 15:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560099; cv=none; b=K3oykgv+iUhkexLUJBcola9tbWNO9wPst8jhYvx0Yw1EZvS0JmyVfkkfGnuczbUnLRfssueP07ClvifrRaMV8ipTAMRai+9P21dMENyuf1MsLrIngkhks+yZdPA3mWu/hQSjz/TNIJrbf1O7i6dUFCEkAghEU/DkEi1ZYPPaItI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560099; c=relaxed/simple;
	bh=KFNywJY77A37y9C7nyuYTxEOSJ8mD3bMQuXrniAKLF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=joAxGX608Bd4etOElZ5D3HPLv/ZzLmlgHK6UXt5XIqT8TJ3TcpER2b1tHpQJQB/jk0JWg3bKWYGXhTlkvVnRqDrIoVmnsNmi+rqNETlDayGglcupKoUDcG3izKtE5tSTKWtZWRum+n5DtIykXoMuZ0+fcjl8pBgyKuFKENHK8lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T05Ujlka; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T05Ujlka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ff
	B7GrmVp8WAki9+UnmVSGGvKtwSZ9GLa+Vb7MYQ6is=; b=T05UjlkaldoQa5YO1i
	pYWOXA+5sHjoD1Znr8vTiWAk3LqecPXJQt2ysiuoKU09Ur5AmUhmWEXNBJxkoq2y
	oKSNHkoYPQvONVjblDNCVPpvZJO0k52szKh6MijJ7Ps8HK9TcOOGPx0R8mcmAhCU
	XRJCZO3IGNeWr/eQtCx1y2HFM=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3b1rIOV5qyHOjKQ--.35310S2;
	Mon, 20 Jul 2026 23:07:54 +0800 (CST)
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
Subject: [PATCH v3 08/16] PCI: dwc: fu740: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:11 +0800
Message-Id: <20260720150619.24733-9-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3b1rIOV5qyHOjKQ--.35310S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1UXr4rWw1rCr47Xr13urg_yoWDArbE9a
	4UGFs7ArWUKryFy3W2k3yfJF97Za47WF1UKa1rtFW3ZF97Xw18Wr9FqFyDJF48W34DXF1x
	JF4qvF40ka9rAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRt7KIPUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wuyVmpeOctvPAAA3R

This callback is invoked after dw_pcie_host_init() has cached the offset,
so we can use pci->pcie_cap directly.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
In pcie-fu740, the call chain is:

  static const struct dw_pcie_ops dw_pcie_ops = {
    .start_link = fu740_pcie_start_link,
  };
  fu740_pcie_start_link()
    -> dw_pcie_find_capability()
---
 drivers/pci/controller/dwc/pcie-fu740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index d0a34f680397..72c0a6316fff 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -178,7 +178,7 @@ static int fu740_pcie_start_link(struct dw_pcie *pci)
 {
 	struct device *dev = pci->dev;
 	struct fu740_pcie *afp = dev_get_drvdata(dev);
-	u8 cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 cap_exp = pci->pcie_cap;
 	int ret;
 	u32 orig, tmp;
 
-- 
2.34.1


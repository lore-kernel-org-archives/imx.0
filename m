Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7024343FD;
	Mon, 20 Jul 2026 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560098; cv=none; b=X/szLvWz5ekYx7jghh+Z+iHQP19gKCkbJk7RpFR9gsDrjGXQOzjaP00lkzXbS3lbCd707tKd/Lnn2PSbbncIUAkewKzXuyT3REGY5jJhEeHRDdlx1K6FnUi4KzdO4i4b749lkzes4ZUjyphyDMYVDdXpxZnyXGfySmWgTRpbLzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560098; c=relaxed/simple;
	bh=ThaktiGAe/yfRYpI9orDOAKwzNP7ZavcpetdONWm9nI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IvHeTkiAw+S5jcqMnoQ7whE5pRFwGDS4ndS6OhebLMvSraK4ELemYv7W+VDrngCGH8koQICqXiMNoyGQ8afXc2tPbPImMynoQ1MAS9kw0FK4vkESxUhn1XfviCjpjpZLEuKberS1EvDhql785SAJvcAYM2sRJU43aTNi6lH7kp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KVDwbKop; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KVDwbKop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=kb
	4jWdBr7fAMGhV7hOxhuVJo6c1gLcmiTbqibBA1sDU=; b=KVDwbKopKysaucMRs9
	vwQ9KpV2FqhFGITqoRCFnxIIT3GIlaUaBJzVA8i3oQFykeCl1NZvYQ1ThBbUJZH6
	LjTGBYx/tXd3O4YFTwKg3BKzcQxZM8p+JH/ucFPH0scL5NIuJtGrrCvbAaqIfmdw
	w6QcjRo88fO7gfeCHyFzYbVtI=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDX+mO9OV5q8LEOKg--.8910S3;
	Mon, 20 Jul 2026 23:07:44 +0800 (CST)
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
Subject: [PATCH v3 01/16] PCI: dwc: Add pcie_cap field and helper in designware header
Date: Mon, 20 Jul 2026 23:06:04 +0800
Message-Id: <20260720150619.24733-2-18255117159@163.com>
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
X-CM-TRANSID:_____wDX+mO9OV5q8LEOKg--.8910S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFWxCF4kArWUWw4fGr1fXrb_yoW8Ww45pa
	y3JF1Skr48AFWavF43AanxZr15tF93ArW7Ga93Kw1SqFyaka4UGa10yryYyF17KrWIkrya
	kw45t34rCFn8JFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEv388UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxACwVGpeOcAFAAAA3o

Add a pcie_cap field to struct dw_pcie to store the offset of the
PCI Express Capability structure. Provide a helper dw_pcie_get_pcie_cap()
which performs the capability search on first call and caches the result.

This is a preparatory step for replacing repetitive capability searches
in both core and platform drivers.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-designware.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index de4b245b1758..8113efd33a24 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -591,6 +591,8 @@ struct dw_pcie {
 	 * use_parent_dt_ranges to true to avoid this warning.
 	 */
 	bool			use_parent_dt_ranges;
+
+	u8			pcie_cap;	/* PCIe capability offset */
 };
 
 #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
@@ -829,6 +831,21 @@ static inline void dw_pcie_dbi_ro_wr_dis(struct dw_pcie *pci)
 	dw_pcie_writel_dbi(pci, reg, val);
 }
 
+/**
+ * dw_pcie_get_pcie_cap() - Return cached PCIe Capability offset
+ * @pci: DWC instance
+ *
+ * Finds and caches the offset of PCI_CAP_ID_EXP on first call.
+ * Returns 0 if the capability is not present.
+ */
+static inline u8 dw_pcie_get_pcie_cap(struct dw_pcie *pci)
+{
+	if (!pci->pcie_cap)
+		pci->pcie_cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+
+	return pci->pcie_cap;
+}
+
 static inline int dw_pcie_start_link(struct dw_pcie *pci)
 {
 	if (pci->ops && pci->ops->start_link)
-- 
2.34.1


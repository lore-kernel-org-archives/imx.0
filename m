Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEE8185952
	for <imx@lists.linux.dev>; Wed, 11 Sep 2024 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726059110; cv=none; b=oWf91mdu5EAzZoarEqohhQQuRcvrEfwj2HPqrfR8VhtOMl3l41igJoHS17kKfXrR7qyQrvbaBwLs+DjPcVMkgQsdCarK4oHJ40Ynw0flXpI7khrJABXeDCVLrFm3K3lq7PAmvcQ9PcHAwiGkZAsuJ6JyFSOmfXZ5wCSq4nWLCZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726059110; c=relaxed/simple;
	bh=DkDNO3+/HIOPzfQfkH3CefAUuCsde3qx72N7MjZkUos=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TO4WL+0b7N8oWV+IMWThMyC5Q7CL9FbEIruNUGuafgUB2Qg+oXLT0smBbo87l7j2wvZOi9SUU8z040Qdansdh9Lb+pVZn2MZb+3FIwGfUScm5UefjVW/r3wxKxLHZCiiOcvto3hRn7+lL8bQkLic7w1BmWG5M18cf3Khc5+7a7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aobxcyoE; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aobxcyoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=dOBwp
	HSygVUV5YR0zc6cjxhI4d8cJqeLkkmOcsSF9hU=; b=aobxcyoEja7ZvOMNrgVh9
	+6mRpcoe+yUnPgd4xvQ0uTmt8LQrMko0hUrXnsw5ep4LV21u09EHDGPJgljph1GN
	GrLwBHiF0i97NbA74P5PPrmqlJ0N6w4LH3ZBC46R0caLoe1OxhChJlb4Itkf8YS6
	IHlf2NCzD1+Zzw0ohjykXk=
Received: from iZbp1asjb3cy8ks0srf007Z.. (unknown [120.26.85.94])
	by gzsmtp4 (Coremail) with SMTP id sygvCgDXHndNkuFmmfouBg--.3491S2;
	Wed, 11 Sep 2024 20:51:26 +0800 (CST)
From: Qianqiang Liu <qianqiang.liu@163.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-pci@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qianqiang Liu <qianqiang.liu@163.com>
Subject: [PATCH] PCI: imx6: Fix a "Null pointer dereference" issue
Date: Wed, 11 Sep 2024 20:50:57 +0800
Message-Id: <20240911125055.58555-1-qianqiang.liu@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:sygvCgDXHndNkuFmmfouBg--.3491S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr4rWrWkAw4fZry3ArWfGrg_yoWkJrgE93
	4j9FsrCr4UGryrC3sFy3y3AFWav3Z3Zw18Wa4FqFZxZFnIqw15ArnrXF9xtFW8GrsxXF9x
	CryDAF45CryUujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRxR6PUUUUU==
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiRQ5XamXAo2QY8AAAs8

The "resource_list_first_type" function may return NULL, which
will make "entry->offset" dereferences a NULL pointer.

Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 0dbc333adcff..04e90ba4e7d6 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1017,13 +1017,14 @@ static u64 imx_pcie_cpu_addr_fixup(struct dw_pcie *pcie, u64 cpu_addr)
 	struct imx_pcie *imx_pcie = to_imx_pcie(pcie);
 	struct dw_pcie_rp *pp = &pcie->pp;
 	struct resource_entry *entry;
-	unsigned int offset;
+	unsigned int offset = 0;
 
 	if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_CPU_ADDR_FIXUP))
 		return cpu_addr;
 
 	entry = resource_list_first_type(&pp->bridge->windows, IORESOURCE_MEM);
-	offset = entry->offset;
+	if (entry)
+		offset = entry->offset;
 
 	return (cpu_addr - offset);
 }
-- 
2.39.2


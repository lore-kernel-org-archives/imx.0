Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104143;
	b=cda8AoXSRncUFlsqmUynJn5tYVo02s82lVwGXnG0+q4UkZxmOxi2rBn1BqQyxklCjytE
	 caurkE+apTFnw10O4qNaWnbVhNBZ2WWA2jZD41r5xth/5ZNYRIO/8kxMHozscN3NQOWiv
	 Gcy3Zs4IhSrez683xUK4jgNRl9Ep3hAc4lKjSt0wdqIsPj5TJeNwGHSV5rZqhGKwShs0m
	 h6il3zgGTMQQm+MJmoHN7tDZgaPE4BZD4SO4ZHGrTLq6s84epfaVwf2iaX8qmvDhRp6tx
	 5e8EVOMpme/0p/3AjvyOS7cTDUyBXG+acHcGNmSq7zgbz0iQMYXcXxwQl40lTf9cjkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104143;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=S5t7uFoKN8gTi5kSeRc4raDy/yZw3HkWKIXPXE2zN9Q=;
	b=Mk6/cHQzNb7nxoPGDMFqsmxv9V0cT5zHZ7Nd094sJrjAx3S0pS64PytipL68GcWpJzsR
	 8DW5TydpNjJY6Nl5ufjE1+IzhFUE5Yrcuy9SjC73OmmMYL28lQlmfRRtXMu0FzWMMSnz+
	 BExlFvXx4z+S2LAXP1KCYkLUd60HPdI/RvtrLrvPTTeymkWDas+mlo4cf/2zdPsyNqHUO
	 QGJPL1qBEZMl4JOVUmd59UZpX5NbQFsbpYaQDyAL3up3/ZBjHzNq14gAC/SjIdMa+WEJH
	 V1fYm3wTM8fujOw/6LJD5I4/VqbI+aAopO6NDouFprXaEhTuOdXn5yCxTsaS04NhwEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YUiIybxD;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5A8606A33E;
	Tue, 27 Oct 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA5A8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YUiIybxD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=S5
	t7uFoKN8gTi5kSeRc4raDy/yZw3HkWKIXPXE2zN9Q=; b=YUiIybxDqGUIwQ39mp
	PlrkjVLyqnAT8c0ajSwxUOZ0YZTx5JW2mzUJxYEkhfjV8NSjDLo1nDdb9Vzq2nAh
	GxN8cOsr7RVD3efA056DUVYU9fu4Gmu1VvZiVLsecWtFLbIuqWngDvb51ChAyg6P
	VNPgnAkifZY+By/6k8VnTQ+7k=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnz2v5mOBqYaUSDA--.46182S2;
	Tue, 27 Oct 2026 20:28:42 +0800 (CST)
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
Subject: [PATCH v4 08/16] PCI: dwc: fu740: Use cached PCIe capability offset
Date: Tue, 27 Oct 2026 20:28:19 +0800
Message-ID: <20261027122827.2725643-9-18255117159@163.com>
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
X-CM-TRANSID:_____wDnz2v5mOBqYaUSDA--.46182S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWDXrWkJw4Dtr4rZFWUArb_yoWfCwbE9F
	yDGFn7ArWDKr9YyF12kw1fJFykZa47W3WjgayrtFZxZFn2gw18XrykXFWDAF4kWFZxXF97
	JF1qyF48tay7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtpnmPUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7Bs32mrgmPsZugAA3Q

fu740_pcie_start_link() is the .start_link callback. It runs after the
controller has been powered up, so replace the capability search with
dw_pcie_get_pcie_cap() to cache the offset.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-fu740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index d0a34f680397..61e2daa20b19 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -178,7 +178,7 @@ static int fu740_pcie_start_link(struct dw_pcie *pci)
 {
 	struct device *dev = pci->dev;
 	struct fu740_pcie *afp = dev_get_drvdata(dev);
-	u8 cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 cap_exp = dw_pcie_get_pcie_cap(pci);
 	int ret;
 	u32 orig, tmp;
 
-- 
2.43.0


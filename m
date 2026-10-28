Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156856;
	b=vkKMjEs7JEcFbjzYcZ2bZ6NcoTskO5amjG3Y7jhvWJIVlpyeORCrkGC7dQQQVLlCNgFO
	 5T5WTs861MsbuJxSYeDWCcJ+ORVaslW/YZfW/B+eUGPklJKQehahSVd0HVWOfgQKoKqwr
	 e/o/bC543ofcI2lM7dCdBP/QTMlt7Orkq6LibZbtfvrtG+HuG/sa0Ogd8q2P4dkRsRUHX
	 I5IMJ94GmYd6WJvafM8acXaRXcFICkw5tsTTIsI5ITeYiwmKCXWmqM3MdphtxziQAZ2P3
	 oX/wwR3uHPVGyjR0t+9gSiwmqO3KdI7fe7yPzlj4shOrPIvMw3R6vKMXDVswRtbQzJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156856;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=GeE1WcyeYWP2mSPHN7XEqyR08PBMAZMQypM2d1RF7uc=;
	b=d0OX3x9d8KDCxS0ddYYCbub/3OP9/db3v2786oup4CYxX/wGDTuMCQYKHNYxu0j1rGOp
	 x3y5spJQCNP0lwC8CDFA9sntJ+DDAATdSawrzbatK8hEDXgUrLfIHcVfhe5vVFxywVn/D
	 1lEZDc1+cXSaO9h3OBkU7HtMK3oj1TF6QmbNbNfUdUu6WPSOUWG+9lqO5Hr76pv8IzaWt
	 4xqawOdXjVBpFgc8vnff93UB8EnvTliKCVC5l33yR971DyrvB2n9zV6JkznuUaDGBUT1N
	 Wy9lLg5qTYQuK/OYfrGw7R8bQhobUXHjyoXyNgFTK/udAI5CQmMl/zSLs3jr5Yc5a7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=g+ics2jL;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECA4606A320;
	Wed, 28 Oct 2026 03:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ECA4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=g+ics2jL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ge
	E1WcyeYWP2mSPHN7XEqyR08PBMAZMQypM2d1RF7uc=; b=g+ics2jLEMoWNTcWou
	3zuuHVannuRGZ/4ausRW5qQudn+/+QPForLoRvvdrurb1Y5Rxg1ADvE8/7V5tX+i
	p4ShFBZhHusGdXKLBIuFdMKDGHdHepwSNela/TocacSGAl/Kxq/kWHvHuXqCEwzq
	LwiYCPKMHjcKfvCvRUusynt28=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnVwncZuFqLzE4DA--.33198S7;
	Wed, 28 Oct 2026 11:07:14 +0800 (CST)
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
Subject: [PATCH v5 13/16] PCI: dwc: spacemit-k1: Use cached PCIe capability offset
Date: Wed, 28 Oct 2026 11:06:49 +0800
Message-ID: <20261028030652.2917756-14-18255117159@163.com>
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
X-CM-TRANSID:_____wDnVwncZuFqLzE4DA--.33198S7
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1fWryrZrW5XrWkXry8uFg_yoWfWFXE9r
	9xGanrArWUGF9Ikan2y3WfXF90y3y7Za1jgayftF98Z3Z2qw1FqryDZFWvyF1UWr4DJF93
	K34qvF1rAFWUGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMb18tUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wLkiGrhZuLHqAAA3l

k1_pcie_disable_aspm_l1() runs from the .init callback with the
controller already enabled. Replace the capability search with
dw_pcie_get_pcie_cap().

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 92a71ea90ac31..3369592b28608 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -116,7 +116,7 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 	u8 offset;
 	u32 val;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	offset += PCI_EXP_LNKCAP;
 
 	dw_pcie_dbi_ro_wr_en(pci);
-- 
2.43.0


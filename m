Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104143;
	b=3ZLCnLHTwepbsfi3mSQWR6o1GHhs2ItWzmF0AfNmMzhTP/SFoxS3NLxs25q4N6aSxbFd
	 WMGK8ZNEFQl64Pc3Yn4h35iyVN6Fils0FHmdHzAfUeeRDhlgx7OeVf9wgBOr3V//uUA7v
	 y8SNJVC3rv7u9TPBE/Awj+xB4JpmjOn6LB8PC/JrISJpi8hZ3XSpOchyceCATHHFezECV
	 tA5AGVQCEMUxVjKCr6nHdmejrtp/xZ+q38fQyuQJ2fA/WK4z/bMkkzYDxJt7rtK7n579m
	 JHf1a83Rq0sa/IAxDlcDoXsa8lKt1LWwL0k2CKpN+xZd0SJfk3qty+p4e0oU2mfJPZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104143;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=284z2S2Ae0vjBC8wol5cV24wAKYRYVn7CnfN94QDtaI=;
	b=U6NFmXMxrM+fIZZltfVppsDkSARGt7wdUBENdkDeOXosPVsQ1Tf8sSLpS7zH2FpSQd9D
	 FAZyegiYL764ah2sT4YcJWYDzwFdl0mqrikJnoQCwoajosSuyObbjWBw77qHZG/j8nto1
	 WpMcO6iaDRJ6rvL8FGYaFp3zuPiGAxODJsUR6OXlpCM3x08GJNfL6SVwbaLod8V52Yq0V
	 Rmi6+DHfTESdCZc9mb8sWFO3NdYJ0xevXtTRH8mV0dKHizTgme4Bf73mAUo4yLzFjQONt
	 zKYvV/3T0QQiWwGnYsHZpYGvJ5Pqdxf4F/HEkDhzrcq1xhZ3LCoVvfxfsx3sXJyK+1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AhN+GBKr;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE21B60A2623;
	Tue, 27 Oct 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE21B60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AhN+GBKr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=28
	4z2S2Ae0vjBC8wol5cV24wAKYRYVn7CnfN94QDtaI=; b=AhN+GBKr3IZARxLUls
	AoCV0fO4i8ZEwY3sNxmoHPX40XX/r3Kq0W8OLHB+ujjOxGwngR4oGRW6wWMf1HzG
	lHCvFKYMDvk80cSiirpAHekL3eWDYOsmBK00BoGDHTORkYkbf20Bbo3pW8gkJq2P
	RHGxOmlN4RCbx3vn0S8Riw8Gc=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnz2v5mOBqYaUSDA--.46182S3;
	Tue, 27 Oct 2026 20:28:43 +0800 (CST)
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
Subject: [PATCH v4 09/16] PCI: dwc: intel-gw: Use cached PCIe capability offset
Date: Tue, 27 Oct 2026 20:28:20 +0800
Message-ID: <20261027122827.2725643-10-18255117159@163.com>
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
X-CM-TRANSID:_____wDnz2v5mOBqYaUSDA--.46182S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wry8Zw4xKw15uw48KryrXrb_yoWDWwbE9r
	y5CrnrA3y5CFZ3CF12yw13AFy2ya42q3W09ayrtFZxZ3WxXw1vgws7ZFWDZ3W8Grs8JF97
	tr1DAF18J347JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNmiiPUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7Bw422rgmPwZ4wAA3H

intel_pcie_link_setup() is called from intel_pcie_host_setup(), which
runs from the .init callback after the controller resources have been
enabled. Replace the capability search with dw_pcie_get_pcie_cap().

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-intel-gw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 348e579e683f..a891c3f8eb01 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -119,7 +119,7 @@ static void intel_pcie_ltssm_disable(struct intel_pcie *pcie)
 static void intel_pcie_link_setup(struct intel_pcie *pcie)
 {
 	u32 val;
-	u8 offset = dw_pcie_find_capability(&pcie->pci, PCI_CAP_ID_EXP);
+	u8 offset = dw_pcie_get_pcie_cap(&pcie->pci);
 
 	val = pcie_rc_cfg_rd(pcie, offset + PCI_EXP_LNKCTL);
 
-- 
2.43.0


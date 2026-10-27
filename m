Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104144;
	b=EgGodljgffFztRJLhOtK3S8ifmzRfz4g0pQGNnCHzZuYLJ/RdG7lwWOUSvql3mIr1gID
	 gioA1zw0cn3WzbZ6Z6LSsZ0MvXKVvjYU3zbOawV9J+dwPM8b6BEc/B0ouhZMaoRzDXVdI
	 V7stGquidpjBs+bFO2yBE5EFYDk6XGoOPJWE8Aep++HItfeoADfppp7Qr8/x1UhPqVeIw
	 LcsM/82HmSaDYr3WScLe3rhrNum6H28DDTiP5kfUrQymsiyg/tRHevUhyVgjPce1LKZYE
	 OMIRrksu/G/6TNLsAdljuTtBP3F1S7f+h6iQmIFH0CWXLYDwMAuy2nSnhv0lGXdIINg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104144;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=WPNfxFDuxL3x7KswGwtOTGrsdyXt9tx1HriDed7EIQI=;
	b=J39q17HOSVyhJgkvVGNfy9BW0UJ3st3xjjuHzQQxEJZrT9Jngtv4wY2t3c761hOW0x2X
	 k+R6CwGCeqw6N71ASnTxcDKoMm3avDXTqPboaGJgjGIQXI2DCFLdddDy1xHotRoVAAUVp
	 KpWzVqv0ZvYTUHa2au1DyyYPxOeKhchF/AbpI7xLeHECmvmfs3kRsSpQ4kYSmTl3OR7xk
	 uorMgW6XSX2g3Tu8GZNDS+5hIb35rIOlGfqYgUnBuo9RasrNYccNd0evyd+nMMcpirZU5
	 QJs6DGh22KCCJjRlhzJSX8BUp8u23GeqIPEaSeNMcOjEWls+IMGTeeeL5/Ps0KXimtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=f04X5bpo;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31541606A31E;
	Tue, 27 Oct 2026 12:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31541606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=f04X5bpo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=WP
	NfxFDuxL3x7KswGwtOTGrsdyXt9tx1HriDed7EIQI=; b=f04X5bpobbdtpxh7tj
	7SEi/GbLEoRJzH0rInUMxMkRZoc7CaAF9RYiFott9FqU3I7Y+autjdYoTMSMITUO
	Y6g5ck/IBAUv33+qvFcgCYyDmsxfe3yJi/xM0ilZ8Mdw+rkiI6Uh6csviCPDgeq3
	joCJo32U21xe3ioplgHkxW7V8=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3Dz_umOBqUsqlCw--.64541S8;
	Tue, 27 Oct 2026 20:28:37 +0800 (CST)
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
Subject: [PATCH v4 06/16] PCI: dwc: rockchip: Use cached PCIe capability offset
Date: Tue, 27 Oct 2026 20:28:17 +0800
Message-ID: <20261027122827.2725643-7-18255117159@163.com>
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
X-CM-TRANSID:_____wD3Dz_umOBqUsqlCw--.64541S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWrXr4xGF4kKFyDXw47Arb_yoWkGrgE93
	4UWrsrZrWUGrZYka12v34fXFyqva47Wr1j9a9YvF9xZFn2vr10qr97Xa4DAF1DGrnrZr97
	Kr1qvr4UGFW7JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNHq2PUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xU22WrgmPUYOAAA3W

rockchip_pcie_enable_l0s() is called from rockchip_pcie_host_init(),
i.e. from the .init callback, which runs after the controller clocks and
resets have been enabled. Replace the capability search with
dw_pcie_get_pcie_cap(), which reads and caches the offset at this very
point.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index af26a07c0c9e..753606193855 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -373,7 +373,7 @@ static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
 	u32 cap, lnkcap;
 
 	/* Enable L0S capability for all SoCs */
-	cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	cap = dw_pcie_get_pcie_cap(pci);
 	if (cap) {
 		lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
 		lnkcap |= PCI_EXP_LNKCAP_ASPM_L0S;
-- 
2.43.0


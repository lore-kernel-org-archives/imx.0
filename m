Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C7C142E83
	for <imx@lists.linux.dev>; Sat, 24 Jan 2026 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769275501; cv=none; b=BRg2OUOdei99bMWnEREk8l09AVN1O4FjynaXUXDThpHo7dXvJtC/mB6fxLF5OWXsGHYSN5JbVrJPSt3ROQmou4B4w7K1eRnZ9nbBnU0Hh0tFjvOtuZHhFW1GL+tBCNuDbMV/X7YPl8UaqzjtFSFC5K0F739Dq1fa98Mr7gLMZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769275501; c=relaxed/simple;
	bh=N8BJ2XoL6RWsSMDXgT3y0d3NEwsWENvOGYzbokKPriQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ObGxJ+4fKl+Cu9+1n192HX9YKyETN7lSzqGATW0s/QFZ9KKdpeOWa3ca5H9jCUVP5IVkTJUKYa+CdWBlyf/TYlVtYIrysl2PeK/Kp9dKZz14E3sw6p7Zy3Ui1hG+W91OPKq9h7q+6/SSmft07L/58p0sTk1T0hiOotDdtCc6f0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S96eCREA; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S96eCREA"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8947e17968eso36458156d6.0
        for <imx@lists.linux.dev>; Sat, 24 Jan 2026 09:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769275499; x=1769880299; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hu27MEk2joWcihG8erKat/1jVTiWwwVOoOBwBr4PT6E=;
        b=S96eCREA9i7VTUFoy55KQHrN9POZ7wnA94D820iyA1i1l3Uen8Aeq6A5ys+PXu+jAA
         /QYCQLJwjsbxrKHh5mWCkWhY/dIw62vtJEshyNPcDZJercCwxGsV8ZwcnQ2dfcRar+V2
         AVBhYG9voJsmBiwMLLcPojyJPFFQSUG5VcokI2GTpPcCBCIwL2HLCoU1INv2pyKmCQXG
         ahXYnv4ssXe0XNl/0rgLhodPC32HWXwOrw3VG4++WkyNTaX7L3DMkR4DAXQ11yAkQu8Y
         zAobhBy3YCRJqr41v+vo1Dwy/8V4ji2JCTo9v3GCfdw8QSpdRj9CsmketIkNRnJsQF4Q
         ngzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769275499; x=1769880299;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hu27MEk2joWcihG8erKat/1jVTiWwwVOoOBwBr4PT6E=;
        b=tOy6YreN7HsiNybEQJwYe7PWdVoEtE+w8cuSf6vvGlhdt1BLQW5egWNVDVKwfpR5iI
         NzNE3f4DSrbA85+OEfGwMZ1kTEXQwpA2zadWwfjpd42DcMFEr8e/g+duZjJN95ddGyiJ
         TBdWhMxBfrCq6YcyXDBD7kNAGJ3Tsk7VCCAJ3dhc0/Rse0Wohz1bVRdVa6SYO/vjdhcW
         BhN9TMg0ZLnd0z7yoq8U6Ru03224wN5odQKoApU362LL18LqN27L/5Pt3BgakQjfNFsY
         nOXb2Ya3CENvfs1iO3YOc8JV2hjH6prPQwFbLFfyExXrHpYO6HHRX8KK94G+fPUT3Pb4
         iS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9WLxV9FyV1PrNLImfvvtUDZ0pdzKmORNhdvDEuCnWF1BP/S5ipeIERqlyExTsgX18TNw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0nTZ58RkrkPfecMtjammadOj6usr8vX8MrCGFOczOxBVxfk9L
	tEW145Fr5C7v8qwpYrEk1wJ9gSgJU3h/439rjSTR66vnZ1fjZOHUeL2aLJD1VHJpZT8=
X-Gm-Gg: AZuq6aJV7ptBcpud0ksI4tLR/+maLm+iPs4KN+PZWb7uVgHOAKiDWtht14peCYQoT2r
	Q1ZxI/cmsZlSKbvdlfSkH4AkgBisOAUttyQWZtNfW5/W61gpG4qp7vkb/uiYCTSEoPoG9sl5HkO
	8/3NxVYoKoWoe4EG5jfYN2gAA2vsBucOvCKnnXh5R87s8YqfmPtC/U2euLKKuT5OKKizFrTzghO
	xaUXbh3BiHJAfIE3/5NnPWLexvGnQQtcnapFwceJYtL/m0Ppv2eoN6nBGHG/jHou3GkxvilESJU
	mnMS9QCem6QzM708pnmlC/ndFT3gGCSNqtNzQxrWhm0qRqSzcOVsBgCpNGAb/uu882CsWKzxCNi
	bbz2QIjHkwzY7HAmHJHdIstOFabh2i0UCxJMvXhxHFv8Ekk2bzmEpEpV805h0HGUeN6FNQOZgjo
	z2ljxDfHny7JVLbpX+KEm3GZYC
X-Received: by 2002:a05:6a00:744e:b0:823:3056:c2e6 with SMTP id d2e1a72fcca58-8233056d753mr1391339b3a.67.1769269376898;
        Sat, 24 Jan 2026 07:42:56 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318666c16sm5093118b3a.24.2026.01.24.07.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 07:42:56 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 23:42:45 +0800
Subject: [PATCH v2] PCI: imx6: Fix device node reference leak in
 imx_pcie_probe()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-pci_imx6-v2-1-acb8d5187683@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHTodGkC/23MQQrDIBCF4auEWdeiNtWkq96jhBLUSQZqDFokJ
 Xj32qy7/B+Pb4fkIrkEt2aH6DIlCksNeWrAzOMyOUa2NkguFReyZauhJ/lNMey11bzrtEUD9b5
 Gh7Qd1GOoPVN6h/g55Cx+6x8kCyaYwvaiezRXofh98iO9ziZ4GEopX1OB0H+gAAAA
X-Change-ID: 20260124-pci_imx6-f97d70887dfc
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Trent Piepho <tpiepho@impinj.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769269369; l=1739;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=N8BJ2XoL6RWsSMDXgT3y0d3NEwsWENvOGYzbokKPriQ=;
 b=h6ad2YkaTwuh/K5r3ATTlVSOlDZhd2RIYTIws/ygz/DGkZChc07DnBrwAdCZ7SBoQUMA+VBAI
 YHNWHD+cMCrBBP0h/b47zCHs4WZV2TsrS6/fjuhJKNurMo7ouhPSHlC
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

In imx_pcie_probe, np is obtained by of_parse_phandle() and must be
released when it's no longer needed. However, it doesn't release the
reference, which cuases a reference leak.
Fix this by using the __free(device_node) cleanup handler to release the
reference when it goes out of scope.

Fixes: 1df82ec46600 ("PCI: imx: Add workaround for e10728, IMX7d PCIe PLL failure")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Use __free(device_node) clean handler to fix the leak.
- Link to v1: https://lore.kernel.org/r/20260124-pci_imx6-v1-1-6f4379fc5160@gmail.com
---
 drivers/pci/controller/dwc/pci-imx6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 1d8677d7de04..f459d05ecd7d 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1643,7 +1643,6 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct dw_pcie *pci;
 	struct imx_pcie *imx_pcie;
-	struct device_node *np;
 	struct device_node *node = dev->of_node;
 	int i, ret, domain;
 	u16 val;
@@ -1670,7 +1669,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		pci->pp.ops = &imx_pcie_host_dw_pme_ops;
 
 	/* Find the PHY if one is defined, only imx7d uses it */
-	np = of_parse_phandle(node, "fsl,imx7d-pcie-phy", 0);
+	struct device_node *np __free(device_node) =
+		of_parse_phandle(node, "fsl,imx7d-pcie-phy", 0);
 	if (np) {
 		struct resource res;
 

---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260124-pci_imx6-f97d70887dfc

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F2E38BF62
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 23:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787612688; cv=none; b=mWmtap+LOEkSOkgU6hbsq7hKHvRiIFquZAds55QteD0iJ7rt9mNSbeDcFBy7mjTkJAkyzt7T/NeCopChMQK5F9Jw/MiLDY7j3KSoqSJlo3j9kSsTbe3W/gTxlWOyG5n+7qjrLRA79QmU1GB3Ro0pHEVb6RE+oxIVm4hZWAVdqrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787612688; c=relaxed/simple;
	bh=WoXloJrXVbmH2q1MZYQehHQUeWaEkOhNRXNS95dMd9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ckxJwQ1HBtv4q2ASTVqPAG7w9P96bDJIad2Yd9tbTicgOl5SwXPv6kdd8U6zMn0y7a5O504Q97tXhW2rWQd28NbID9m7uX4rsLbNJ8cU5erQdpTvmpJ+kxssK4dXY+GKCbO2eBYlbbtRwli02xzMlN4e7vPoRrqS5/3XrwQGL5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQvVyIzI; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQvVyIzI"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbedf318752so3136051a12.0
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 16:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787612687; x=1788217487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGnZD8PU2ZM2OuEJ0fefI9bGemjyRjfKxbkU0KSOSbI=;
        b=VQvVyIzIltOqyvqBPlrIhXvakjQjpVC14+UygasBk9LXZi2XPgHJNKM4GUug6qJam0
         kkKt4MAmgBxqA9Te3aoEVAom6Y03e5beFSfhTpHQzg0Eu6x1y6yLGQ39E7ZU+08f1r9d
         hSWDzD44ZKKw8iuRNIHgaWxki4UH4+NY+LzVTCU4LQN5blrBaFu0CJyA81kRMTamvQjQ
         TaPA2jIO4eMy7serGjSeb+J6Skx15sRrdMG3xmbkVXtLnm6Jilm3u68t106uPiJo3Nkd
         xfk1i6n2IyGgk6SQbI01uZJWxgCC/HykzBhSt7CIfhNu0pF4eBwvsSjEymaZgL8KA3ki
         V0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787612687; x=1788217487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGnZD8PU2ZM2OuEJ0fefI9bGemjyRjfKxbkU0KSOSbI=;
        b=XbINWU7AxmDUG0a1XBNnmRbe81ivlAcjUiI2QhTqtHtyzsliQSDVLHgfp0YnzI8cfg
         P3CHqyF/7IYXzv+gFSz4Iuw5/YFR80MfjVLSs9NAmDpmYpThm6tmL6IwUqan7sMjb9yh
         E6qqC7F07W2xiNbjmkGKC4ChT2oV6SbmMT920+Z4eAZCtrSyFtnzY2PilCK707jOkUhj
         Jyxs76rKIZM89D/JN4UZX/eSAs5marMKZ7hC0LtQBk/mQZ7Jy0Kpa+gXUNSEFa0co6Bq
         LY45ygsFUcDKfaj4fRxXbWFMusXpD5cWdxlsOz5Y4Dl6+mMrOCydi6S2D3vWHUcgVIfL
         lhWw==
X-Forwarded-Encrypted: i=1; AHgh+RoHcYRaxnKM882I7rZyEjAC3+QoTkWoHuKJtQZjm639xxDXnTF5nU5ppOELkSD+Pjqf73s=@lists.linux.dev
X-Gm-Message-State: AFuF++mGd0/hQKfqFLQb57UlvgVr99UXe7N4PalaEcu9iN0uC+GpfveI
	NsZflvS10HsqKvHeKCRABy32dzjolZFLahpxi7Ho6Lq/PLRDjrgW7IA9
X-Gm-Gg: AR+sD103Htqh+GdJ0lvdt9VURl8l+newfLAJAygpnvuWiTrkDqGhacq5HMNoS3yKYj+
	moD4CdC+qXuQQoJbVBEo9fFhKCULb5muYwWwusJcz+eDS+m4C/56u50StAjnPrrCltWL2UmYPof
	meyJ8SOlo4oOVQf5TOO35xNvrvvH+8Lm1ztcVPVDHG6NGw5TDn7Z0B7BRup1+oD3iVNlNfkbJpL
	VGtVwt9WPv8orLH6rfDvJldUa8eF3aB5btebqMiLrx9VsipoAEiAO7Lov78TvStoX0nhHCQgVaV
	kZCYWq5rwT+7i1dF/eeroh8r9j3T/tMP22kohzvYDc9G+ZFlTiYr8sAMj9BFOCji4cjMnDXTTBs
	CNxk4+BCx7E3tmSsxMLjuYE2GwCtQECBSIKCrpddfBn7KKAX8PBbBiEDj/l6+QaDgmyOQD66AeL
	DKxP49Hpfvn/NLH47Rfs2dTiHIQLnwZNy1i1RkfK/5wSSnNhtwX2iNlwGMFeJKq4IQ7tkAJYFm5
	9eljPNMdX/ZkCRoY1FdIh3bli0uD2+LSTNPhmURbdiYV/ovI7tv
X-Received: by 2002:a17:90b:5745:b0:380:f389:447b with SMTP id 98e67ed59e1d1-396464ce7bcmr4294356a91.11.1787612686607;
        Mon, 24 Aug 2026 16:04:46 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b39efdsm1214065a91.5.2026.08.24.16.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 16:04:46 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhijian Han <hanzhijian1991@gmail.com>,
	sashiko-bot@kernel.org
Subject: [PATCH] PCI: imx6: fix endpoint init error handling
Date: Tue, 25 Aug 2026 07:04:27 +0800
Message-ID: <20260824230427.3649829-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_add_pcie_ep() ignores the return value of imx_pcie_host_init(), so
a failure to enable the clocks, regulators, or PHY during endpoint
initialization goes unnoticed and the driver proceeds to initialize the
endpoint against unpowered hardware.

It also returns directly without calling imx_pcie_host_exit() when
dw_pcie_ep_init() or dw_pcie_ep_init_registers() fails, leaking the
clocks, regulators, and PHY that imx_pcie_host_init() acquired.

Check the return value of imx_pcie_host_init() and jump to a new
err_host_exit label that calls imx_pcie_host_exit() from the endpoint
initialization error paths, mirroring the root port path which releases
these resources through the dw_pcie_host_init() framework.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260824152857.DB9771F00A3D@smtp.kernel.org/
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b..1dad93e9d 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1634,7 +1634,10 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
 	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = pci->dev;
 
-	imx_pcie_host_init(pp);
+	ret = imx_pcie_host_init(pp);
+	if (ret)
+		return ret;
+
 	ep = &pci->ep;
 	ep->ops = &pcie_ep_ops;
 
@@ -1646,7 +1649,7 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
 	ret = dw_pcie_ep_init(ep);
 	if (ret) {
 		dev_err(dev, "failed to initialize endpoint\n");
-		return ret;
+		goto err_host_exit;
 	}
 	imx_pcie_host_post_init(pp);
 
@@ -1654,12 +1657,16 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
 	if (ret) {
 		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
 		dw_pcie_ep_deinit(ep);
-		return ret;
+		goto err_host_exit;
 	}
 
 	pci_epc_init_notify(ep->epc);
 
 	return 0;
+
+err_host_exit:
+	imx_pcie_host_exit(pp);
+	return ret;
 }
 
 static void imx_pcie_msi_save_restore(struct imx_pcie *imx_pcie, bool save)
-- 
2.43.0


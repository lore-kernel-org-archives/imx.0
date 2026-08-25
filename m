Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A0F1A704B
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 14:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667348; cv=none; b=mkIlRzFlBUQdMX5/b01lq96loWlkxcr4m4QltLXabgHpY0rTdEaiZ+kOWvvtDVgNr11wG5ktekbdYhM1lX34Bxl7Qd61j9cVi2hvz54jqD6WZNZwlmghpGeRoasNjksFQlH+Xnxytwh3zWsP7PTiAit7UkAkIX9LmNHvxqR9saQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667348; c=relaxed/simple;
	bh=N8dfMV2RTxCE7arhbl2EaVyOwVpkyAhCuc/xfSBqTcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dRBY8S3v/9o3HkwhOv4bJb76wo0PThRDZLRsG0JDDOdD+66VmmPR9aGr1Yd1vhQiYMtAWCXqQrPDTwg5twj+rhDCDGnc11OsmRRvaBEyubF3Gkrc4QjehLbxvNBBYLr0lf5WpH5vmUvKzYaG/fWfKyMaBfFUnq9beKQYOoYLlvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lH2shW9I; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lH2shW9I"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so3824989b3a.0
        for <imx@lists.linux.dev>; Tue, 25 Aug 2026 07:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787667347; x=1788272147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGI8avUDsdCwdcQZ5iPHHrLahXfIYCIB9Ws1YZ5JElk=;
        b=lH2shW9Ihsd/GkRfdhm3DiV6oe5Dx4QRfnB/yKSszaNEtod28sufQ0esFUdRelkFfG
         877ywPfkEJ8v2/f9Fi8/chXp+uKxlvmt2GnSyzrsL1T02ybpuQWLvGsVdgvMwWHGXZ/W
         yQitPOLeAIgD1EZ0AR3idwkGe9CZCYybaeb7nWZ9T6RpnVJudpsWK96pez9ji7JkNy3U
         xJR97N55QClaVKjI5FJ0pKADP4yoUSVHzZaMY39mvnZ0n3qRBcbYjhARyxaOfH2NuehD
         9CHcx8QQLYSjLs6o06EftuOVfxSN9dofogrAZqQAr5r8yS/dD2AiIgi/Lx6dHr1G/jjg
         IBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787667347; x=1788272147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGI8avUDsdCwdcQZ5iPHHrLahXfIYCIB9Ws1YZ5JElk=;
        b=L1YiVn42K/Adf7WzEGDmGJ897pHEFWG8nqvaEMhmJt2PbJXMUTyqX9tXXuTaBP9AQj
         7d/1p4q2RnlDCkkKxClpzcPgrStGQLmFCS/FAFaAQ7HRpeAExebxmZLJIVJBB94s1n1Q
         zIOHjS5NIUhtyjfhRw9bu6gfoHflgHobKyCwyfkjAZAEZjKvIZXquHuOTQP1E0LuQ5h0
         uoeXF13TMy5A2pMZVb0rthY7lp/KJYQRheiMeIp34OC0zaPf77et2KBiGVz2IMJhm6OS
         dWVxgGMK5or3lKICtZlcT0zyDdZhSvE34y5wmBnzP0ji4wUOhUbGEMJuyY3bCdGXBS4u
         8d+A==
X-Forwarded-Encrypted: i=1; AHgh+RrBMo4LI0nYgmWvV68Yla3flhm0tiM989JA6yDDaJfxdT3GE1JZ4JkOhw3ZpV7lvVdeE78=@lists.linux.dev
X-Gm-Message-State: AFuF++lZCA0ExOPXiOkO7oFYejXryIsoJMjBNCf79UPXrDoFQc21sakn
	3cLdImjozFiUBuwKyjEYYc+FNqVL7ArLdjg/U4CL3+sK55KfAN7RvMKR
X-Gm-Gg: AR+sD11uXlHz5eJ65M4vd7PGpSBbQMhbr6EZpOeeVqiN7v8eN+thbNscJH6UuEQkmtZ
	bxvDoyKhBZ8/GLube43MSZ73C7MTBEuIfUbChEJDn0jlQbDvaZ6jnw+Ot6SEFYW0BK9BrZZXYgT
	DgoBCiNq1yhfq9iQpFSicNZzTahn1IAWJi/C8DS0jVZXocZBqIPUd5Ffk3VH0uKS3Jb9271AYyV
	O2mtjjXqcYV7iJVyTcjOH/L2N+0XzeDw9KWPSE2YxCzi95TU80Ofes6aviI6LZsB+F2VqNyKUG7
	v1TXZXFzh6l/PQ42cMHYxegoPoUzxt4fmxUL8V7tp2lyfZbBeUF1wK8liQ201/AJSRytlOP53Bk
	bX8sxtKBSGvSVyyE36xCUH4R4auC4h+wrfh/+c10fhvaOObtXxzuQBw+RDKso94wvj87jxdjAAW
	rLJmqN1FLVyN0tnA9jfbwi+ce2E+J9HxMA1gebLCQi3fQp7fayFcpA+QCs8vFiGgSB1kisJih2Z
	g+SruzAcUnyfT5aM0P/gdVy2e/2txt2V0sJmX33zugqb0jZ5Sbw
X-Received: by 2002:a05:6a00:928f:b0:851:ba04:ca02 with SMTP id d2e1a72fcca58-851fa070bf3mr58592115b3a.16.1787667346530;
        Tue, 25 Aug 2026 07:15:46 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520eed5034sm3122767b3a.1.2026.08.25.07.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:15:45 -0700 (PDT)
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
	sashiko-bot@kernel.org,
	Zhijian Han <hanzhijian1991@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] PCI: imx6: fix endpoint init error handling
Date: Tue, 25 Aug 2026 22:15:26 +0800
Message-ID: <20260825141526.3911472-1-hanzhijian1991@gmail.com>
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

It also returns directly without releasing the host resources when
dw_pcie_ep_init() or dw_pcie_ep_init_registers() fails, leaking the
clocks, regulators, and PHY that imx_pcie_host_init() acquired.

Check the return value of imx_pcie_host_init() and register
imx_pcie_host_exit() with devm_add_action_or_reset() so the host
resources are released through the devres framework, which unregisters
the EPC device before powering the hardware off.  This mirrors the root
port path, where dw_pcie_host_init() releases these resources through
the same framework.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260824152857.DB9771F00A3D@smtp.kernel.org/
Fixes: 75c2f26da03f ("PCI: imx6: Add i.MX PCIe EP mode support")
Cc: stable@vger.kernel.org
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
v3:
- Add Fixes: and Cc: stable tags

v2:
- Use devm_add_action_or_reset() for imx_pcie_host_exit() instead of
  calling it directly on the error paths, so the EPC device is
  unregistered before the hardware is powered off

 drivers/pci/controller/dwc/pci-imx6.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b..f0fb4e1b0 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1488,6 +1488,11 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
 		regulator_disable(imx_pcie->vpcie);
 }
 
+static void imx_pcie_host_exit_action(void *data)
+{
+	imx_pcie_host_exit(data);
+}
+
 static void imx_pcie_host_post_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1634,7 +1639,20 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
 	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = pci->dev;
 
-	imx_pcie_host_init(pp);
+	ret = imx_pcie_host_init(pp);
+	if (ret)
+		return ret;
+
+	/*
+	 * Tear the host resources down via a devm action so that, on probe
+	 * failure, the EPC device created by dw_pcie_ep_init() is
+	 * unregistered (also via devres) before the clocks, regulators and
+	 * PHY are switched off.
+	 */
+	ret = devm_add_action_or_reset(dev, imx_pcie_host_exit_action, pp);
+	if (ret)
+		return ret;
+
 	ep = &pci->ep;
 	ep->ops = &pcie_ep_ops;
 

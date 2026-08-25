Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D26E3B1013
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 06:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787637843; cv=none; b=oYe1SRQow/dL9vFD75JIyLz6IyFrUC6BlVlWmvLLJ0k9bh6o5fgPYXL2ttsYXVkBpZ+/q+AtgZN/SEPct3dhiqHdmbgV89zvT1cXamhL5p0mORHl9ISZE9NvGeJgnBIQszYmQ6EPBSLFzMFjrsEQFNJWXmjRaA0yXDClmXQmQ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787637843; c=relaxed/simple;
	bh=qZd7FKre5dmrKvcADqZAyXBMS/3CytHy0dsIUnnFeGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AbUtHQwtNAUi4T1+Fd7WW7IJGdCTePbHw+FdiQu5r20CI5X/oOkRQ4b4ve6AfEkglQZj4B9ZTBp+16GhY8hPNyRSTZzqwyvlGSTua07QmPrlDiobxaC7ufm0aY5YVTojCXnnn5gWE0aoWEA9O+gpSAxz72X1YuWoogjkftDk6WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=owxOPcPo; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="owxOPcPo"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso5481890a91.2
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 23:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787637841; x=1788242641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQdyTi/FS8Kj61goZufr0DmEJyM53G/+OIGRH28vBGc=;
        b=owxOPcPo+dUYdwHBga66Mvk6QrgOr179XXUFRLaIFApIIwUPJdy1v25Fh3nmM5/2iV
         tklF2eZEkHb+G8HZb6/4gPzDH2jlCRc4qe6OZTC3bfF9/vL1CO4qIlxh5tIJf24OXX6Z
         Q21uqnPshP6dxeHHINWnPpkLU8G+anmXcAOWa043IsSxe6cnAfYsy2kV5keoyCfB/HBv
         SqA2N7Eco2603dFSAAyu32ltMvonMYByfI1nTx7Ms2YNMiz3kIodL50tMgMlWtmGHqlU
         qhWzjEWs3FEht9KsVG7t5SRFptYo/W/OqbNJvfi51ELrCIXQdLk7KcUlvBd7UbiYt7+N
         1vNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787637841; x=1788242641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQdyTi/FS8Kj61goZufr0DmEJyM53G/+OIGRH28vBGc=;
        b=HV2Wq0dDdFJse1f+MA4uT1XzrVP7Tcg8xiFrynI2Iwxu7w1YiwmfXJ9m8J5bxF4Xm8
         yLr5ydERWtn5FzBZ4a2IcT2fATtRG/X7gDKK0tRBukN/dHFzD7+8UvXlKnFiDJqgoLhJ
         irk8SC5gUJlWCSgvY6PM5XOHiSJ5trATQxa5Ru3DynmJCfrRekFu1mnf78eZl2p/szz6
         S6nGg+YvSp2Sx/j93JidLalW5Y8dKN9ggEmMdhrr6sI3+5Mq/i+AezgNU47wIJ+171jN
         uTTkhr0hq5GbNJwYwBZIdFEmVpF/wAFInEB7Y7cY9idvDFX/aZjSAw+vKjifFK+Q/Ex/
         5xdw==
X-Forwarded-Encrypted: i=1; AHgh+RrTlIWnmJ6NB4bDOjZPneGocfWz9vgd/HakzjsLa2nFPNiVs1H+KsVrT7vOtNE+XzeNY8o=@lists.linux.dev
X-Gm-Message-State: AFuF++m6UtjQnwG3B/iW3zcIy28MTdj9EfgZViFo+npGqe9yglc/3TWD
	CqVO1RPnP/yIhgJ5Vm0SkuSLCSYmygH4Fe3eP/0ih4j4RnWfsbt8mmIg
X-Gm-Gg: AR+sD12ltiza3E2Gl13lM9/yUAmDflmoaRYhpIJvvfG62vqjPl7OwsAqMYWuVNNNvr/
	EaXlQTp7HFs6ntZlJgvn+SFPKcsjQeKby3vLVvCdtIkeXmfteprNLZsCFdyVxQbbOss8cynwc33
	qMsqSddY9X+E5GA7l98QSiczf+jEtpUL1cqcltOoZlCcJUC751J3PcAKG2M9lkK7mxslu3iMhIX
	KAqcl5811QPcqecHaZaOmPMmV4H8Joarr6CjAK4kJ3EeIOhRqzumgF1faM8xVwduAGr64puhjXP
	g06M24gc/s/qZSlU6WjLSEL4Q7SyEk7E7QYjw63uoJ4Zr2n72Qp5RW+x0SG7/3geKCNEnFCzsYx
	bSPg4nkbfm445eWO5lc9Iqj1AEzekQYqRCmhnP4JuiO7wXFkjvW+ZXsu5ODdJ7FrCMcDMd5ZTb/
	m/j5HC4N5HAxfmZOC4s44Hn3pfyGex3gsK/lc3Jox5lNFwn1UsormD5VbNrS4cvF7ZHRCi2i66m
	ZnjdOM7+wUa8uGGCRnA5VarIqR9XXYA7ls0hnH4ApIxdCdUc2Lu
X-Received: by 2002:a17:90b:1d50:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-395df29b3c5mr49167378a91.12.1787637840732;
        Mon, 24 Aug 2026 23:04:00 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b82847sm2536296a91.11.2026.08.24.23.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:04:00 -0700 (PDT)
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
Subject: [PATCH v2] PCI: imx6: fix endpoint init error handling
Date: Tue, 25 Aug 2026 14:03:40 +0800
Message-ID: <20260825060340.3767635-1-hanzhijian1991@gmail.com>
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
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
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
 
-- 
2.43.0


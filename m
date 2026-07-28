Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBE729DB6E
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 01:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201990; cv=none; b=n027N1PypQwOf3Q/5k2zHfj+kBSLvBiXnNRhCGdN2ixagVutKuGjubIf32LeaDPAmdVlpN4D5la6C4D+f091jxxbIJC3Cu7lfCDYJYcXmmejDFeVuD/xVQ/aItTjd2d8gxzLC1MO9jhxegRXd/hLgwMa9/np/DoH2LKZTiMoHJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201990; c=relaxed/simple;
	bh=OytgOfLKmlcWdDlF3BgeCH/2AjkkT18/BwQ0R9vsBOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=le7g7L3VVK2bnSrcJHcDj7Siuz7RMQt6fvam+3z3Wl0Okiu04gdoSDulgAcEqo805Rfb5iQZlHBxbEtIh45P0ruOzOSo0juQNV3T06jus9ZRs3bpJO4+1LrokoZfN8tU74LV9rrWgALC6GnClEOdRa6dQZy3YdUXFVgIsXCHHYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=r/EzyGH3; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sqNUGCHC; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="r/EzyGH3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sqNUGCHC"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4h8HqQ237Dz8v9m;
	Tue, 28 Jul 2026 03:26:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785201986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOb78p74bkOmvufOcc/1bh+dA535Pa9k7i52m7AyAII=;
	b=r/EzyGH3gq0jSjzH6u+ZswyOUvyFz3jBfnRyF/1noE+2NZlS74okB3Hd4eEFnRSENgEhCU
	CF/Icl+CJzCSC9ce8uSnQCg6kbdKERYgbQ61RyHUAN0FYM+qdF9cdkMJ65SIM3BZuf8rLV
	pQrV/3ukfBlb82d//8bNoT3foQHMm6CHFz72nUGC/380OYDpBqbQfpTJKbbO9x7fmBXK/X
	Sfh1VQ6EpENZSAIxyQIcFpagiqFoIsKEI3zfRqDAibY+qzLTnbbNlrM+jy+CZqcsFsxcDW
	c0ZEqhDhvqprVa1zJMGCS0fv6RbPMp6vbWtS+nF1KWih17X9OkYRx1eIBJNfqQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=sqNUGCHC;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785201984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOb78p74bkOmvufOcc/1bh+dA535Pa9k7i52m7AyAII=;
	b=sqNUGCHCwjzf00FtL5kcEQRgPIzyTFjIKf2F7BE9KNUbk5/TUqJas6eZ87Z/L6jak1NWTb
	Wo1+t44CYWQyHTb1o7LuIcQGivMjxi2X/lXD5FXo9vhH2aauOWu0GroyjMuyGrzzxI8Rl2
	qCQJNIux80uWKS6huYvmxMT82bfqORC/Y9+aYor5VhUKeGu6gq4EQPZQ/OXGqhX+88vARB
	odg2KM+Zw3YO1eDeugMhDIUkv0ANPzt/AECWKcjlD0/iOvIxj7ZlxjGgBaOmvq6SnFZAGV
	f8eD5hFLtXgXde4oHGbFfMjVK+ghKJhOz2UYiMwjz5LQM0ezx1+9CNmCUq3HuA==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Koichiro Den <den@valinux.co.jp>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Roy Zang <roy.zang@nxp.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Yuho Choi <dbgh9129@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 2/2] PCI: dwc: Handle return value from endpoint .pre_init callback
Date: Tue, 28 Jul 2026 03:24:25 +0200
Message-ID: <20260728012548.465139-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260728012548.465139-1-marek.vasut+renesas@mailbox.org>
References: <20260728012548.465139-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3530f36967d57e20065
X-MBO-RS-META: bmr6zbzz4m7u37imjwni6gtkry6uugwh
X-Rspamd-Queue-Id: 4h8HqQ237Dz8v9m

Add return value handling for struct dw_pcie_ep_ops .pre_init callback.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Koichiro Den <den@valinux.co.jp>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Niklas Cassel <cassel@kernel.org>
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Roy Zang <roy.zang@nxp.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Srikanth Thokala <srikanth.thokala@intel.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Yuho Choi <dbgh9129@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 7 +++++--
 drivers/pci/controller/dwc/pcie-designware.h    | 2 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 6 ++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index d78fb845582b2..b00239097d893 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1524,8 +1524,11 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	if (ret)
 		return ret;
 
-	if (ep->ops->pre_init)
-		ep->ops->pre_init(ep);
+	if (ep->ops->pre_init) {
+		ret = ep->ops->pre_init(ep);
+		if (ret)
+			return ret;
+	}
 
 	ret = pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
 			       ep->page_size);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 004b433f17135..6546dc3aa2075 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -474,7 +474,7 @@ struct dw_pcie_rp {
 };
 
 struct dw_pcie_ep_ops {
-	void	(*pre_init)(struct dw_pcie_ep *ep);
+	int	(*pre_init)(struct dw_pcie_ep *ep);
 	int	(*init)(struct dw_pcie_ep *ep);
 	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
 			     unsigned int type, u16 interrupt_num);
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 5f7211b91ee5b..fbe465a29068f 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -481,7 +481,7 @@ static void rcar_gen4_remove_dw_pcie_rp(struct rcar_gen4_pcie *rcar)
 }
 
 /* Endpoint mode */
-static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
+static int rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *dw = to_dw_pcie_from_ep(ep);
 	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
@@ -489,9 +489,11 @@ static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
 
 	ret = rcar_gen4_pcie_common_init(rcar);
 	if (ret)
-		return;
+		return ret;
 
 	writel(PCIEDMAINTSTSEN_INIT, rcar->base + PCIEDMAINTSTSEN);
+
+	return 0;
 }
 
 static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
-- 
2.53.0


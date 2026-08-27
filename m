Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F50A48C8AF
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849506; cv=none; b=P118Rloh9EKXB9SuiwI0HG7FpzrUvx6DL0wU/1yIgisg8Arj1VDdk4HuM/61gUAnywN43atIXsNEmP6BgIw4L6OTGWCkY8VlbwQ3Z2f/Rw6uHg/2h38MCavdmF9v9EIsL0CR3JYP2pSr3/M/53wxVfcOLHp293oqHT7OIW4wjss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849506; c=relaxed/simple;
	bh=Cv42epPoNORB5PcqX0k0Mx2zGd1B1jSGrLyDLj5cWzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UKFQhmHEfrEdSETV3wmUcNjED6rtwQx5xJg14CcZbfvNnZTKfTK6XAI1vkFf8Gey81gO8hvFxaAZe4uOOeKAuJ7HgLt5xPq/ObHbJim5u42q64Ks2dBnSNJxXOg+lWZiRz3IB/ff9nZuf0PMBQ58Ins7LRcerKH6MxG7VCmnSgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Jtn4qUEZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Jtn4qUEZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so22083995e9.1
        for <imx@lists.linux.dev>; Thu, 27 Aug 2026 09:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787849500; x=1788454300; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tbqtOFs9zlL8i8nLzqSqayZV4ABdonTOL9PAP1vFtvs=;
        b=Jtn4qUEZghcyA1eFmnrrdlHGt81wQwmXWS6GraXJWe1sX9bignf4Vk9pUtGdQnysJx
         Wv0hb4AWJztXvqWzRlleYL6H5Kvo33IWwbc1ROiKa/dKNrSRFUCcmZaG8mkQcntaZHZv
         yZv2H8h2IhT7vzJP9MykS7bDk72rwuwigrCQwsgY0RXEfAJnNNqurfFSzGvNpHDcJc5Y
         zQltqq+fFh1e1dEWWrrL8KdlM74xveyghHzGTdUCOAQMcKZ9ST/ejppxdCoLGihvNqJn
         QS5k5evk0iI1n8pdiUwGZWTJD0kVyTfoaElrYrJtj9RxcOlly+YYCG82K7HZ8RNuRCYN
         X3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849500; x=1788454300;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tbqtOFs9zlL8i8nLzqSqayZV4ABdonTOL9PAP1vFtvs=;
        b=UD4Zw5fEZhH24Ix50WQWgPFO5IAkbryNknu/d/cLUU0pNwemFN/FHRxvo6QAe2Tx8o
         n5SSdkSNNdETQV0vGWkBCeIvXZM4tyBV0z8PP0wWAbknXc9xUhEri1CkNphY8kOE3csy
         YSnghzdBGUR1Wg2LHhW2WkYawA4M/nsAMsUtyPt3aFij/w843xvJgzBug6XXD5wWF+Xb
         0INc2MuudjHf67ubhQF/eL0+IZBFww0szCDNpFhO2spNiXE/0kbAMgYfNkze7ycOOoiS
         E2zVPAeYUq//g5GqmpEJja3aY5sBl2yGE+dhu6rb63haSJSwXjfENCVe/vkajY6PD2XL
         GC8w==
X-Forwarded-Encrypted: i=1; AHgh+Rpl4r3VvhMty32x7EV0Q5EnVzLV8BYRNTxoOS/S4pDOD/+2U3CIteCiFMkqqCUhnRBx6js=@lists.linux.dev
X-Gm-Message-State: AFuF++mcewPcOqSfN2EBUD/d/iO/kXythoZy5lZIlX3S4j51sDxAfovM
	Val3MOgT0nksqEcsrNQwEgHj98f7nbhPuwlVdvX/d9h4uQAgiWkcaZg55JJvmjs0pA==
X-Gm-Gg: AR+sD139zsY2FJMQ4lMH+VH/tlM+g0GwnkwKxktvxOJsApT6aQLoMqFN0HGOQ8cDrMV
	eCFuRg4zFv1fyEF6NUpwOps1DyOFRuZn4iEMDGKhkBYQzFsWWAcMRvHqR0azHi7F1IQzs6y2fKJ
	I45Ukb/2k/uMOQGn+aKpAqtCeXJ1ASI45XKv6Ut4Jr3OC4sSWxzeZYthWrUc47fxHQiQvLZolOX
	H+HPeABrnfQ92+vmlcz2AqgVwgV2NpBOZ3wdR0Og+T8fsiZLZDnHZbDPYWIQiZ+f6P+Q3pUUNUi
	EwRMTl12ATiUE/xwt700X21dZiLtVFTfQjJQoF85rpvxiqJcmLMp3i5mFPoQKKao4+fPgRaAeh/
	xOkoePowVtsYFHoy7FvtpckTa0LjViTKRlmNoA4wwpaA4rYU3eOev4Gi4kQZyQMCORKHLDMMGPg
	LWZ3dp78c6CMibIOJ0I2Y9N5mouY22ydGXASLVlW3PxHlEkWiXn1NPFg2AD9ADLWMxt/F/
X-Received: by 2002:a05:600c:8581:b0:499:a760:722f with SMTP id 5b1f17b1804b1-49b91c47bf8mr3744675e9.13.1787849500201;
        Thu, 27 Aug 2026 09:51:40 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56826bsm78234015e9.4.2026.08.27.09.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:51:39 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Date: Thu, 27 Aug 2026 18:51:00 +0200
Subject: [PATCH RESEND v2] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is
 supported
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-l1-conditional-imx-v2-1-40b324aa2a94@9elements.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3161;
 i=michal.gorlas@9elements.com; h=from:subject:message-id;
 bh=Cv42epPoNORB5PcqX0k0Mx2zGd1B1jSGrLyDLj5cWzY=;
 b=owEBbQKS/ZANAwAKAWKaksyA3pPLAcsmYgBqkGsXl1XXO7CczlDW42hMAd4AcZI7L/miM5XQi
 4HNMYkWKaiJAjMEAAEKAB0WIQTgoC0bQQLz7jVH2W9impLMgN6TywUCapBrFwAKCRBimpLMgN6T
 y4SzD/wJXnY4K3bTVEqMPYGKOQB6IFLjmxS3tCQvn8h7h8t5zTdtMDxOFbhTcZmNtsMWFM2KZ3b
 hGFQ41UMlczcyAe1IoHiRfx16B6MehkVhQYZaTR9Xc4yIhY4YPDHqMWll3BcRup8lRQDdeeU0z6
 bcPDaS0n9KjobxN5WwaVucD/5Bz423OQstjwCKLJcDCiGTVKIfMZF7uD420M1SBbMJIvwLiZi/A
 j8d8OYr9+QTsNKsU6HWf86ylOYXSwl2dH1fzh5rWkfmJitWKAqq7keIyhA3kbrCyVA9fsivsWQ2
 hOlnFLaXj7zbuKnsYSP1XJ3dlO5XtQ/Wnwt1/ZybSlFY5lVslsBm6Mssdn6ho8xejaRYHnH2/i7
 bC5g08hPvdLX+E0VkiN07CNG2LIdmYK6gW7+ckVek5T+ddG3i6+Cb/YBB71y4wlqS6o0g++uKzE
 +HK4CPkHupuSyC2MapHS1fDejhDh8/ab/nETLOz+uZ7SEMXlnCoHuXeCbEuhK0pzeY7VSFVje6V
 JyHtOsXDPTxO7JTcbhWO4v6rdu6+HAlbkJ/Bl/56rJmxXQqP9g8eK+zd+tIBoqkr+rRZgA37Aa7
 O0C3NOOnOWAKdeAMraI9QgkEix0O6xybs4nEcQSkUDsa33YGklAhit7mq0u2jBNjiK7Sa3NvDZz
 NwUnFbNbJkBgepw==
X-Developer-Key: i=michal.gorlas@9elements.com; a=openpgp;
 fpr=B4EB74EA41969D1140A4D1791596726986433F8C

Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
states for devicetree platforms"), ASPM states are force enabled
on all devicetree platforms. This causes PCI devices on some i.MX SoCs
(for e.g. i.MX 8M Plus Kontron SMARC eval carrier) to enter L1 even
though CLKREQ# is not supported (and consequently supports-clkreq is
not set in pcie controller node of their DT), which causes the device to
never wake up from L1.

Hence, disable L1 capability in the LNKCAP register if supports-clkreq
is not set in the DT explicitly. For devices that set
IMX_PCIE_FLAG_BROKEN_SUSPEND, disable L1 on resume as well, as these
skip imx_pcie_host_init().

Note, the logic here is very similar to 613f3255a35a, only difference
is that leaving L0s enabled does not cause issues (at least
I never encountered them myself when testing on the device) as its
not dependent on CLKREQ# being physically there.
Since there is already a way of specifying its presence in the DT,
the driver should be aware and disable L1.

Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
---
Changes in v2:
- disable L1 unconditionally on resume for platforms advertising
IMX_PCIE_FLAG_BROKEN_SUSPEND (Sashiko)
- typos in the commit message
- Link to v1: https://patch.msgid.link/20260719-l1-conditional-imx-v1-1-a55a57915c68@9elements.com
---
 drivers/pci/controller/dwc/pci-imx6.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 98e1db751132..1fdcbcd2422e 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1318,6 +1318,22 @@ static void imx_pcie_assert_perst(struct imx_pcie *imx_pcie, bool assert)
 	}
 }
 
+static void imx_pcie_disable_l1(struct dw_pcie *pci)
+{
+	u32 val;
+	u8 offset;
+
+	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
+	val &= ~PCI_EXP_LNKCAP_ASPM_L1;
+	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1442,6 +1458,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 
 	imx_setup_phy_mpll(imx_pcie);
 
+	if (!imx_pcie->supports_clkreq)
+		imx_pcie_disable_l1(pci);
+
 	return 0;
 
 err_phy_off:
@@ -1748,6 +1767,7 @@ static int imx_pcie_resume_noirq(struct device *dev)
 			return ret;
 		imx_pcie_deassert_core_reset(imx_pcie);
 		imx_pcie_assert_perst(imx_pcie, false);
+		imx_pcie_disable_l1(imx_pcie->pci);
 
 		/*
 		 * Using PCIE_TEST_PD seems to disable MSI and powers down the

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260713-l1-conditional-imx-c2bfd20ae085

Best regards,
-- 
Michal Gorlas <michal.gorlas@9elements.com>


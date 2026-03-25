Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D9E34EEF1
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431127; cv=none; b=qoxADwnxqmLLQXgzzTZEczCUKuHGoPHIkLLxTdOFF0qsN+QZ4JUiWUz+CT2mwPS0MVuhRjDnCjwkthdUVeWALddmRZEVy+7mux7tkOZo49gJOBsO+38bCFtFHTlSYuwAXbtuRFfEtIYPlGxd64bNgtOblfdMV/iuGlMrSDEN6oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431127; c=relaxed/simple;
	bh=UV41qUpbXMbPJ8oKt5RHwR1kOG1v2llCMlZ+SAex9to=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nMjpbQ03VV/5CIr9j4SNca1Mg0G96z1wnp/HET8iHZR5O3x6YNEaut1EaxmxsvLO85jjCOnOWcDpnIAeI3sl7Vcl6tPtcJtt2ntRAvqB6JKoL4oKAZD4cHA5KAoBe51brl21tPtabeE6OCHqpyBBkx92TzReBGvIhBVOm3Q8Dxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gzad60y9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gzad60y9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so49231875e9.2
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 02:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774431124; x=1775035924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIsbSfS605Q4eTkbTgnxZvgMorhnFDaqZxn3f2tTBFI=;
        b=Gzad60y92U4Oj82nkTUk5Y+zgbAgOgXMDZ+MwbKqPG+mIB9yhCszEZ/3cl3Z+FJsNS
         12Wg5x0Q7gg1yXA5mn5BKT/3f+SgcCt3eT1IaNVJWMjXvkSAaFTIvSDJ/D4Nk+FeqLjF
         xnFLHTNjs+2w1x9g7gMOk90C/iyb+7jsqN4dmyoWRqRMrheWpEbbP0rOdXPir8Mje+9L
         6Cgnt/6mr/efiImCvWC8R8A+/oCUqx00j5UAmrhvFGdzwJvkvvBmMnhDoXxz2dqYZ1id
         NjrrBZloL7S9mydznh1Gmioujg/K/9iCdN9jOfbLQagJqWIIbB3XZng1/dhmIq0nhnyA
         IwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431124; x=1775035924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIsbSfS605Q4eTkbTgnxZvgMorhnFDaqZxn3f2tTBFI=;
        b=SMnofs25bfD2XRUwCm8R43IWvtu2dCPykndf6VgkHS96ZVkdxCQ8uwPZ2RdYauG1uU
         CBOpV7cWHyM8XzrGXCDmWzO137iAdMoJtsoozqTKEStylW7ypspiNEE6MYK7i5HsW0RI
         f2aGpvS1W3P3B/F8r71FgMvdG6KluJHoh33U99NC0qPgoJNNFZaOuh99rgdDS1IDjJFB
         /PZU7O+fS7eD5yMDJ0C3fSHL20r3S5x+KFJZa8zDA1KVyUfSyMPvgC/7a4W8MmyVrTUN
         oYvN5KOxQNEOj38TFqLyiW1FbtnyvaHorKqkHqJwb6cb5IpJcR3CRBH5Mc/A9on2epao
         dmNA==
X-Forwarded-Encrypted: i=1; AJvYcCUuzHyuy6OLTddzzlS+WP4V5qsw298MLNzkWo9NFceiGM8PsZ7OVg6hf+xS2HIThd3dpjo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+Ts/cae49y5geGSLeBSPlNpAPeLXZkmy+qnIzbf6QEUCkX7B3
	umfUGd+11KWHRO+rN9Qgs7lyvTIe6XD2E2NrsX1TIlEFSTrOuqVeRK+y
X-Gm-Gg: ATEYQzw9cDCPD0TUiRuXcHsNCXuPb2/jESBa7TFE6Xp063foLHtr+sktrzE2IYYpy4W
	1k7Aj6AQvpE5mbtSRO7g1Sa4Lpm1xEDgGYleNUu02eRf2MZDQZ/1eXZ8SM5ckWMbX2DVkze/Qew
	e+6/J8eYWvgxGAftI3LiVnSPFoSYiydZ0UI6tN09NCL20liE6nA42/EUgMUdfh5aqvjoGdypFqS
	QQUezuBlccaMyUUZU8FM7xX6J2cB8zMGOl9r3t0Syko7VoI+8IakCEFfQ4jJ4QDTSzt2XBOttxH
	6QaP5oyaOKWkqFh3Z5Gul70O8wOj4Fik/TIsKzHfWSpP9gzfnJCGutXU9OupgrB5Ol7tbJOK7Pv
	9hPX2fpMiJLI8qevNBG/on2AFDQIGnvtXTJ9S1XKYN3EvnIuHnu19vfpYlg10m/Vm4FvX1mKMz9
	Ioumx+Lxmq+MGi1OSkSgTitJaoedVREkPN43wt+tbVYg556UIC8kzGQ1YPGLeFTa/q9JqXZgNdq
	vA1MtoVCs6oGih9L/OIcLlJSAmd/y4SvSfm8VL06AEFNlJ2zZcKAtV502IBRdRSo4RT52J/61Lc
	CSK2f9QxJuCDtH2M9bLG
X-Received: by 2002:a05:600c:8b88:b0:487:1c2:6a4c with SMTP id 5b1f17b1804b1-48715fbf6a6mr44191015e9.4.1774431123985;
        Wed, 25 Mar 2026 02:32:03 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711764625sm120724195e9.14.2026.03.25.02.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:32:03 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] PCI: imx6: Fix reference clock source selection
Date: Wed, 25 Mar 2026 10:31:16 +0100
Message-ID: <20260325093118.684142-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Franz Schnyder <franz.schnyder@toradex.com>

In the PCIe PHY init for the iMX95, the reference clock source selection
uses a conditional instead of always passing the mask. This currently
breaks functionality if the internal refclk is used.

Pass always IMX95_PCIE_REF_USE_PAD as the mask and clear the bit if
external refclk is not used.

Fixes: d8574ce57d76 ("PCI: imx6: Add external reference clock input mode support")
Cc: stable@vger.kernel.org
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 81a7093494c8..e0580d6efa57 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -268,8 +268,8 @@ static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
 			IMX95_PCIE_PHY_CR_PARA_SEL);
 
 	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_PHY_GEN_CTRL,
-			   ext ? IMX95_PCIE_REF_USE_PAD : 0,
-			   IMX95_PCIE_REF_USE_PAD);
+			   IMX95_PCIE_REF_USE_PAD,
+			   ext ? IMX95_PCIE_REF_USE_PAD : 0);
 	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_0,
 			   IMX95_PCIE_REF_CLKEN,
 			   ext ? 0 : IMX95_PCIE_REF_CLKEN);
-- 
2.43.0


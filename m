Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72273266B43
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479270; cv=none; b=PWA3r1Hq6KqWSciSkBB+2KBq8VZq9mx4DsVg3pcqDADqXsSuJr1CvuXqa5+VLIDL+FayoRzj2se8PfYW1hNPw+/foAF5mSrLnQIU9lj/bZeN8fc8q60HqRNgfX/JyFv3Vmro7kOyJ81tAxOsulVCCOxE5JCLi3I0Yj1IWYFYnM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479270; c=relaxed/simple;
	bh=VdfQ7Yorn3irUgZ/Yn7Cd4nOTpmLJ4Zy/sLCEEak1ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddY+1TkND7Z9Z5PLixnjyIZCBy2owo/xJjF4IiRvlrOMQCVyS8iqvh2ug3bDaICsRslJ9N+MFMwyoiKccmyv2Xu76Bc/CUx/rpokxINaDe21/FOaHgNj+t1chyyZows/hnYpBx1hFRiQjQyZiIptryOTFQ1lHnNXr7qg7SGBlMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=EaJQvy9I; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=WPLx5pm7 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="EaJQvy9I";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WPLx5pm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740479268; x=1772015268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lPSg6DYIbo5is+m87av+3FLHT15AQqV2IPDzqZE96f0=;
  b=EaJQvy9InBtuvxfJ398GcoWyhC+jMUWS7dyl01ji8cMw1M9Y7jpjZaCP
   Juj1eU3FNL3Lm8qg48tuMssewghrSwEa0BSNtfZ8T7o5rE9m5vYMV9PA0
   6nui+cNJMAI05CUF4leFxSKfSx5vg85tE4CXHAwUvHrbrMYprr4GbDSQg
   SSFgQ4TlVLKHa05S1XtLQt5GaDz5g2Tj54DqSpW1Od+DfEGO52HvUfsrx
   B0eCfV6rYItC1LXyVvxu1cHpHfu6XuLBZACv8BqlXHz8W4IS5g7PyfZzo
   eNfOPl21RIfC6dKPCpt9HhI+fdFMjOzn/1VQykffW4gzXGJe/yz345FLB
   A==;
X-CSE-ConnectionGUID: v326R6KsSHG/7qapPLMt3A==
X-CSE-MsgGUID: rMkZVVgATE67lMEW6J3zYA==
X-IronPort-AV: E=Sophos;i="6.13,314,1732575600"; 
   d="scan'208";a="42067831"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Feb 2025 11:27:47 +0100
X-CheckPoint: {67BD9B23-31-C21CC984-D1047F1F}
X-MAIL-CPID: E8C0C7D14AB069B46AB0984605807505_5
X-Control-Analysis: str=0001.0A00211A.67BD9B22.00E2,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B52BA167DD7;
	Tue, 25 Feb 2025 11:27:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740479263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPSg6DYIbo5is+m87av+3FLHT15AQqV2IPDzqZE96f0=;
	b=WPLx5pm7LwtPQ4R8fJGx/N9MFGaUlBKRVwYNsPk5yYS/x+EejAoMBp3u5jpsGfO4x3xqXb
	8sWY1NivLT/Uru+qtFJlCtHrVyoNARx4GI3Xh0DDBtH26ux69bSUsGoKQ3fsgkMLhD54PF
	DalpEASCCJF6L3bsfSaqZ/+gFeBjzjgBja/QyW0S6+Uje8nyvYcf7kJae7s/dvzGQ2E4r2
	15hr79s4wqxQNW+Xus04+9HNdx2ff7c8Vf2Mnr46PdrizdPtNBnepRKpjfqtGWccEs8svl
	kj/MGdeyhwl5BNziX4ZlZ8MV9j+ExX2xxX0l3JyLZfuZOMMFLwbIkhsuXR7tbw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/3] dt-bindings: PCI: fsl,imx6q-pcie: Add optional DMA interrupt
Date: Tue, 25 Feb 2025 11:27:21 +0100
Message-ID: <20250225102726.654070-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
References: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

i.MX8QM and i.MX8QXP/DXP have an additional interrupt for DMA.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 4c76cd3f98a9c..ca5f2970f217c 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -47,12 +47,16 @@ properties:
     maxItems: 5
 
   interrupts:
+    minItems: 1
     items:
       - description: builtin MSI controller.
+      - description: builtin DMA controller.
 
   interrupt-names:
+    minItems: 1
     items:
       - const: msi
+      - const: dma
 
   reset-gpio:
     description: Should specify the GPIO for controlling the PCI bus device
-- 
2.43.0


Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E382D979C
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763031005; cv=pass; b=JLCiBXF9py8/FRvtLZWGaBhfTx0B8gKDlf4YYbqwzL/I3vHE25FrpKZrkun2HW5hUep4H7QBbSrAtZ53VcKaqql1C46FDuA/qwDEiEqpgu5t6Gy1L6A49/SI2GvMvWiZkVy8YIvbg0Q235hZfv+tgueBME0crMmfE/sTpXPMt/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763031005; c=relaxed/simple;
	bh=mXl6UpWBiKHfYNnaiMBr2mKsHAe4lVsCCB+hpvDbOyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQLPC/zi3F7PR9JdF6hNFsFKkBysw7eJLeAZhfkqmlU390sNZnxKC+6ku/D3vbpUr9zQTKaAHrgEXcZM+TbA7J6828xyu0eJXxW0Gv8LulAIL2+HWE47FQsqKenbZyAvQqdnJbeTxWfMePOSQyJApkUO3ILdY21+4DW+QNiLcWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ChSz+Klm; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ChSz+Klm"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=e0hk/9oKjZpX3yolBpPlN0u54kAbbIh38AdbzQ0+tRw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763030957;
 b=D6LqlaA8QmHdw87nRGsQovPcH91BvenqKvclftstXEzxmds4v2t2ACXyGR3VwGK3OyhDGTnn
 5RSTuLqp8GhwEftoWdBAAj7lb07FWooXm5Kz5zmrnF9BF87UHciL0/zKunFFGlj3iyjNo1LvkqO
 JyiGAucoFIo4eXtZou8QK5CcLdmMF1igLencHYE976XtBiPLR9EXSR/kghb1gGuiogJxnswikh2
 QXiykVDx+2p/skPz4oeuLXWFnS7zHmnJzMwcSVHxbE3waoAnn3fSmpEUnn8ilPvAobNjcA+Icsa
 Tvey7lGCusi7ebejI/453U6OlO554tUnhCmbrejcH/aEA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763030957;
 b=KIVhBblB5YwBMhVqfQq6Gej0vO9Om1Nxy2iExrtt0UzCF7i5lnxw9E+XE0X30mWzb94VANrh
 OkuQBty302VrmFUZmkDXkwmfmH8aIe9AXX/5NZi+numbCkfRMx8EyU3qVvLpN/aRiAOADeLQJcu
 Am8F0qDVqqvXGFbvxEBvHM3Z0EFdGE53ZgymTuct48/YLQB9a54RarI9sWMG5RhR+R/+8ba92E1
 Y5OyV+e/BbKPlLfkqVmzqIeAq/QKQTiDZD6SbHJIfSsR53JSyBuFZMBQyZPxDXClwnIlNdb5u8L
 ZMtthuWWGPUM9QZ3BUX2eqjm9+9GTc1jTxX0NnFlUrFOw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Thu, 13 Nov 2025 11:49:17 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7DEC75A0FB5;
	Thu, 13 Nov 2025 11:49:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: mba8xx: Add MicIn routing
Date: Thu, 13 Nov 2025 11:48:55 +0100
Message-ID: <20251113104859.1354420-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113104859.1354420-1-alexander.stein@ew.tq-group.com>
References: <20251113104859.1354420-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4d6cTG256Zz4MJ2w
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:38de7fd8ba10c26054d70621dd57a3ee
X-cloud-security:scantime:2.335
DKIM-Signature: a=rsa-sha256;
 bh=e0hk/9oKjZpX3yolBpPlN0u54kAbbIh38AdbzQ0+tRw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763030957; v=1;
 b=ChSz+KlmFD9vrEQ/KSBmEkd+MF3vQvUVYtiOKHRoFmYMBOTHAw4RTEnLhYvfqiX+GCETrWhJ
 8RMWJdKaRuKieuCEWboP3faHT/mUib63OwmuUbTQxS50hZrbTnDQlLL0p4E8NkCwinbjOlXf5cm
 H4PSOkF4X1A5jMCVAyCEmZzdbeJCzm5Vy70s1wCCjTUJEvwzCVZn9Xu7vz+WGNOxpKUNBkmH83x
 xWivmJRdF6qC+1PiMz6mNAmkecabP3b2AWaucore3v/2rnx1bN5K6E2VQzgrzXyhrt+/FXUL716
 gvXsjp4VKfgKYlwatsawwoZ8kEU375oiloMH8Tqb0Ylzg==

MicIn is connected to IN3_L. Add routing including the Mic Bias.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
index c4b5663949ade..f534dab44e8ed 100644
--- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
@@ -128,6 +128,13 @@ sound {
 		model = "tqm-tlv320aic32";
 		audio-codec = <&tlv320aic3x04>;
 		ssi-controller = <&sai1>;
+		audio-routing =
+			"IN3_L", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"IN1_L", "Line In Jack",
+			"IN1_R", "Line In Jack",
+			"Line Out Jack", "LOL",
+			"Line Out Jack", "LOR";
 	};
 };
 
-- 
2.43.0


Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4002DFA2F
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030979; cv=pass; b=C7Bm9NwzklIvRv5ikw2UANntu+JeI7pKW0ED/MlRG2whDSZZKvHawvVvpfchTuYKFrwUDO+Q9acVG0vgibLs5hH4fW79QRPoA6VbgJgdaunPyK3Wrf0FWeKxs7eFkDEFzoX98nBjwrrVt+R7+kNg66tMvnLIzmGbZIg+0GR3m2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030979; c=relaxed/simple;
	bh=J6BsqTCmOrFFiAQAx5pEd4B6YJ3Nlg5q4umEShFXHAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B08JDtF7OhSn9owVJoJMM/yQtfRjQRz+qts2RGKp9IwHuscSJGW25qofQWe+zpAWFY5rPMjrPIVHfF4Nu8MIi+R90aSH5A4EFgEsfKeNiS8e1UxKKdNZZSjavaUcYc0aGoxZdmmClamWC7H3Am6ai04IieNoLfFfr4agft0qSf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oqqtYQOs; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oqqtYQOs"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=HwZpnlL5PSUjD1ekyFYHL+mEFm8pXGu4Iwrph47h1b8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763030957;
 b=s1bXrKfFHUYP1qf3sKtfjjxdy+ZzRnA0MtnvyBjNiRQjZLLm84J1OQEzIPvCulMjrn3ReTDf
 /bSHJ8CriA5tTsS24eUTTQ5tSQDrquzRnfO8wwNmW+/8f66VVcokesDZvqAqTddIsg/Fhr9oB+6
 qiTj2aNdytEkGolxQLMWsyNgySclOE0ju0EC3wZtfv9V/bXT1UXTnWp/XSBXUN9eW8WLkJPmUZ0
 ZQ7i63R1jIwgiFFGrBZlj7gIT/59W627qNwQTfMds+FKKBkyAikOMHAH04E1KaHTTUvBrH3CTY/
 qfiPrXe13MSX6Ii5y1QCTKABBL5fTQ+iISULuh1SpynrQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763030957;
 b=D2xae/EYtexEFgjPBm0hOOfvlXpcTf6cwLyZSlIjoH5b0sHnOGl2SfU0d2zILKLk3ahcqwy6
 0i280PKbXh3bqO84hbBs5NDgqBCg1VBgacVRflEzFXZ39VnO+Dtn08CnXGrGr49V1oVvSp2OM7K
 HJt3Dk+dUSwKsHEzyXco7uktlszJbi+XV7CUJaTPSPR9JDsj4v5grXUQNNrsNJhjAs4dbtywDCc
 ehzFVWKif/OAiq4es98yvMT4fHEIsaQqP0kMvMV628zbH9Fr+3FpmLIHeiunrKS6lJROUwRFPXE
 AxfFrIDd+pR9NEMr3vZIGPAMN1rETf68wqqSQLVWRa4Bg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Thu, 13 Nov 2025 11:49:17 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C3B245A063D;
	Thu, 13 Nov 2025 11:49:06 +0100 (CET)
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
Subject: [PATCH 3/3] arm64: dts: mb-smarc-2: Add MicIn routing
Date: Thu, 13 Nov 2025 11:48:56 +0100
Message-ID: <20251113104859.1354420-3-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4d6cTH3cvgz1kPGJ0
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ed014fac5779153bf3b07ca053158c71
X-cloud-security:scantime:1.897
DKIM-Signature: a=rsa-sha256;
 bh=HwZpnlL5PSUjD1ekyFYHL+mEFm8pXGu4Iwrph47h1b8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763030957; v=1;
 b=oqqtYQOsYTuLqPteHH7W6IW0qrNs05dIAyatZVg5GRZqCpHitxTpD4rUDxcLCrfOHaJ7575h
 3gm7cm/DEcLRldErRKwkeekufl18D9bKRQIhhq5GPc0b4cjwEGXD4QZd9tQQpvAS56K7IuYOd3y
 vsYbLFz9hQFBylCaBYxNppstQ3RdlTIAPm/wopQR2+cU+Y7gqbg7uFMS3Xb/mZ0sliZi5nMa7qG
 rPIjwswIZ/+XgQBdhWidDqOmCKJB9QNCiHRvav+zlR7PrIiKUOndiD9Abaa3krEE7flCQbW4Eib
 hWbVtDfj94ccjTx47CWXnCDaKhkUbqCO8nuzYclZaYhcQ==

MicIn is connected to IN3_L. Add routing including the Mic Bias.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
index 478cc8ede05ef..3d20e3bf32ce7 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
@@ -98,6 +98,13 @@ sound {
 		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai1>;
 		audio-codec = <&tlv320aic3x04>;
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


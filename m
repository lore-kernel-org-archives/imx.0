Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF630183CCB
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473295; cv=none; b=cgSDEiUsDMVoZkbaHmr8RnwiqRQnD/cnv2JzlZ2TI0bM3ONjAphlDfxdw0pzv/eTJm1elibUZV5130bkncgY2lFDAYari/hT1/YHrJAGM9hWILp+V4j4jhefpNc/Oo973EvIURaY8P8fdTBKW0nXQdwcIuTWFx5TkFgFq63d9C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473295; c=relaxed/simple;
	bh=el+2+VhKC5jRMs8MZz1/cuPsTUlb59NhVTipPykuCUM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eWJILG8oDTMR7dMvfzYjaHLNGI7mqcCGzqvmPc/XHyciT6DOGkqtyOUOVkHJ4De7RsXk9KncdMgyf2PinRf3snh6ApawVAmnimjfGgkWKUBZWxwCpc6wv8Ee6VUr6lL4A2hkmT0Gmnvy+wlTqD1BKCPx21HOXrWemAZxkXp+U/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=kPiezFF9; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=LMhkEMaj reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="kPiezFF9";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LMhkEMaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723473293; x=1755009293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J83UG3eV4YQ3ivPf6c3chMTQMdfxEsFuu/CCNABYO94=;
  b=kPiezFF9mrRKYOGOsw8iy8YnMln2RizAc8AgYBWXtnEMVNlzcNexSlRb
   CT45sDgpHqgK5VMSJmcEYOyuHBLGlgNj2s+9TI8BFHx0u7hXlWK9ScQ8Z
   B6UD2l+yGmDwvlNFJB6K2oGYlxSqL9Tx+KNt4mH/ZkPeItQLGF3ZH4vkB
   BcCO0Qvqn7fC/scgkW219gc5xmke5HjPaOLklwLfM0jx5KDC+yotriMrz
   wGT3TPv2diR8u1pNktEMlAX5YThJpOJFiIyUkduIk7eRUcsh4zBRtvgna
   dkLyaq/ic3k48QrphYhzGzlCOrsH8Ggb2rrxXu1OmLwW7B31BWUgSgUh/
   w==;
X-CSE-ConnectionGUID: Vv9imb4LS/C2zYEGUpdTKw==
X-CSE-MsgGUID: qOLalxyUQR2c3vbmX84oSw==
X-IronPort-AV: E=Sophos;i="6.09,283,1716242400"; 
   d="scan'208";a="38365808"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Aug 2024 16:34:50 +0200
X-CheckPoint: {66BA1D8A-10-78509F09-E532FC2E}
X-MAIL-CPID: 89D413C7B7F41B6DD5E8ED534025D977_1
X-Control-Analysis: str=0001.0A782F1F.66BA1D8B.0008,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60ECC16476F;
	Mon, 12 Aug 2024 16:34:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723473286; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=J83UG3eV4YQ3ivPf6c3chMTQMdfxEsFuu/CCNABYO94=;
	b=LMhkEMaj9rd64ot23Wqh8LKSR1s5gMnJRsOoAbUnJg+ofc+b47uWYKH1Kq7V/q2aY/qRlN
	63V8vhEfQPQpoP+Yy16ncDVVw37LjhC74otR93h8iXwQl3jkUP1wO0X/+Gdv019lKbNdqA
	TmL92fLXAYTlhZEpi2S8L0NC+BolmiNIyNBylz6iq+SLKWN5TZEyvmScYixVlBYP/doEAW
	GLD53HnWaLCWJS4RWB28DHvRqSZrGeOzk2eN5d36CihTgN0DgLYGrR5nByEgWjXV/fnjJt
	yyyo/8v5JRuXs7Po+VyLkmDFx0ljiHaBsaZris+W5yqWkDTjyjsQzpuGyFbZzQ==
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH 2/5] arm: dts: imx6qdl-tqma6: improve compatible for LM75 temp sensor
Date: Mon, 12 Aug 2024 16:34:28 +0200
Message-Id: <20240812143431.98323-3-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812143431.98323-1-Markus.Niebel@ew.tq-group.com>
References: <20240812143431.98323-1-Markus.Niebel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Use national,lm75a to specify exact variant used. This should cause
no functional changes.

While at it change node name to 'temperature-sensor@48' to
describe the function of the IC.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
index 68525f0205d3..828996382f24 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
@@ -27,8 +27,8 @@ pmic: pmic@8 {
 		reg = <0x08>;
 	};
 
-	sensor@48 {
-		compatible = "national,lm75";
+	temperature-sensor@48 {
+		compatible = "national,lm75a";
 		reg = <0x48>;
 		vs-supply = <&reg_3p3v>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
index 53e78f1aed38..1d0966b8d99e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
@@ -20,8 +20,8 @@ pmic: pmic@8 {
 		reg = <0x08>;
 	};
 
-	sensor@48 {
-		compatible = "national,lm75";
+	temperature-sensor@48 {
+		compatible = "national,lm75a";
 		reg = <0x48>;
 		vs-supply = <&reg_3p3v>;
 	};
-- 
2.34.1


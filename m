Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1973D176AAF
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847623; cv=none; b=Qga/WJhkms9uKsrG07nGqZ/UD5KniF7wQrprk/f1XnYbAY39W0RbysVFmU4fRaq57+HLGObD4D1dw1RD6DUbECG8RpnhGxy5qjdffsHBpSgyVwvXxQ+k4dqTTj22NJKz+tIeI87knoK8nKKb154MgXoAweMQ3wx6ZpvcBAdugk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847623; c=relaxed/simple;
	bh=rmjkhQe7FSIu4Q8m6eFQYCCBT33Ix4W669r7TXSn2cU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FfKUezivoH2ub9iH5HYwrTnvf7H7oH4yvEiHT9QeA8/Ay5Rn7K9Y4tn4AwqcvytNvqK5kIeoZx7ZD+1E+ABIQnhJ+raMDFIhRTsmWNMugmb/r/OI5Av4z//XSuBfXCUKEYRuJ7SretHFmQCzGZ/mtYhBjZROOPGCMlpEo6lvB5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=AeTTZgYU; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=I/o+qxsJ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="AeTTZgYU";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="I/o+qxsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1724847622; x=1756383622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RMc4aE+/eUmW0Zy745JTVSk1WG91Y7repyjb7gb/rqk=;
  b=AeTTZgYU3LZGFBT7obeS+/50QdESbN+hgChrEdgQ9RcS5DWEXnLJbAgl
   1ZwwLsGHOfHbi1dEt8fFXgzojlzNptnZoBvvopI9aA+ipE7egLTPWyzyG
   LalVjGMd3PFTTaWOhBAlRwP27JmIdY90czysQ4LC5WvBO/Zr9r2fG6B57
   k+FSN4IBRb9HH2hYAlyTOLd4eQ6JkpcsqTimudSSJYdc3ObVyE1Bnzbmt
   w3sccIPNhe6YDBdHCc0YJPipRPdUo4cJb8c3CVhr8RCQxkl8ddRAVfyGw
   viJ+QvGbNM75yA/duWaoPogNH+2K3NdmcP4QQjK37RMiihegWUtjFBNF0
   Q==;
X-CSE-ConnectionGUID: SU5BgnG3Q7e50N4jc/d9ww==
X-CSE-MsgGUID: T5IsBVwlThCj/FzQBVdELA==
X-IronPort-AV: E=Sophos;i="6.10,182,1719871200"; 
   d="scan'208";a="38635572"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Aug 2024 14:20:20 +0200
X-CheckPoint: {66CF1603-4-C661815F-E221238E}
X-MAIL-CPID: 2C3619520FD6ECEC3C510975086B3F2A_1
X-Control-Analysis: str=0001.0A782F28.66CF1603.0081,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EA471613C5;
	Wed, 28 Aug 2024 14:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1724847614; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=RMc4aE+/eUmW0Zy745JTVSk1WG91Y7repyjb7gb/rqk=;
	b=I/o+qxsJEqdH0KhZ+54i4KqckvshmQ5F2pETxPTPeOE5irzUx4rOm1/VCaC3hvFDTTzxvQ
	H6zQa72+UnEYowVN2HXqV0Ihgfryq1nvNBsD1fS0Mtsi0c3oO4+6WLYtuHFncJptT1+tUO
	wPH708AiLZ8+utOm4Sl/Isk5Z1ecyNBfqkneq48EbL8MJBd+H6IbHs4I4na+hsp6lzsQLG
	9OY0XK7vu2owGZHClSuAdjFPxMKsYonBu52nbwv+WpaEwmfiYcyzOeAAfvgenFSTMPCi2X
	BFQS93XlTG2H8ldwJP9dM+/YXO9XliO4fimJWnt2mhvUNeLCr1FyWxLcHv5LXg==
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH 2/4] ARM: dts: imx6qdl-tqma6: improve compatible for LM75 temp sensor
Date: Wed, 28 Aug 2024 14:19:57 +0200
Message-Id: <20240828121959.1268463-3-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828121959.1268463-1-Markus.Niebel@ew.tq-group.com>
References: <20240828121959.1268463-1-Markus.Niebel@ew.tq-group.com>
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
index 68525f0205d3a..828996382f246 100644
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
index 53e78f1aed385..1d0966b8d99e2 100644
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


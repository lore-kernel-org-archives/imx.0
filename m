Received: from mx-relay95-hz2.antispameurope.com (mx-relay95-hz2.antispameurope.com [94.100.136.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE68D39BEC9
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891926; cv=pass; b=lKvAaI5BPueVqW/uAWgYzWfyQQ3+n+QHO47+4x2P2qdLcOza7pnDCWLv/I80khZ1s3MmQ1hjLiAWAWO8Ec8JDOTBBIMvMcJ4x424XXAnyLMKVAXwGgqIHoNDy6Q9CFLB7qrX823iVPLn6m3sIy937+MjgrGwigo2kVL9BoOA8ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891926; c=relaxed/simple;
	bh=2kGYXJE/iVahj8BFqpe6AykUip8ftdYsjkq/kDCnExE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OyxyC/vUGek8JZvrAUG8ZxwxYEcqNadW46tom81XbXSdaZ4XmfbHakcB1+8kuvF0XH49Mg1WTTk2S6J1iwp8YttzSgd/ldsBYho11bzpkVWYLMj5dEfCUWXDaAq4QJisGpHNkEnzPg57W3LFmGlr8fmvzGe80BD4TZ3uPAm2JJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=j1YN4dhN; arc=pass smtp.client-ip=94.100.136.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="j1YN4dhN"
ARC-Authentication-Results: i=1; mx-gate95-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=yh5ZsOcuDpa4wWwoqzqt35sd6N66Msu9e9l9XpN6lLM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765891880;
 b=D9fg7yg8mfb3qBkl+AvZ9h3rZQlXSkVH9jif4AeHBky+k031zSR1EwBey8asRuQfuHHU93Ck
 mU4NZwdEdrEG4wO0+1Birfh0mAKlxG9Nprv8E3cKlCD9N3sobo0UN6Kkni8aYvIZWWxon5blkEy
 JX6PxSdXVQXCfJqS/0N7cOM2phv8WzDirsmdyEnNYCE+YMyfb0KLjGcGAJm2X2hhL3leIZaAD9m
 +3aKKVm7UPTL0mzRTK7js1DwRNc1TXj2N+3Qx00f70GOiZJXKUs4S6DEr5yTiel4ZL9tIXEnT3e
 S704lTzULMiNWBAO8U9DC6KeOELud4vXX1i8nbYV3OzEQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765891880;
 b=ZbHfGgsrRBpnSFlGsJjK+My+f5ruGI/1l8hDw4LzUXD16y93qep6U9yuasuxqTeDFLB74pnI
 G+BQBVIZ0WgpLIacYzzKyflaPD61HkPiy0JITFA/w9npfT/29FVVvqpjdlMPER4koVWgYdoA/7y
 inxJIJjDlL1Pe8Qicy/4UdsfuIlIs7DEYia6IDuGrj/n1Z4lqBite2NoTmQ1Csioe+31SSwuk/o
 KFAO9dUquSDNjl/PHDSZFsRt9A1FEttukgt3FdHgYzyL8As7uFdubujBjxtF2kYyPcy+YN9yv+r
 btc6lkyfYnm9eO6R215jrSHbciXUgsek5ktZ6VgplYldg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay95-hz2.antispameurope.com;
 Tue, 16 Dec 2025 14:31:20 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 2E46A5A089D;
	Tue, 16 Dec 2025 14:31:12 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/4] arm64: dts: imx8mm-tqma8mqml: remove virtual 3.3V regulator
Date: Tue, 16 Dec 2025 14:31:04 +0100
Message-ID: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay95-hz2.antispameurope.com with 4dVyW50clrz2F9KH
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:504100b48af9d3fc233a2e6c6ae8df85
X-cloud-security:scantime:1.536
DKIM-Signature: a=rsa-sha256;
 bh=yh5ZsOcuDpa4wWwoqzqt35sd6N66Msu9e9l9XpN6lLM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765891880; v=1;
 b=j1YN4dhNEadYH7w+SpaPgQtRv1xH5wurkiCTr7lUzzaEr7PxuT1nZOcAXWILwwXUWi8+z2ht
 SwRYI9IrspMUGOSzkNzxoQnzsKyl2Kt+cP312oixXVgWSyehCaGHad2RDMHXvLc7CYjk6TLcoFT
 vxdQvzaErPqd5/rkrF0p1gFgsPsLwAUOj4pq5xseMlduYOiMQnfl726+w2iIhUuJuJQLMje57T1
 2abDLvC81G7LTY+5bJgMLZER2gingWO9/D83Nzg+c0H7crW/knO/+i95Q85S7uE7lFVzbbvDRuy
 xBPk/3P1yAIDt2Agf+UcYDk0j2H44Fnmn1VgCOKxtP0zg==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

BUCK4 rail supplies the 3.3V rail. Use the actual regulator
instead of a virtual fixed regulator.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index b82e9790ea205..16ed8ce5b5c49 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -24,14 +24,6 @@ reg_vcc1v8: regulator-vcc1v8 {
 		regulator-max-microvolt = <1800000>;
 	};
 
-	/* identical to buck4_reg, but should never change */
-	reg_vcc3v3: regulator-vcc3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "TQMA8MXML_VCC3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -223,14 +215,14 @@ eeprom1: eeprom@53 {
 		read-only;
 		reg = <0x53>;
 		pagesize = <16>;
-		vcc-supply = <&reg_vcc3v3>;
+		vcc-supply = <&buck4_reg>;
 	};
 
 	eeprom0: eeprom@57 {
 		compatible = "atmel,24c64";
 		reg = <0x57>;
 		pagesize = <32>;
-		vcc-supply = <&reg_vcc3v3>;
+		vcc-supply = <&buck4_reg>;
 	};
 };
 
@@ -253,7 +245,7 @@ &usdhc3 {
 	non-removable;
 	no-sd;
 	no-sdio;
-	vmmc-supply = <&reg_vcc3v3>;
+	vmmc-supply = <&buck4_reg>;
 	vqmmc-supply = <&reg_vcc1v8>;
 	status = "okay";
 };
-- 
2.43.0


Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD7F30E82C
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892417; cv=pass; b=eMPCdxtsoqbi0WSv6lDWSto65iDXq9EIOPBXD0Sbar9vBo05/8CCae/nDkyYmhcchxdp7Ee1L7YE9kfd3RBSjupVGvJ60NaLUnf/eMF11+Qx1tZABgrHKoiuPTvfuy+7+8V27BHuK+qzKBqvxoivrD6kDnqvVHR0NXPy1pfehnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892417; c=relaxed/simple;
	bh=N8TpxZwTyWRYknKFIaRqD5yc42lOcxuZYnhhV9yg8Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScKlMy4R75snSlxRwKOnHzjaRxyda4OZIsPQcrw3I+7fJEuUrDa+ilEVFd7sUQp1npNW6s322nFhIlbGR4z+bAvBCJweXJp83X0hhsZSLT3aZhzjD7EtzdRuqbAzJIWc8Hd3eR3zFNzmJYIx2Dg3/UZdEQjpQHNCcm3F3mziQxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=K6gNsCpL; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="K6gNsCpL"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=51S2zN2wdAlNO7CZ6tg4ggDgdRZ66PTczsqK+t6gA2c=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765892396;
 b=niaFFyI1WLTIlF0p9kDAGWUT/SMV83G+B+W+K/FLWOUhuY3Od6N28EyetIlDI38E4wp3QYmg
 jSuTOz+auT0XUH1ijk0SEHYJgKoWbdBuB+LS1+4pN6my/K7YUZAKQF/wzusMhRZIdvt6YtfRoO7
 Tq+YhqbSLHEa2VQDZ7uixzX0b/B+3hjw5gkI9tnkyhssmP3PVPWyQTwzPWqr8a+fH+41Kw4gKxh
 z/IBndstDtSd/FSCaljeLyukP/XozoQ+nffULXMoujz0L0+3uJ5gcFFCYZL2KfjNtEXMtQdrznW
 vpv4XiJy/fYTRdO3d9aKc0bv7LuwNwA+JHvpIt/pKg1bA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765892396;
 b=ewrHnNP64/cVuwZtG87fYzf8gcF/ySRB8te3yrg/Ib+yVcFcwZ+OqqqNZBvWGgZsDe+KXm6r
 6SCBRZO5ZhlBlzEtUoaTMEU50LsWGwxUUZxRF7G88u4mJeS8achQgFRW0EpQpYptq7XLloANXNg
 MuokCfZAzPuRGuJuHj2/+egfkA1EM24huVYlKC6Rc1XXsneubYeMokDHo9EDigrbewz4jkv8vS2
 5lg+u0lICaNEeWByNGL3psHSZFHtCXqxTgTqg0/Bw7ibFqMFIliuYAuCMnv29g35Xa+cBAZGLvT
 E6ZTamEb6HUKytmkDHviwTPkS5AKyMRjRSE0rspMXFV0w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Tue, 16 Dec 2025 14:39:56 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4F68E5A164D;
	Tue, 16 Dec 2025 14:39:45 +0100 (CET)
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
Subject: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: remove virtual 1.8V regulator
Date: Tue, 16 Dec 2025 14:39:24 +0100
Message-ID: <20251216133927.913039-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133927.913039-1-alexander.stein@ew.tq-group.com>
References: <20251216133927.913039-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4dVyhy0pfhz4MZNx
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f1f82f19600168d6731e536ebde1b7be
X-cloud-security:scantime:2.336
DKIM-Signature: a=rsa-sha256;
 bh=51S2zN2wdAlNO7CZ6tg4ggDgdRZ66PTczsqK+t6gA2c=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765892395; v=1;
 b=K6gNsCpLPcuT71vFf/Xi7eDGozSXFM8eAqPnALyWazA9jqhya0czU4RyG2PzdQfgCrh2l2ED
 oZTMpeoS6M8jf5+ah9y2M+e5zWgo2PBuvnQaivdcfOf7hoNbX5wHMkH8rrWhQgHUMX2JIND68lv
 YkrcoeQ7fglbUJRjfo9L4XvP+YoQgBub/kOpSlVy/eyB0nwDdlsrb0wAEEwrmSb00Y/0GKSBRQb
 HpEpL0v+T3e7/N5WZVMM7b7qJFf5Mc6U7iTYewyHTKnwzLPWPA+v2LAhgLVvwnxI/uUvUN5zDVM
 GhbiegIJ58phK2UjcoKIHG0sMvzyRjvcQ8oMlphVfUnDA==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

BUCK5 regulator supplies the 1.8V rail. Use the actual regulator
instead of a virtual fixed regulator.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index 34d6415348f8c..ac6ce5d814c50 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -15,14 +15,6 @@ memory@40000000 {
 		reg = <0x00000000 0x40000000 0 0x40000000>;
 	};
 
-	/* e-MMC IO, needed for HS modes */
-	reg_vcc1v8: regulator-vcc1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "TQMA8MXNL_VCC1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -236,7 +228,7 @@ &usdhc3 {
 	no-sd;
 	no-sdio;
 	vmmc-supply = <&buck4_reg>;
-	vqmmc-supply = <&reg_vcc1v8>;
+	vqmmc-supply = <&buck5_reg>;
 	status = "okay";
 };
 
-- 
2.43.0


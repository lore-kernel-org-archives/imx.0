Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F9E397D1F
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891905; cv=pass; b=DgCC9SqbB4C/q5Q/gsiI3NQPRQFWVMQrqsJI3+5zfUP9Y7nDrIQ40QmKMXGKTpuxDny6tR7Jzb50axnbopu17Sz21easGpWzlAF5PtmzwTlfuZHcAt1Z0mnYKffvBvxP4xDyF1rIYxrwjpuXObaQ61wkA/R3BC+fMt41Qr1w+Yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891905; c=relaxed/simple;
	bh=PR0NlHN7YqPKKsbMjxMs6NKkCd0HY+1rUkhqTYtnpHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLdjzazzKQ1I0TDXuBu1haY3SQ8MsfRTZfEIb6rreyIHoKTEQOfddMEY92JcoKCKA/124KYKrYvkbv1OHx3a8z+LBpgxDRZyhHd2l/soAU3vmJLTIwYOfWjAAAqtfmyzLjXZ0C+688YhKvXQkmjSgKSo8yRE2I3Scd+pSf4OAks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=fAzsjv2l; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="fAzsjv2l"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ZD7EdcJ5e7dAsrhJ0U5LSV+PqEdKUrqQJz6YmQiuB8U=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765891884;
 b=WyW55VPgrqW4tRyvJs+T5PFDouXM9wiBX3tSekSd+v+IYB3XbLXp4jQzuzexzTiJM1wjPa8q
 o55QcU/W6e3MbyMiQDZedyNhSyWRzMSCVthL21/CX6hyY79DIMwidg6I0dyYg01fvNZAC9O2fQv
 q8yNtn8BrZnd8pwgpXQzhQcJwJ9VvVoxqjoISh+iqrbSztYJCPvfcPocP8/J0gCCHi5GgFYSJpL
 bH2YsRULhyJwBGKfopUFhAJkVQWnOMG18eaw/mR+G/ub0h2ZPP8Rr4lyuYwKIZVnej/kNVRt/RS
 tC7nm4fPTBEVU8eS07CZSFgy00YVVZ+pUiUxycEQV+YOw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765891884;
 b=nf//FaYJ9T6iDn0aPLX71rlmYiwZiza84F2LVLp3d8pe/Rn4mJ5mrRFxbvUcmr569w7je2fm
 orbGpXFc++ZmfpOVqW3cSh1CYQdLloGxwFxRwsp5+ln92PtXavrfpaMidAqMSxutd8Pumdbr09d
 6W/3PG2gZP9TxGtMBdqTAmf/KL+MzVK2eHKlIyqH4T2fFtHynZvEb7KnOGw7klNZO2Zk3nsEGU7
 0m/y12Lj9GsY6U0/7uWwhEoVs7Ph3O/1aCU2WAOZ04eOJbawbe6pReSysrHmg1mxFumtqTembyn
 0yMPhbvW7D7iZriVqFZHyD8WdGkAD6u07apoRHpFq3HqQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 16 Dec 2025 14:31:24 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7785A5A0757;
	Tue, 16 Dec 2025 14:31:13 +0100 (CET)
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
Subject: [PATCH 2/4] arm64: dts: imx8mm-tqma8mqml: remove virtual 1.8V regulator
Date: Tue, 16 Dec 2025 14:31:05 +0100
Message-ID: <20251216133110.905950-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
References: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dVyW62g3Qz3yZDb
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:3ac751a4171fb0e3b80f44cb1af22f3d
X-cloud-security:scantime:2.207
DKIM-Signature: a=rsa-sha256;
 bh=ZD7EdcJ5e7dAsrhJ0U5LSV+PqEdKUrqQJz6YmQiuB8U=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765891884; v=1;
 b=fAzsjv2lZXAOSsE6Ikfw8pwDvrnICOsdICJ2qTVuP8N+kMsB5TotvQtbUHYmB76GHbO2OsSK
 uh91UhjGrjPyhpgY4AG9b0l7Ls25EX51rkcmYgNQaOeD7zukhVlXnTAawjdYlrWxCxoWlpgsS6d
 7pFRZYG2VrX7n6zRznswkIlky6TTKPv9DVWWVgRXEv0IolW8xGT0i1sFq09rjMhiRm8TkSB3UGw
 daPsgO0e9Z8J89OSEJ4ryILAg7+G04hetr9/JHhaDElsjnXYHLiuECvTl172pLBrimJGgNUnlqk
 tfIYtHKCRNZJ/sepfnpvqVcoBEEMh7rZTplIZAHQDhizw==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

BUCK5 regulator supplies the 1.8V rail. Use the actual regulator
instead of a virtual fixed regulator.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index 16ed8ce5b5c49..6e63cf8beadcd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -16,14 +16,6 @@ memory@40000000 {
 		reg = <0x00000000 0x40000000 0 0x40000000>;
 	};
 
-	/* e-MMC IO, needed for HS modes */
-	reg_vcc1v8: regulator-vcc1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "TQMA8MXML_VCC1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -246,7 +238,7 @@ &usdhc3 {
 	no-sd;
 	no-sdio;
 	vmmc-supply = <&buck4_reg>;
-	vqmmc-supply = <&reg_vcc1v8>;
+	vqmmc-supply = <&buck5_reg>;
 	status = "okay";
 };
 
-- 
2.43.0


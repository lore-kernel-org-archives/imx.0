Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E35334BA24
	for <imx@lists.linux.dev>; Sat, 11 Oct 2025 07:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760166978; cv=none; b=FAHUFLYQXBKb2Z9/TTGi6+yDjX0mmblbg8nfOEqu+KN91w9q2RRG+DHrlL0d4NfzhnEzHIrqCfiv8vmMAZoeHsvSJCqy/DGiUjvAdYwMfvlNZnIRlJaYl7SfUXzVn25PPZsf1BjClLXJ7ZgsSCAS0qicA9B+X7//2cPA7rhMoeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760166978; c=relaxed/simple;
	bh=/TLxbFVcOffd2gCQWR1V7rl8jK9Kvl2ZEoVFOrfAQj0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I1eMbT3fBNgyQM8W79qDg8faHCupgBcVO1tMPdgPq4YQSq4y2D3jP2znV5D/zvZv8vBuUTSQcEYKiNITRlNl1vGYn5T54kjbb8A64Qi9LTqefB7PRYRskHIYYME2wczIFjt3v3r0q44NrS38y+NRqober4vKQDKz18U66Q0K4Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59B7LqQK014093;
	Sat, 11 Oct 2025 07:21:52 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59B7LqoK014092;
	Sat, 11 Oct 2025 07:21:52 GMT
From: Alexander Kurz <akurz@blala.de>
To: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Cc: Alexander Kurz <akurz@blala.de>
Subject: [PATCH] ARM: dts: imx53: enable PMIC RTC on imx53-qsrb
Date: Sat, 11 Oct 2025 07:21:51 +0000
Message-Id: <20251011072151.14049-1-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RTC inside mc34708 is supported by RTC_DRV_MC13XXX since v3.6-rc1.
Enable the PMIC RTC on the imx53-qsrb. Without a battery the RTC may be
powered via the micro-USB connector when main 5V power is not available.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
index 2f06ad61a766..6938ad6dbc2c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
@@ -28,6 +28,7 @@ pmic: mc34708@8 {
 		reg = <0x08>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+		fsl,mc13xxx-uses-rtc;
 		regulators {
 			sw1_reg: sw1a {
 				regulator-name = "SW1";
-- 
2.39.5


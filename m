Received: from mx-relay90-hz2.antispameurope.com (mx-relay90-hz2.antispameurope.com [94.100.136.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FF334D90D
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 15:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599606; cv=pass; b=g+GJbgxy8WZcO7TzZ3lwqUqFFGif4iaMrwqAQol0npmfwT4Hvp8lSa+nw6BbfAW1dhHBMqynKLwpOZB14H9WpoBOHvYbZ4FHobUZu1mV59cwOh6F1LmU4saQceKahHbfxyKt4wyd5uk4s7jL3ZSUcnqOaUA+DaOCHBfXRBxpP7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599606; c=relaxed/simple;
	bh=3D2Tp2ehvbGdEDtmqGKDfVWCYZgF6qNl/YW1X43mlnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eg/TH9W1U6/StxhHSqL2b944vUHRFLicEGsThoHRz3hu8MvfHLMxL6KP+XsE6JIDr+iqhD9+y/HdE4jiRxjEB0GJBKeki1Hl9YNBcd6MkFM3aDpQvXxu81x3LwwRxo7iXA0ROH8kDPYCWANp78M243CKpnocuDGlV8FvwAIUu94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ELtXCtzL; arc=pass smtp.client-ip=94.100.136.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ELtXCtzL"
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=68DvBw7C0r/sh/Gh8ps74CB7ldatS0EygipCKbHo5Hs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771599574;
 b=RgUgcvJidU6rcPNR1AIajdMYtpw6jiFgfLtFM8cLiJ7VkoreGw+FkXm5cPHp//6b4jIKjde8
 vIyM1gOI+7MClnj0vHNM2tkhvRBbCbpDzlt7+xYtGtdguuy1BPvvYThcHdCjuj2wLUun49fXWAo
 PDiIgfo0hqf+RyngHsD+oyU6bPpFmW2yqaqgTlZtiV1EraQLG6p0IioPQ8e4+xZACiGGHgzgnK2
 HwYyrtcMrbjeweAl4SCOkSL97oOXnd3v7beOZTJ/HyPXfCuf8jRivg6lt6cYrdEcmsPhKKalAvQ
 oSsG2PbzUgs+i2SJfeFABp5+2RoE3hLlxPRk7sjIcaihw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771599574;
 b=iC5fa8S2IyQu3t/l0yOU3ofMqwOhLPFUGx/yphcc5ShpFvB1SOlb1IUeBMKwZovQImCFgtX2
 yZv8uAu7CWS0WQTn8qQ/4o/dYy4osnQBs1PBirqCyyYN7eVkC4wq2Qthlid5jSQOd5r6zseg7cd
 3HbHHxim5T1fFTClOrGmsZ9802VU9AElZA6swtkPjOcGTC78uDS4DCqt4a/rWT2t+HTQYPNbwwo
 QOnj9DMBoky0YNOOui/bwOKHZr+MvbzQnybP6Pgbkp2iiK+BWYm9xnlgiI6KAWvJSdsDlgkZNbf
 O/snkyDKtkOL/OtH2uOd1q1OBCiA/R8vqLYxJWEaYp9DA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Fri, 20 Feb 2026 15:59:33 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 76B8D220B38;
	Fri, 20 Feb 2026 15:59:21 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 1/3] ARM: dts: imx7s: add boot phase properties
Date: Fri, 20 Feb 2026 15:59:07 +0100
Message-ID: <20260220145917.1797286-2-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
References: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.feilke@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4fHYLL0kZXzWxwB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:c614331d226334654bdcc2f6989c9275
X-cloud-security:scantime:2.494
DKIM-Signature: a=rsa-sha256;
 bh=68DvBw7C0r/sh/Gh8ps74CB7ldatS0EygipCKbHo5Hs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771599573; v=1;
 b=ELtXCtzLJCVMrx4Z+XYIwAuZZAOU9OkPMl/UmiJ1iSs80kmbz5NlPcG5JMpkXMabzV6kWczs
 rWJbAC1LQnOM8gmNrOVLm3p4HAvxh3hCP85ks8I+GnqMYLbTXVEUR6jZLv9cBpQgod0NsNUi8Nm
 9J3jVtKeRgh22TR27C/eDJ5kRdAQVaMobAu5KhgMLsvkLbqJPT4pTl5uHiTbnN48QOwm12Sv6t0
 CquZLEcv9l8OaciO7ANOKjohyRW8DQvHRwxnM615gSq6Mfrap0we3scaK9xythtlVex2ZB3wOUq
 V04qNON+pglVQa7yoQZLpPp88AqFJBbxZ91mOctLm8TFw==

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

Adds boot phase properties to essential resources in imx7s device trees.
This includes the buses aips1-3, iomuxc and SOC access.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
index 9235dd7e93bb..5c9be24ba7c5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
@@ -209,6 +209,7 @@ soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gpc>;
 		ranges;
+		bootph-pre-ram;
 
 		ocram: sram@900000 {
 			compatible = "mmio-sram";
@@ -371,6 +372,7 @@ aips1: bus@30000000 {
 			#size-cells = <1>;
 			reg = <0x30000000 0x400000>;
 			ranges;
+			bootph-pre-ram;
 
 			gpio1: gpio@30200000 {
 				compatible = "fsl,imx7d-gpio", "fsl,imx35-gpio";
@@ -543,6 +545,7 @@ kpp: keypad@30320000 {
 			iomuxc: pinctrl@30330000 {
 				compatible = "fsl,imx7d-iomuxc";
 				reg = <0x30330000 0x10000>;
+				bootph-pre-ram;
 			};
 
 			gpr: iomuxc-gpr@30340000 {
@@ -712,6 +715,7 @@ aips2: bus@30400000 {
 			#size-cells = <1>;
 			reg = <0x30400000 0x400000>;
 			ranges;
+			bootph-pre-ram;
 
 			adc1: adc@30610000 {
 				compatible = "fsl,imx7d-adc";
@@ -902,6 +906,7 @@ aips3: bus@30800000 {
 			#size-cells = <1>;
 			reg = <0x30800000 0x400000>;
 			ranges;
+			bootph-pre-ram;
 
 			spba-bus@30800000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.43.0


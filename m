Received: from mx-relay107-hz1.antispameurope.com (mx-relay107-hz1.antispameurope.com [94.100.132.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF292329C67
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771422905; cv=pass; b=NyUSPsisSTTqhaUSmQWCYbR8WfFxi/XpNXZipt50ByWsUefIaO5uols/C1SyeXuiZenZid6Raxmib+uWQa3jrR6mNEdvXE6jWUiu/BJIsIOQk4C8ELNH4SzkezXIAL4mT6Xo/eR+YWruiLS0ycqttizb4W0mFP273vTf/FNPIf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771422905; c=relaxed/simple;
	bh=sWUXrg+TMuP+nw/K7Domls/wcuN+SJ1BRKrgc28lk+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJFbfZ8gRwbF2XK6/rwgDsc9KlAstGeynJE9vZ22ukypti1OKTEUkdTOWgr/SxTTd+dv0rc4gi2UYKI+/ktlO7wBxFZKScwJMTrau8P+TfeY/vHy1t+lnu/O7MperJWNUslbsiTUotTfkjJid56U/C+9aHbVdm8LwRCRpNBPd9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gAUYKFoo; arc=pass smtp.client-ip=94.100.132.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gAUYKFoo"
ARC-Authentication-Results: i=1; mx-gate107-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=HmH2gnYHLoGT+gPFoqYfzgcg3mVohz7j0M5EpQAudWE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771422880;
 b=gBcF+HXPk3F3UsDyfnaXJWhOCEGdtvgzldTQwuyHPO9M9Qfv0oOZpagvNNytLh1kC2MUwCcC
 VN2FKq4g6s4U5kZZA5HgTcOnIIME+usKGS8rfj+KNfk5MQW5hv+ML3/TAHJLsomrBp1JZTtx0Si
 ptxPC5ZAMMc70MpSETzVhLkjC4ZMPm6LCJaL8wea255oVaQJ8+YfTBmD58Wk7lr6M6ARjwRbPS1
 dR1PH/w0iICcbN2Km+Hh2ybxh+qwxQ294CCeU3P0yQgSclqPxxtWpM7F524cLAbhyzdmQAm//Cj
 98MT2n9UA/LlA/kbJixRzb3wzFaglmn8ILMujZpuwN0Kw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771422880;
 b=mwMaEBCEIhPU5ZqOib++DskK7sODppDKzf0eagMKz/rjDSJkzg4lqjOohpSHo166kLf3vu6R
 Dh1N7eu/ZH47SPxFTVprVy0AbYVJHf7DSqYmLpF8jjjof6G98wTEus0MHDV/jQH591GseT+IH6c
 jCfLV1u79wQW3gBeMhJtarQp+Ljs10/UgbC0gYomPuUDC/+qUEmtQIQvHPlBbrd6g54Fzl+NmVO
 CCHMtyPJ5/oQBFT/iKp1Almk9uVFL4N/BfDPxC8KBJQ2BbWtjrzpfzSWHZfpHrKT1B3cUR+GUg2
 2UEtguLbfGy4TOiWF78nx+QvAN3AVX6ctAojvYqDxGJLQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay107-hz1.antispameurope.com;
 Wed, 18 Feb 2026 14:54:40 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id EB07C2205DE;
	Wed, 18 Feb 2026 14:54:26 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: imx7s: add boot phase properties
Date: Wed, 18 Feb 2026 14:54:12 +0100
Message-ID: <20260218135415.204974-2-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
References: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay107-hz1.antispameurope.com with 4fGJ0M4wR1ztZxp
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:005226ad2035b8035f0646bf4904b0c7
X-cloud-security:scantime:1.935
DKIM-Signature: a=rsa-sha256;
 bh=HmH2gnYHLoGT+gPFoqYfzgcg3mVohz7j0M5EpQAudWE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771422879; v=1;
 b=gAUYKFooN4+FjJaXvQ0Z98Ow07Og7YXdfmYk2JEJlVvzJEDGvX5OUvIZEltXaHBsVJbpWOZf
 qg+aSxCd7qDJUutwzvjn6g5et3LWR41THjXUsPEtCTdoYDYWqS7BcL1eEoh77sIqZJu5arhNm+5
 RC/iGMXFbLfqEVhxn2+eZ3hBVNW+NKyMo55v26UI6GnKZmlwvIMjiUsFSrLT3kuqyYXYPzBU5Pv
 K0wJ5ZEPCFyg0pGp5jHuScenCZpF7aeJQ8eLdch8chvm49PDTwKMiMAiWrH2Y0fIRMgdNVhtfuR
 2BdRVs7azxH98DX9Q7GJ6WGJuYHvJ9pk/s35HDRgniSDg==

Adds boot phase properties to essential resources in imx7s device trees.

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


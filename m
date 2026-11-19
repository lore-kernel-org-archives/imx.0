Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083988;
	b=z/gr3a+oKVWqSRT8jYRyTrWePcaz+Rm1LmK5IuZTCbtpLCm2htEZ+hCSNoh2d12Az75e
	 DYzRIIYRRHrnywMs3DrfazAVrj1aBbQHIWlpqSfKK20H7FCCekYUQ4XD3JgbyW41lklg1
	 zlDY2MqeCzZQjuH5Sk9whnCDVTQ3LlIHujmQ/F3LG01Oj9hQqZESiyQ/XA0tTC/FrYcbW
	 I5kKgPMMBF6z83Tl6QNtTYOER1XsAo9k/Wf+BlNwqy6f+mSxLEm4MrM8+rN2k7B13jEbv
	 BJVnGIlLaEct/LnsjhARqQaL9ao+XzFc7vVqGwk1tK8LsAT5BhpsLfW31mOINQgV+FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083988;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Virus-Scanned;
	bh=RdKBL2ZT8p0iQbKt/GS5KGAaU5/MWPgNyUJOPC47fuw=;
	b=SbpZa7DdoqKNZCJV1AXuUaFXcDaWu41Y4la1nmpLURtia3N8bEm63OQoLCUi4xbJO8R9
	 A8aT6+2bpxzTuZ33sJtenRVujxQ/75uz4LDhq0Q1VUPPHA9H+0L/zYaYOSSSXdG9EZsHe
	 KOWKpWDZkt4kD/pKgkH9vxeagHLp4ZiULKAgHgIuc3nyEGL2CIzctRRlB7nCeJyAgeEqA
	 WxEBck21AQ6gFCGDKzEEfLDpZm1Rk6I5xuYhXQPfgn0pWoowSj/wlqRmnkFotP3W+JTpd
	 dpLx1p0mzTe7uFBksK1ds5c5eTEUkGWRR9aNTcEEsAJQ3iATVvFWFgOQGv1F5/y1TFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=iESTq3U+;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2737606A320;
	Thu, 19 Nov 2026 10:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2737606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=iESTq3U+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=RdKBL2ZT8p0iQbKt/GS5KGAaU5/MWPgNyUJOPC47fuw=; b=iESTq3U+Vva4Xf6N117sAoQ4wm
	MhRMrEnV/FXQo5Vdmkmv2KEJr8YpowfLQUuLnroHEVMVrl6KfCHpS4b+2CyoGs0YzJJSD5JGmf0lT
	9rwgDmACOtuwW41VY/fexrTheXZfoBtznY/t9FzBUNK1r5FixX1wssbbSoIYhTAkpRgTxDb6q40b0
	oCr/RHXR0jcrkXw2y/0G/wc0c19HTeN+FOHwqcrtQingpFoKMkqaUcAZPikNRuxD68+HVAxN/RIGo
	i2r4CCHM/vb/Ea26rTGZxizpixExbGZs36ILlJCjt+PbPxj+A8uUqb+FQXaGGi297ZTW4DUTIt9jO
	HUQZ3rXg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <Max.Merchel@ew.tq-group.com>)
	id 1xTzLO-000DDB-28;
	Thu, 19 Nov 2026 11:26:18 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Max.Merchel@ew.tq-group.com>)
	id 1xTzLO-000GjE-2H;
	Thu, 19 Nov 2026 11:26:18 +0100
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: imx6qdl-mba6: Add EEPROM nvmem cell for all board information
Date: Thu, 19 Nov 2026 11:25:24 +0100
Message-ID: <20261119102531.2995127-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28188/Thu Nov 19 07:24:39 2026)

MBa6x has board-information (mac address, serialnumber, board)
located in EEPROM at offset 0x20.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi | 4 ++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
index aca320ee8f476..9b199b277c220 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
@@ -29,6 +29,10 @@ nvmem-layout {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			board_info: board-info@20 {
+				reg = <0x20 0x60>;
+			};
+
 			mba_mac_address: mac-address@20 {
 				reg = <0x20 0x6>;
 			};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
index c7bbd6195fef1..517913abbc66d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
@@ -39,6 +39,10 @@ nvmem-layout {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			board_info: board-info@20 {
+				reg = <0x20 0x60>;
+			};
+
 			mba_mac_address: mac-address@20 {
 				reg = <0x20 0x6>;
 			};

base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
-- 
2.53.0


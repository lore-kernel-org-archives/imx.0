Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347713F8236;
	Wed,  1 Jul 2026 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899127; cv=none; b=h+zn9DUsg6HEAqmpVv1l4PcfYm6PGbCf00CfYabDMPZfFL/sMy7cmxIRkMNBbsVUdLeAk4hVKCvbYFskoaaPh2364zDt+ZgYLPC+8X1PRuSpQYRWtWc4pGhmfXIGWKwYOKD7Z0jOxKvQ00zDpN2HS8fZ9JB1uMnFYOJ27MXriNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899127; c=relaxed/simple;
	bh=RHuTnTruQ9oJg5y7F/Q1JPAzF2SlrZEoHfcl3aFighs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tmGnp03gbdUdBJtETzBqTMs+f8gr+Kji0P3wgUU4pBme+JJG3ydBk3uWOmDxEPD77jYeEGzIeli87nwu6Eje8eqdsNQGZpmZEb4ylWT5lKjgMZBwB7G3gKsM2tdwu40qP7oZ/HznwSRlFLZKGtp2RveTMzb5TelHr9ROTLfOSyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jQrFf5/I; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jQrFf5/I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=S5CD9RCGzTJ8lEWCXCyIZVGHOFsiCgVXwE8Z7g69M4c=; b=jQrFf5/IjpRWnpMNXSB11D6z+8
	zzx6sCrx6XRbFWE3+I/L/ThV1vsBBSW2gWNmf1jMIsXIoUmd9n1ioU2iIRUATvigGkNkXZ2D7Dfp1
	YtN8xXr3otSf0zQnN18xGcDprra3IefSKll4N3TxBRDik4MeoWjqu+ll3tvuNZB9/yqdLNHPpBggn
	azRfeBdA62Ryx1vPeoGgHUXnohYgj+YNzsTVFaZOLPMTEpniJXPJAoUbmZpF/AdD8wyFxedNWKVY3
	DAWzWQZyOWRxzCkpf9lOT4FsutupWe5kFUn3Cz7bTi+xDakejCH/yWXag6EUDruS8eIUeE/632B6v
	U/b2VZHA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <Max.Merchel@ew.tq-group.com>)
	id 1werVT-000Fue-2j;
	Wed, 01 Jul 2026 11:45:23 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Max.Merchel@ew.tq-group.com>)
	id 1werVT-000DCq-1P;
	Wed, 01 Jul 2026 11:45:23 +0200
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: imx6qdl-tqma6: add nvmem-layout
Date: Wed,  1 Jul 2026 11:45:18 +0200
Message-ID: <20260701094520.1482697-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28047/Tue Jun 30 23:29:24 2026)

TQMa6x has board-information located in EEPROM at offset 0x20.
Add necessary nodes and properties for nvmem cell.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
index 67f8f59aff5ae..2fa116e1ca9a6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
@@ -39,6 +39,16 @@ m24c64_50: eeprom@50 {
 		reg = <0x50>;
 		pagesize = <32>;
 		vcc-supply = <&sw4_reg>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			module_info: module-info@20 {
+				reg = <0x20 0x60>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
index db552802554d4..4361c7efb9d73 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
@@ -32,6 +32,16 @@ m24c64_50: eeprom@50 {
 		reg = <0x50>;
 		pagesize = <32>;
 		vcc-supply = <&sw4_reg>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			module_info: module-info@20 {
+				reg = <0x20 0x60>;
+			};
+		};
 	};
 };
 

base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
-- 
2.43.0


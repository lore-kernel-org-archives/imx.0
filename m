Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF793EAC8B;
	Wed, 27 May 2026 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779874670; cv=none; b=gu+5bkGJS95leuSNbd+20z5a5EBJpixhMwvegtBZ5dFjaDbPDf85eNBV9HHELE+1Lpcx94C6BslOQCC77uCx0r+FRyqDYwEyGKXjU8uyj/0u6kI8dkvGQTJgxp6VBGs0L8NfQo9g0OcKjcf2yZ9GMa/69tHSKYvWJafJegCtoss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779874670; c=relaxed/simple;
	bh=IFW3TFULvw5guIIO/NOVp7nYEWGRZHHHkK9ypkNGsx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aWGtU2rbqw/kZ2HY7wRIAEkIR94RSdHH+LQO/cGIQYIvxdMYXoke9HnrPH/WsJ0VxrCgPWnkHEIe4qzgTkjgmPTRzZmJ7dAfIes2s63dH0DDkIiLS6Tdjh5Li75OW0H1+4AyDEi6fE2BsUU6Ycv5nv5E1RlPa1C17+mVBNRLNgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oH/PHzYv; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oH/PHzYv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=ZqjmhqkgJdbO7oHJ1AsMR24ix2j+E0GMg0GqfLOc6N0=; b=oH/PHzYvmpt89Fm7LOKf1/Xirt
	iUteiybdYKzpEA9b4wTzWWeYPUoHQHIqE5wHvMN0RABtWzC3gT1934pkKplYDd52E4Mw5KlY20mom
	7pNKApfm+s13Ok3bPUJxi8R0g4XmXDwwgGmgwTfZo3wfWWCL3S/neH9Wen9ACFVWwil3rGbIMcknu
	6gFzItbzm82+N5qBWe1CDP6+6Ph2unsSHXbQ7uIfxRKTToYfvi243im11C68VjkPQPaad1GzH0U6q
	IlMKotuSMfF6E++M9Puv99e93njCRmG/tah4ronOFD0kz6yKjJC2sE2YpRARJ5IltTZwPOb3YE7ZY
	KaYTP1IQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <Alexander.Feilke@ew.tq-group.com>)
	id 1wSAhl-0000JE-1a;
	Wed, 27 May 2026 11:37:37 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Alexander.Feilke@ew.tq-group.com>)
	id 1wSAhl-000DxB-1r;
	Wed, 27 May 2026 11:37:36 +0200
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
Subject: [PATCH] ARM: dts: imx7: add nvmem-layout
Date: Wed, 27 May 2026 11:37:17 +0200
Message-ID: <20260527093719.160777-1-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28013/Wed May 27 08:24:49 2026)

TQMa7 has board-information located in EEPROM at offset 0x20.
Add necessary nodes and properties for nvmem cell.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index f3d7a2d0cb7b8..e1f740edfb763 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -151,6 +151,16 @@ m24c64: eeprom@50 {
 		reg = <0x50>;
 		pagesize = <32>;
 		vcc-supply = <&vgen4_reg>;
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
 
 	at24c02: eeprom@56 {
-- 
2.43.0


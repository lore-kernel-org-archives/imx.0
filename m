Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446F42AA6;
	Wed,  1 Jul 2026 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896993; cv=none; b=LURxlP3xrd26GFiYv1rGjw4uCOVkaZvYOqWBtKeNyEExEDyLLfPqnD2kzNv2aZ7btzudfF89MTNa36l+MArKoUIEEo4fusZ2uBdMC2c7EyOtenV1x6tfhma6mPE99GWiXh3ga/+TdMKw7edCjFiA9x0LCGuxMqevPxuYASKuwgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896993; c=relaxed/simple;
	bh=noJn7mJQsgWOgz52G8yMKwzjXPPCN+EoHw/1TvTzXmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5jguICL00znsFnlXcPrzVPOF7SoHhAYOtDNXuhXEVOugn2iwBbqdE0ABDANYPPx8yMgufwvazACDyPbti9Pd8ekEYCgKdmZGa6IIi7H0QziWcKmGhT2oO51sWH1F12o9UdLAJjFtnwTiWyiElzzT6Rn9nF+aTn9/ntLzkHI2Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=iKN4FMG+; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="iKN4FMG+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=F3tUEC7RtYlVbwWQFfwwdFjjsr90lp0ihCLoI0ydDyQ=; b=iKN4FMG+lZhmANi3WAwUcoL3GK
	kNhJxc8LmIwWnlYROVGRbBdG1yll15aFzSjDcdeAuO/6BvNnn9D677pkbx4LbeSez5JeQ6jeytlEM
	5Y75HoKrYSUH5lR3s2jVnvCNegGxP0DpYB6YVynY+JnJPQDznStyrydE2jd/TWm8MFXBpS7Zy7xEi
	B46oBIR0Zi2i/P7fWA7TSRaSgiDXjLpRIwnpikv09RxAixvwEArLzkIK63zDV2C4O9EieIi1epaSo
	MPzes+gMx77gbxJBNLJyPFTNyy6Vi8xRuwEQu36DeGeRlk61yeAPvXS5jqvFCPaxno4isgNzkS2He
	T9LwR3ZA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <Max.Merchel@ew.tq-group.com>)
	id 1weqx3-0009s4-1P;
	Wed, 01 Jul 2026 11:09:49 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Max.Merchel@ew.tq-group.com>)
	id 1weqx3-000GWG-2O;
	Wed, 01 Jul 2026 11:09:48 +0200
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
Subject: [PATCH] ARM: dts: imx6ul-tqma6ul: add nvmem-layout
Date: Wed,  1 Jul 2026 11:09:44 +0200
Message-ID: <20260701090946.1479190-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28047/Tue Jun 30 23:29:24 2026)

TQMa6UL has board-information located in EEPROM at offset 0x20.
Add necessary nodes and properties for nvmem cell.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
index 4fa98e6a66d7c..9b70e58868b08 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
@@ -126,6 +126,16 @@ m24c64_50: eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 		pagesize = <32>;
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
 
 	m24c02_52: eeprom@52 {

base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
-- 
2.43.0


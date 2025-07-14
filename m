Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B692259CBA
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502825; cv=none; b=ia1RJiAznO3iYZwy+n2AmgH5EglBIBh0xAGbKCC22S3mLTyaC6Datpf7bAkCMFwY9OM7EKes0kNgQfI+4pwvLaA9o34jeSBs2Z4+2ywEykhRZQOl19/FJ+eAoYDAMQSsPybovlpT9Ir7z80tgPF4ulDUqGqX+FdllmDLrji/5AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502825; c=relaxed/simple;
	bh=wgdU4WP9FnJ8Y6csHTkjGCEqVcCVt6v/KyxIsvJySS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJWMmwPnh8OwYOY4WJCxZX1DvDLj7o9nx5ej470kG0Yfu1j9z8QOW+CKpopsHj7/vvdbRAHMTMr70iQYdvqvrWYO45K3dnqnPweEoUUMnMOpkjiwTuWO/0QUbMfO6CsmkEN7dpTJ2dZMMs5a3X8AklJlSnoHRQWb+ruUreiEvXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=wQJVQh/0; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="wQJVQh/0"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82052C753E;
	Mon, 14 Jul 2025 16:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502822; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=madsTv28Rf7JKcd1M7q0kHETPGpzvbAfjoCb2ndJQxU=;
	b=wQJVQh/0cvikZ/fWJTWn/HxmCUCvueT7jIuP3N79DjnRQA6Wo1SL0LFid+a73d9wMmxSq/
	u+RnjlxIq3EFYFdZFIndHsLbhX6lj5f5QNyZmnZtXQqVGT2nrubeVnhDnwlAA/Pg/54Va+
	YqzZweuLoiYlUMVQsL15Jb3T85vdtGM3cKDwDRQbnKh2kIhPQ0fq5YqsnT8+EZ/RMpP0Q2
	5IEEhPKBbwAYmMJNRifAVKtAQSnqlSGxYa+EKKqaTnwuQ+yjCXRRHoEEeVoeBpaJyGNgCX
	Lc9DEdOZIRZH5wMMMzPUI/gkZkbhOBhs4Gt3DJPQIT+rA2ahkngynygJgpVy1g==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 06/12] arm64: dts: imx8mm-kontron: Name USB regulators according to OSM scheme
Date: Mon, 14 Jul 2025 16:17:32 +0200
Message-ID: <20250714141852.116455-7-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714141852.116455-1-frieder@fris.de>
References: <20250714141852.116455-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Use the names from the OSM specification.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
index 264553248d5cc..96987910609f1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
@@ -38,7 +38,7 @@ reg_usb1_vbus: regulator-usb1-vbus {
 		gpio = <&gpio3 25 GPIO_ACTIVE_HIGH>;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		regulator-name = "VBUS_USB1";
+		regulator-name = "VBUS_USB_A";
 	};
 
 	reg_usb2_vbus: regulator-usb2-vbus {
@@ -49,7 +49,7 @@ reg_usb2_vbus: regulator-usb2-vbus {
 		gpio = <&gpio3 20 GPIO_ACTIVE_HIGH>;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		regulator-name = "VBUS_USB2";
+		regulator-name = "VBUS_USB_B";
 	};
 
 	reg_usdhc2_vcc: regulator-usdhc2-vcc {
-- 
2.50.1


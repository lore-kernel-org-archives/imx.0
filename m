Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2AB1E32B9
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737379534; cv=none; b=XfrNgD5/h33dN1EAPX80rkTafBntlogtpU9tUfzcAOT3MSVc4JrgqqvkatzXAA0KCGFHi+9SSi7/aj7w12S1dV8xVdSHqXCDFutFYW5jC1k9sRCdzpwoXkIQAr56DYIyWmsqjuPn0jRNR3L0nLwt1fGdr8H7P2nAK0NbmZ4XNKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737379534; c=relaxed/simple;
	bh=CDoJCZYfXtvsOYlJjgOQo3X29b6AM6JhGYKu2siHjsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g1am7FF5frgiLo7/Y0rhA33GUkocKVdh+SSi5C5vuRh/BxeDSdplICqyVN2kMO3Ap8lnMzUzmuR/F4k0ZL+305VaMhwpdHJKAkvOQwmNwyS4HksuZb/HCqg1/Fh7A6bTJgmh43Oxwj40IXaIZmIZvazNgqy1KhoXTCEV3RfmKSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=W/4ver2D; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lrDuZYiG reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="W/4ver2D";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lrDuZYiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737379533; x=1768915533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mRcssIy0D3wBhtQcXILEIWDG0AtdDcnDWd1hDsno3wA=;
  b=W/4ver2DcFh3+G1s1ZsuvQw0pt9b5SrlJZ604AD2sVfJ58bc8SAPA+6Z
   B5wFZzRNHU7SveO+OlS0l0x6jbhh5+Uj3XjgaQ2XDEF0M4RnmLycAQaw8
   FuCN7e8bIKC344YKJ5b8HsJbSanCh9Mhd/SEbfxcAufiL5KQnVrmAuRZo
   b65lQjYqmXR7Ishxy+e3/J2uCZtdsWy6uHUMEBqtCJWhYA9EPxQacOb39
   Uvi/PaSr1JYjG4Ejl8Oe7CbhHezc9sF/GgSG6h4f3M5xWEkMSgDy1X/mX
   bryzRNy3zGCBY+q2Uo+78DfzX0zjeOSrZA2V6oOeGq5bDU+Ljy3KqQrEt
   w==;
X-CSE-ConnectionGUID: iTqurQXYSkyRWVle7byU4w==
X-CSE-MsgGUID: WwKgWIhZTQu0ioHIIgfXMw==
X-IronPort-AV: E=Sophos;i="6.13,219,1732575600"; 
   d="scan'208";a="41177850"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Jan 2025 14:25:32 +0100
X-CheckPoint: {678E4ECC-11-9B2B6168-EB6F31C5}
X-MAIL-CPID: DC5E2AAD34FE55F2E840A13270981609_5
X-Control-Analysis: str=0001.0A682F15.678E4ECC.003B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FAAC16F538;
	Mon, 20 Jan 2025 14:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737379527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRcssIy0D3wBhtQcXILEIWDG0AtdDcnDWd1hDsno3wA=;
	b=lrDuZYiGY7PNHdU/Y0+ppDaxqp3+Z0x36gCZF1AOMNwkxQfeMqTJSLnCxSgnYYPCI3trWq
	kU3phdcTfxZPsVLczcKpWcpJ/nf7eCgGdxhHKXzAzS8vV9cmZpveD7UscTD9zgxogGf0Rm
	camcUTANG6OynMqUbtsYHNBBR/4M9Z1c1soSilnxM7uav1WVcYREVreKKT4CA0OF/jYG2I
	qyDtXfEkSznvGSrDms8Y6gvOdZvkAf9rQLKrzGuQcsKjLU4oJYvzBI3/eU6UYhX6S8LHhG
	G5oLQ/pJ4hK+xGB42yflhx8NQbPao5jQQERE0zMzXC0tgL8Bf0ToMAyWPCJ1iA==
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
Subject: [PATCH 5/5] arm64: dts: mba8mx: change sound card model name
Date: Mon, 20 Jan 2025 14:25:02 +0100
Message-Id: <20250120132503.556547-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
References: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The card name for ALSA is generated from the model name string and
is limited to 16 characters. Use a shorter name to prevent cutting the
name.

Since nearly all starter kit mainboards for i.MX based SoM by TQ-Systems
use the same codec with the same routing on board it is a good idea to
use the same mode name for the sound card. This allows sharing a default
asound.conf in BSP over all the kits.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 124a2544826c9..0931f680e6875 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -158,7 +158,7 @@ reg_vcc_5v0: regulator-5v0 {
 
 	sound: sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
-		model = "imx-audio-tlv320aic32x4";
+		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai3>;
 		audio-codec = <&tlv320aic3x04>;
 	};
-- 
2.34.1


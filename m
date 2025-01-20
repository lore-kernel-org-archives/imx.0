Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616F21E2317
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737379529; cv=none; b=BTrhhrPU69qdEbnzM7wgq2HoIP+6gu/HznkFnuOdd0UP96j38i9UkEsgvVOAQYh40YioP0yGtzyZrkoUAJdpuPOPmuM4vS96U54NLF3wfTzfcCGS0UGkC5mZ+C9yAAm0AVbpG6/aFH4tg9rrKvBRNnSYFJoXP4wTJ3kozJnm8rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737379529; c=relaxed/simple;
	bh=msJQYV4v6b18Hab2aHU0fsywuVQKlzT13JQnyHzjeLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oljT2K6MnIL82GN6sivb21/aTsEb5pi9jwbl5h6IA7G0V2mnVOEW8i6IhcyZ1zSZ+KUcXmEYH93ZdC4CHU3LjIv9mr0YVwaD/86EfwjVWAROjuAIFANCBVjPcBmHJ2ydrrMQ4/xJPNY7Zoi765fJsTcbXzzTnk4k18Lok5GUwXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=NvCHlncO; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Z4qQ7i2I reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="NvCHlncO";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Z4qQ7i2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737379527; x=1768915527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2c29wNKlu5vUAR2wt/xuZ3JMluICUzbKrNycz1Ea4Sc=;
  b=NvCHlncOVaeovH+BUn71w/4iDnMhGZmNgeTbqZ8mAiRXTHJ3hoic/iTR
   ayQGo/24T0DwPw3Bop0reEH1v288fImdjdPWdB1uDSIRXgIa+jAn6jfFa
   p647L9fNec4Mo1AYB/im3d/AYf5Nh8AjNsr7SzZSPOaBHCP+Im6qHkxWh
   0gtxE3aix+bQlScxOm6ybGopAldJNVShyGp2XfUK1KCZCXe7wOgUU3/ns
   sFlwEHdKuAjay0lad2EY3nXJRadNSt9bpwQcp6M8y5y3luFL9pKUOG+0l
   nt7o2ozfMi8mKYbC+Y3BNbY6JSQL7awQedzzsIXQvYjsYDAGzuBC6x113
   A==;
X-CSE-ConnectionGUID: SHd0UahgQCS/DT/OJBNsyQ==
X-CSE-MsgGUID: 9EpY86SrTx2BP9VLjF0PTw==
X-IronPort-AV: E=Sophos;i="6.13,219,1732575600"; 
   d="scan'208";a="41177845"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Jan 2025 14:25:26 +0100
X-CheckPoint: {678E4EC6-21-1CE016C0-E589DA3E}
X-MAIL-CPID: 162C60AF69C19AE50821BCABEA4B7DB4_1
X-Control-Analysis: str=0001.0A682F1F.678E4EC7.0009,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4F9416F862;
	Mon, 20 Jan 2025 14:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737379522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2c29wNKlu5vUAR2wt/xuZ3JMluICUzbKrNycz1Ea4Sc=;
	b=Z4qQ7i2IAh1jVarZ9dc+WnQjE6Xp0fAq5H1CYkZvAXoYn+2Tg/ujaK8S3vOucK6HbREoVg
	uRGjaLX/ia78gHUII2Sar2PbK5OGErFemQxZbp4/6J26tChRAUQHRn4u0Jr7SnBuDCxXgZ
	PzXhY8TYnDzB6STV99DuF0BP/58h08Fo4b50qGxbYTt1oqiNnDtJj1PHUI3Z8tSJlN7xDE
	qXvKqmpXJyuDXz02cNJPL1TKVCArvwrYWI+/Ma3TxX/MjaSM7n2d+K3h24KDGqZDHy4jhO
	D2OjOW4yuFMxKoVTSvC/ijM4NdLLLy8wlxIrrJyvAzKKP3jjGRuVxZmow24x/g==
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
Subject: [PATCH 4/5] arm64: dts: imx8mp-tqma8mpql-mba8mpxl: change sound card model name
Date: Mon, 20 Jan 2025 14:25:01 +0100
Message-Id: <20250120132503.556547-4-alexander.stein@ew.tq-group.com>
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
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 730fdd85d731f..f20e022937567 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -241,7 +241,7 @@ linux,cma {
 
 	sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
-		model = "tq-tlv320aic32x";
+		model = "tqm-tlv320aic32";
 		audio-asrc = <&easrc>;
 		audio-cpu = <&sai3>;
 		audio-codec = <&tlv320aic3x04>;
-- 
2.34.1


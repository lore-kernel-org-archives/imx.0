Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7F855769
	for <imx@lists.linux.dev>; Mon, 27 May 2024 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716798857; cv=none; b=bWCZu0l/ybbnjiC1vasE+mZ9f5fQK5E6yLEur5kLlw1ShftfSUkuIkXx7shcIhgBzqRNfX/Ev1ngj6EllXly4ceR1MxiA6IkvXqYoSALvkqHrf2LjgMzKXo6s6X407V5vOvEEPlEEyMQlOLDNUk4KWldniukS7P9R3wS2xCfUHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716798857; c=relaxed/simple;
	bh=elvAq7UtGknIb6crDSiKS9oRZqkD//5l72kIWJITzhI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zj3Wuw8363Ounq6S43ztzMbgfSNWSVZ1IQXbgL5UD3rPuEZZJESYkmyCvsxrDt4Zx6DWuOuaiixcGl31DT04tKDZJfI6ZchYY2J6F2WHLePY5TVmLWFV+nk6JUax9b5VmmTRdfQ55JxZZ9Rmc1oZEr7Btjvt86CX8MCbZuZ6uEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=EpRcFOxq; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=BrBlwXH+ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="EpRcFOxq";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="BrBlwXH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716798855; x=1748334855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T2u4zEaRlGBpo4Yx+BpIMgm18+yuNbm2IErR00tf+e4=;
  b=EpRcFOxqfcrdOgGCtKQqvfyzkCQfXBfmsdCjqLiSZr21JtwWmRp69Jc1
   +Ue0sFvg/ZN3rtbWzUejhLwdclisRuQG+wlHhB3JouYruGQc/PfkLRVn8
   aYxDFq5VLlctm7JBqzlRZuOnmM1KKMd+PwPf0qL8ECMBeptbmHP1IYjjk
   FIgU5U78gAnHa5Vq47A/Fo2ud2qj98g/JV6qlpCck5tp9H6FSlh/N/4WE
   22bqsIYfXgo1dcmZ39jb0IpWGFY89oOlHY7JVzlTBSZRpww0LeZftYjND
   vZE3ZToY5Qmghbh6nNqJl6lUh+M53oUZ9t7+I5coI97M2/rVzLd2EyckC
   g==;
X-CSE-ConnectionGUID: 8vsgpL6VTwWCVQLLxj0/wA==
X-CSE-MsgGUID: RAdqJ1+nT8u3Kz6/TV/Efg==
X-IronPort-AV: E=Sophos;i="6.08,192,1712613600"; 
   d="scan'208";a="37075690"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 May 2024 10:34:13 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48DA91637E4;
	Mon, 27 May 2024 10:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716798849; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=T2u4zEaRlGBpo4Yx+BpIMgm18+yuNbm2IErR00tf+e4=;
	b=BrBlwXH+vb0bJYpSEVvH44dcHo2m7o4ZlufZo+JWmxaBrttOwlEfpW7KeO9P6LfqaqnfCE
	tnta6HaB1ohjmBzMEtiRSS82j2RKlNiIRF/WvNZB6wPhSA1R4ckr01I6uQ42p2k8HcAdUv
	gO30Fols+6nJ5tQcIEoUW7jr+i3+3rlX91fXaill3BZbpOIrWNangmtkoKYOY4ga7jfLt4
	yBw/hqlBMOBEYLnF2LK+o4zU26vfR1yplKurEf29Xr/o2tquS7KT/WYewuVuAssgphLxpz
	WIeXD4BqXBgsW2tv8uE6XEKpzRuUFjQoCuYQTnDD7pHL4pXKGEgSjH1rlv20Qw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/2] arm64: dts: imx8mp: Add imx8mp-specific irqsteer compatible
Date: Mon, 27 May 2024 10:34:02 +0200
Message-Id: <20240527083402.30895-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527083402.30895-1-alexander.stein@ew.tq-group.com>
References: <20240527083402.30895-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

i.MX8MP irqsteer has power-domain support, so use a dedicated compatible.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 8eb9f24007d00..fdaf7d5314384 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1996,7 +1996,7 @@ hdmi_blk_ctrl: blk-ctrl@32fc0000 {
 			};
 
 			irqsteer_hdmi: interrupt-controller@32fc2000 {
-				compatible = "fsl,imx-irqsteer";
+				compatible = "fsl,imx8mp-irqsteer", "fsl,imx-irqsteer";
 				reg = <0x32fc2000 0x1000>;
 				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-controller;
-- 
2.34.1


Received: from mx-relay68-hz1.antispameurope.com (mx-relay68-hz1.antispameurope.com [94.100.133.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5CE328B6A
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771422904; cv=pass; b=kPY+E0aWYjumWfiChLRTCl2EiDKJJkDb0aLoNqidZYNBWpCfhgCGbWOYlxHVFl+K5asN8LPXlpu10e5W9Sb/PpoUPvFRrMkbGWJnTeIvBvMhwhcfw5ebQlTf0kEeSAsDpIvQ3O94u95CZQbhZJCQQR4+Y+7IP5TJ9tFRiZWSET4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771422904; c=relaxed/simple;
	bh=zlYmR5pqQJ626KZtxqq2zRLEQk+zc3UZYmpHkkXEaaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gj/ELNgSetgoAYC1w1Rk65qWgUGkmM/ko3efkMQsGaCLCone4PeTTjQeLx+kPLPzUeCvaKE3wMoqV9V8zEJWbHhaKhEz1JInLwNcSsvNIE3q/bNdNJAY6aO/j/g1vthhsXLcoo9Gn4mv4MXkh7efHo2I7xvsdHUgOWtFogi+GA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=A5GKAQha; arc=pass smtp.client-ip=94.100.133.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="A5GKAQha"
ARC-Authentication-Results: i=1; mx-gate68-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=q+Tm8R4GAdM0m4OtqwBsV1ejjLiRRji4g58Lasi7wdg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771422881;
 b=smPLF/MMwHsVuA0JgN6VA5N+/LHh054XbKcGG/4RAvW+kJfbjZK9Gwm198YEuuf/UzTS4Ujj
 jU/yOHHxsE81R/Yi656JiIb+B1ksXzSOcC+JMgd9cMz5jEAdYNS3keCEQOJeJKr7ZBFsW2VRHHM
 8PiFy5jvTZ+YeNzW8g+5syelrz7SmQ76rI3v94C5BNESzq5UvXgalow98CQ1up0dRTy5vxhKeLT
 wIX+qBi5iyic02wVKMijAobvcty0f0QFhktBe4B9hOrXaEp7EzN72E5nfZkAzWCFWDHQevvHCx2
 8GR8jSPyTx5vOau9o2IJDpulgxJDLP7tsVNRRKo4FerYA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771422881;
 b=YBhoJ+sa75ScfBWmUj/YOubbf2i5P3Si0Sqhqig2Mu9/NgKKbb/dQGz9meUFZ4iWmrN3Bsuo
 MUP0anbIhDl3x/H0Seil4TtHJEvZgnVCEDUXCEB588aUkoQenbmn6x7iS86FRkAKvQVKNukABNk
 DzoThm1yc4xeKHJxFbm+m/TeR5QV1ZtEkyaof+rPFz8S0RM6TzrMxSUZ1QQINoaum6ypDegaN2Y
 b+Rc2CVOk7Tf0Frz47tLyZjzQCdVhOSiriuJ38aDoH8cWNI/UvvNCS6hvK08H+UmC3WnJfEQ+rO
 8AkWEz2LKx1e18YQluwvG/bFoE6ONqpfO7rZmtDHhVo2g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay68-hz1.antispameurope.com;
 Wed, 18 Feb 2026 14:54:41 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9E361220BD7;
	Wed, 18 Feb 2026 14:54:28 +0100 (CET)
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
Subject: [PATCH 3/3] ARM: dts: imx7-mba7: disable boot_cfg pins after boot
Date: Wed, 18 Feb 2026 14:54:14 +0100
Message-ID: <20260218135415.204974-4-Alexander.Feilke@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay68-hz1.antispameurope.com with 4fGJ0P1wlLz32CNC
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ce6b24e2a0fcff62cc441489d1e1fb3f
X-cloud-security:scantime:2.173
DKIM-Signature: a=rsa-sha256;
 bh=q+Tm8R4GAdM0m4OtqwBsV1ejjLiRRji4g58Lasi7wdg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771422881; v=1;
 b=A5GKAQhasQVdaGHzNOOUhyPebDwR2/VNSJY5h6C4b1U8y5C+qDiY/2Wkl8l9cTJruICArAPQ
 n8sZhMKortCDGVYZr8k34vaKccV2vbzEOT47pimio9G5soRO+Di6oRo3W2qmU3aLVz0Vq7JulST
 i1E+AVMcEnrCkxtAs8mFCefJAyQHn5PGSM96O/E4AZZr6IF5uE9P0DZNjexEj3u5QhlEG2ysCTl
 FfoBMUfhS6Wys9vRoC8HzyFUAcPD26e3XmjJ45MVixDUhWm0jMdJmBEzJKgeJ0DgU84Bgz15f5r
 6/47tS6yd5i+pcxyRtZwixpJco0gDK6dt9NBmb7WpY+2Q==

The BOOT_CFG pins are located on the LCD bus on our starterkit.
Disable them after boot to separate those signals.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index 03f2f2cbdfbc..4192adb27223 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -287,6 +287,15 @@ &flexcan2 {
 	status = "okay";
 };
 
+&gpio4 {
+	/* Deassert BOOT_EN after boot to separate BOOT_CFG circuits from LCD signals */
+	boot-en-hog {
+		gpio-hog;
+		gpios = <3 GPIO_ACTIVE_LOW>;
+		output-low;
+	};
+};
+
 &i2c1 {
 	lm75: temperature-sensor@49 {
 		compatible = "national,lm75a";
-- 
2.43.0


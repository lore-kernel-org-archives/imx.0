Received: from mx-relay93-hz2.antispameurope.com (mx-relay93-hz2.antispameurope.com [94.100.136.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6492E093E
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277642; cv=pass; b=D5wEbO2Rn1hNARRW3RRy56y1N4gl5mQtXLyW2SmOZqGq3c1q5vNesHGSV34CT81OkQRJm7qHmLN1uh+9kuvTgCjpOr3SVQp9/HwG5kfU0jLIfW8naqIbBMAcNwp8qlyXYa3I/b2UR+OnSoPFxA4JGl4mdQLyfXmz7Sc6n0IKOVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277642; c=relaxed/simple;
	bh=gLOKZ+MkdH4N2hLjk7nJT+UlcMAPrO4IXvoE7pnJDDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Acn0UgAvrmWW30KHrDBDroX8Ki2+WSi5R9HFhFxqPWn33/MduVorCN05jDA3Jp8+2IjdQGXctf4ILvucamvHN9sFzgm9oLIPgvMtADey9AIokDOx54Oh0Pl374hliXvI90tbhDiEqWUrnVdu/9GOjmk2UMe3SRTP+WnWl+630IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=QNAyd3pI; arc=pass smtp.client-ip=94.100.136.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QNAyd3pI"
ARC-Authentication-Results: i=1; mx-gate93-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6EdOKfzZ01O67SP5Ml+fXS/xdGTFEoMvJNRoq1JoWc4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277619;
 b=SFc8hFNVEDyBDs5U2we0fOxDOzSSfUHolaZvQGMExjRZOVf7h2dqcng5Qpd0vlQQ78+s4ybv
 8lM/qvhFIUw25gY8XMLUTqpqswyKBrVmSFZgFYfdj+YX9KwmOWBuwWWCLiJNXuMIX/gqCAMeVd7
 pb/YUO7uM+Rdrx5tRSfzMfsnr1GYQ6rBopWWmcSOEFkztt5xUXc/RMPCcoZspaimqkGcHQ9Jujf
 /DDB0X1kT6x7xCFThATtW1qzDAY3IBSyltNn6TZYajgabLdxa0pdrZO0b0/KP8mSGS97mC7+oOJ
 4/sD4gOS1OYIWXk61eFrpxaSusKB5TINDzAYeK4WwWv8g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277619;
 b=pZTR5AgYm0AKWIVzvp2pdyQaRsh9KAJzu9BbASJmhOvy7Q1hs78TFdJrEmfmtjGJck/Zpt4z
 jqFIn3Vp1eAVZrDXdrpwyZ69/pxDdw6riKN6x91bZ21UqfAkEl6TlNY8wFIMHtrgLjEoQJk9rc7
 HPAt3kfoBH+wKOs6Vis4irpncwAHlpXnpJL8LLKu3G2UGhgZQ3YCp6qspGVtTwh/BfhsQCk1Kya
 hdzodWpL+UR4t09Ygx8BfX8GaF9JyywrGYc/SBSZOyGEyVgLUM1+GqHy+0zwZV1ctQoxORW63ey
 twyjuehq5PE11s4n0DnUNv7tmLQmUGGkhjmCVAjvOMWzg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay93-hz2.antispameurope.com;
 Tue, 09 Dec 2025 11:53:39 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D3D6DCC0E95;
	Tue,  9 Dec 2025 11:53:28 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control settings
Date: Tue,  9 Dec 2025 11:53:13 +0100
Message-ID: <20251209105318.977102-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-body-digest:e54c6801c37c73ffbc98dcd4d28a370f
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay93-hz2.antispameurope.com with 4dQbLK45Kmz4QZMg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:357d07ff5100462428c8535adff74f8f
X-cloud-security:scantime:1.955
DKIM-Signature: a=rsa-sha256;
 bh=6EdOKfzZ01O67SP5Ml+fXS/xdGTFEoMvJNRoq1JoWc4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277619; v=1;
 b=QNAyd3pICC6+kuWzS17tZlh6YC5P6ZWUsSbDJGqsP7Ym8IwQpFm16kk6L78+ishZLdvrf/H0
 wbgS1JXwI5nYWFPvW2XtlxqSnDNcBGAGpZa1B1Dr23SdoPgoSwqhvXZD1AAEjcdNVeehWgfP1Gl
 PytksK3LPTOEYHWPFhA9V1SYQhv8ml2Mh5BS5NbGHyq6j8ShB7d5Fv3htfR0YI4J6lecvVRBO3Q
 cozTvCRkfA7HqAgV3X1be3rArqJwL9y7FUAb7RIRRPJv28aiXVS68NTfcltdsdCuddpzriIogqI
 s2wfxA51sxA9oe4mmEEEXvYgOzvvi2Xuz7djhGhAcvjgg==

As per datasheet of the HDMI protection IC the CEC_IC pin has been
configured as open-drain.

Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS314")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index 67fe1f63fd93c..30f0e81c4be00 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -704,7 +704,7 @@ pinctrl_hdmi: hdmigrp {
 		fsl,pins = <MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD	0x40000010>,
-			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000154>;
+			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000030>;
 	};
 
 	pinctrl_gpt1: gpt1grp {
-- 
2.43.0


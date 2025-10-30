Received: from mx-relay94-hz2.antispameurope.com (mx-relay94-hz2.antispameurope.com [94.100.136.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8829B2620F5
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832507; cv=pass; b=fNl7FNRPH7/nKZnSJ6E1FRaRB+jxsIQI/+7YOHTzNqYqtxXDLZR9b0iI+35iuN9+WeK/74bw3jJnb7AU7hvRE1jZOAOXOGpKTk+aGTU2V/9oVeRYHU3PnO5vYcK2SxWF9m73BVCsiFsFUA6Zl5ENNAp1Q0uLJ0UTmuMW3O4eRs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832507; c=relaxed/simple;
	bh=Js2Xlt1TcksUkzr8bWmp3YdEt6kTQ3aB6Ws4q1qzjx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KqQDr+DpP8PGcOJRbyDewsg/X4Dey7PbvtaksNeJBwymUTZaOcUfPVDnYRggarjbWD49syFQSCxYMBq8n8TgDvoaM09U0mso18B2iAcVynioYcEljpwNqc70qnCKhhnaZz5m6yQs7zJncCRlnFEL2fQ7/8JFk8liiSfhCOOUJpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=a2miSHL1; arc=pass smtp.client-ip=94.100.136.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="a2miSHL1"
ARC-Authentication-Results: i=1; mx-gate94-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=OgKqByS2/RO1SRU9MW5M+/ddL3PnmL8qHsnqkvfLvhY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832412;
 b=NSBFHlJBoRdzUflL9NpyD1vwJxL2mKXTmw/UAVXs/IUS+WufDGF3tc8ew8HxPihEpH5k0YHF
 wdRSQVb/UkbZQCd0KTKK2jtouers2m705OJRohzf8Ulp+BU7u0WLqSJ4NQI9/uvtD2ppXGeY48A
 ZNkGdiCAECmbYHjLKUdQJ7dH3v6UOSjSx5Wt21QbFMtzO3mDEej8SKWiKe1W1HF4DORUDfp4l4f
 UEFsoHzaIrXtUkpJRiV+XWKfjpFvMA7aXPKO1Edwp4BUAYxgY/9FQaubB/CSrDlLconuUUtlpL/
 9eQISeuChwBAvXz+U9J8M2CF3sXckYxNNcPv1y17FAjLQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832412;
 b=Et8aDBfSa+YW7FCu3rdGu+Eb5uCCUHb2TeF6no14as97mlD/DBaveEQnVygpeVfmcnjo68xM
 48UJ56gq4i2m9oQj8SkLxCvht9PRaCsp/FONb9lLnT1Kx0WT0/rE6xpZhxhndCZTDOI/yUp4x83
 bHmOw9dnJtpzSht+dSo08uu8MkTqo1yLKFH20cd4781amdS0vY8m6GDNYjMUkV8t/7x7M8p7YGV
 ZEbMfq49OlPBdIMhNX8Gt0/ToD0JtxcSBj5bSDA//oFA3lR40/wZ8MATaYW7/3q4RMl2jLbiYI/
 JfGDQ9zxcCYnzL0jTp0spMFu7wyeUR/3O0kxye+GLEeFA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay94-hz2.antispameurope.com;
 Thu, 30 Oct 2025 14:53:31 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 136855A07D3;
	Thu, 30 Oct 2025 14:53:14 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/19] arm64: dts: imx95-tqma9596sa: whitespace fixes
Date: Thu, 30 Oct 2025 14:52:56 +0100
Message-ID: <20251030135306.1421154-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay94-hz2.antispameurope.com with 4cy5DK3v73z3dGQg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:783d95388d58bfc72f1c3cb0f6f3ac9e
X-cloud-security:scantime:1.915
DKIM-Signature: a=rsa-sha256;
 bh=OgKqByS2/RO1SRU9MW5M+/ddL3PnmL8qHsnqkvfLvhY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832411; v=1;
 b=a2miSHL1kIofURy+OSNj8mT+pCy83fXA/vEPMHairpB3AJdIGUbYsCjCW3B/G2z8c+B+GxdK
 oUaER7BXusa+QU59j9tDs+6Xa3qpdvOA6NhpUVaSEgN4BfP6lGvzApU8pznAgJAZBYNri84B7ny
 WOCOMkQmyd0uSJDH917ZtTNduoPQo0rZjkSelHWqLai8aQgAqJQbqQIsqmkA+MOAoWTgR8zguyd
 hDy0EA17XHco82tkyqpy8sYDaou2Cv92c6impfraA5cbr3l1Fgo0dZQzbyeFhnfgnzveS6pVhde
 52Yu1IYVt0AhOwuTnYggcRupABVrrgmauehlY+BsintSQ==

Use tabs instead of spaces for indentation.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 9c892cd8ff215..a4c6083ab43b1 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -621,8 +621,8 @@ pinctrl_lpi2c3_gpio: lpi2c3-gpiogrp {
 	};
 
 	pinctrl_lpi2c4: lpi2c4grp {
-		fsl,pins = <IMX95_PAD_GPIO_IO30__LPI2C4_SDA             0x4000191e>,
-			   <IMX95_PAD_GPIO_IO31__LPI2C4_SCL             0x4000191e>;
+		fsl,pins = <IMX95_PAD_GPIO_IO30__LPI2C4_SDA		0x4000191e>,
+			   <IMX95_PAD_GPIO_IO31__LPI2C4_SCL		0x4000191e>;
 	};
 
 	pinctrl_lpi2c4_gpio: lpi2c4-gpiogrp {
@@ -631,8 +631,8 @@ pinctrl_lpi2c4_gpio: lpi2c4-gpiogrp {
 	};
 
 	pinctrl_lpi2c6: lpi2c6grp {
-		fsl,pins = <IMX95_PAD_GPIO_IO02__LPI2C6_SDA             0x4000191e>,
-			   <IMX95_PAD_GPIO_IO03__LPI2C6_SCL             0x4000191e>;
+		fsl,pins = <IMX95_PAD_GPIO_IO02__LPI2C6_SDA		0x4000191e>,
+			   <IMX95_PAD_GPIO_IO03__LPI2C6_SCL		0x4000191e>;
 	};
 
 	pinctrl_lpi2c6_gpio: lpi2c6-gpiogrp {
-- 
2.43.0


Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1622D6E4B
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 21:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766525737; cv=none; b=ch/6J/dlnsLoeWBpeOEU5lHyEgnH6PqHdo/sA+mzvX4wURTEXfl5YzfF7rAsZ9TzB6ZnE81jUrtXpdTRCa9OBziOa2b/4NCWLJ1lEANm0SZmwGm1xtyy+oWpNxLfCFFzhkh8bkiZckA5QNDQBHip4PbAZGCTI6MdeQqU6B9nFvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766525737; c=relaxed/simple;
	bh=4LxVzoYiZ+imSrOKh/GT1oH8ji6K+fpHnPRTQVJteRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvg9PQbweaejpVU6a7At5KW28pvr7uufovYNgtw5hFJ81POuCCt8Scmgv5bHtYOFOxLBYu5RSDPyfnFrrwUX0L6DqihbnLu7IRpNYQKTVabge5ynBW/m519kl7X8qZC70Wya8Rd9z3dsaYNrARfLPBlBD+ShtZvWzkH+6ygxTVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=9cKGKIlt; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="9cKGKIlt"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1vYA2Y-00000003SSt-04IL
	for imx@lists.linux.dev;
	Tue, 23 Dec 2025 22:35:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mhrIoXouXYs4DJFLD2MmLh4WIXwwUc8JqcYdOTRcOos=; b=9cKGKIlt2MeEKd8kxKur8Uwb0/
	3FnjnIFaeQgivS3hca7eFsDYB/F3IDB6uldNIsQB9JTqD+eWzpSqu31am2veeiftzkXX2+UHo2KsK
	b+KtxS+zxAw3BmFphllnMn6uMVa1Z5ToT3drTTcegcynDw7+zXhtebwBEaox0xN2/+9QvDi4IfX1e
	C6+/kCy9+nghYPmGDgb513CrGVEFw448UzaDOgDzaKYP/pUk4+IMhjKuAO12+d712hbmboQ70dWVW
	1IaB/f2ljAChOFSTqgRJ817ZuWUC8cn4K6r8F0lV0BuFfJ2f35FHLD5f/Uoaov4iFiWjscQ6Va25Z
	ODt5CsUA==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Tue, 23 Dec 2025 22:34:03 +0100
Subject: [PATCH 2/2] ARM: imx_v6_v7_defconfig: enable EPD regulator needed
 for Kobo Clara 2e
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-fp9931-clara2e-v1-2-e5b1cb79330a@kemnade.info>
References: <20251223-fp9931-clara2e-v1-0-e5b1cb79330a@kemnade.info>
In-Reply-To: <20251223-fp9931-clara2e-v1-0-e5b1cb79330a@kemnade.info>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=718; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=4LxVzoYiZ+imSrOKh/GT1oH8ji6K+fpHnPRTQVJteRM=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJneXH9sMs8laIg9D2za8Mtx9UT56aka3OfmfVkpXblx6
 ardkzz+dJSyMIhxMciKKbL8slZw+6TyLDd4aoQ9zBxWJpAhDFycAjCRtAMM/6PrFwvnsj+skb78
 eJOmsKVsXK7+0sa3X16+6Jktefjioy0M/52VTVX1bsju3Sy34pCPjvsJjTrmranVD5pWlK3/Wrl
 qEzsA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Kobo Clara 2e revision b requires the JD9930/FP9931 regulator driver
for the EPD, so enable it.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 0d55056c6f82..94ef23b272fc 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -251,6 +251,7 @@ CONFIG_REGULATOR_DA9052=y
 CONFIG_REGULATOR_DA9062=y
 CONFIG_REGULATOR_DA9063=y
 CONFIG_REGULATOR_GPIO=y
+CONFIG_REGULATOR_FP9931=m
 CONFIG_REGULATOR_LTC3676=y
 CONFIG_REGULATOR_MC13783=y
 CONFIG_REGULATOR_MC13892=y

-- 
2.47.3


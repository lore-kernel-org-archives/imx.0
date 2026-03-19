Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED093C3C19
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921255; cv=none; b=GmwJAJBu1WwIpDngTrsYQpBiWNw+eoGz6+/ZCQIK21BZSswEBjVU2fIV4FIDGet1YSdDYvEFf5MlEeqad51t+34Q4qIzv6HLbFVchSWgiiY1xUWfTtrKDksz0CBVfOtYWOXBpb9vY5DxsFIe1AlznBltrnCb3aYuvnD4etR3Kmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921255; c=relaxed/simple;
	bh=xYK/Vxt+uVywhLIFh8m2CgSQfgWK8Ak/1VpZKfinR5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XDkfhtkVKOcNVreI+gD93HGX+aheS+Ms/zuj57lXXutZiQ9uHIapuD4sXr3JyuggyAAxZHG3StqBIRrowA/iTR8jktUUdIzzYRuMB4cne+oPmJJ8D5pDqXIhfVMPYwt5K4bMR4lg1w5KwDDAroxpWGbiuqoIdFQpvvwOCA2PDLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 10210C3EEAC9;
	Thu, 19 Mar 2026 12:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 10210C3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: i.MX8MP: Fix HDMI LCDIF FIFO underruns
Sender: khalasa@piap.pl
Date: Thu, 19 Mar 2026 12:45:40 +0100
Message-ID: <m3ms04caaj.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Running (and terminating) Weston on i.MX8MP sometimes produced black
or grey screens. The LCDIF3 INT_STATUS_D0 register showed a FIFO underrun:

32FC6024: 1000002

The PANIC0_THRES register was set to:

32FC6238:  AA0154

which apparently meant low =3D 2736 bytes (0xAA * 16 + 16), high =3D 5456 b=
ytes
(0x154 * 16 + 16).

With this patch (based on NXP's driver) the watermarks are only 16 bytes
higher (register values increased by 1) and the underruns are gone.

Tested on Solidrun Hummingboard Mate with a 1080p60 HDMI display.

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -353,8 +353,8 @@ static void lcdif_enable_controller(struct lcdif_drm_pr=
ivate *lcdif)
 	u32 reg;
=20
 	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
-	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_MAX / 3) |
-	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_MAX / 3),
+	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, DIV_ROUND_UP(1 * PANIC0_THRES_MA=
X, 3)) |
+	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, DIV_ROUND_UP(2 * PANIC0_THRES_M=
AX, 3)),
 	       lcdif->base + LCDC_V8_PANIC0_THRES);
=20
 	/*

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

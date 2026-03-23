Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E78629A1
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 12:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270491; cv=none; b=IFWV6VZO5v2ZRSA9o/0n0KMYv7hl7CRkWhmUimf9ximMM9TPN1B2Xc3S9zTHo48MfnUKqzcSIzY/FOs5/8g8H0hHOY1qVB5FQkvU+4N9fecMJ9TATMnOY+W3wyECAcJ/72/WjKMkB/qlLaVb6Y8SaF7Wvh07XYeEdyUD0QuE0Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270491; c=relaxed/simple;
	bh=EeEZBp48R9KwYDvG4fDKiPg79sFhVSKHCu47Mf/8i9s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PIU0XA/f8QLyP6fPJ1bvGMsE7wFoGN+Bu4pBoc8QONRS3YoU/MyVYN/a5roSxy9MegQXbCa5R/l7IngE2b36EwD7fBTKr/bRpY3wS7RhEBvRu6v76v+lUNpeR4uhnUelPX9hbjxsfs80rzDB3hAyD3ubJXyBrkIHiGAZe7Rz+NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id AAAAEC3EEAC9;
	Mon, 23 Mar 2026 13:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl AAAAEC3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maxime Ripard <mripard@kernel.org>,  Marco Felsch
 <m.felsch@pengutronix.de>,  Marek Vasut <marex@nabladev.com>,  Stefan
 Agner <stefan@agner.ch>,  Simona Vetter <simona@ffwll.ch>,
  <imx@lists.linux.dev>,  Fabio Estevam <festevam@gmail.com>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Frank Li <Frank.Li@nxp.com>,
  <linux-kernel@vger.kernel.org>,  <dri-devel@lists.freedesktop.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  <linux-arm-kernel@lists.infradead.org>,  Lucas Stach
 <l.stach@pengutronix.de>
Subject: Re: i.MX8MP: Fix HDMI LCDIF FIFO underruns
In-Reply-To: <ecd02f87-c4b7-44ed-8ecf-98e0990af34a@nxp.com> (Liu Ying's
	message of "Mon, 23 Mar 2026 16:18:55 +0800")
References: <m3ms04caaj.fsf@t19.piap.pl>
	<32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
	<m36pvjbo4xy2rtdymshjpmwu7icl3wlyiwcmmjaozo7jpe5lqk@zt7byx7iwmym>
	<20260320-amiable-hairy-bullfinch-28bfda@houat>
	<m3a4w2d4ds.fsf@t19.piap.pl>
	<ecd02f87-c4b7-44ed-8ecf-98e0990af34a@nxp.com>
Sender: khalasa@piap.pl
Date: Mon, 23 Mar 2026 13:54:37 +0100
Message-ID: <m35x6mpuya.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Liu,

Liu Ying <victor.liu@nxp.com> writes:

> If you may use a display mode with low resolution, say 640x480p60, and
> the issue still happens, then I bet it's not related to the panic
> threshold settings, but more likely related to KMS detail control seqeunc=
e.
> This reminds me that Lucas had a patch series[1] to try to fix the
> sequence, but it seems that it didn't fix i.MX93 LCDIF according to [2]
> hence no landing.

It seems it depends on resolution: at 1080p60 with the DIV_ROUND_UP
(thresholds increased by 1) it seems to work fine. At 2160p30 (twice the
clock) there are frequent underruns. Now with thresholds increased to
2/4 and 3/4, weston started fine 10/10, while shutdowns were 8/10.
4/6 and 5/6 made it worse, though.

I don't know now. I will try to investigate a bit more tomorrow.
Perhaps the sequence of register writes could be better, indeed.

The following doesn't fix it for me either:
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -358,34 +358,27 @@ static void lcdif_enable_controller(struct lcdif_drm_=
private *lcdif)
 	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
 	       lcdif->base + LCDC_V8_INT_ENABLE_D1);
=20
-	reg =3D readl(lcdif->base + LCDC_V8_DISP_PARA);
-	reg |=3D DISP_PARA_DISP_ON;
-	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
-
 	reg =3D readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
 	reg |=3D CTRLDESCL0_5_EN;
 	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
+
+	reg =3D readl(lcdif->base + LCDC_V8_DISP_PARA);
+	reg |=3D DISP_PARA_DISP_ON;
+	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
 }
=20

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

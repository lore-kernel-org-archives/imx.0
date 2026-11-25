Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629101;
	b=n5AIn/t9/qbUaUuPgBfMg0XFC13kgVjqNHId8LyZDBkfC8pS6C/Fobwpc2vXMLIGDKau
	 BEeTNRbC//g/rHiB6xkxgor0ryuzcteZfd7cHO9+GKlBFpO6OGHM6sYZRbJaP10cSigcV
	 OXqSJY95Ttm58fJmtmz+fGs9ytKFEEJcY+08dI/ZyrTUZ5ouoCWFhBHctjd7HrBXTW/uJ
	 7gIhuuUFDV7/mmDiquSX55lY1eKdWyczYOyflZj29agJWtXWiaExntBzHDkwFllxDfhgs
	 N1XTy044zj8q478nMnA4yUpoAAhA1WOwDji+q9H8X3D49aOFjO9LgvU1sM9B9hwUA6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629101;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=xMDGdQQqSK1PYacGJc8PKE4CVLn0Cepep5ypo7GFAAg=;
	b=zHfxgMeNv6TE95SVVEwyMShI8RPiMTpUphzLBypTD4k20aqCmcV9jgWM2hbvYCSd6gyf
	 JUt5MdGTRKZ4s+4HqjetirOCmsSrJtuBohupdzYObINEDZ6xONLkF4JzP90YTO0zK/Drb
	 aKakmuAJViDmjuzYLu65AT0Iu1Mzin4VMI+4Iskznf2lbF1RvxDMSOdic9D8AJD3o39hT
	 7Lc2EewQxEn2uRzkyYyRYKpiqNFOvvFUDVU2WAKSSO8vW0YPwNS7J8Zcy2T65A1JsBnso
	 L0jHEpP9h0iYfjn9HEPVkSHvS9wb5BVKDpbUOvrmCsU8OeG0S7N5kujsk3UQ9DkWTiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A80EOuAo;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5A3606A334
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5A3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A80EOuAo
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 969C64E41783;
	Wed, 25 Nov 2026 17:51:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6418660480;
	Wed, 25 Nov 2026 17:51:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C85111E6B0C5;
	Wed, 25 Nov 2026 18:51:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629094; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xMDGdQQqSK1PYacGJc8PKE4CVLn0Cepep5ypo7GFAAg=;
	b=A80EOuAossSMzXLJrPrBNLWKg59cTm9hWH8I1/gEjwI1086BPf6mUT/IMYzGKE1Kpat+q3
	NzW7UKoqIhFc1H/KCt5BVEInecl7Wj7igF7YEmX12ZlEf+m5jy4ZhGTR1+sTkjjPtAd9fT
	X1+dZJQdpTmvGvnVlGUoN+oEYWW44PRAS7Z4+67PZu7i5A/fdZBvOICGV4neDh41fdgpgy
	dioIW0PfG5FqnF4t1ZYKkpOMLBbpfufuPS7zKUOJ6wNqmzrNT24g4VOSuFNSCAPkwafthj
	8vYDy04V7larmzAk5ZSjgH2BG0Lh68HsSsjwtnDP7wqMRCoqaHASdb7CHlCK6w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:21 +0100
Subject: [PATCH v4 08/32] drm/display: bridge-connector: hoist error
 management to common code
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-8-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
In-Reply-To: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

In prepataion to add more error management code common to the HDMI and
non-HDMI branches, move error management to be common to both cases.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 19cacae617dc..f4a71801e8a3 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -1057,15 +1057,13 @@ drm_bridge_connector_initialize(struct drm_bridge_connector *bridge_connector,
 					       &drm_bridge_connector_funcs,
 					       &bridge_connector->hdmi_funcs,
 					       connector_type, ddc);
-		if (ret)
-			return ERR_PTR(ret);
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
-		if (ret)
-			return ERR_PTR(ret);
 	}
+	if (ret)
+		return ret;
 
 	if (bridge_connector->bridge_hdmi_audio ||
 	    bridge_connector->bridge_dp_audio) {

-- 
2.56.1


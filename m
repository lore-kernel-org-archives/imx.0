Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDEF3E63A6
	for <imx@lists.linux.dev>; Tue, 14 Apr 2026 13:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776171898; cv=none; b=Tdzy/Q4xK3ehw7buaO+0bmlIKbixJORmzenPbUtEThKfMMNe4M6+0szJh/RTyO6dkBzGFG6NWh98GnqrNyfnFlwTWRSpPCS5xL21G/IPGgSQ8TCCzXu9zjmqLijosjSvfKuAsPjkFXoUwpXIXNriIb2dHEwI5VvR1O1NI8Y/Xtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776171898; c=relaxed/simple;
	bh=kXBYo+kPV6NrWZ8XAKJKjYVt7vPNYnJ3wtjNDm9aFYw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IORmKTkoXuEDdzCCBs9EswpZ9Pij3l3uLYx//4Wd9/HACtaUs8RJkOoEHFH6IXUnF9QzR3kUkc5npO2qCTSgBVy4PZG5Tl4qB/roB3BoDboOiTWADfG36b6v5z2MGt7Xb3bBZHjkThdXgeUUX/iEDvaHuHkKP4vrB2pBNIiutQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HGrvT53l; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HGrvT53l"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 395071A32A5;
	Tue, 14 Apr 2026 13:04:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 011F760410;
	Tue, 14 Apr 2026 13:04:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EF80104510CA;
	Tue, 14 Apr 2026 15:04:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776171890; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sMKnxA5wkmaVbtom69wdESxTucjweg7sLV3hUwlQi7E=;
	b=HGrvT53l9sLI7ttKrxv7GVp/UERYTQTVQX+6QvIByWYTSrqwRlc0+rzD770Wc2fXJwbYET
	hN35pWhig60ourC/nacGmD1pwtBa37lJrx3h+VRtmUVNlEqMx9Onw5Be/wlop/QHp/BN/+
	ccDfcgH9m62JkuHeygKSz+WaV8wj4s4zFKQE4fKKpXhesBs6KZmGAkgkX5PDMrP3yfAPmt
	xL5DzQ4t3xk3zFB9PjtnF4O0dGYMfR5nHdKRoi7mhjc0YLw2Y4/aYK09mkZ+Ole+PyaJoF
	ZgUgsYFwngw+lrpegisH2aOkHtRKyrLlpFjiestSl8UBQhR7DvNa8pq68OgrOg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Liu Ying <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Damon Ding <damon.ding@rock-chips.com>, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Fabio Estevam <festevam@denx.de>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Gilles Talis <gilles.talis@gmail.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 Heiko Schocher <hs@denx.de>, Josua Mayer <josua@solid-run.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 Richard Hu <richard.hu@technexion.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
 Vitor Soares <vitor.soares@toradex.com>
In-Reply-To: <20260407-drm-lcdif-dbanc-v4-0-247a16e61ef9@bootlin.com>
References: <20260407-drm-lcdif-dbanc-v4-0-247a16e61ef9@bootlin.com>
Subject: Re: [PATCH v4 00/11] drm/mxsfb/lcdif: use
 DRM_BRIDGE_ATTACH_NO_CONNECTOR and the bridge-connector
Message-Id: <177617187564.817159.6628977023354785525.b4-ty@b4>
Date: Tue, 14 Apr 2026 15:04:35 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3


On Tue, 07 Apr 2026 14:24:14 +0200, Luca Ceresoli wrote:
> This series modernizes the i.mx8mp LCDIF driver to use the
> bridge-connector, which is the current best practice in DRM.
> 
> == Call for testing on i.MX8MP boards (especially those using HDMI)!
> 
> For who tested previous versions (thanks!): some patches have changed
> ingnificantly in v2 and v3 so I had to drop your Tested-by on them. A new
> round of test would still be useful.
> 
> [...]

Applied, thanks!

[01/11] drm/mxsfb/lcdif: simplify remote pointer management using __free
        commit: 1bff813f8864f72528da4e1b389b62360e9c26ad
[02/11] drm/mxsfb/lcdif: simplify ep pointer management using __free
        commit: 23bc92902eddd51e51613790c9c0f9e759fde174
[03/11] drm/mxsfb/lcdif: use dev_err_probe() consistently in lcdif_attach_bridge
        commit: b08bfcbc138a450434e9fa38dfd487f687ae7ba3
[04/11] drm/mxsfb/lcdif: move iteration-specific variables declaration inside loop in lcdif_attach_bridge
        commit: a6bdf27448b49af6a9daa1d081e2f019fb002a4a
[05/11] drm/bridge: dw-hdmi: document the output_port field
        commit: ec9dfa70c2915c2dd3676d674287ee56e52a7ef5
[06/11] drm/bridge: dw-hdmi: warn on unsupported attach combination
        commit: 5316b7464c998357c468fcfe3717be6258330708
[07/11] drm/bridge: dw-hdmi: move next_bridge lookup to attach time
        commit: 91938b4fdc267931943d3e9f1b14d46d2b615330
[08/11] drm/bridge: imx8mp-hdmi-tx-connector-fixup: add an hdmi-connector when missing using a DT overlay at boot time
        commit: 73cb588a6d90849301ef48ac89f3439a8942a890
[09/11] drm/bridge: imx8mp-hdmi-tx-connector-fixup: show a warning when adding the overlay
        commit: 1148ef0c600f641f4ea95b3d8275cc911fd2f232
[10/11] drm/bridge: imx8mp-hdmi-tx: switch to DRM_BRIDGE_ATTACH_NO_CONNECTOR
        commit: 06a2950fef18c0a8a26bee01b9550bf3006545c6
[11/11] drm/mxsfb/lcdif: use DRM_BRIDGE_ATTACH_NO_CONNECTOR and the bridge-connector
        commit: f604819d9cc9532f88bb4cbd76e7227532ce5abb

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84CA190693
	for <imx@lists.linux.dev>; Fri,  9 Aug 2024 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723201222; cv=none; b=b7jy6LharSl7ZhdXxcNubXemc9ktKQKSv2hfIoTL7fgcqqIHxjugRtwdi1E9LOMT83GELTfXMQorvfa8JffjTR71HpspfNMAKoljpkuA+OqIjEutR6tmXnbllxPXLI7FRcRfAB4wiQ2E/Mc/WDLJAP+cfJ5lngqCX+UPhk5WU0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723201222; c=relaxed/simple;
	bh=X58qlnjaSP9ol6S8lkxfsITsdTcjOR4bTv46v2pTVxY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BnBht87wK3NEQYvVchNydv9fJHIwkYBjGdd4G3OwRAVduR3YrrZZGvVd9+uZjm/q4f7cxwz7yuUVSyfJeL3Gd1K6UmFZJuOuGgWlkt+LI5umjXHYG88yEb5uol7Wlo2UCdUBf09MVKcbcoxFArgYlVba2eqwEN/cdrg5lF0+DdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1scNLq-00031Y-3C; Fri, 09 Aug 2024 13:00:06 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1scNLp-005eDZ-Fs; Fri, 09 Aug 2024 13:00:05 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1scNLp-000AQQ-1G;
	Fri, 09 Aug 2024 13:00:05 +0200
Message-ID: <4c974512e5392f2d96ea5e04e909821ad017d6ef.camel@pengutronix.de>
Subject: Re: [PATCH v3 08/12] drm/imx: parallel-display: switch to
 drm_panel_bridge
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 09 Aug 2024 13:00:05 +0200
In-Reply-To: <20240602-drm-imx-cleanup-v3-8-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
	 <20240602-drm-imx-cleanup-v3-8-e549e2a43100@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On So, 2024-06-02 at 15:04 +0300, Dmitry Baryshkov wrote:
> Defer panel handling to drm_panel_bridge, unifying codepaths for the
> panel and bridge cases.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

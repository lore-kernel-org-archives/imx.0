Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50582FFDD6
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416221; cv=none; b=Agt0tl3bjSOQIOpfCuL5BJC2BTGJQuGEfzuvSRBB6HPVwT6e5IIb6Jeag1A/Gz7368bMH95PqX4TduRAqZuCXlxc0hlLDx9Ddfcd1nX35Z74BfuIbQN3+bWqhkgEcjpJLWK15CnC9/kKvckEDC3fbOiRxAZZk1uJKdpxmyMEBek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416221; c=relaxed/simple;
	bh=K0VZgvjYgXw2TwSd56awEP0HWtuv9A0xTzSkbJQtJ4w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Xz8Lyshh8W8cIs6x7IfKG6SAiXJGn7Wr38z1O3c3nAi/RrjiUfNBWGzTWsjX7nvETr36Lquc3LhSpe/PhALWK5vS8DOJttJAEdtr4mS2rhrRLTcELjZ1dhGAOjEWzWdBMt716GqvUdjkbWxTS/Vu0+RGIxG/dOWxfXi7d1QbFkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=om7p5rE3; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="om7p5rE3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 72E06C225BB;
	Mon, 26 Jan 2026 08:30:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0368160717;
	Mon, 26 Jan 2026 08:30:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5AE2119A80E2;
	Mon, 26 Jan 2026 09:30:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769416212; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RL12cC9qRX/ILoBDTmW2NvbjM3xBeSvvr6O9KVeZoZg=;
	b=om7p5rE3iiSwBy9bPPxolkQYErQW/3CDgztw9hO1NsSOzcCt3Au/qjDso2nw8w+QNQWbUk
	UkEzPTb9UlKqYKAvpL9GsVOaEJmKX2fEFmk+4Ee3r8C+8TIZEGPOtwQUjQCU5IUuIMxRJn
	z6LJUNbgR9DXE2ijEVLiBnIy0QbeaKf0++EC+uEC2SyurJMh42AV9e19mKvUjmD8jYiJu+
	+Q+RIwCS/Ip57PyXQdLH/RRv5vnsFKJciIh9RqI4MJYsAnXAeMe5kl8E5oUOUyopCRJ0M4
	/b2bLgC1Qg7JGb+y/8Fu4jrnUwmNHgxUTudw3edMKm+7ysEjJO71Xx6dKBOslg==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 09:30:09 +0100
Message-Id: <DFYDP4W448IT.144L31296M4LG@bootlin.com>
Subject: Re: [PATCH 2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer
 dereference in imx8qxp_pxl2dpi_bridge_destroy()
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <20260123-imx8qxp-drm-bridge-fixes-v1-2-8bb85ada5866@nxp.com>
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-2-8bb85ada5866@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jan 23, 2026 at 10:22 AM CET, Liu Ying wrote:
> Pointer bridge->driver_private in imx8qxp_pxl2dpi_bridge_destroy()
> is NULL when imx8qxp_pxl2dpi_bridge_probe() returns error, because
> the pointer is initialized only when imx8qxp_pxl2dpi_bridge_probe()
> returns 0.  The NULL pointer would be set to pointer p2d and then
> NULL pointer p2d would be dereferenced.  Fix this by returning early
> from imx8qxp_pxl2dpi_bridge_destroy() if !p2d is true.
>
> Fixes: 900699ba830f ("drm/bridge: imx8qxp-pxl2dpi: get/put the companion =
bridge")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

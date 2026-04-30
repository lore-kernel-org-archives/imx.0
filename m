Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9706739F19F
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 07:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533477; cv=none; b=Un4bb0r616EFeoNwo37MtX9bpWXYy/4RcW25+BY5EqTeH30b1nxsnJVm1sXpzyHKAUrvNwjo8Ee1f5G6eIyU9tSSDIsMFhBvpzjYr29aydw/cqVkxTffUeL13sNV4RRYDEiApVNrcjASB1LQq7gOgbclpy9gZMxv/zP9B9FXbGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533477; c=relaxed/simple;
	bh=rCdJk26ceuOoonMtgUgRiFRQEpVnqJsO6yJf69anZ44=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=rtUADLnXdNe+6K08TjiZ3BK9Kd3+lwxdWM1uWNusm+WGybKe/oWl1UcAVWyLhg0ZVC5mn4hC4X0BiDZr8BW9ZaNCEF/jgNFJM8Lczd1Er11y4uvFmQrhWSYHnLaR+Jh2SituBSdTnXE7NB+o46gnvU/2Ro0K7rc7gZ4dDO1Qls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WoOX+do3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WoOX+do3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ADDC51A3486;
	Thu, 30 Apr 2026 07:17:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F51B60495;
	Thu, 30 Apr 2026 07:17:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01BEB10729FC2;
	Thu, 30 Apr 2026 09:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777533470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fYZocCmk4lmGT9EFNgIlV7nk5A86HLgtF421diFCKSM=;
	b=WoOX+do3yybdEoFa7DAreeKsB6INbX37cr/NMH09jHfWInuntO3hyNCUd8njgEQQ/8q/nq
	+tJqUn/Te3H74VIoNZ5vFcOST8/qL1g/4YAgf2r6sXRQGlylKocFF3J6LAxZfyw1O2YE2k
	ACnNoz6aVp83gthH0GjBF7cr8a61DO/As8QDY0cRWoMZTXve+riChb5T2R21uOL97JGRt1
	g/M6amic3c8jEiyHpDiMsR0waP3nAGsxXB4Efw8McSyi6LcdYbMxwRgbkO7xkJgoURjY/O
	VW2OyV2jpCUUZHFAC/66EihwcmU391sA7D+A+/8qIVCX3FFBkJGc5X5u2q1m8w==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 09:17:40 +0200
Message-Id: <DI6B0UNV68LI.3PYKFFB0F1DH6@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm/ipv3: add CONFIG_OF dependency for
 DRM_OF_DISPLAY_MODE_BRIDGE
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Arnd Bergmann" <arnd@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Damon Ding"
 <damon.ding@rock-chips.com>
X-Mailer: aerc 0.20.1
References: <20260429140024.192432-1-arnd@kernel.org>
In-Reply-To: <20260429140024.192432-1-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Apr 29, 2026 at 4:00 PM CEST, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Without this, not all dependencies are met here.
>
>   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && DRM_BRIDGE [=3Dy] && =
OF [=3Dn]
>   Selected by [y]:
>   - DRM_IMX_PARALLEL_DISPLAY [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy] && =
DRM_IMX [=3Dy]
>   - DRM_IMX_LDB [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy] && DRM_IMX [=3Dy=
] && COMMON_CLK [=3Dy]
>
> Fixes: ba2db93cf3d5 ("drm/bridge: Move legacy bridge driver out of imx di=
rectory for multi-platform use")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

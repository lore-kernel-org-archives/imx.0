Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FEC47F2ED
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039434; cv=none; b=X6gJDJUmZCJSweXuMFANoLx5tDxclmK9Zg8vznmriTOEyWs28JxzRaxLBd05jpsl7l3DbbvrAX4/Q0xaXHp8GTraxVtTrt5lyKfR0rQh8W1E7vKLOMbdNg/Mou/q6Jn+Z2hleHY7kbbhNcCWv9jonoC+CbmEz4nDWf01lKxLDGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039434; c=relaxed/simple;
	bh=1acfOVpbRX+/BArPhnPASXAgqYLqIQjqqJEOyp75w+I=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=OCMnyTDkNykgKC37g85lB0hUrFI0hmQNrFzRxfQDC6FJeaNjcFB5e4+6I6Fvda2oy/6t4t9Qqh/2LnkB0SV8ujG8gjKxteblDRUAG8KYp++IVAHcUouDuGPpf4b/27wXTUEgOAvUzsdDLcizfLnhcFc0VdTx6uxyQnroVs1FV3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZujtwIKD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZujtwIKD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DE2A4E40DAD;
	Tue, 14 Jul 2026 14:30:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 154B360346;
	Tue, 14 Jul 2026 14:30:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D39FC11BD1904;
	Tue, 14 Jul 2026 16:30:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784039427; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oH7pV3dzD8txMH8in1lzIVd6sxUWNu5LuUwhK8rbs1A=;
	b=ZujtwIKDUTMvkl70KweYLz2K10Skoqn+1JVhtGLX7eGVBLXxyAHPsXDAq9AAMQ9XMTfmKl
	4HqUN9Sdjcaw3IUD8hfpiOFSvMJHBzHJUE3orMcW1vPqqt91aWy6UqLMU6jo8Ar5soJLVm
	eNxpqrXJUb+3LCuhY9jemItjiSS0C6pRMbugaKKWRIGQslBYUKFwrUF+MtyAnJCGeFREC1
	GBhyw1iklLBg4oy0rDbCTQmmmwU57Nyr5Clq4t181+XqohE+37H2Z2joDYdpPtL0JZoDyq
	csH59Bi7My3zoz6CWnkdCHiqHGol3Z1fPF78rGjhD5hahBIYAPKHgqMbRSRzHQ==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/3] drm: remove unneeded 'fast_io' parameter in
 regmap_config
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, imx@lists.linux.dev, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
References: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
Date: Tue, 14 Jul 2026 16:30:13 +0200
Message-Id: <178403941344.13050.12493561230026073506.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 05 Jul 2026 18:35:35 +0200, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> drm: remove unneeded 'fast_io' parameter in regmap_config
> 
> When using MMIO with regmap, fast_io is implied. No need to set it
> again. No dependencies, can be applied directly to the subsystem tree.
> Buildbot is happy, too.
> 
> Wolfram Sang (3):
>   drm/bridge: remove unneeded 'fast_io' parameter in regmap_config
>   drm/imx: remove unneeded 'fast_io' parameter in regmap_config
>   drm/rockchip: remove unneeded 'fast_io' parameter in regmap_config
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


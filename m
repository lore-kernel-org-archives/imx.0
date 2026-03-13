Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9B3CBE9A
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422448; cv=none; b=lajvfj/4SiEGs/MudZeyW3YsuSKbbgA+mNVlbaDdt0H5y8HWnZkqgW0AwwUSaxWIBFv4Nlxn9HYacCbBjSEzvKfqp0tG8C/NUzCSNSVWLQx/cAx7UNXewXeWSVvL0unziTzwi7oF9YXoQb59vouxCdPvGEfAiTZGoENympxIKr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422448; c=relaxed/simple;
	bh=vzP2F8ldfzZldEuB0zwnw7nG2Tv4Qz+d5X+msxEr7kw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FiCXTSQ3n6f5qomDfS7PkLWh4KJlcTXxDOjL4TTBVqWNZoctQgJhBry3Zq6bmzbdoqyBFd2OfaDLff05dTYH7dVSxpYwOcGhqlCNoAH86HAv2c4qFaNCSphlRe6oxbn5RMQOJPdLb468RIrgIU8RMXcGo/G8i26vfr6rcdsLSiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FQwm0oHl; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FQwm0oHl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3134B4E42644;
	Fri, 13 Mar 2026 17:20:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D338F60027;
	Fri, 13 Mar 2026 17:20:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 981B410368614;
	Fri, 13 Mar 2026 18:20:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773422442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vzP2F8ldfzZldEuB0zwnw7nG2Tv4Qz+d5X+msxEr7kw=;
	b=FQwm0oHlMEBGzEMCKMoMgbPWC9aQXWU0IQHzja3zCZvBOQseFndRbL1FYs5+RZuq9rAizx
	//+bQ4vUk+VzZ9SWkP7XJo02seGVxZL9jR2r/AR1tIiNRI1W5dODW7y+5aQiIZUncv6Pn3
	2EW3aaC2pLxqFIVeJ9W/yfPZphwqkwRzCN+JXWimvguIHFxbwOKjwSC5FTJhxh575mjxV5
	VP0OqEIBeGo1mvsT0ledGpg1JAnHL87zndYiA0RcsdiuoukHIGePL0hmUgPdZ3CF+y1pKC
	Gv9xiluP18x+AcY2pEbCxLuZbmOJ3STtfv71g0Ju5SQAeLMdb+tsn65cW5R5Iw==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 18:20:31 +0100
Message-Id: <DH1TSA7A427M.359T6C2RFKRNY@bootlin.com>
Subject: Re: [PATCH v10 17/18] drm/bridge: analogix_dp: Remove bridge
 disabing and panel unpreparing in analogix_dp_unbind()
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
 <20260310020029.178314-1-damon.ding@rock-chips.com>
 <20260310020029.178314-4-damon.ding@rock-chips.com>
In-Reply-To: <20260310020029.178314-4-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Mar 10, 2026 at 3:00 AM CET, Damon Ding wrote:
> The analogix_dp_unbind() should be balanced with analogix_dp_bind().
> There are no bridge enabling and panel preparing in analogix_dp_bind(),
> so it should be reasonable to remove the bridge disabing and panel
> unpreparing in analogix_dp_unbind().
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

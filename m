Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715B42DAFA1
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 17:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421961; cv=none; b=XRithZ6hXYdDYRgglTWobLfUXeNXY1aJzGBpz6zDH8qnDp25JdAtHF+Xv6Ou2lR2dKFKPcI4HqJRPJdM8hViu+EcUasDU3QSikl9j3QrE8Xw4dsJ2Q7TfHyafZOYLG+B4axoOm644lc7U508e1w14vjcJr6rZWYMXktU+Z1wq/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421961; c=relaxed/simple;
	bh=QXrvX/Nhpiwn/b7xc6dulpE4qamSvM6IPfIyjIOUbE0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=g661yscgTHiNqO9YLEUzh+Uxk23aJsd1jQ4hG/yAhUiOHH3XOFQ+YO4zsW98zzbbhCwDKXprXkIeJkehoCUGIVXrq82lciF7Cs5cMDspoaDDw+xUcaXD7jo0rzQdSm7uWBgtW1ZTR/o38UVS7b70kzEP1S5ViYnYjIjbYe2yXgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NrqDPYAz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NrqDPYAz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5499D1A2E1B;
	Fri, 13 Mar 2026 17:12:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16F5D60027;
	Fri, 13 Mar 2026 17:12:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 213A510369F2C;
	Fri, 13 Mar 2026 18:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773421957; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QXrvX/Nhpiwn/b7xc6dulpE4qamSvM6IPfIyjIOUbE0=;
	b=NrqDPYAzNZZKGuHx6gL/Xsizy395RSXJxizJIYoXMHHeR4CFaITwHCCVWCgAx1ZDYLtTuz
	uH9T9R8wiiwI54PSANwVIEwo2PpnQleYh4hlqzZpo6mNI7i2Icz3rrEifxzakChQTkBuC5
	iGTLkpB7tUytSfLwfjyTAwoVT8abXl1McrF3ZmVwFpN1Q3jzE79EN6M4/ovdTRvakQ661F
	pQstUiGi7ipqwkLIC+Z0l9sCHLyy6btjrDYm81qFW7tMcZlJxPv03ovEo6tAW6X369TNJf
	2MX4Q1/MbbAuWhv6QUPnZ9hhbnMBNNALtkO9BCqR8j1pOgRW5PzgRUAQt7YwGA==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 18:12:19 +0100
Message-Id: <DH1TLZT5696T.2XAQIND6F9YS3@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v10 12/18] drm/bridge: analogix_dp: Remove unnecessary
 &analogix_dp_device.connector
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
X-Mailer: aerc 0.20.1
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
 <20260310012458.169272-13-damon.ding@rock-chips.com>
In-Reply-To: <20260310012458.169272-13-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Mar 10, 2026 at 2:24 AM CET, Damon Ding wrote:
> After adapting to the bridge connector framework, the private
> drm_connector is no longer required.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

This should be folded in the previous patch, where all usages of this field
are removed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

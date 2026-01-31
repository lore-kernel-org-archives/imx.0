Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D51A5477E
	for <imx@lists.linux.dev>; Sat, 31 Jan 2026 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769863880; cv=none; b=NGgqeO2LGjN6euPcPi3jvkKsSqHLvrAHXkjENPntR6MEizVHmeMtG7OC/641S5Gr4PrccwAVrmAA4nK3CNQFnz8tJCPeUylmGQxa2z/Rip0oig8QQJmsMfLKbNWQvkDXHK8ZvZZ1LHr05o4w2PpGE+Vqs5pwQD7LB4osZe3vMEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769863880; c=relaxed/simple;
	bh=/lxexy1NRGnGkNwTh+ZH9C7Afn1tu/sVb3g8M/zCZEQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=ZAJkx6+OVfd7h4dPIr/O5KSveISM5IsDSClPAoJ3nZm3PvdCVxqnOxrki2bCOgklUj4cV8CieN0ts5apY2Sf7tLEcF7jNEuNz8Nc5L/mxnu0fh60oXFC5TxQZ31JI+UbAhoOrcLYhmUGodCAKaZwVWYw0OTCANXiohb+r8kZrxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xUz4nJ3S; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xUz4nJ3S"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9625B1A2B5E;
	Sat, 31 Jan 2026 12:51:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62646606B6;
	Sat, 31 Jan 2026 12:51:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35E56119A8886;
	Sat, 31 Jan 2026 13:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769863874; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/lxexy1NRGnGkNwTh+ZH9C7Afn1tu/sVb3g8M/zCZEQ=;
	b=xUz4nJ3SqjGSb47/RdZbD7Mz4iocZu5Lg7WWrLX+Q3XjVIFvvhEyp/qZle3m+2QW+oTtkk
	basmI5anMTEXc8TeVJSa7L+5cEIPDYB+Ahou91ptDdsT67GEcF/pyI1ogFHPEQVKO9HWaP
	3M7vzhz1wVR1lbwQsrieEA2GjG0S0DJ7kPdxNIB7mmOVKhLpIrWbFvHGBVRexKSkV2EoVy
	wvdeSCDukaZRYEZ/Z0r27A5wQWaX9jOq6N8+rNWHE59XfSqQTo1QLcUZjoQcbmcYDhSuTB
	+r83Re64f6lxJ1tj8TXY8V7ROzULO4dxPEsrW6lQzc3mTI7rgSIyl2e/EifVOw==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 13:50:59 +0100
Message-Id: <DG2SDKH3BPGG.1IIH4ZHVY4M69@bootlin.com>
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
Subject: Re: [PATCH v8 03/18] drm/bridge: analogix_dp: Move
 &drm_bridge_funcs.mode_set to &drm_bridge_funcs.atomic_enable
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-4-damon.ding@rock-chips.com>
In-Reply-To: <20251217093321.3108939-4-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
> According to the include/drm/drm_bridge.h, the callback
> &drm_bridge_funcs.mode_set is deprecated and it should be better to
> include the mode setting in the &drm_bridge_funcs.atomic_enable instead.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

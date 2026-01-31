Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE6B22156A
	for <imx@lists.linux.dev>; Sat, 31 Jan 2026 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769866488; cv=none; b=YWng0QBrlxSOXwKYTsUwGu0Vxi7tRFBKu6q01lLTaPNaXTDpIZDp0VWO0aBONx9ia2vD2RvCEk0X3du34SconkFTtwW1dUdA2xQKX6Luoj6+wB29MjszahneceM/rGa0MbPaiXdPOwhNWGn9VSFlKni2NZIgd71fL76TC63ZDI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769866488; c=relaxed/simple;
	bh=0HAQIqHa85IFCSYgPdu37BcRsaz31BQ9JGVCc0EJGks=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=fmjPjfaFPMQZdHbpd5y6aMgEDB/HVV3liB4T5hgS2h3mAkvjsNG1uKNWoLvP6EduUXrhi0FDD/KBB+ofcEQFZ29ikzEEZ6lgmNX6cigr0ZG8qWb+/e7JpFCbmq/xEnICKkl6QkFX6CnlfQA2SjWSzqZw+N+SKI8lPNIEieB12HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fngV0pi6; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fngV0pi6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 539981A2B62;
	Sat, 31 Jan 2026 13:34:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D3ED606B6;
	Sat, 31 Jan 2026 13:34:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F16B119A8886;
	Sat, 31 Jan 2026 14:34:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769866477; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0HAQIqHa85IFCSYgPdu37BcRsaz31BQ9JGVCc0EJGks=;
	b=fngV0pi6VE6AZzizYbIJfeRlGWfCSwNkJCKGblK3KIcyIyOr5b7vLMh36tA/uRXiPJ2CdD
	cbdMAStxEyz1n9ZaTfPSCC381dSy5T72ToPbdzGHgn+mPZyvA1axyZnANceZLCwBOJOLS9
	DwEcKSZ/DQ80GCvCzAAcvfZMZhRzP1ZbAEZfZwVbbncDSN540qq+1vmLepakmbSUsZWZNL
	Zk0Ks6gPWlvDS8qwjtcpFexMUMoHsGFxFnS6PjMv+zf5vQ6qtLUDOFcaGXnUdG1xxml//V
	SHH1Mtj/39nGPgK5sVwyxoNWAHrqpdKekrjKHrQF75cisR6hn6e9IR6WUp8qaQ==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 14:34:20 +0100
Message-Id: <DG2TARDGCULW.M6ZDK1G0WGKC@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 16/18] drm/bridge: analogix_dp: Attach the next
 bridge in analogix_dp_bridge_attach()
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
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217095912.3109103-1-damon.ding@rock-chips.com>
 <20251217095912.3109103-3-damon.ding@rock-chips.com>
In-Reply-To: <20251217095912.3109103-3-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Dec 17, 2025 at 10:59 AM CET, Damon Ding wrote:
> Uniformly, move the next bridge attachment to the Analogix side
> rather than scattered on Rockchip and Exynos sides. It can also
> help get rid of the callback &analogix_dp_plat_data.attach() and
> make codes more concise.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

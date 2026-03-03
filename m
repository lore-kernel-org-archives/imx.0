Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625E738C40F
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530957; cv=none; b=moGhOsaWhRr6d6LFNwcAVxxn/xNhoWdxF7wBBKwZOJuu9dpcS/PoTZl4XQhHyhbDMkYoKaoE1nSxBxRV6fO6F7zpBemc1xXiVj7RilzGpQtkNteaUKPdfXZjeMIKbLHcs5dzmPvIKscJl5tbzygO3DQazBd7Zvk07vP7we53SgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530957; c=relaxed/simple;
	bh=ERvThpojbG1RdGgC8JszA8Cf/QGoT4sp1nxT0t1wwe4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=JwKZLBfXlWBUY4dz6mN4skmDoX4E9zo5DCJQl393xVGZgDsMtNl8GZ0iQ7x/tfmi0E//9oDtSSM7o2ldeIKFd922ckP+e9Q7JqlJDbBUg2BQrf/wZ+oJS6lSt29QctgmRqVOcmcz0398Td+61obamjN6SU8XQAoc55aN1v+/QaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=takmQF+X; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="takmQF+X"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 74D12C40FA7;
	Tue,  3 Mar 2026 09:42:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC9EA5FF87;
	Tue,  3 Mar 2026 09:42:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D9A3103682E0;
	Tue,  3 Mar 2026 10:42:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772530942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ERvThpojbG1RdGgC8JszA8Cf/QGoT4sp1nxT0t1wwe4=;
	b=takmQF+XVeRBDBtWiVh2gCEJzITUj7lVRRnEUoAXS4WM61CI5nfVZoYpyzpPjgC3jAYORI
	LvVqBfhwtII5arR3tX3hBL8oK71NMr+3t6e5esCW356lTx2y5KmNtvFphdBtEQvsKLt6qp
	YzgNhlBH7JAO41a3HgJJZhPRsmZhcDPrPNxvUjNfixto0SYlq8P7y4/s2+Q/7utdNBCQDC
	uxo7q4UCBoDNDRA+47cHEIW+ylAtju1vOpzS7RtRjp5dY6ScY5SISS5i62Ve37FMfB41lS
	ZbasGVQqF6q2baVDcxGcIdCRVbUlLA4KYQpoUUa/WMkj91q9dpxloE+R5v+IYw==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 10:42:09 +0100
Message-Id: <DGT1RVJSVGQE.14GDIUD6SWZTI@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 02/15] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
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
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-3-damon.ding@rock-chips.com>
In-Reply-To: <20260210071225.2566099-3-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
> out of imx/ subdir for multi-platform use. The driver is also renamed
> to make it more generic and suitable for platforms other than i.MX.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

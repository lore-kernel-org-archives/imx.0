Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E023A5429
	for <imx@lists.linux.dev>; Fri, 10 Apr 2026 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775807167; cv=none; b=q69U9n2f1OhRdHiFDLm1H6NhnIwGCfuGFoHxw+eaSb7c0lJI63tg31WlKPv/n3OqcuuzY4owlmarH7tvzrV+1qn+KFCrrBR+YvEHBF9bBWpTUpYFAv65SkOutCdPo62tCde9bJ4r+pXSKPhBOuxPl3YAM867skTbfwb+XT+Q8aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775807167; c=relaxed/simple;
	bh=7Wx2UvoBeg4k3i7NLhBgGaJ/f6VlZn5MlSBSEC/Ki5c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=k4a3jThE7tjr2F65ognwFKfu9r1MRXC/7ml572h+xntFjwOpRBRnhwVlujwLW2KjnFskrBZ/MzfVGL2fwGm9pTwswkUpDl5gKhf+PlT0cGrNC6WfWSEuDPFAQEHPhCqoOoYFdv4L/yH60COXw7DBtbczstOSQxWCeZatKcNxs5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c2gI9uXM; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c2gI9uXM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D8DFA1A325C;
	Fri, 10 Apr 2026 07:46:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A622E603F0;
	Fri, 10 Apr 2026 07:46:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C111110450202;
	Fri, 10 Apr 2026 09:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775807159; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7Wx2UvoBeg4k3i7NLhBgGaJ/f6VlZn5MlSBSEC/Ki5c=;
	b=c2gI9uXMQw2ocbIaV7iJBi3GU94xHn9sK4jjeGkd2gMfIg5CnpxfRwgyKgVkVGE9q34IYO
	/39qw0B6QoPr9dmWz0rmpeWKp/mCikTGHwJJAIkgk543AnddgUrSfU+su2knQFOieEQwrT
	6Qw+zHm+G8knYxThwesoYymirhqybo3SElUEXkMG4hquvI85xL/RL3yZdRWKgLMACINht/
	Ew7x7oxfTPk6l3uqPj9FfovJg+FoGhdezOy/R+LxqPfQ3d/8zhTH6gSrVQztmWIl+0L47I
	1WN3g7ErrycSUlz7jtUAheYOFbdNkuVJE40YHH0dX9llUUYQPutcA+jKc3yQ1A==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 09:45:52 +0200
Message-Id: <DHPB3JVDG5BE.3QSUWB2FUC3XP@bootlin.com>
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <kernel@pengutronix.de>, <festevam@gmail.com>,
 <alim.akhtar@samsung.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <nicolas.frattaroli@collabora.com>, <dianders@chromium.org>,
 <m.szyprowski@samsung.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <victor.liu@nxp.com>, <Frank.Li@nxp.com>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <inki.dae@samsung.com>, <sw0312.kim@samsung.com>,
 <kyungmin.park@samsung.com>, <krzk@kernel.org>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v13 10/17] drm/bridge: analogix_dp: Pass struct
 drm_atomic_state* for analogix_dp_bridge_mode_set()
X-Mailer: aerc 0.20.1
References: <20260409065301.446670-1-damon.ding@rock-chips.com>
 <20260409065301.446670-11-damon.ding@rock-chips.com>
In-Reply-To: <20260409065301.446670-11-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Apr 9, 2026 at 8:52 AM CEST, Damon Ding wrote:
> To avoid using &analogix_dp_device.connector for compatibility
> with the bridge connector framework, get &drm_connector from
> &drm_atomic_state instead.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

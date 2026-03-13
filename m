Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404E1346782
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422462; cv=none; b=QRXiMRHReXnbZh/8szcsXUJfOiX35bw2XUQAm8Twdw7SHytGY9XW3WMFezRNeVO+a8PkNKOpZHcUXuW4x7sEWA+W9iaaCnbdRkBYXyqhqmQKbtqFdjxqXYsgO29/2Zm/WjmgvHiaaBCYmyF99gnkK3Y5lAavm7MgQLmczDWGHdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422462; c=relaxed/simple;
	bh=3DWK+h5edTmRvUbM/mZG6EfD+UZlA5nnNuQWRmdQd5Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=UU4sDdpL8zOeK0wcnTTGgL/mYpo88x7kUgd54cShReiSBylEXiSHr65zMVbnyySbAXnLZiFdqsSbHYzADC6LkxaL3AvCelfLA61siZw2mJ38J706C4tkXQAhkQzRTAFg5SUvqLg2F6QVYNjLt7Y16EVR/+oYDBanCSgjb/sYc+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A7HawzIy; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A7HawzIy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E23F74E42644;
	Fri, 13 Mar 2026 17:20:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B3E8B60027;
	Fri, 13 Mar 2026 17:20:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 666A610369F56;
	Fri, 13 Mar 2026 18:20:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773422456; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3DWK+h5edTmRvUbM/mZG6EfD+UZlA5nnNuQWRmdQd5Y=;
	b=A7HawzIyiy94D5qIRkDexP9qHwNzDfdu81U8+GuqhJiT02RiMKrFa4xHM3eIhho9J5yWxz
	Qw3zkiN64Gd15SyCHSqUnM4ajMrfmeJf9SiLSI7foiEBEjHxwDglk0dmeWsJ6DC5dq3rBy
	ngq5y0YueV/rF1lKhJTjeOP2gqssqYL/SKYU9JmH8dAodPsqpOnr/HOrwAUindyzr2+WTJ
	XB3TSvRcN1cWoG5W4q01VYatcwI4lClMTpv/SoqY1NMbQy0tFtJFE5ezsARrr/VCR5semF
	GIysxfFJyhN/BVqiPtZphLxkddvHG58OtS2kZhX6B3t3YKhBeMjbzedIxXBOmQ==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 18:20:49 +0100
Message-Id: <DH1TSIFDJRJ4.2T0M55T042X54@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v10 09/18] drm/bridge: analogix_dp: Remove unused struct
 drm_connector* for &analogix_dp_plat_data.attach()
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
 <20260310012458.169272-10-damon.ding@rock-chips.com>
In-Reply-To: <20260310012458.169272-10-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Mar 10, 2026 at 2:24 AM CET, Damon Ding wrote:
> For both Rockchip and Exynos sides, the struct drm_connector* is
> never used in callback &analogix_dp_plat_data.attach(). After
> applying drm_bridge_connector helper, this parameter will no longer
> be used at all.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

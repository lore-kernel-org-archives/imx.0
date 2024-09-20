Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE6717B427
	for <imx@lists.linux.dev>; Fri, 20 Sep 2024 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726844038; cv=none; b=nurrDBWu/VhsAv7AVEDs93NHJF2gbDqpGeANYexIk7+rwhilNKwXhG8PRd/ksbYh4VIzJZ13DppSFNhAEw+fjz8J4YYXR3kgOsY/z7ST3/6DIk84Z+weALowRN4gWXlw10WG5TXEOVFGBdXvIJG9wF0r1qaB7nGXBLxJlsLHKEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726844038; c=relaxed/simple;
	bh=S4P7L6S4YVxHG7FlOc9S8smNJC+oJB3xqP6RGBINWaE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C61Z19MNoh/YE4c/c/HGISP0JDaLTQH4VIzfKu31X5RzHV/CXEmhuXa2mvzSKSXJIDVNfUz6wHDBr8NCahd+9Ww5QoGbIQV5C6O1w6aA0T6pKcUVPaLtgS58ZhFz6VoGYpzC6BB534unQIpXzeNZTQQSa8o0E7fDK0q+ylK7PAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1srf0f-0002Ol-7i; Fri, 20 Sep 2024 16:53:25 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1srf0Z-000H55-Qp; Fri, 20 Sep 2024 16:53:19 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1srf0Z-000BDt-2K;
	Fri, 20 Sep 2024 16:53:19 +0200
Message-ID: <13010c194e4674f6bdef84bcf748030a1d46b814.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/5] drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in
 request_irq()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jinjie Ruan <ruanjinjie@huawei.com>, laurentiu.palcu@oss.nxp.com, 
 l.stach@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,  tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, shawnguo@kernel.org,  s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com,  robdclark@gmail.com,
 sean@poorly.run, konradybcio@kernel.org,  quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org,  marijn.suijten@somainline.org,
 thierry.reding@gmail.com, mperttunen@nvidia.com,  jonathanh@nvidia.com,
 agx@sigxcpu.org, gregkh@linuxfoundation.org,  jordan@cosmicpenguin.net,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org
Date: Fri, 20 Sep 2024 16:53:19 +0200
In-Reply-To: <20240912083020.3720233-4-ruanjinjie@huawei.com>
References: <20240912083020.3720233-1-ruanjinjie@huawei.com>
	 <20240912083020.3720233-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Do, 2024-09-12 at 16:30 +0800, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
>=20
> Fixes: 47b1be5c0f4e ("staging: imx/drm: request irq only after adding the=
 crtc")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

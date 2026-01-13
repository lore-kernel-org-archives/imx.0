Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750FE35CB86
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303911; cv=none; b=sTCEiktw8bH4TLZ0No1mEDHD3GSFupWCXYlegFrbXvbT3TZcIeGRt9OA1qXMCLWFX8ha5y1ac6ejLQgyiA71r9wXfxZ5nJV8ogE8YBsBW1lL48mpB3zfTtscbvkNDLydyh6ROqlnLvvP8KFH/rAzgqGDw1pr05xFwOviFaXbCU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303911; c=relaxed/simple;
	bh=B4kWBn9gjdvScHFjE+y4UkWXcGn5pKA7zE+7suaO1v0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AlgPFG0/Y+AyExW9PLFP7ntcWa0XKTC95YCSlPyyX/zZNZVxDoRu3Jc4PCB+ncLyKXcsyom+gl2hbGm+QRQ3jaDc14BNcZpYBG/iaiJ3rMbtn/n+arx1oUUjQ8Biaf6p+MdBDcL2Kpo7xRD8FMFjpdT34QR+fIA055A/bb316H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vfccf-0008LF-8r; Tue, 13 Jan 2026 12:31:41 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vfccf-000Pj3-1h;
	Tue, 13 Jan 2026 12:31:40 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vfccZ-000000005PZ-3ACz;
	Tue, 13 Jan 2026 12:31:35 +0100
Message-ID: <0d3a41526ba02eee28457fafc95f5152a9c7bb4b.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: parallel-display: Prefer bus format set via
 legacy "interface-pix-fmt" DT property
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@nabladev.com>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, David Airlie <airlied@gmail.com>, Fabio Estevam	
 <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,  Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 13 Jan 2026 12:31:35 +0100
In-Reply-To: <20260110171510.692666-1-marex@nabladev.com>
References: <20260110171510.692666-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Sa, 2026-01-10 at 18:14 +0100, Marek Vasut wrote:
> Prefer bus format set via legacy "interface-pix-fmt" DT property
> over panel bus format. This is necessary to retain support for
> DTs which configure the IPUv3 parallel output as 24bit DPI, but
> connect 18bit DPI panels to it with hardware swizzling.
>
> This used to work up to Linux 6.12, but stopped working in 6.13,
> reinstate the behavior to support old DTs.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 5f6e56d3319d ("drm/imx: parallel-display: switch to drm_panel_brid=
ge")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

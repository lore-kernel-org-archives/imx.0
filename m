Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB636894B;
	Thu, 21 May 2026 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354868; cv=none; b=OL3JZ8ziTSHgeYJAiEydb/DF0mQMA8HUS62Bxrm0o+mK7eiYJ85eWcF/kzHXZYY6/f9VTOUvjvY5Hhn1oaDzd+V2xlpuC7csW5hRfrjAHCOHxZGVN0WW1/AL7NrCBsEWqAnjmeY+Um6xHzx1QP3PCgzOUTo9c+RJYwAeMXfYa0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354868; c=relaxed/simple;
	bh=RqI6vh+WLkfGwtZ7w9kdY7+93wc7lSm+3beIEWvGDJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aG3fpfFl1tQePJVkEZM4lf8FfED4xLw9M6pt8i7IbdgsB0gOycm0OPVZWpQL1z9xhyiMVp2+CLjLtcNRL/uCXGp8goMuyOSx+LPomCp9jFp2hWhsRer6GU/F3HGNNEXI6kxLp55WKAZJUNUwazg5r4Rvy/fNRLvrCTGJWqm8uGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=guwmnCLe; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="guwmnCLe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RqI6vh+WLkfGwtZ7w9kdY7+93wc7lSm+3beIEWvGDJc=; b=guwmnCLeCXw4BCcRlPU7lYatnl
	sZ/Nc87kEeU7S7IZqvbdwDPiYFJTjE74sti2902t8TOYJhE09mcvx2aicZepZ1U8bjhVHSh3TcZGg
	Y7fM3/5F6hseiuztXmxfbroXQQbM1+lUN1ZkEZS7mipNp/JuFNt40leR8kI9tt5bwyAOk9MjT1Mah
	fcDdyPRGk+GtfFRUn3R1K/3+Wo1fjTkrfsctUZfeNV3O7MJXg2KcaQGMHEV3YddrXsXQor8s3Jw51
	vuV05V9yKOQnUMa5ll/QPX6+CwfbL3npFjv8zCCwiRIWvLvkYYcGxAfEpI9ZahULoTQdlVMPeomaE
	rAUX5teQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v7 00/23] drm: bridge: dw_hdmi: Misc enable/disable,
 CEC and EDID cleanup
Date: Thu, 21 May 2026 11:14:07 +0200
Message-ID: <4998578.ktpJ11cQ8Q@phil>
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 18. Mai 2026, 20:01:36 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Jonas Karlman:
> This is a revival of an old dw-hdmi series and is the first series part
> of a new effort to upstream old LibreELEC HDMI 2.0 patches for Rockchip
> RK33xx devices.
>=20
> This series ensure poweron/poweroff and CEC phys addr invalidation is
> happening during normal DRM funcs, ensures EDID and CEC phys addr is
> updated in detect() similar to how the bridge connector works with a
> HDMI bridge attached, and also changes to debounce hotplug processing
> to prevent a full disable/enable cycle during a HPD low voltage pulse.
>=20
> After this series HPD, EDID and CEC handling should work very similar
> regardless is the dw-hdmi connector or the bridge connector is used.
> It should also help ensure a smoother transition when dw-hdmi is fully
> converted into a HDMI bridge in a future series.
>=20
> These changes have mainly been tested on Rockchip RK3328, RK3399 and
> RK3568 devices using both the dw-hdmi connector and also using a basic
> convert to use a bridge connector. The changes has also been tested on
> Amlogic S905X, S905Y2 and A311D devices that uses the bridge connector.

I now also gave this a spin on a rk3328 board and hdmi still workx :-)

Tested-by: Heiko Stuebner <heiko@sntech.de> #rk3328




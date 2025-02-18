Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D34EEEBD
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 05:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739855571; cv=none; b=WWrjT24VDSXOe5gmldAudqRof9zS5Z2TwNqJHDuPIo0MB2F3RCCXbqrN/5VXBrhw1D7PvpTeGoMNdTS3ujjB1MyZVFbx6HDGySZCnAUSXOCsDpyd3cYKUskp3O3x/vhRM5buXFHo4j7C3QjO8TzAxAGlPR7YCKXTIJR/eB0FpIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739855571; c=relaxed/simple;
	bh=RVmjeCRqTXAS9npYyrfHmPTEC8iV7VKhX5Hk4awCdI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJntGtQpODrYv9XYxdg+IZaeuB5NUpkAi9ogZqYfNpvDalDZLaKx8IJu5bI1/9HidLw+E03HtifmuhTpWG+fCKVlsGV2ma7YeePZACYy6QBcPwGIGjDSEhgFdjDyr9D80f6tUJicivevxW62E9DbEkElfxUTxBtVhGmJr80PV44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Qk4UTYh6; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Qk4UTYh6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=68i6nZgeVAEVlthJvzDNRrc3GqZTagQDZ3jgb9satyw=;
	b=Qk4UTYh6UlVaXdNFDvLqCLE/9H15fDwguI+YL4sZxWr7lZUBnU5RMmxiGMmj50
	72ksoqJZOqG0fnZkUzYDglznOmshaR8+xMg7xuf2to+KKCHfRsLKwE2SjkxZ+vT7
	pd4VPhdaWUNGRvcQ/fzcFobQogLybc7fLA31CBNwe8hnE=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHg+GVFrRnzEwjCQ--.17496S3;
	Tue, 18 Feb 2025 13:11:51 +0800 (CST)
Date: Tue, 18 Feb 2025 13:11:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Frank Li <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 00/10] arm64: dts: imx8mp-skov: flesh out device trees
Message-ID: <Z7QWlbkoTz5VZle+@dragon>
References: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
X-CM-TRANSID:M88vCgDHg+GVFrRnzEwjCQ--.17496S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWxZr1UAw43uF4xAw13urg_yoW3XFc_ur
	12qa48JwsrGan3Aw1qgw1qqryj9w1UC3yUXFW3WrZYgw1fZw15ArykX34rWFy8AF1akr4D
	AF4UX3WkXFW5ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU87UUUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBz3ZWe0EhkQVQAAsX

On Mon, Jan 06, 2025 at 05:06:35PM +0100, Ahmad Fatoum wrote:
> Ahmad Fatoum (5):
>       arm64: dts: imx8mp-skov: correct PMIC board limits
>       arm64: dts: imx8mp-skov: operate CPU at 850 mV by default
>       arm64: dts: imx8mp-skov: use I2C5 for DDC
>       dt-bindings: display/lvds-codec: add ti,sn65lvds822

Applied all except this bindings change which I assume display or DT folks
will pick up.

Shawn

>       arm64: dts: imx8mp-skov: configure uart1 for RS485
> 
> Oleksij Rempel (5):
>       arm64: dts: imx8mp-skov: describe HDMI display pipeline
>       arm64: dts: imx8mp-skov: describe LVDS display pipeline
>       arm64: dts: imx8mp-skov: describe mains fail detection
>       arm64: dts: imx8mp-skov: fix phy-mode
>       arm64: dts: imx8mp-skov: increase I2C clock frequency for RTC


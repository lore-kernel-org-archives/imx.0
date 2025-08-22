Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AC5223DD1
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755852246; cv=none; b=EIsllQ5V4tncrcrQYipbndt1fZ6LcQwLZZhKcGPirbjSLDB/Sdb0vNIzX/VXhzA+No9hrJREzbMXB3JXcbdQclwKVsW1XBgISYqQQraC01q/QMjHW4qSqFB3ZKChc+99mtLmWnzEdzCUvyRr9/xVd5fJGqnnff8yfGYU8iUHozE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755852246; c=relaxed/simple;
	bh=WIbTbcYWzk0LwWnpPaIMHccPvGBc9pWxBYx0XcS0yUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D69/dsvZX0lHjrlLvHWn9X6uGV6ag07whC47G+TwCG2AOoTZZfiRDhwAs3L8jG6LZMb+eX1ciL+/zgH5FzQsjyew7fZJOWDuPm3wpIzyVkSbRAOgpFcRoNDuDzaYr2qxHFSutD/Fmnh/3HMJuyXjdgZoOPvV0pz1X4wGZAyLcCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CDohxI7/; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CDohxI7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=UISHobrNh95ObNFh3tYCD32MPVeq0eeo9WH+Sn/Lp0Y=;
	b=CDohxI7/RTmNtk8Lq7gKdoNqYdZtzyyReCeYNx73wEYD8wMw167gSXfwt5tQd/
	JDlfrLT9jjz5H6kFKQFyaeizeUAoQyh6GfZah4uYeVwr33C21BrE2r+9I1lkehM2
	Zm1nrpgc14EhL3vqRhZtb2rw8EoMmo67Gu+Km438xHpJI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCHJdqPLahoTvcnAw--.15193S3;
	Fri, 22 Aug 2025 16:42:57 +0800 (CST)
Date: Fri, 22 Aug 2025 16:42:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Joy Zou <joy.zou@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peng.fan@nxp.com, richardcochran@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, ulf.hansson@linaro.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, frieder.schrempf@kontron.de,
	primoz.fiser@norik.com, othacehe@gnu.org,
	Markus.Niebel@ew.tq-group.com, alexander.stein@ew.tq-group.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, netdev@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	Frank.Li@nxp.com
Subject: Re: [PATCH v8 08/11] arm64: defconfig: enable i.MX91 pinctrl
Message-ID: <aKgtj9UVLnuoJzrj@dragon>
References: <20250806114119.1948624-1-joy.zou@nxp.com>
 <20250806114119.1948624-9-joy.zou@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806114119.1948624-9-joy.zou@nxp.com>
X-CM-TRANSID:Ms8vCgCHJdqPLahoTvcnAw--.15193S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU1a0PUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBKzGWioLZLpOwAA3h

On Wed, Aug 06, 2025 at 07:41:16PM +0800, Joy Zou wrote:
> Enable i.MX91 pinctrl driver for booting the system.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Applied, thanks!


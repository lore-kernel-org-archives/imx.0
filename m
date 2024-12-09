Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0C8221D86
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745170; cv=none; b=GRv0dpbA8MG0ylBV5pH7kXqXOgnfgcKeKuqxCXe6cjS3trpKrDXJ7ldL1jzDDUyAbvCiB3f5TS4VpcMpJ5P0y/Cdoq/vGKwe1+Pv/J99m++f6FnEk81zsfNM8DhCphm4fCKAvp+flLVtCO49kd6ao1n7Gxa3zLlxaF+JRuC2Kok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745170; c=relaxed/simple;
	bh=a6RLnagjYk6FxWaDYNCB14xzDyQCd1oNDwzxq5w4Hdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za/B6Z618QscNMr5X9edwqPkV0nlIGBnkbctQ6iH7mC0P32Hp+SzjNuW1hMorgh0tmSeKaHgu0qK7/GtBrNl1x0Mu0ndOwoCnbEHJbWNxhyGPWpQDgVkAquKKycppvHDNrDjH9gT4TDS4V+uHYEB9NDz+dMPlqt3Ke63SvUlZgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Wl9Uwb3h; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Wl9Uwb3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ahtKyo3umu0l8xANNPbc/omC47RmvAyiOEB98A3zRFk=;
	b=Wl9Uwb3hHHYw1gXSGXz5c9Av0256OS/lw+UeGGnBU2D3FOnTxEqpD+4SYAcazJ
	8I5juTXjI7/sdyKwQPMJmTlJu+06Eu/oX0g6dYXP8lW5UmTc8XpUqOY4QTi9n/nA
	wvO0/C8DCt81JKSI5t46SxjkYeubpjnoyxz2TN8YyiTtg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3ZJi+2VZn8elyBA--.46363S3;
	Mon, 09 Dec 2024 19:51:29 +0800 (CST)
Date: Mon, 9 Dec 2024 19:51:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Liu Ying <victor.liu@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
	marex@denx.de
Subject: Re: [PATCH v6 1/7] arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set
 "media_disp2_pix" clock rate to 70MHz
Message-ID: <Z1bZvsGdwd5dlJow@dragon>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
 <20241112100547.2908497-2-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112100547.2908497-2-victor.liu@nxp.com>
X-CM-TRANSID:M88vCgC3ZJi+2VZn8elyBA--.46363S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw45tFyrZr13XF17Ar4rAFb_yoWfArbEyF
	17ZF4v9rs5XFyYkwsFkrZ3Aw48K3srZryUCayUJw45ta47Xan8ZF1S9ry5Wa1UXa4ayw1q
	gFn5Wa98K3sIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1xpnDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRWwZWdWsiw1LwACs+

On Tue, Nov 12, 2024 at 06:05:41PM +0800, Liu Ying wrote:
> The LVDS panel "multi-inno,mi1010ait-1cp" used on this platform has
> a typical pixel clock rate of 70MHz.  Set "media_disp2_pix" clock rate
> to that rate, instead of the original 68.9MHz.  The LVDS serial clock
> is controlled by "media_ldb" clock.  It should run at 490MHz(7-fold the
> pixel clock rate due to single LVDS link).  Set "video_pll1" clock rate
> and "media_ldb" to 490MHz to achieve that.
> 
> This should be able to suppress this LDB driver warning:
> [   17.206644] fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (70000000 Hz) does not match requested LVDS clock: 490000000 Hz
> 
> This also makes the display mode used by the panel pass mode validation
> against pixel clock rate and "media_ldb" clock rate in a certain display
> driver.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Applied, thanks!


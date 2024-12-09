Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A608422145C
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 11:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745175; cv=none; b=qrayCMZjRh6fadWeYQn7D5nmqIdY5y7atqcAtnO7/NxRG5uqELCt8eII/PFXhfZV6cJVi5EE8swOUKnIyznP8lvV6Ko4yt1TA397uzS40SHCo2rWT9RzXeUFCXIpm7PbBv0OhyDguJTuXDR6lKS+4lcYGSiQzcWASuN4TpCq1Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745175; c=relaxed/simple;
	bh=asbCCiLuOh7U6iGbLsXWhJlo78FDOpTGTEtz83/J4Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFwORhyGszSo0XXdjY6uKRys2+pAnjMYYYelbVjr7uSmlI8pc8QVLL0GrOhH6VbU6Y8Z8+ZpWclEsABl8RjcCUA/DzknzA6ewbT94NCsq4+ptg7sbwCKMkZ9ZPfdo+HWYzcTZF9J3PvrhNRJf2mAEq90jvMm1znJeLfAxn39VWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=e8BjV0Gd; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="e8BjV0Gd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=u0ACcEk1UOUwykRvtHfGsibvZAQHV7WF85gca/fgXtU=;
	b=e8BjV0Gdm8xg1RQT7gFdCEfIB2hmYXk2RxcjvizBiZwTERVncWc3lYh8fh7ESe
	I4ZQ6uzmY2DIi9zRnUCR/Qt4MFonfQuPf5OjgM+0Ema9B1r/ofvoUvE7YtYjnTCP
	dOdwwzXOYsSwA1QrysrBu3zXFFRxzHIA/8jqP6rFtl7yQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBX33HV2VZnbrePBA--.47878S3;
	Mon, 09 Dec 2024 19:51:51 +0800 (CST)
Date: Mon, 9 Dec 2024 19:51:48 +0800
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
Subject: Re: [PATCH v6 6/7] arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI
 adapter cards
Message-ID: <Z1bZ1FvPmjPr3LU5@dragon>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
 <20241112100547.2908497-7-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112100547.2908497-7-victor.liu@nxp.com>
X-CM-TRANSID:Ms8vCgBX33HV2VZnbrePBA--.47878S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr45Cr4kuF4UCry7CrWruFg_yoW8JF4DpF
	Wjg3y8Gw10vFZ5Aw1v9w18WwnYvan7Xry8XrnrJw1xGasFkFZ5JrsakF4vv3Wqv3ZxCw1k
	Xwn8X34rGas8Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7xhJUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAGwZWdWx209gQAAs3

On Tue, Nov 12, 2024 at 06:05:46PM +0800, Liu Ying wrote:
> One ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
> and IMX-DLVDS-HDMI adapter cards.
> 
> Card IMX-LVDS-HDMI supports single LVDS link(IT6263 link1).
> Card IMX-DLVDS-HDMI supports dual LVDS links(IT6263 link1 and link2).
> 
> Only one card can be enabled with one i.MX8MP EVK.
> 
> Add dedicated overlays to support the below four connections:
> 1) imx8mp-evk-lvds0-imx-lvds-hdmi.dtso:
>    i.MX8MP EVK LVDS0 connector <=> LVDS adapter card J6(IT6263 link1)
> 
> 2) imx8mp-evk-lvds1-imx-lvds-hdmi.dtso:
>    i.MX8MP EVK LVDS1 connector <=> LVDS adapter card J6(IT6263 link1)
> 
> 3) imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso:
>    i.MX8MP EVK LVDS0 connector <=> DLVDS adapter card channel0(IT6263 link1)
>    i.MX8MP EVK LVDS1 connector <=> DLVDS adapter card channel1(IT6263 link2)
> 
> 4) imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso:
>    i.MX8MP EVK LVDS1 connector <=> DLVDS adapter card channel0(IT6263 link1)
>    i.MX8MP EVK LVDS0 connector <=> DLVDS adapter card channel1(IT6263 link2)
> 
> Part links:
> https://www.nxp.com/part/IMX-LVDS-HDMI
> https://www.nxp.com/part/IMX-DLVDS-HDMI
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Applied, thanks!


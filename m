Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17311CD15
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 03:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763265117; cv=none; b=gwQ0zLSHyVhVq6HOU7LfW/WID/s4OEKVFK3Wper0puOpLmTnT5EmvWGo1afCtJ5ZhkXZ37ab0tnWCbJeDRtWc6IyviNFtMhS29mZGWSZwqnhrFOwK5C46y0T+LXmC7AeERFPrI0TDn/wUdozIOZ+kh9egmT55E8koF1C3Hk3cyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763265117; c=relaxed/simple;
	bh=elDQNfVxbieXT1jJ7mnTPTdGSw8jTRG/tSs3yo5cCRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blszgQj7udIRggXzuUKwEkA42IXIutuitt8nxUBeC/QU6oTy742y2Adi82Z1Lf3gkX2NBidHjZguvj9APX2u4ic3Xc+7RU8OkKlnU3LMHeM0IkKtuAeaf4Ti55lSsHe+CfnUthCOsmN7LP6K5IszcLFXiqXyvJvy595R4PAI3ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HRXqVbri; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HRXqVbri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9T2DbJXTL02gDuKqRKAHj63zBLmVwp0FHpFWKELvs6o=;
	b=HRXqVbriK/FgeE7H6K/G1lLF9PBP9XAYmclO+P7pLfBBklJ5poTiXzOEeBqjNd
	ilKXnYYDrlkbsjK+RHk4hJB0GyEAB6bJwJgWFc4xYNIim4N+h7WGasO+sWWeAUFK
	NXEBdqxWqzvb02vkr9eUrlZzaKYUDdauZIVU+Z43mJCbw=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCnKou+SRlpHYgSAg--.7957S3;
	Sun, 16 Nov 2025 11:49:21 +0800 (CST)
Date: Sun, 16 Nov 2025 11:49:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 7/7] arm64: dts: imx8mp-evk: enable hdmi_pai device
Message-ID: <aRlJvijH-F8pz10O@dragon>
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-8-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923053001.2678596-8-shengjiu.wang@nxp.com>
X-CM-TRANSID:M88vCgCnKou+SRlpHYgSAg--.7957S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUbWlkUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNgEjiGkZScFifQAA37

On Tue, Sep 23, 2025 at 01:30:01PM +0800, Shengjiu Wang wrote:
> Enable hdmi_pai device.
> 
> Aud2htx module, hdmi_pai and hdmi controller compose the hdmi audio
> pipeline.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!


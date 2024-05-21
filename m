Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF4A12EBEE;
	Tue, 21 May 2024 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716301371; cv=none; b=bOvCfVp8SmrT3gMmJc1XIsfh8vtjDlSsnE/kuacvM1GtSWgJkmzKrfSnCrgHRo3FInTUPp2TPNBsfdRkBjYB5gEye1/YupoOCtwcEnja8kqC7kw9rJAbgumNX+GdXMKF15T1OAaqZFbS5pB6aawkI2IQbnIDs5wbqh/XX8GXSsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716301371; c=relaxed/simple;
	bh=S5q3SL4QrTR3x283h+0MNUSZ9W9XFtD33KHiNZqcSl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5bvcPc0bzv+GFAnn/FqFsEEGwGe9qx55+EnvrGX5iWqZWbAL3/9f8ez2UNLR1Z4LOhH4zRxfCmgAoJOTD1wkU5ZvSUDWWrGI5DFOhEJGn1MrWFGUTOJp58u6xYqUovhviu7qXFNoPrvNi6Bbd6yyBi8JIwvsCMh5HhJQLZ3AKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWGiwbed; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWGiwbed"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE36C32786;
	Tue, 21 May 2024 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716301371;
	bh=S5q3SL4QrTR3x283h+0MNUSZ9W9XFtD33KHiNZqcSl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWGiwbedDHAWhiE/kXtKt6+ISYbgMQXrC/QkoChI/Yioxemjt/lm6tPLtsHOzwa1i
	 detR11P8pCJR/fS6Z7rnt717eygsx3WRGe8o19qo2Wc7+t9fArmFhHHrtTxJUvmPMi
	 0y3X8qrE3S9gMru2g/1RwOXSkmy4rxNiOJcmD7Nws6D+y/Qw77Rf3gIScyTCZp2bQB
	 sHMFudlkOcvvUdz97FHIo9Mig8cLflJ1ZMWFLQDK9qr8oBqZF30b+tIjXQPmisBOqc
	 bt4/DPQfgThwXo60NfZ7nTBFOB8SX2WZ9s4XIcKLGorkEu8wNzLHTIrGSje//W6yjC
	 ZXyta3rraFEiA==
Date: Tue, 21 May 2024 09:22:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, kernel@dh-electronics.com,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Yao <markyao0591@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: display: synopsys,dw-hdmi: Mark ddc-i2c-bus
 as deprecated
Message-ID: <171630136735.4113488.212985602812996008.robh@kernel.org>
References: <20240521104057.10485-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521104057.10485-1-marex@denx.de>


On Tue, 21 May 2024 12:40:47 +0200, Marek Vasut wrote:
> The ddc-i2c-bus property should be placed in connector node,
> mark the HDMI TX side property as deprecated.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Mark Yao <markyao0591@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


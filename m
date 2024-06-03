Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F08138C
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 01:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717376514; cv=none; b=RCGJnKL3tt5LBbnYWamNJmrhPQBZoWo3geMMnLv2+xfd+kpyHCmMFjahyHkSosfGZkqUBL/3Vvw2ZZbISLmF9sLmJy7SLZm5tE3/MUBK6ewncHJ0E0j33qmyaHAGehWKcvfqpuVUgjhokuVttZpk1U6bJBqO49M3NZhMgibLSR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717376514; c=relaxed/simple;
	bh=8KQhL6ywg+vk5Q4quhgLxQRukYZuRZKD6MuWqSxI5Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYjd8ABlNVwNjrkBTewmHPFBCmdNKjw/OUqX/W3BCDaysXw/wba/Y2nNEocXYHSa9kZ7GYnoqInsAqG0YM0cxBir6YRb8Xmx46fp8f646SLlDVQTF4Xyek88aXqtp8GmLPQQfdVqq066ZDbpdzclc5nCbArXfAk11uUYs/5kAKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JMGOqeqU; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JMGOqeqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xZbSDbq/icRgVx9ShYGX4awFI7wJXxRwtsK0+qNVhqQ=;
	b=JMGOqeqUIv4fkBs+rrau07hvHUOvpsYV+I2J+v/9TgGdhc/2CD53oeq+AnG/qN
	XiSP483HmlVsBSgFRfKogl8sfVmGXy/C/RdZPpwES/VqqGtuTgkOv2UPPwGza/nD
	HtuQc2A24HY6pVrlm4oW773TEezAvEYrqxbyiVHayK7+8=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrADnThhIE11mkMfrBw--.57962S3;
	Mon, 03 Jun 2024 08:50:19 +0800 (CST)
Date: Mon, 3 Jun 2024 08:50:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, aford@beaconembedded.com,
	laurent.pinchart@ideasonboard.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] arm64: dts: imx8mp-beacon-kit: Enable HDMI bridge
 HPD
Message-ID: <Zl0TSF6ql+FFgm0d@dragon>
References: <20240305004859.201085-1-aford173@gmail.com>
 <20240305004859.201085-2-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305004859.201085-2-aford173@gmail.com>
X-CM-TRANSID:C1UQrADnThhIE11mkMfrBw--.57962S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsRRRDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGAvyZV6Nn2DiigAAsA

On Mon, Mar 04, 2024 at 06:48:58PM -0600, Adam Ford wrote:
> The DSI to HDMI bridge supports hot-plut-detect, but the
> driver didn't previously support a shared IRQ GPIO.  With
> the driver updated, the interrupt can be added to the bridge.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks!


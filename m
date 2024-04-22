Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8264437
	for <imx@lists.linux.dev>; Mon, 22 Apr 2024 04:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713758657; cv=none; b=Yo4RDQtEeFuU/tQY8KHyU85nUofR8RwewT8LzzEsdu1v2iRZSTYiOzOvieYntdjd2u1+TyKDb5a3buUEQ1Viuru4FPHNHqaxiE9TyqIvuVpkz3o2izYJBwDp4lFVXj1GjtDaMO/V2rroCKIF3F997YzaCyGbl4QX3hjpFmmIBLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713758657; c=relaxed/simple;
	bh=Wp9/jMq1i0gA3KGjLqqk49C1hXN1/SAaPPno8YJF7iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvBjNkhbvunIMMp27qYAfOJ05ogtTvetKDUjb8c25uDPcVx9JM/HRsdb1V8xXuPDkjYFX/b0l+vN5/iNSTgk4JIn5g73uVRZLq80XsKi5GrqGu0c7CEj9FIsvrlobtTOQ3dm0pPiN1wDrsb2sXMEcIewKSx4JgDzI78p+fa2h54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=A8tzrFcN; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="A8tzrFcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=FSlezW9gwAGOI5Wa8d/8abIpiIMp6PI7HfWwx9Mf8p4=;
	b=A8tzrFcN3IlACQRD1OMygezuV6eJMBFI/Dd1Zy2AqhPYVA9EF6v9GaEdqCzb5v
	xcug0swm8810WLjcdEDWrQbg/l3ZdPyNQiGwKsZ9fVLMk2TvbFs9EkBAOX5GNBHk
	/zsd7YtfCXXogKIuGTL7OVhGd93WY2hFMdLVbX04Rz+Jg=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrAD3_0Oq4SVm98wrAw--.20916S3;
	Mon, 22 Apr 2024 12:03:55 +0800 (CST)
Date: Mon, 22 Apr 2024 12:03:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo@jmondi.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: debix-a: Disable i2c2 in base .dts
Message-ID: <ZiXhqWsQie0TERh0@dragon>
References: <20240404002009.10052-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404002009.10052-1-laurent.pinchart@ideasonboard.com>
X-CM-TRANSID:ClUQrAD3_0Oq4SVm98wrAw--.20916S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWkCw48ArWDGrW8KFWUCFg_yoWxKwcE9F
	y5KFnxJwn8tFs3Gwn3Wr4fA3yI934UKF1UuF9Yq3yfZF9rW3sxC3ZFyFWFvr17ur4vkw4f
	Gr93tr10kryj9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0sL05UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGAvIZV6NnuIU+QAAs8

On Thu, Apr 04, 2024 at 03:20:09AM +0300, Laurent Pinchart wrote:
> From: Jacopo Mondi <jacopo@jmondi.org>
> 
> The I2C2 bus is used for the CSI and DSI connectors only, no devices are
> connected to it on neither the Debix Model A nor its IO board. Disable
> the bus in the board's .dts and remove its clock frequency settings, as
> the value depends solely on the devices conncted to the CSI and DSI
> connectors. Display panel or camera sensor overlays will configure and
> enable the bus when necessary.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Applied, thanks!


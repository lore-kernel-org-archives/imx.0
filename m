Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1D51362
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 00:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725236773; cv=none; b=gcbxkLVH8GyxDRq91zNvdVQ0ONKsXyWeeu8V4DEQ/ChFhUV5R4G2v3Rz4equxZIUp8bGNeBKJYQHScymnXrTgDYCSr1vMeZyduJM0uoStFAs7pzDzXI04Ro4AxDCIZtej4BsXCcoe/mwTSWkApnQzaQlYAeYQmrpjc6ago+m1As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725236773; c=relaxed/simple;
	bh=pS8/Qr3RpxndFHxuK2+iHhalkaF8EeghXZM+l9d3ESc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DU712mO1to0NrNAXeTnerE0Wyi+lcVmotFX3RSoqymXIus7lXw7vlyoVegyJZQI9xGdnReLMNVMvPTzqHkBrZhHdKmRWywVAAK4vw0NiP71RhAKV3RqepplDRz2FdazO5L1KXPGyw2f+iJI+ibsznqFD0QuL+0nd8mtl1spJ+/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=nAItCEWE; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="nAItCEWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=j7CC6uEOY/IkNRJQl71zuS1FGHgn1rQnYM6TNUwIKJ0=;
	b=nAItCEWElPxGkCnhWR+y2GxIT1dEEJKL4Ig3bNaOrvowyItqBr8p0H+Vftj5NF
	nz072W5casp2l7TzTVHj069kk/ygDQSkGJNB8b8YUwKDyGGWFqQ6quQR0qN5m+dX
	8/J2cgDO8ADXnRHuTQGaYG3zmn10cNRZCJvVbKYeYW40k=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3v16mBdVmI_lKAA--.41356S3;
	Mon, 02 Sep 2024 08:24:08 +0800 (CST)
Date: Mon, 2 Sep 2024 08:24:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2 v2] dt-bindings: arm: fsl: rename gw7905 to gw75xx
Message-ID: <ZtUFpu2kWFBoluIo@dragon>
References: <20240828173651.4053753-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828173651.4053753-1-tharvey@gateworks.com>
X-CM-TRANSID:Mc8vCgD3v16mBdVmI_lKAA--.41356S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrWFyfAw4rZF1kGFy7Aw45trb_yoWxWrb_CF
	nFkFWDJ3y5Jw4xGw1aqFn5ArWIka4jgrWDWr45Xay7tr95Aw47GFWvyw1Dt34jyF47WF13
	uwn7JrW09ryS9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8BBT5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAJOZWbU4VY-2AAAsP

On Wed, Aug 28, 2024 at 10:36:50AM -0700, Tim Harvey wrote:
> The GW7905 was renamed to GW7500 before production release.
> 
> While we typically do not change compatibles, the GW7905 was never
> released before its product name was changed to a GW7500.
> 
> The use the the 'xx' wildcard is to denote the fact that this
> device-tree can support range of board models from GW7500 to GW7599 as
> has been done historically with the Gateworks baseboards to support
> various build customizatoins based on the same PCB.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied both, thanks!


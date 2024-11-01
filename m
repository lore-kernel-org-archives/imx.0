Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105CC42C0B
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730454554; cv=none; b=nzmPmPolCGfPRs9GzSq69q0FPmznIwev2RlqXdEMRskmywSEEMyaAhnTSNsawc/2d36CIKgmituQOshWGtUpyCm6/604Jk+Y0KYN6R60lDDnGr9DCk8okQ/eXhtMUKKHzW0mBoo8F7hz7Xd+JIh7f8dSEv3jq9LxaM/q/gJoRTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730454554; c=relaxed/simple;
	bh=tIjeF0eix8nbfRW8y1gE3n4C3MRQR8Pe+zuD9kbXwhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ND50jG/0FIp/UoaYeoOCFzb5ZIf+IXEXtIRgEO8HTo9QkxuQkE4hPST0ShSMtkFYOz3+rs8n1WDlpInJ6bCogOYvmdcXindbB0VTR6i2neOW5CzvQky2qYklXL+wyFMBwt0eIVKNQDFKBjvTWUG5o/6gykofyL+uc/k+mwzjZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CJ3teuCV; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CJ3teuCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xLbFvxO9wbFKIlHLG0ze0IRckOOUzPQ/fxFGtuwV3QU=;
	b=CJ3teuCV74Kij0nIv/QJ78QgPOMCAtiUCCmWMjrqSIiBXombK+q+II3fIjoUxH
	xz/sn4mCMGD9Vrb8DyrFFn/aQJpZ2qEgO3nsrKwNM/yStUXwHAsOdUqyPHpTa+v8
	1CSNp8ALf7kvsHnsbwP49vR+/tHhTx85/3YfD7LudL9jk=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXje77oyRnJPxjAQ--.14016S3;
	Fri, 01 Nov 2024 17:48:44 +0800 (CST)
Date: Fri, 1 Nov 2024 17:48:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexander.stein@ew.tq-group.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8: move samsung,burst-clock-frequency
 to imx8mn and imx8mm mba8mx board file
Message-ID: <ZySj+lVvO4eBjDjj@dragon>
References: <20241022220429.1281129-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022220429.1281129-1-Frank.Li@nxp.com>
X-CM-TRANSID:Mc8vCgCXje77oyRnJPxjAQ--.14016S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrW5ZFykAryrAFy5uFW3Wrg_yoWfAFg_CF
	y7Ww1Dur43AwnrKwnIkrW0k34jk343ZrW3Jr1ftrnFyw43u3ZxAFykt3s5AwnrGF4IgrZr
	A3yrAas3A3yfKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8k-PUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhqKZWckfBh4iAAAsg

On Tue, Oct 22, 2024 at 06:04:29PM -0400, Frank Li wrote:
> Move 'samsung,burst-clock-frequency' and 'samsung,esc-clock-frequency'
> properties to i.MX8MN and i.MX8MM mba8mx board file. These properties are
> not applicable to i.MX8MQ MIPI DSI, which uses the compatible string
> 'fsl,imx8mq-nwl-dsi'. The properties are only valid for i.MX8MM and i.MX8MN
> devices with the compatible string 'fsl,imx8mm-mipi-dsim', as described in
> samsung,mipi-dsim.yaml.
> 
> Fix warning:
> /arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: dsi@30a00000:
>     Unevaluated properties are not allowed ('ports', 'samsung,burst-clock-frequency', 'samsung,esc-clock-frequency' were unexpected)
>         from schema $id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239CE217641
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786515; cv=none; b=qjMQhnQGSFEL6+PUHeIcqZrGJAYM/wstHf5mmlflnPG5iOYhX7EAVg2K3GCi7+qJoR4hoVoxonH/fVPe5mudZOLkuMs3RRM3M7tv7EQP9jDPPRtHoUtqNtY0nBez5QVKe30qS77Lx7ILFMoaji8awNWlNC3rDE43FQEyR5lfGlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786515; c=relaxed/simple;
	bh=3Pn2XY0R5r/pkW9Wa6PkniaTqmqz1SSKpcWPRAAjRpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAF52bfFQqyaC8844oKFORw8W1Kfw7pOXmcOEPOawbez36jx0yJazFPuXWyq4K0LPm2X3j4jk0S9E7ykPzHg9GMNLk8dAEpKnOq2GCQcBQqqalbdueEYJUjGsOGhlwkp8aL2AEAzoxDnzod3EcMnI8eLucjVTUWqDaYKnzXf7A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=UTFWmIGp; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="UTFWmIGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=cWvBvJY/V1Stch0H93wsamiErQGrI0aoePeCBYg4NqA=;
	b=UTFWmIGpiWYlPHdNS4u/Y1OSiMDcjea6jJG5r6XMeLCd5gWcxzFzvpodReDC5t
	p0CStdUGEBRMCJUzAKh/NHr1q/6WWp+Du/cPe5qtNMMOrTGECnAdoK/xfw5UTdbJ
	aYIh10M9KSkqJVySYW0O2WAIZoqrihbiXSb5MVuzAXQkY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC38fbyCLNnJaVNCQ--.19260S3;
	Mon, 17 Feb 2025 18:01:23 +0800 (CST)
Date: Mon, 17 Feb 2025 18:01:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mq-librem5: remove undocument
 property 'extcon' for usb-pd@3f
Message-ID: <Z7MI8UuBconRVEyL@dragon>
References: <20241023220252.1392585-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023220252.1392585-1-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgC38fbyCLNnJaVNCQ--.19260S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIxpnUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAh-2ZWey3iu+2gAAsK

On Wed, Oct 23, 2024 at 06:02:52PM -0400, Frank Li wrote:
> Remove undocment property 'extcon' for usb-pd@3f to fix below CHECK_DTBS
> warnings:
> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: usb-pd@3f: 'extcon' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


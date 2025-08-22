Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAEB2DBF5C
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855685; cv=none; b=CeztRbKny0w1hhe/uB0h/k2qaf7IQOv2F0vhZuSAVsLtBd7CfNiMpQ50/4Iq8HaSptHolwh1qRsliplI/vmxrZbyLXdwubupghgWrOZdvv5pvIpuRlOWmPB6RQZPJ0zc+yGkSZYFyqEEo2bMkB/4XwtzQ1x5Z5CyD6kIoQ9UaF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855685; c=relaxed/simple;
	bh=Q82BPiYlkrUkVnpiR/I5Ymj+miavXyg2dafU90RnLp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQJvz9qdhuAoH+E3kc/sfTWNJo7A86TZ3ysKwFaU3+ynijIk1GlwK9stsR78RsMqOm+pSPv37YU0M8VzK4QevHrby73CwHet3txFFvtSoU4u4mFX5ITzobEV4G2+h7xuy+JBIOVvZSKsT99qo1dsENsi2QW5UOF4VPC8denpen4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=oylgM3tF; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="oylgM3tF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=gVmUHKrtpOYQxCJmFxIgVTMfEmr948Q51zk/Mp4w9sA=;
	b=oylgM3tFSnx4A5WIBcMnNR2bRmfU2hMq+L/eFtSkHY6D6n8fmoggMckqx4TQzx
	aK7N4fozcEq0igDoFMqSDBk62BYarjt7Nn4FnOPKMdsOutEHo+N92VQnbLuUopE8
	qyUdzVJ/X5zF0orwPecLDe1Y5SELceBeIkdtY7uPeLw2w=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3T6cjO6hoXhEWAw--.33224S3;
	Fri, 22 Aug 2025 17:40:52 +0800 (CST)
Date: Fri, 22 Aug 2025 17:40:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/4] ARM: dts: vf610: add grp surfix to pinctrl
Message-ID: <aKg7IhnulkotjNub@dragon>
References: <20250819-vfxxx_warning-v1-0-080930d8e1ea@nxp.com>
 <20250819-vfxxx_warning-v1-2-080930d8e1ea@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-vfxxx_warning-v1-2-080930d8e1ea@nxp.com>
X-CM-TRANSID:M88vCgD3T6cjO6hoXhEWAw--.33224S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2LZ2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARuxZWioHpBJPAAAs1

On Tue, Aug 19, 2025 at 03:44:07PM -0400, Frank Li wrote:
> Add grp surfix for pinctrl to fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: pinctrl@40048000 (fsl,vf610-iomuxc): i2c0grp-gpio: {'fsl,pins': [[144, 0, 0, 0, 12738, 148, 0, 0, 0, 12738]], 'phandle': 19} is not of type 'array'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


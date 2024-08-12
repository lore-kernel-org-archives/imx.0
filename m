Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E77116DC18
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723455625; cv=none; b=tHeHxIVaRuxUV9T81+YdZu4H1qDL6HzAm0ffSyGwWFvjTvS7A3x3J+x51pqqw2uNP2k4+HBR5rSaBZjT1ANKzmFoCnsgCtX8yMDRGCsD6M3U+N+eSfvBYjpq/m84LJKbV59HKEEDuOJqd7AaTjawnaACk+YgxhjIFdX8feJ65Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723455625; c=relaxed/simple;
	bh=mw6cplmOp2lcSdbR8MqeYBfW6dC4DuyHrpxZr9V789o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5yXF+QDp4ajwToxPbi4S+rGZm0mxfctRk7HfEb7hZlJ7oaY6YJDO9pIpD+8qx4lRSomwVkcKzLTsOKhH2ry5cgCU6rPCuQMoec5kK/dk3K2A1PTO7x2DHbWxrSpwIaxsrx1/PaCpkrYeTpBAVpChqbWY0+6LdIxwsynn50ndbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=AiucvR8o; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="AiucvR8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xCSPQrFRYSdwq4poKWRNvIyPJNPWv6qGyxka+0jKnPo=;
	b=AiucvR8oj/DrADaQRaQEH2WPDsOmxBRejqJXjDzqrJ3aIoIWGZqokACkjgbX/T
	4e7I/tUlYRKAb+JJGyJL25vx6rAYaIgAzA338rsXpFb8utQUj/LZXWnlTvicQLjE
	tJ0oMACAjBGgWWY8unPokuRPUV9edhQ+hYo3m/6Op/vjg=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAX3Y5i2LlmmjZWAg--.34770S3;
	Mon, 12 Aug 2024 17:39:48 +0800 (CST)
Date: Mon, 12 Aug 2024 17:39:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: mba8mx: Add Ethernet PHY IRQ support
Message-ID: <ZrnYYqCpTKFOGiG+@dragon>
References: <20240717064916.1670702-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717064916.1670702-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Ms8vCgAX3Y5i2LlmmjZWAg--.34770S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgg5ZWa5z1UgEwAAsw

On Wed, Jul 17, 2024 at 08:49:15AM +0200, Alexander Stein wrote:
> The interrupt pin of the PHY is connected to the GPIO expander, configure
> it accordingly.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

It doesn't apply to imx/dt64 branch.

Shawn


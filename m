Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FCB1581E0
	for <imx@lists.linux.dev>; Sun, 16 Jun 2024 02:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718504916; cv=none; b=E+iUq0wUyO1HwzFtAMh3EURaIFV/xuHK50uE26JK6E/3pgwDMfBYm83OGKa3zLE/Myw4JJi5bRHBWiOP8wzPnm/WBZxshKxxecQsqUuDEhZF/l0NxCkeKIeujh2cdc6AUnkPhFtJSi3etf44XOjyQ6REA7OlJnG7YbsYWcHSEz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718504916; c=relaxed/simple;
	bh=1r14RNKX6lIR0dzW2WDHULEq9VmnThN3nSSYnADO748=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxBiaSz5CfBLH/T3HT06dVfjhNJOGa37tMa4VpgZNdip75jLENiWyqsim603AQuLU+IOY611GDLq4T9rJhvgJfSp/8Hf1n/7jrgVDt3NlbPxOYGWTTk8w4jvNctwhck2LLZrBetMU448UKfj83FplBZ8MqjPG2Yu9p3uubarilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HlSt0jGS; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HlSt0jGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=tgM+933VJXc6N/HR2wHbnAQi4LrA+IyU4Qmg8g8VZFE=;
	b=HlSt0jGSDyU0Lc9m1Ig0h+KdZgSVPxIbrFubnol386klkkt6lEKMU7UeTbbCjV
	1G6/al/qLc3PSsK9IyBcFzzk+FsQYOmo2GnJiIpWdd1+b6eNBkuxRORYQ78tnmE8
	bkJtXSJpQf2TZWkLauaM2PVzno7dEYn5vWAm+bbOpzacE=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrACX_heyTW5mR4S+CA--.63768S3;
	Sun, 16 Jun 2024 10:28:04 +0800 (CST)
Date: Sun, 16 Jun 2024 10:28:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: phygate-tauri-l enable pcie phy
Message-ID: <Zm5NskGQrjQk5SSZ@dragon>
References: <20240525171854.2165241-1-parthiban@linumiz.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525171854.2165241-1-parthiban@linumiz.com>
X-CM-TRANSID:C1UQrACX_heyTW5mR4S+CA--.63768S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVJKIDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFRQAZV6NnP0RWQAAse

On Sat, May 25, 2024 at 10:48:53PM +0530, Parthiban Nallathambi wrote:
> I210 intel ethernet controller is connected to PCIe. Enable the PHY
> to use the ethernet controller.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>

Subject prefix should be 'arm64: dts: phygate-tauri-l: ...'

Fixed it up and applied both, thanks!


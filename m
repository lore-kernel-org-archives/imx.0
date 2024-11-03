Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335D4A926
	for <imx@lists.linux.dev>; Sun,  3 Nov 2024 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730625651; cv=none; b=I5OeIqqOEQfawty6o7cUavf9eZmFiqPa6zVo9JX1snDtSxdpRXqLhRYBFPx/0y4JNAW/ivcdlVZcbKy/XRW9dhjtsFvo+2jSj6/utSOisAq7Nz/rM5ZjDkh6+TfN2l2Fw1+XLTe7sHkyYbVBSltE0MhAP9NvktbKTcZt4UqsbQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730625651; c=relaxed/simple;
	bh=VEiFMNaHkGx5MrLRTGpbFJIk4D+Cn75e0zVDY8az264=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2TQ8uY5GSKS47S6F9k7gJOj8LC2Ex9Q/Wn2BNuxUVPZFmmJGQuDUIavxX4dem0h+2bPTlQLyyBhZ569e2AVLzoUsi95aZY9BfNKe/IwzFASxLoL0QFl1e7WWO10dyq6UgLwzDRg0ZlvaV6YkM5A/k0zHNpJQ+XWQ9B7mlla8j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=cpgCf1s6; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="cpgCf1s6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Hd3hoqAxo+sIaJnbd/+l3S6rvstB+d4XTwMycmbNR9U=;
	b=cpgCf1s6Pj+4pHo2nrO4q+eqjlO9emrkG8q+ttAhEjr9Lzp2Pd5B+yH7Je+RG1
	sPoz1GlDpCzUO2bPhpCaBNyPvCh88VCTCOAZejWAfldLoSKwXyIUU+xFxwWgLw/T
	Te1lHSyGtprDDXjncDec2YMFx/L+l0oBc3i/W1KYdIx2M=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXX7ZWQCdnm9KRAQ--.15895S3;
	Sun, 03 Nov 2024 17:20:24 +0800 (CST)
Date: Sun, 3 Nov 2024 17:20:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: alice.guo@oss.nxp.com
Cc: alexander.stein@ew.tq-group.com, wahrenst@gmx.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v4] soc: imx: Add SoC device register for i.MX9
Message-ID: <ZydAVhFvHWCk6oNH@dragon>
References: <20241031065438.3912960-1-alice.guo@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031065438.3912960-1-alice.guo@oss.nxp.com>
X-CM-TRANSID:Mc8vCgCXX7ZWQCdnm9KRAQ--.15895S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxhFxUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQyMZWcmsdbyxgAAs+

On Thu, Oct 31, 2024 at 02:54:38PM +0800, alice.guo@oss.nxp.com wrote:
> From: "alice.guo" <alice.guo@nxp.com>
> 
> i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> which are provided by the corresponding ARM trusted firmware API. This
> patch intends to use SMC call to obtain these information and then
> register i.MX9 SoC as a device.
> 
> Signed-off-by: alice.guo <alice.guo@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Applied, thanks!


Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69DC1C700C
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 05:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752213207; cv=none; b=Z4Z02G5A7OAm0NYtqwOIoG/OmGv2hUvDRh6iHy1JAOdLWmghAEyWKno4X4yIG3kIQtu6RfDaRohfx6KrFrPcmg8Kr379w51j6l5wvq/pS8f27goLCkubnc5mQH/ItGpj93QdBVWoOy5SHGM7w3e5DoAAMZxf27CEjQnvYKHqkQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752213207; c=relaxed/simple;
	bh=/m8ZSj1b9t9MbiWEPW9bXd6dMn+NejgqAoQfrNddRTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4vdh7WMlTdPUjq15TbKCMq7IkLXNqjI4AFg83WQyovreTwGHHJ7wLgdjkUOrPDLsO1OCcSqzLqkfsZdYLB3PMcrDK5jSrmiNXZkRhr7wwFEK65ztNDiZ0P/9V6BqH1EWNHj4LzulaySDtSxCkrsySQ4YyUdKA+DSUC9lS4vLsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=P0LR7TvF; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="P0LR7TvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=arHEu0aIDNsWIedap3lnQQ6Zb5rdOnRdLktlbu2rz9Y=;
	b=P0LR7TvFdASbBQx8TsFz03jiRuVoQS3dUtLb2cv/uajhnoojRzktCTd31j6Pzj
	AsT0S4lz89++TZjJb395jnBXQdLYlGbiCAI0HJ2NGmr4d+oVAHn/Numyarsrju76
	9iIExbv7kDJSEo3vSNJRbPwgYi3R4s5q9EpOmiT+yTp/M=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3Fx4XpHBodJZQAA--.53351S3;
	Fri, 11 Jul 2025 13:41:45 +0800 (CST)
Date: Fri, 11 Jul 2025 13:41:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.li@nxp.com>
Cc: mirela.rabulea@nxp.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ming.qian@nxp.com
Subject: Re: [PATCH RESEND 2/2] arm64: dts: imx95: add jpeg encode and decode
 nodes
Message-ID: <aHCkFpTwE2ce-j5G@dragon>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-2-Frank.Li@nxp.com>
 <aG8p71A4/ntuOde+@lizhi-Precision-Tower-5810>
 <aHCjNtw9G7joUnka@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHCjNtw9G7joUnka@dragon>
X-CM-TRANSID:Ms8vCgD3Fx4XpHBodJZQAA--.53351S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUrxhLUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAR2HZWhwks47UQAAsQ

On Fri, Jul 11, 2025 at 01:37:58PM +0800, Shawn Guo wrote:
> On Wed, Jul 09, 2025 at 10:48:15PM -0400, Frank Li wrote:
> > On Wed, May 21, 2025 at 01:34:04PM -0400, Frank Li wrote:
> > > Add jpeg encode\decode and related nodes for i.MX95.
> > 
> > shawn:
> > 	can you help check this?
> 
> It looks good to me.  But has the binding change been applied already?

Ok, found the binding change on linux-next.  Applied 2/2, thanks!


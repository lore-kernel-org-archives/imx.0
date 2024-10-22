Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AA1A927
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 01:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729560453; cv=none; b=I936qbIT7BRDyLOPXq9RXwkwbxexWLwe0Df14RQMEADjjyjOiz/wY8xq+XTyPjAP936jHGc3uU3PHxUP29uElafz4ivRUYj9MxF6EN+rSp7Mjr+t0sRlFqPPY+cYYBvXnSYEYStDVo2xzXIQiLRmS3ShW+E56SAPX+gIzlqx/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729560453; c=relaxed/simple;
	bh=dqszEP1v019qGNcL5CesOrLFKyvxXNh+xc6yd+cMh8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfdNytdS85cs7kkWXLaYkc02WCVf8EFZ9w9bf/mHzNB1ozA5BxvtfO5xY1Bk4FzCgmxt87iwi3mPJHj2K/3hkN6hU7dC9jZDCmWOTyG9eDvMpeWY0oFp93T+zU9hgi3QcIQB/WjIiqjxFROGTUlcizBsWbp20UXH7BJgo+W7XL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Buz1x96t; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Buz1x96t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=dVrd/2fUWFhAJT7e0aGI6esgbMA0fu+dfMpHANARuy0=;
	b=Buz1x96twcRHAJQfuAdZK/M4fx4p9OBUmc4NXC2cbkl5yuQP4j9ElGIkQMTqW5
	1ygfysgG5+sx3Wi/N/lKe1kDaQlC9klhfnhxTGGdOdVzCB4Mj6u6ivOdcL4YOAZg
	WOfNnjqCeIiWX/tSGXhN+Z79WGYIaulLQW4C+H18Cfd+A=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHLrlt_xZnTOeSAA--.5164S3;
	Tue, 22 Oct 2024 09:27:11 +0800 (CST)
Date: Tue, 22 Oct 2024 09:27:09 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: correct sdhc ipg clk
Message-ID: <Zxb/bU7Z7KxLF9Mu@dragon>
References: <20241012025221.1728438-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012025221.1728438-1-peng.fan@oss.nxp.com>
X-CM-TRANSID:Mc8vCgAHLrlt_xZnTOeSAA--.5164S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIXTmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhSAZWcWdwf6DgAAsW

On Sat, Oct 12, 2024 at 10:52:21AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The ipg clk for sdhc sources from IPG_CLK_ROOT per i.MX 8M Plus
> Applications Processor Reference Manual, Table 5-2. System Clocks.
> 
> Fixes: 6d9b8d20431f ("arm64: dts: freescale: Add i.MX8MP dtsi support")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!


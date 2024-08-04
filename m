Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33458A934
	for <imx@lists.linux.dev>; Sun,  4 Aug 2024 15:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722784099; cv=none; b=QSRIA6FcHuVj+cbDyptowOF4ycuTlzbEeDctoR+nyP9MEbYKyGbJlVdlTnJ/6lAE773j5GTJsgZJYI7AZllNIh1TlrNtXZGLdFF06g7nnulGFEwAyV3BjCERfaI/kdEmauE1iCYnjXg+tSuWVTAsCZxs9rlNRKWP0vEx0Z4zHD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722784099; c=relaxed/simple;
	bh=M8y+LdVMnpc5ht81uEK6XB80b5nISCXQTzcloRYe3KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtY/txzheJSQjonLmdG6JMRx0ZQELCuP2Yrg9bcjtUc/N0aGMKbKRk+OUHkK5LFT0Ul9aG0vYZL4a2srhaameVeJ19JAF96mb9KYiWT9ETcbsibXgUljZB2ZzpV6szeD2JsRkYEEHTGZ3CMbYFmzHo7dyNyZN4FGAZ4NjgITZ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=SXne06Xh; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="SXne06Xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8TuAd/3CLxKF95hF35sdD2H6VbiQxElPgKmbxCAbFxg=;
	b=SXne06XhEapJ3xDBSHD91xFHGeQUD4c1LfjCT+jZNJsfWCg3+ZRCBTrSACjN2v
	FHwgF79EYX+34twApVNSr5vMUOa1NMnOakCHLaoiqPkWm7v/HZ0THRlD4nBIJUWH
	FNcj6fA4J+RtaCVAEqiUcceg8I+uyzYXyi2xVx4eyg8Kc=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHL+3Klq9mMP2DAQ--.18575S3;
	Sun, 04 Aug 2024 22:57:16 +0800 (CST)
Date: Sun, 4 Aug 2024 22:57:14 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] arm64: dts: imx93: drop duplicated properties
Message-ID: <Zq+WymbduhMlsPbC@dragon>
References: <20240628020953.1108967-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628020953.1108967-1-peng.fan@oss.nxp.com>
X-CM-TRANSID:M88vCgDHL+3Klq9mMP2DAQ--.18575S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB8xZWavYGtqTQAAsq

On Fri, Jun 28, 2024 at 10:09:53AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> '#address-cells' and '#size-cells' are already included in soc device tree,
> no need add them in board device tree.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!


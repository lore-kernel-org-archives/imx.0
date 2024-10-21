Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1601E47C4
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729505104; cv=none; b=YmfZo7AjFyBvj4Br47VTmrJO38yUJUqENZ9rVE3eucO7ClkxxwHmlCLwj5DQ0VXzjUS9oe31EFwIFcwVFzBfRe2OQM6hnVj7iSIDToQuoHmde7kaPEkiJdC9wbmifbhw7N0MKyp1CnwP2AxcCIrBq8beyuTWIeATcYCiuWDXrz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729505104; c=relaxed/simple;
	bh=QGKOfojuGwA8bk3kyiBttuSlO5EB+1utUkRRPtuOQH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVyFgLoEFko1ZIL9fNYbjYi+NnjcjcoWGAHGog7j7g4zO7w+ztMdnZns2MKQVNLbNx4LzNqYyFihGyR/rMEExDpDaofxU+4vrsF8CZ0Tj+V0xEQM5y9LyEaf4nJbs/xi6F9sVs/qIMnFYj4QQuvwMAYJIjADb0Ao1NaB+lCs+CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=kSie+Ket; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="kSie+Ket"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=u72vB56gVZXy+GebQCE/4uynmgB2s9u3gqTbtiTGTcA=;
	b=kSie+KetPIIQ9ik4pFKsdxHs2MoPIIvHEfrQoLnocl43LZfw6EWGvE0sz6imYW
	HhF67h/pFBnf1vKaSyXfs4L+WDpv8w7MZblrI2avWdtGuknrJTsr2UTe0mcGao0n
	8xDZS92Q34a7yzhDZtgRudRwmuhl5NDgLRjuVCTYaBjoY=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBHl9UnJxZngIeFAA--.4804S3;
	Mon, 21 Oct 2024 18:04:25 +0800 (CST)
Date: Mon, 21 Oct 2024 18:04:23 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v1 1/1] arm64: dts: layerscape: remove cooling-max-state
 and cooling-min-state
Message-ID: <ZxYnJyMCP0jFSSLJ@dragon>
References: <20241007220542.897605-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007220542.897605-1-Frank.Li@nxp.com>
X-CM-TRANSID:Mc8vCgBHl9UnJxZngIeFAA--.4804S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4b10UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgt-ZWcWDelKcQAAst

On Mon, Oct 07, 2024 at 06:05:42PM -0400, Frank Li wrote:
> Remove unused property cooling-max-state and cooling-min-state.
> Remove undocument property #cooling-cells for ti,amc6821.
> Fix below dtb_check warning:
> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fan-temperature-ctrlr@18: '#cooling-cells', 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/hwmon/ti,amc6821.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


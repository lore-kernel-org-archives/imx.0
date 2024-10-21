Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1228F1C69A
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729499005; cv=none; b=IPROdi8ZKReEV+5XkRJ0Tc4ovjULI9dnUS6GQhCCcKhPPrJ0Q/2VsC1TJFwLJSjS8/1GBxvtjPoSxtp2mIQSRe/AVHCSCMTm0K53hyxPBOmX8NjSXFBbP0O84sCS0N9Jbpip7/Pp4yaalnzgq0HLXQdhNK9TD/Qejzi7A/fqPZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729499005; c=relaxed/simple;
	bh=Sgn6AnppeIsyhNYHCD7iIlv/SBhZzSE/0tqKJRpc1Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIzzhTmKvA8W2IH7soEBykfb4p0zfwhwN0VH2/2Ou6KzIr/9w/JYhpazW1WvauEdGMT/svdhWg23MJREMXtH+z36cCgk4ezOYMjTLtjk6muJvNCc7//UWG8LGjrA4PfUd5b4uohqVRiZKOvUW3ildb0ZaDKhWumnhDkvZC5BPEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=m1qbSvQa; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="m1qbSvQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=+R27LUY/LnG9v9CKSDXsTEb8phTGfZlABswL5V3q/Gw=;
	b=m1qbSvQaztFJQWjcmOyhw1UpJfzYMLeVDuh0sOGwU5ZvfSLCalqangGZno7+Jh
	rvUxl2jQ2csjpaSSeWb3a4fFBpEPySSZ1mtixPoZFAtNmU6ToB0qOvjfUMZikGVp
	FhifzmLEaRT6IbLujU+Rf5Qs44jYTmzz5n7wZY/MHslWU=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXnSdWDxZn_OyDAA--.4591S3;
	Mon, 21 Oct 2024 16:22:48 +0800 (CST)
Date: Mon, 21 Oct 2024 16:22:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: freescale: verdin: Update tla2024 adc
 compatible
Message-ID: <ZxYPViA4JTJkUtSu@dragon>
References: <20241001124505.73857-1-jpaulo.silvagoncalves@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241001124505.73857-1-jpaulo.silvagoncalves@gmail.com>
X-CM-TRANSID:Mc8vCgCXnSdWDxZn_OyDAA--.4591S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRN-ZWcV7NltagAAsA

On Tue, Oct 01, 2024 at 09:45:02AM -0300, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> This patch series updates the compatible string to the correct one for
> the TLA2024 ADC found on the Toradex Verdin iMX8MM and iMX8MP devices.
> 
> João Paulo Gonçalves (2):
>   arm64: dts: imx8mp-verdin: Update tla2024 adc compatible
>   arm64: dts: imx8mm-verdin: Update tla2024 adc compatible

It doesn't apply to imx/dt64 branch.  Could you rebase?

Shawn


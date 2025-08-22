Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536A52EE285
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855748; cv=none; b=OHInMJvqWXVThb4iA7Y7yBJBALp1K77JETj0hpYBzxW1gd5VQQp2sPeGxqn7xO8DUL+fQF2tlSkXwWWhFmIGf5cJVV9jSzxgOoOv+yx/j4wDOvs8/43JQTeithBCqoNzpD9gUlaAAebJddrSM6XXVBKucH5mY56yf1liwK9CX0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855748; c=relaxed/simple;
	bh=5J7ZDWHJOw3DHrTYKkEr3SjzAieYCayrmzq1eWzPVvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Km/0cZUgZcRQPKvlSW3G+3nqZYyFaaQKl1WjEOkyq911s3zpjTAKr6+ik13PF0l/KzGKMSCEQvli9wrMCs/sbkxg9nujL6Z7MVuvRZ06c1eExDSJde2JigH8KHfLGaep7tOIb4GXB5DEN189Ay8nPH//jXr4aqIDI2Wcly5mnDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=lfBTSx1k; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="lfBTSx1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ihFpZK8Kweu8myYJpFk/JCzFIlJuPsYFn1vhCIEfLGM=;
	b=lfBTSx1kHGgbahgmu7uyxhXzEjK2ENgY0l2K9oOt/sRitUvMIAOaMjPc762zAg
	38N0PZDK8KP5tAU2sme1f1qaB+WCp/3AVLk1/fNlKH4iZ/VfCI49wvamYLnPyZg8
	gj38z2SxqvD+LGtpOHwCUZDDrdev56xaSDij0LlCogecI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXd5JjO6hoMRQWAw--.62618S3;
	Fri, 22 Aug 2025 17:41:57 +0800 (CST)
Date: Fri, 22 Aug 2025 17:41:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 4/4] ARM: dts: vfxxx: add arm,num-irq-priority-bits for
 nvic
Message-ID: <aKg7Y0sjZtJpYLT_@dragon>
References: <20250819-vfxxx_warning-v1-0-080930d8e1ea@nxp.com>
 <20250819-vfxxx_warning-v1-4-080930d8e1ea@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-vfxxx_warning-v1-4-080930d8e1ea@nxp.com>
X-CM-TRANSID:M88vCgBXd5JjO6hoMRQWAw--.62618S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFWrCw1UXFyrKryxWw4kJFb_yoWkGrcEvw
	4Ig3WrGF4kCFnIqr1UKwn3J3sayw1rArZ7G3409r1UJFyaqayrJ3ZrKayfJrn8CF4UKFZ8
	t3ySqr4Yka4a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbzwZ5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwUskWioO2WmGQAA3u

On Tue, Aug 19, 2025 at 03:44:09PM -0400, Frank Li wrote:
> Add arm,num-irq-priority-bits(4) for nvic to fix below CHECK_DTB warnings:
>   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
> 	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm/boot/dts/nxp/vf/vf610m4.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/vf/vf610m4.dtsi b/arch/arm/boot/dts/nxp/vf/vf610m4.dtsi
> index 2bb331a87721000880cebeb81dd3c00febfbed3c..ccb5deb4e9528fe005a5691347d4a3852fa52ca3 100644
> --- a/arch/arm/boot/dts/nxp/vf/vf610m4.dtsi
> +++ b/arch/arm/boot/dts/nxp/vf/vf610m4.dtsi
> @@ -52,6 +52,10 @@ / {
>  	aliases { };
>  };
>  
> +&nvic {
> +	arm,num-irq-priority-bits = <4>;
> +};
> +
>  &mscm_ir {
>  	interrupt-parent = <&nvic>;
>  };

Should probably add it here in name of order.  Fixed it up and applied.

Shawn

> 
> -- 
> 2.34.1
> 


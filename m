Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E49F36B
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730461603; cv=none; b=Ri4DmgYRnJGwx9CuHoqY4Cz3yalNmxpp65pYatpPUGDxx2mcsRty+/4u/OjED2T4YJYzR4HTJxeGiuMd4mQZPRggA5ESAIO8jPcHgGkb7m4bGifa+B1IdeQ4lL+q/aJlYsZ7I40L4qaBjQNNbU1eMY5dGTVju5aBu2AUmiOBKXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730461603; c=relaxed/simple;
	bh=2FFDvupKdpH2nMa7kFYy8HYE5gnZkKHKaoyzng9SVMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkxkT06P8ED7gUhYXxluP9VHw7Q7kBMikjul1hCOPp/byNkSC2dlE7NsQz2tBdDQ3T5plp74WEz65Dbt/bU9jZMwwMYaeo5VCialsJMbGGgsFmDEG+R3yQHfrF7cZTsB6f4Avhq5uhd6q0J5DCxfLhOl9SP4pboIAEoAnilzWjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=KJKFw353; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="KJKFw353"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=vBhhEiomKrzvqxGLGcDjM350Ad9Z2r+Ry5z4X3rrDy8=;
	b=KJKFw353fhDs710pbkq9vTdnMRsejfZ5iqwWlIWRjb1RcZwxk4IfCUPm3QLqFA
	752EO89ExgeAZ0rHV2XEe2vHdu5s414AXZpsn7MoRT+oXfuVomORhj5HijuR7GXq
	pj/6wl0Zs9EUHvikIXj9YKlsYf1DHuQUcihnccmjbyz3Q=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBX8YiMvyRnpAFrAQ--.14187S3;
	Fri, 01 Nov 2024 19:46:22 +0800 (CST)
Date: Fri, 1 Nov 2024 19:46:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mq-librem5: remove undocument
 property 'extcon' for usb-pd@3f
Message-ID: <ZyS/jGUf2C2VlJ4J@dragon>
References: <20241023220252.1392585-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023220252.1392585-1-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgBX8YiMvyRnpAFrAQ--.14187S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruryDuw43uFyfJrWkZr4rAFb_yoWkJFb_AF
	4xuw4rJrWrAFWIgas5tw4kZ3W2grWUC34ftr1rXr4kGryav398Ca97Wr4rGrn8GFWFkrZ8
	ArZxXF15AryYkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8voGJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhWKZWckdPvVbQAAsc

Copy Sebastian for comment if any.

Shawn

On Wed, Oct 23, 2024 at 06:02:52PM -0400, Frank Li wrote:
> Remove undocment property 'extcon' for usb-pd@3f to fix below CHECK_DTBS
> warnings:
> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: usb-pd@3f: 'extcon' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> index 1b39514d5c12a..61bdb43dec31d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> @@ -794,7 +794,6 @@ typec_pd: usb-pd@3f {
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-names = "irq";
> -		extcon = <&usb3_phy0>;
>  		wakeup-source;
>  
>  		connector {
> -- 
> 2.34.1
> 


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B59723184F;
	Fri, 14 Nov 2025 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104163; cv=none; b=iEH/E47R0Mgg5voMnmxYA0n86x+Fj8n9tF+wGFmHf9XLitLKCoC1d/WhgZzmphgJd7KzZM8NpuSY/JyNYGIyHGzYJKM0rD6l05wmaeW37pnSX18ztsMjwy7sEe0bJvdBouvwqzn7KLF1bGjG/i3LUcmftHgQOF9+2GYAYYC10Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104163; c=relaxed/simple;
	bh=uMczW6xm3tzYXJie6UXCYYndNg50YuEV29JoCE/q1ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+KKK6auuYW8xkHjG1bR1FgsxlHmQA/rdXbs2V7DtWWCZDgtncpSCmKO7TSC9KIpFA+mMd7oSSf9EKjB48CJefI+clZj77Hmeh7I6oO4s74oAMJFjXYlQOpCZl7F6BPS0i7nfCVzjBI0PfppibzgiEv/HVJ8FLTbDsV+RHkSSPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXB/SH+e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXB/SH+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B48C4AF09;
	Fri, 14 Nov 2025 07:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763104161;
	bh=uMczW6xm3tzYXJie6UXCYYndNg50YuEV29JoCE/q1ik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OXB/SH+eZFegjNwezMreXdWJVEB1Uw8X41gZ8U+mRfgeMPGcwoVsxSXizMcK192pJ
	 J238StqrQcqXv35Q4ssEC1oHeThV3GPZmfsHNkzmV+DhTvlV+IId4opjTz+qAllAiH
	 qCOq8WyydbO2MSknFThAQVQffscFRq83G0F5UPjYOOjh7hckuaRiXJER15dtzjA3wq
	 Mkx0W12hqqC1An0g12pxy+yDVr+1Rrybr2sVY1UpkwLtZB2mH8plHHZYzZ2ZNEC+pd
	 vRF1/goXKkSDpC2dMVBusVB0Gp5jQ3+0LFSzAiejIXxGbsns+1+dW+MZgWB2ddls8p
	 N1u0fooSE49iQ==
Message-ID: <77918d70-49a0-4922-8f41-60b236a0ae3d@kernel.org>
Date: Fri, 14 Nov 2025 08:09:16 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: freescale: Add FRDM-IMX91 basic support
To: Joseph Guo <qijian.guo@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Justin Jiang <justin.jiang@nxp.com>, Tom Zheng <haidong.zheng@nxp.com>,
 Steven Yang <steven.yang@nxp.com>
References: <20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com>
 <20251114-imx91_frdm-v1-1-e5763bdf9336@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251114-imx91_frdm-v1-1-e5763bdf9336@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2025 07:55, Joseph Guo wrote:
> +
> +	reserved-memory {
> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0x80000000 0 0x30000000>;
> +			reusable;
> +			size = <0 0x10000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	sound-mqs {
> +		compatible = "fsl,imx6sx-sdb-mqs",
> +			     "fsl,imx-audio-mqs";
> +		audio-codec = <&mqs1>;
> +		audio-cpu = <&sai1>;
> +		model = "mqs-audio";
> +	};
> +
> +	sw-keys {

That's not how the node is called. Either use existing name or follow DT
spec in node naming.

> +		compatible = "gpio-keys";
> +
> +		K2: user_btn1 {


It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

And underscore used... Please do not send us downstream code.

You need to write it from scratch from usptream code, not send us what
you have in downstream.

...

> +	};
> +
> +	pcf2131: rtc@53 {
> +		compatible = "nxp,pcf2131";
> +		reg = <0x53>;
> +		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-parent = <&pcal6524>;
> +		status = "okay";

Why?

> +	};
> +};
> +
> +&lpspi3 {
> +	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&pinctrl_lpspi3>;
> +	pinctrl-1 = <&pinctrl_lpspi3>;
> +	pinctrl-names = "default", "sleep";
> +	gpio = <&pcal6408 0 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +
> +	spidev0: spi@0 {
> +		compatible = "lwn,bk4";

NAK, don't fake nodes. Just because downstream uses this, is not correct
argument. This does not exist here.

...

> +
> +	pinctrl_usdhc2_gpio_sleep: usdhc2gpiogrpsleep {

You still not bother to test your own code... Again, why are you sending
downstream code?

Best regards,
Krzysztof

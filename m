Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22056398FA3;
	Wed,  3 Dec 2025 18:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764784974; cv=none; b=uL9Ve7UH34t5GuaUcTTVWA6iDL3LxO8DwRzYGcaRl64aqJ8O7UVhTqpFn0XhB5mhr+9Ie42kbOISadZFXFswX9Rgu74uitxs3aTyaH4b4oPY817mJEc43WbnC/x/YIm/qzz1Qts5DPKq6pa0pjM2TgO8yuzaiLlKlNs8H2x41Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764784974; c=relaxed/simple;
	bh=LzZXmv9rm/Dq7yhuvhvRzxUVsCEsA2jTVnTclfEwJaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVWys1T2Y5TJROlF1YsR0s0Y9H1+qnREfCto2Gnk8Nc9Icc0r0c+/qET0InBW3ix4kMca4B4jn6CfyOJay6GQMuzz2+cTeGYfhojP5NTWoNic7ZS6fj6S8G37zj0HFv+TMjiM3r6UdUdFXGn1BPEpyyqftQ9xnkn0yjQ5hP9YwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qq2o0+OQ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qq2o0+OQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=sSj7FMQeqa2UUNYX+T5h0r4adaA2rYhnswTS7LJ4PLg=; b=qq2o0+OQASQPi8kqSd5Hh2C+n2
	t025LiGMZYo/6IgKwBAkFZlFEEfQVQRtxb4NhnbHdHRcs6MGZ+b2iXB3kKblRwnifsnCKN+tk9qJT
	6aT8dtcI23AnohMVw6YhBHWB0VT2H7QHZuXw9Wuv1AhnVGtedS49qEjOtR5vgMrRB2OV3ro5tnk9g
	UimYZ9nqpjdNrzASvDNjOyLxR2SCYcWhnt35LFz6qarFvKpgDsxWNUOXr8GZD7uaPIcaJ2lzdntQr
	nShXBXURx+uZOu9EwmaRLwKwQ7xNSKuNmSh21RjacXdMg17lORLMWRwqDg8pQ0plP9bIM1o0mBQXH
	5C4bG0vw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrBi-00000006u6S-2Spi;
	Wed, 03 Dec 2025 18:02:50 +0000
Message-ID: <33d659bd-eba9-4b47-a374-32b6c763d640@infradead.org>
Date: Wed, 3 Dec 2025 10:02:49 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
References: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
 <20251203-imx-se-if-v20-3-a04a25c4255f@nxp.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251203-imx-se-if-v20-3-a04a25c4255f@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 12/2/25 10:48 PM, Pankaj Gupta wrote:
> diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
> index 127ad752acf8..5fe96299b704 100644
> --- a/drivers/firmware/imx/Kconfig
> +++ b/drivers/firmware/imx/Kconfig
> @@ -55,3 +55,16 @@ config IMX_SCMI_MISC_DRV
>  	  core that could provide misc functions such as board control.
>  
>  	  This driver can also be built as a module.
> +
> +config IMX_SEC_ENCLAVE
> +	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware driver."
> +	depends on IMX_MBOX && ARCH_MXC && ARM64

Is it possible to work COMPILE_TEST into this dependency?

> +	select FW_LOADER
> +	default m if ARCH_MXC
> +
> +	help
> +	  Exposes APIs supported by the iMX Secure Enclave HW IP called:
> +	  - EdgeLock Enclave Firmware (for i.MX8ULP, i.MX93),
> +	    like base, HSM, V2X & SHE using the SAB protocol via the shared Messaging
> +	    Unit. This driver exposes these interfaces via a set of file descriptors
> +	    allowing to configure shared memory, send and receive messages.

thanks.
-- 
~Randy


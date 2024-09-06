Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627A91D0DC6
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 15:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638016; cv=none; b=FOz3Fz/GcV98mNcK8kSVyogrZtwvzKnYiPNnnPNIFa5HHFPNzz6eEEErjF0xTWGf0w83iy4J4l5ENPi3vFnQT7UkTPIKezQb4nGKpIKPfkX+zl98QE6+VJdgz7OUIx6NZUkePoE/VdddP5UkPYUMi5pjToHYRyWpuuZot8Zleng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638016; c=relaxed/simple;
	bh=WAWEBcr+J5ycmnAjjxWFN7gCy3KcxkcCtECCiUEjoO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDrKEMLSOBhmZW4zP6YjIRcn1g1cJTBe2Y+Oif1ssc1fEjlKZS20AyxDWrD5BvQtx8r/XSrEmpfbe1HkDDfIhLkpCjyeoehzahW569pD7EBa+xBrFNMzXUvyRMp1Snu+PNIFLQp0e1xZ9oI3/YlbnzhsmSEd4mDeQoI2LFEBZlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dGQ90Yqk; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dGQ90Yqk"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-374c4d4f219so1302444f8f.1
        for <imx@lists.linux.dev>; Fri, 06 Sep 2024 08:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725638011; x=1726242811; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DI8o5gu7OR5hgYkJNn+/W5hw7ApVbZjOLKlmqFfKJmE=;
        b=dGQ90YqkJGtgniEfGpcHq8jxqYjIP0pDcQzGp7f1fjaXtofLSt5scCl+oWtgyl/LCi
         4diE6G3uWe75X2MPXXcQL6RN/R/zWVWHX4aFKVcYud6JPhHRpXtj7CXld56U4B3bDqYh
         AXMMgadVwTaXGyRB3js3wdbX8J9fHNBWlk0Ylhf88GpLeek0ysFqvGw6Fzkx7+50YMps
         +HoifcODLgeZ2FVMTF7hHohhYxJFLroPAp8WMYN1r0OeQZiRf4/76NaCW9PFjjDe4oJv
         xzkUQyv1aeRnbA8VbA/G8+ia/zUl0b/R+QzTu/eYDJfOb99rwqMSAOQHlB8rsQsUUQ4k
         rsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725638011; x=1726242811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI8o5gu7OR5hgYkJNn+/W5hw7ApVbZjOLKlmqFfKJmE=;
        b=vpR3oy6brbuuukvr5sy/g3YJYWnqAKhKCqqZ8O7raqvry3IzE0KR4nqExicTOKYKGj
         zsIgBWNGyND8bhcc+RO3aPRW2AcHrjN/L8jyBwOTkRHhm+U3CxxlZCAVky29S7O3Dryf
         eEevFGydEp8tZr2t7m4jvgELuZeRh7bZho2+bQfQnh0kv1NCiDmkdbxUu5cIUbX0acq0
         cC6MmzrXmst9KPjRN1hgbrIsytaQtmfZsHks0+v1EhZnDSQLT7c2gw0T0e0b8qrMx+BT
         +Hv+24tq+HB7wbjgTH3R/royI8MeCQHu9V6eCuBMAvWBxaWfR/mPEFQQ1IIb6xW8FaoS
         ZNKA==
X-Forwarded-Encrypted: i=1; AJvYcCUFqHshHwc5KlntfZcMtyAVTr7v9jUs+UwfMNGYqgHcEgzqxoNIhMPEWcTH8LrC3TbjQzg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfdY6gdKzFG2CngaL74sqlJCLl2h272JRc9u+GAeKGkJjyUCkN
	SQ5kmJZ+038bLQUdVLWgnV5b6VNOU83dLyApU3nqvoW1eZ7aCKHafW+chRc5eGw=
X-Google-Smtp-Source: AGHT+IFhlE6ZrY41rmkc+9XGmW+fZeuwq4JG6dHsE1M5Fq87WTjwrS/Nh6wLsDQBUZUkcgmyZ7UGWg==
X-Received: by 2002:a5d:5192:0:b0:374:c9f0:752d with SMTP id ffacd0b85a97d-378896a5ca3mr1851961f8f.47.1725638010354;
        Fri, 06 Sep 2024 08:53:30 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca05cfb47sm24222555e9.22.2024.09.06.08.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 08:53:30 -0700 (PDT)
Message-ID: <276a7f04-6761-40c2-8f37-799175f9b11b@suse.com>
Date: Fri, 6 Sep 2024 17:53:28 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: s32g: Add S32G2/S32G3 uSDHC pinmux
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>, Radu Pirea <radu-nicolae.pirea@nxp.com>
References: <20240830113347.4048370-1-ciprianmarian.costea@oss.nxp.com>
 <20240830113347.4048370-2-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20240830113347.4048370-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/08/2024 13:33, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Adding 100mhz & 200mhz pinmux support for uSDHC helps to enable
> higher speed modes for SD (SDR50, DDR50, SDR104) and
> eMMC (such as HS200, HS400/HS400ES).
> 
> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g2.dtsi      | 153 ++++++++++++++++++
>   .../arm64/boot/dts/freescale/s32g274a-evb.dts |   4 +
>   .../boot/dts/freescale/s32g274a-rdb2.dts      |   4 +
>   arch/arm64/boot/dts/freescale/s32g3.dtsi      | 153 ++++++++++++++++++
>   .../boot/dts/freescale/s32g399a-rdb3.dts      |   4 +
>   5 files changed, 318 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index fa054bfe7d5c..7be430b78c83 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -162,6 +162,159 @@ jtag-grp4 {
>   					slew-rate = <166>;
>   				};
>   			};
> +
> +			pinctrl_usdhc0: usdhc0grp-pins {
> +				usdhc0-grp0 {
> +					pinmux = <0x2e1>,
> +						 <0x381>;
> +					output-enable;
> +					bias-pull-down;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-grp1 {
> +					pinmux = <0x2f1>,
> +						 <0x301>,
> +						 <0x311>,
> +						 <0x321>,
> +						 <0x331>,
> +						 <0x341>,
> +						 <0x351>,
> +						 <0x361>,
> +						 <0x371>;
> +					output-enable;
> +					input-enable;
> +					bias-pull-up;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-grp2 {
> +					pinmux = <0x391>;
> +					output-enable;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-grp3 {
> +					pinmux = <0x3a0>;
> +					input-enable;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-grp4 {
> +					pinmux = <0x2032>,
> +						 <0x2042>,
> +						 <0x2052>,
> +						 <0x2062>,
> +						 <0x2072>,
> +						 <0x2082>,
> +						 <0x2092>,
> +						 <0x20a2>,
> +						 <0x20b2>,
> +						 <0x20c2>;
> +				};
> +			};
> +
> +			pinctrl_usdhc0_100mhz: usdhc0-100mhzgrp-pins {
> +				usdhc0-100mhz-grp0 {
> +					pinmux = <0x2e1>,
> +						 <0x381>;
> +					output-enable;
> +					bias-pull-down;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-100mhz-grp1 {
> +					pinmux = <0x2f1>,
> +						 <0x301>,
> +						 <0x311>,
> +						 <0x321>,
> +						 <0x331>,
> +						 <0x341>,
> +						 <0x351>,
> +						 <0x361>,
> +						 <0x371>;
> +					output-enable;
> +					input-enable;
> +					bias-pull-up;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-100mhz-grp2 {
> +					pinmux = <0x391>;
> +					output-enable;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-100mhz-grp3 {
> +					pinmux = <0x3a0>;
> +					input-enable;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-100mhz-grp4 {
> +					pinmux = <0x2032>,
> +						 <0x2042>,
> +						 <0x2052>,
> +						 <0x2062>,
> +						 <0x2072>,
> +						 <0x2082>,
> +						 <0x2092>,
> +						 <0x20a2>,
> +						 <0x20b2>,
> +						 <0x20c2>;
> +				};
> +			};
> +
> +			pinctrl_usdhc0_200mhz: usdhc0-200mhzgrp-pins {
> +				usdhc0-200mhz-grp0 {
> +					pinmux = <0x2e1>,
> +						 <0x381>;
> +					output-enable;
> +					bias-pull-down;
> +					slew-rate = <208>;
> +				};
> +
> +				usdhc0-200mhz-grp1 {
> +					pinmux = <0x2f1>,
> +						 <0x301>,
> +						 <0x311>,
> +						 <0x321>,
> +						 <0x331>,
> +						 <0x341>,
> +						 <0x351>,
> +						 <0x361>,
> +						 <0x371>;
> +					output-enable;
> +					input-enable;
> +					bias-pull-up;
> +					slew-rate = <208>;
> +				};
> +
> +				usdhc0-200mhz-grp2 {
> +					pinmux = <0x391>;
> +					output-enable;
> +					slew-rate = <208>;
> +				};
> +
> +				usdhc0-200mhz-grp3 {
> +					pinmux = <0x3a0>;
> +					input-enable;
> +					slew-rate = <208>;
> +				};
> +
> +				usdhc0-200mhz-grp4 {
> +					pinmux = <0x2032>,
> +						 <0x2042>,
> +						 <0x2052>,
> +						 <0x2062>,
> +						 <0x2072>,
> +						 <0x2082>,
> +						 <0x2092>,
> +						 <0x20a2>,
> +						 <0x20b2>,
> +						 <0x20c2>;
> +				};
> +			};
>   		};
>   
>   		uart0: serial@401c8000 {
> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> index dbe498798bd9..7ab917f547ef 100644
> --- a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> @@ -34,6 +34,10 @@ &uart0 {
>   };
>   
>   &usdhc0 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc0>;
> +	pinctrl-1 = <&pinctrl_usdhc0_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc0_200mhz>;
>   	disable-wp;
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> index ab1e5caaeae7..8739f63771bc 100644
> --- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> @@ -40,6 +40,10 @@ &uart1 {
>   };
>   
>   &usdhc0 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc0>;
> +	pinctrl-1 = <&pinctrl_usdhc0_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc0_200mhz>;
>   	disable-wp;
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index b4226a9143c8..6c572ffe37ca 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -219,6 +219,159 @@ jtag-grp4 {
>   					slew-rate = <166>;
>   				};
>   			};
> +
> +			pinctrl_usdhc0: usdhc0grp-pins {
> +				usdhc0-grp0 {
> +					pinmux = <0x2e1>,
> +						 <0x381>;
> +					output-enable;
> +					bias-pull-down;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-grp1 {
> +					pinmux = <0x2f1>,
> +						 <0x301>,
> +						 <0x311>,
> +						 <0x321>,
> +						 <0x331>,
> +						 <0x341>,
> +						 <0x351>,
> +						 <0x361>,
> +						 <0x371>;
> +					output-enable;
> +					input-enable;
> +					bias-pull-up;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-grp2 {
> +					pinmux = <0x391>;
> +					output-enable;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-grp3 {
> +					pinmux = <0x3a0>;
> +					input-enable;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-grp4 {
> +					pinmux = <0x2032>,
> +						 <0x2042>,
> +						 <0x2052>,
> +						 <0x2062>,
> +						 <0x2072>,
> +						 <0x2082>,
> +						 <0x2092>,
> +						 <0x20a2>,
> +						 <0x20b2>,
> +						 <0x20c2>;
> +				};
> +			};
> +
> +			pinctrl_usdhc0_100mhz: usdhc0-100mhzgrp-pins {
> +				usdhc0-100mhz-grp0 {
> +					pinmux = <0x2e1>,
> +						 <0x381>;
> +					output-enable;
> +					bias-pull-down;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-100mhz-grp1 {
> +					pinmux = <0x2f1>,
> +						 <0x301>,
> +						 <0x311>,
> +						 <0x321>,
> +						 <0x331>,
> +						 <0x341>,
> +						 <0x351>,
> +						 <0x361>,
> +						 <0x371>;
> +					output-enable;
> +					input-enable;
> +					bias-pull-up;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-100mhz-grp2 {
> +					pinmux = <0x391>;
> +					output-enable;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-100mhz-grp3 {
> +					pinmux = <0x3a0>;
> +					input-enable;
> +					slew-rate = <150>;
> +				};
> +
> +				usdhc0-100mhz-grp4 {
> +					pinmux = <0x2032>,
> +						 <0x2042>,
> +						 <0x2052>,
> +						 <0x2062>,
> +						 <0x2072>,
> +						 <0x2082>,
> +						 <0x2092>,
> +						 <0x20a2>,
> +						 <0x20b2>,
> +						 <0x20c2>;
> +				};
> +			};
> +
> +			pinctrl_usdhc0_200mhz: usdhc0-200mhzgrp-pins {
> +				usdhc0-200mhz-grp0 {
> +					pinmux = <0x2e1>,
> +						 <0x381>;
> +					output-enable;
> +					bias-pull-down;
> +					slew-rate = <208>;
> +				};
> +
> +				usdhc0-200mhz-grp1 {
> +					pinmux = <0x2f1>,
> +						 <0x301>,
> +						 <0x311>,
> +						 <0x321>,
> +						 <0x331>,
> +						 <0x341>,
> +						 <0x351>,
> +						 <0x361>,
> +						 <0x371>;
> +					output-enable;
> +					input-enable;
> +					bias-pull-up;
> +					slew-rate = <208>;
> +				};
> +
> +				usdhc0-200mhz-grp2 {
> +					pinmux = <0x391>;
> +					output-enable;
> +					slew-rate = <208>;
> +				};
> +
> +				usdhc0-200mhz-grp3 {
> +					pinmux = <0x3a0>;
> +					input-enable;
> +					slew-rate = <208>;
> +				};
> +
> +				usdhc0-200mhz-grp4 {
> +					pinmux = <0x2032>,
> +						 <0x2042>,
> +						 <0x2052>,
> +						 <0x2062>,
> +						 <0x2072>,
> +						 <0x2082>,
> +						 <0x2092>,
> +						 <0x20a2>,
> +						 <0x20b2>,
> +						 <0x20c2>;
> +				};
> +			};
>   		};
>   
>   		uart0: serial@401c8000 {
> diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> index 176e5af191c8..828e353455b5 100644
> --- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> @@ -40,6 +40,10 @@ &uart1 {
>   };
>   
>   &usdhc0 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc0>;
> +	pinctrl-1 = <&pinctrl_usdhc0_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc0_200mhz>;
>   	bus-width = <8>;
>   	disable-wp;
>   	status = "okay";

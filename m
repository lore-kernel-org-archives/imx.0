Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DBE35C19A
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 10:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791942; cv=none; b=S+AmBuadXex3ui+JrhFBx6ZjxeVrNxobjMMRFG1kbdKEcRWywwjzpIwlzd0QVm2nQF2US984miAzZNOnhsIk06Qd19N5IoTJ+rOp163c39bRhPMg5Uf/SokypxGL+3trkkFXB27suD9EJb/84XEwbjtLg8+f2tPW4Ll53gYXTL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791942; c=relaxed/simple;
	bh=BzoNyfrEyJCPCGtVdG90MFhEGrkW+3rXdDVn4rAVtCQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XnmsXrmaYdJqeoZZHJxtMxeo66n6sHYPa0FN1qMWCVOBCtnNXwhjPqEuBX7Wwb/9xYTEnTN+z4YSyElXBy8OX9SzskLj/A8+nsug+JbwJiAhdYJpgk8B6raGSAbmHvLSsFzIHVXlJRW7Kh+uh139LHBqzBQDBPeaYvofBtpLsqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2L2AoA1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2L2AoA1"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so5710167f8f.2
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 02:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772791940; x=1773396740; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv4dJ/4VMXcAmevXlUG/734DLVWUrC6bvT8eqbpexP4=;
        b=i2L2AoA1t99OsPRiI667NfLrsyxjQSTB/+IZG4f8KMLc1dWlZUOnYG1eJXo22kVexo
         +inla0eaH1fPOCFwS09uwKOFyiHA1TKTYMUQitBePgpWwXxXq9jkrzV9lQ3eWUchrjnr
         /WYxapAkdvWori4dB6j5FLdt6QOu2e64YuXdsG1LLv3+Cwvx7dDT2bhecVMoY+Xj0sFa
         sFtQHdMGYJFZrCXRS7GVsBf1iPxvUb8twMe36UFv14SD3UFcWyWNabt6xlLMscK4mvdq
         Cf1LDOOBCYKo0scZpHq4S2VR3j9cmpUbc+/mPp2EssW97Z6mKVRG/8j4AHgqBQU0Qsyq
         N6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791940; x=1773396740;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv4dJ/4VMXcAmevXlUG/734DLVWUrC6bvT8eqbpexP4=;
        b=ogJ57ng1tMDRUpBWUyAsv3CiF+CXfGz1xy6b83Es3g6Qwnf7yLfNEvcq/RFNM6FN77
         3r0+IqPgTHTKYwuSEuavHkXg0TbPEu3iyBnE81GnrtS1i+laaxj0Sgdr3Apvd4BL/EqR
         E7dlSlg9B/enhFAaOSDyxPkbneVAaKZoYCXh1nrUUWSR96tOGC1DMxpaqfBVvh2jS2F+
         plRT/4xhO1uoS0p8qCE+PLB13afCX1kgT+qSmgKbq4/xhdfUXVSJCTnU1pEFzGizvfaS
         tkVDeZ424C18M0K4iVFUBTi7bhTky6QLBf0Jqo9ZV/HEZmx74qz3wDuxCHTO4H1Jgi6H
         lRDA==
X-Forwarded-Encrypted: i=1; AJvYcCV8DQ10tIGy/u2lk8TCtEP9CXX5cCd/11GSWseLgC9DOifiygntTn2H4FbUkNHtPssxK48=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsf/MMp3xlmMGfnd4sC8Wy1dMH4cQ/nwd4QAoWraVeQ5s20B4O
	eat6NL1urIbQl3+zEJa71JI99KC4MPRESUQVTlKf06JO238Q4zCdqdoXa8gapaKOUK8=
X-Gm-Gg: ATEYQzyWsQ+KSuSf9IdkFHgtWW1r5+MPv1j9gXM14gN3kVN+hjoH//w/WhWRt4K5l87
	lrqJmLwzAX+LdSjdVMqOBamiiIUgQTU6GlnepqRZkycW225/FDZXfmxBblOquzyxnwV95sDQq+a
	HKbLFPp3FaJRRm6+13iNuOM+zTqFMtP5wmZAd4OiqGIaAq6Ehm6siFqhInHuxYfSqPiXJvrHkw5
	OAA2f5bSK7QILRMoFkha8CXEQloy0dnFLC8hluPgH7X9zGB2PfGn6U0rRk8qQms1UfBROOeeete
	IJInWRm+nTCmUxMqEo3ulN5KQkAPDCuY1h2YDBYojhcj3j+EVR/W7Jp5XTWnP75oWbKM62SmHzS
	DuQLUzf1HS9W5BvcsPVkVPBZVPW4wIQqf/jxgnReNhmVbhttn2/Roh/kTm3/h+v/1lm6M+gQ4sT
	xeVgO+aDFCo5YPRV8nrEz+WjuP0H0BdXKXrQ5vwFq8RMIh0AD+IQlH2EyNvf8IG6QLa5OIxxCss
	eCB
X-Received: by 2002:a05:6000:1acf:b0:439:d752:8bf9 with SMTP id ffacd0b85a97d-439da8a0219mr2636932f8f.58.1772791939641;
        Fri, 06 Mar 2026 02:12:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95? ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm2529820f8f.6.2026.03.06.02.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:12:19 -0800 (PST)
Message-ID: <6b4ea910-1a73-421e-8a38-8827a506b937@linaro.org>
Date: Fri, 6 Mar 2026 11:12:18 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/7] arm64: dts: amlogic: s6: Drop CPU masks from GICv3
 PPI interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Marc Zyngier <marc.zyngier@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <f9c6eddebebcd2e128edd2dbc51706e23589f9e8.1772643434.git.geert+renesas@glider.be>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <f9c6eddebebcd2e128edd2dbc51706e23589f9e8.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/26 18:10, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> While at it, replace the magic number for IRQ_TYPE_LEVEL_HIGH by its
> symbolic definition.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> index 8ef6319390331fcf..ab3acef2b147e62c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> @@ -53,10 +53,10 @@ pwrc: power-controller {
>   
>   	timer {
>   		compatible = "arm,armv8-timer";
> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   
>   	psci {
> @@ -84,7 +84,7 @@ gic: interrupt-controller@ff200000 {
>   			interrupt-controller;
>   			reg = <0x0 0xff200000 0 0x10000>,
>   			      <0x0 0xff240000 0 0x80000>;
> -			interrupts = <GIC_PPI 9 0xf04>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
>   		apb: bus@fe000000 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

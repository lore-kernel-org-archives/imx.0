Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D6F319864
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596610; cv=none; b=lDanHnxBeCOdjy6Ei/K8Ax2Mygs0ml2Jk4nZLKrHu2fpbO8IuH6Nm4YIsKTm2dkf5owT0MiP6ackJOSfX4QYKQXQ1uS6ZKToaTa0NfGK1pXHJKzppAVqxIK50vh2gB0XrhvlCzraq4dt3F4X9XkzyldGn2EVmMlO39Oo4hsx+ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596610; c=relaxed/simple;
	bh=g0ZQSSDWjXeANXVszXFg5R1z+7y+0W+C8DYO/dgRiQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZL+iNSL34FXqGlMDP2JRV1qAP1rawdRgHPO/HScqGMMQZkMXkpDFCTfQV9tWBargWl8QeOiPiHOpYrzTSTPxJOXO8Coh63F881bQ+sSPMtZJMZ5ZiShdHAEFY6E03CYvxSzQ1+LdMv00mrilFK8IeMw1A6hndfpWmCTj4hE66w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwIedou1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwIedou1"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b9e418ba08so2804580f8f.3
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596607; x=1756201407; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRnvcJ2f2fPQ8sZ2OC8GktyRnLPTrLj3Sq7t/FTrOnE=;
        b=QwIedou1NF4APqowWDMT6XsBshCOhI9Wj6J5GzdL+AlK6eRveP1W+aA8voD1217Ey6
         QNmh0+ZEgC/wOHmdSg5Qa6CYGxeR4pwOdlLZXcClSnNglPJuwl3BGeg3xz6z92RwahoY
         PWSPdCtZKWtCeoEiRDnlbu0F8LeCqNT1FY43o5g6l3+Ndvtl6diqHvBrw433RNpgDUyc
         32AvRYXh3WhdGQkNuTxqjQIoMT5dvF5beYP2dQbGNHQtFF91oOiIvG9DdnMPwJGsh2T4
         Y6VT14MeDa8hBVdV6B5VyfwMnnhxQdB2gvrogQgQMpHeSXT4J9c5T0Bm89XIaoC2GFqk
         qs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596607; x=1756201407;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rRnvcJ2f2fPQ8sZ2OC8GktyRnLPTrLj3Sq7t/FTrOnE=;
        b=qu+tcJMBAntdoVScsi0w5TOVgEYycZkUB4Nalr9w+GjWZhI7RP/fZ70S7jUWr4l6yG
         8NyWfQyDVEKHUhExfCO9OPl48MC/oifX+G+3hG0EagRYlPXrlBrP2e3LqqdRag880juz
         NRIKu+6UvR5arSsT2yguF5vrGC92tEsyZy3buKNmopu3wyKAKlwIt4LiauD3091G/vlx
         7yomynxnnzyd5exqUF8pH/CXYjsz5PwAeWnvrvv44RX5Gxvp3PPP7j32/sNm6cPeiU53
         NcruOymj9+jxdC0bJcD2kfOWAfP7c+iu/Utyu9mowTTZ9OHNoHxhWNp7EcrCva41kG+c
         i3HQ==
X-Forwarded-Encrypted: i=1; AJvYcCW59lGQAPVgVdEKkcvs3cJNh1nUcZMfq8t9qs2vQbPAzfwwmv1OTWtTLCaORqsHKMJwNzg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDyHDxUcnAOyGYh6YRi7HR1mrdv6VpiuLi89r+zyK9oZVmhgjY
	TKpga7w/RWCcfFFnHrLRhDg5y0WY+h0HuKWoctMIh9CuHFBW5FfOzoRo5YBi0g64QkE=
X-Gm-Gg: ASbGncuPqKV7segVolMCEGU/vHP248m/yPG3OrMknomukEkmJMhwRkQiu+jgQEJ6ShS
	1BcmZWflqYJmpj8No1pd6yneuROaVpVnBE7Ansa/nmg583HCN74NGwjQ74uwNe8cNU9yYTgare+
	lpbrlOl+uh/NbnWKV3uUwhkTFKBITGeAzAo2fqBehGLZJwooEUBUialuMYURv8ik4PVmLb7k4pX
	SSmK3nLFWiApqT4xmYYUheK9Pk179s1pfn6zfXuY55EZJpRGUAcTWMzCTqmNm8QCQhx2t878E8r
	vcF/XArjtD46c9OJiNBhWEDmDL2phFnFV/frHpAcPlvPOgKFLf6MqeYANcm+/0rPRMj0QosIekL
	5E1QdIhqyl9hK+4UBhfXi6H0N66mD7qH3oIJtsbnV2NDUJHvaZBvFguphoJEn6lWG6PPNzruTGF
	MrK/f5Dnw=
X-Google-Smtp-Source: AGHT+IHJcbfoHziYmKYumTTSzX3HBo05hfHJRAHATRASlvGKTD+Scv9wCOw89lV3HUAzWsOF4xrNaw==
X-Received: by 2002:a05:6000:2909:b0:3b7:92ca:2831 with SMTP id ffacd0b85a97d-3c0e028d43amr1435457f8f.12.1755596606910;
        Tue, 19 Aug 2025 02:43:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:e7a:79e6:53ed:ce35? ([2a01:e0a:3d9:2080:e7a:79e6:53ed:ce35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b437862afsm11782925e9.2.2025.08.19.02.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 02:43:26 -0700 (PDT)
Message-ID: <2d576dac-0f9d-4f04-8aef-b3df5f88c926@linaro.org>
Date: Tue, 19 Aug 2025 11:43:24 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 15/15] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <20250815-pinctrl-gpio-pinfuncs-v5-15-955de9fd91db@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-15-955de9fd91db@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/2025 11:09, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The strict flag in struct pinmux_ops disallows the usage of the same pin
> as a GPIO and for another function. Without it, a rouge user-space
> process with enough privileges (or even a buggy driver) can request a
> used pin as GPIO and drive it, potentially confusing devices or even
> crashing the system. Set it globally for all pinctrl-msm users.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index a5f69464827119dfe2a7781b558094b283fca215..1751d838ce95d6138c824b90098f74891dec7656 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
>   	.function_is_gpio	= pinmux_generic_function_is_gpio,
>   	.gpio_request_enable	= msm_pinmux_request_gpio,
>   	.set_mux		= msm_pinmux_set_mux,
> +	.strict			= true,
>   };
>   
>   static int msm_config_reg(struct msm_pinctrl *pctrl,
> 

I tested the patchset on CI, and I got the following errors:

db410c:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253304#L537
[    4.056081] msm8916-pinctrl 1000000.pinctrl: pin GPIO_38 already requested by 1000000.pinctrl:550; cannot claim for 7864900.mmc
[    4.061402] msm8916-pinctrl 1000000.pinctrl: error -EINVAL: pin-38 (7864900.mmc)
[    4.077245] msm8916-pinctrl 1000000.pinctrl: error -EINVAL: could not request pin 38 (GPIO_38) from group gpio38 on device 1000000.pinctrl
[    4.088430] sdhci_msm 7864900.mmc: Error applying setting, reverse things back
[    4.100751] msm8916-pinctrl 1000000.pinctrl: pin GPIO_38 already requested by 1000000.pinctrl:550; cannot claim for 7864900.mmc
[    4.107960] msm8916-pinctrl 1000000.pinctrl: error -EINVAL: pin-38 (7864900.mmc)
[    4.107970] msm8916-pinctrl 1000000.pinctrl: error -EINVAL: could not request pin 38 (GPIO_38) from group gpio38 on device 1000000.pinctrl
[    4.126971] sdhci_msm 7864900.mmc: Error applying setting, reverse things back
[    4.139203] sdhci_msm 7864900.mmc: failed to activate pinctrl state sleep

rb3gen2:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253305#L1120
[    4.155880] sc7280-pinctrl f100000.pinctrl: pin GPIO_91 already requested by f100000.pinctrl:638; cannot claim for 8804000.mmc
[    4.167636] sc7280-pinctrl f100000.pinctrl: error -EINVAL: pin-91 (8804000.mmc)
[    4.179817] sc7280-pinctrl f100000.pinctrl: error -EINVAL: could not request pin 91 (GPIO_91) from group gpio91 on device f100000.pinctrl
[    4.196265] sdhci_msm 8804000.mmc: Error applying setting, reverse things back
[    4.196293] sc7280-pinctrl f100000.pinctrl: pin GPIO_91 already requested by f100000.pinctrl:638; cannot claim for 8804000.mmc
[    4.203735] sc7280-pinctrl f100000.pinctrl: error -EINVAL: pin-91 (8804000.mmc)
[    4.203743] sc7280-pinctrl f100000.pinctrl: error -EINVAL: could not request pin 91 (GPIO_91) from group gpio91 on device f100000.pinctrl
[    4.235716] sdhci_msm 8804000.mmc: Error applying setting, reverse things back
[    4.235722] sdhci_msm 8804000.mmc: failed to activate pinctrl state sleep

x1-qcp:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253310#L1776
[    5.881549] mmc0: SDHCI controller on 8804000.mmc [8804000.mmc] using ADMA 64-bit
[    5.889494] x1e80100-tlmm f100000.pinctrl: pin GPIO_71 already requested by f100000.pinctrl:665; cannot claim for 8804000.mmc
[    5.901103] x1e80100-tlmm f100000.pinctrl: error -EINVAL: pin-71 (8804000.mmc)
[    5.913184] x1e80100-tlmm f100000.pinctrl: error -EINVAL: could not request pin 71 (GPIO_71) from group gpio71 on device f100000.pinctrl
[    5.913186] sdhci_msm 8804000.mmc: Error applying setting, reverse things back
[    5.913188] x1e80100-tlmm f100000.pinctrl: pin GPIO_71 already requested by f100000.pinctrl:665; cannot claim for 8804000.mmc
[    5.929538] x1e80100-tlmm f100000.pinctrl: error -EINVAL: pin-71 (8804000.mmc)
[    5.948557] x1e80100-tlmm f100000.pinctrl: error -EINVAL: could not request pin 71 (GPIO_71) from group gpio71 on device f100000.pinctrl
[    5.955983] sdhci_msm 8804000.mmc: Error applying setting, reverse things back
[    5.975984] sdhci_msm 8804000.mmc: failed to activate pinctrl state sleep

Neil

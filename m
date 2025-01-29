Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2824D1C3BF7
	for <imx@lists.linux.dev>; Wed, 29 Jan 2025 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738165434; cv=none; b=lHdumr+A1/oGDGMh/48w/tGpBXODUfaQQKY9VUG3VMKfrCeMQac2E+pyR8z8ogG5M2U5px5EnBFn1xl2G/6XrEslWXEdBASI1qOVgNxzyqSFwg3rJefSCop89Fmei2eBkZ5e2mX1/VDJlDdC/4fvJRwPX11rjOT7tsfO0IJQx2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738165434; c=relaxed/simple;
	bh=qg3GvwkSQaINnDplbY9Jxv9EAKxWtjMkn+E02u+EVuA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Le5JVMvXaaKsmrrHisRyMUOZeUyW+vy+RDkZ7tvmSClkygWMO79ai3ZLXI7Xkio879uPwuCAlu0ix9O1BOF4NrTd24wo0yxv48SAlq3zkERTaABO+WRdR2ulctMmB1xm/iKVrkXOlYrEY/Q2sFxIt2LIUB1g8HJac2pbFqwKWtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QdCvZzV4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QdCvZzV4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso6142935e9.0
        for <imx@lists.linux.dev>; Wed, 29 Jan 2025 07:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738165430; x=1738770230; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPHIr1AdUQXL4S8PLOw7faEqsccJFgDRWTAC+UQvuk0=;
        b=QdCvZzV4CbncCVmwZR22cscMYlY4PgyHMlZLWKnI2GWplRD1refTsaCtEb4sb5fdMD
         vs0N8Mo0mI7fDRYbrWJlf0AS6wexXnBW8E5RdyAPjEbIxlWAPZFx46Z3xWyMUaP4HdLZ
         439rtx8UKZ1jOjcD85TqadsuzTbNP2czrTzzUiw7snQfJD4KanSpZn0z4TPivv/tCjsa
         dcGA8FFI24O/oZjRn9o1CRaeiW3w1Z1Oyui0EdvdauznQyiXO7QcK7X+Lzfl8n9O/ali
         asiaQGBU/ZAzuI4Loicn8R6UMYgecJu3wt43Mz2HSGQ4MZRd904yYJRUX0l0ILEBwLtM
         btVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738165430; x=1738770230;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hPHIr1AdUQXL4S8PLOw7faEqsccJFgDRWTAC+UQvuk0=;
        b=aZNpn7N62XOOGPT04XQLIMBTSYT7E5lA4I/dgoPqYqnpSfEbjpggcxots7KjwJtdDe
         hPcgwkDncuF82HdebPkUw9CHilFvzZcfciQ0Thy+99qxWRvA+g1Dhz0/QwVCvLHGDe0d
         1VhwSNXuhcg4ItVe7CDDypRc6mNXI1lO6nu1tlPRjZxIYleBnA64zkOovFTnnWoyST4X
         pUroN1wPhifeHHUBDCvtfXU9On01xrzA5srO4IwIEV945Pua3hnrfziLwecQxCUpZKsp
         pyH4j9nw43S2dVcmqTPS6D7JY8/Z3SrvCTfDuux0NMRIFSAPnrGA4f59skuuXCTgBDf/
         ymug==
X-Forwarded-Encrypted: i=1; AJvYcCUwGH1be0zKLMz0u53zizLdukcjbDOe4OfZ7K5F3A4ngGkygeheMOkQtbM95wIwdI1vIUI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5O5Y8AR7+YDnVu0FOw1PdVoBGWA4rTNb5bydIYi8dwZ04oDLu
	Rxh44wQRvVDVeh4VV2Yo5YM6vvRe76oXo4nUS9d7XFDRurExBOLU5X2bP6BWg3E=
X-Gm-Gg: ASbGncvguNcy19LoK+wYbBDv7ELVINo3XKExFxcOg6swVghMjhrDCXJlC+pIp81XOGc
	rMVA008FFfh3JgUeeCMelsjKag1pcMpDmKmUZCKJA4cpzOaUAMrd7n+1L0wpSTIktXJaBYdae7R
	pDuyuj0VmEGyBvHOF51TBdqZ7TppXvE3LcgzhbK5CIhs8tt1ootkBd3l+LSu1bpdnxL7nOyTIFW
	wtq4sKr7D/5wRx6jGEIjFHYk8ZBPD/fxPen5EYNW2emX6CbcpWpKk2KihGM2Pe8c53rQWnvDVkL
	X68oUsFTaTjQUKPRRaH/3DdnWKylR8a+yDro/oS3vYCM3xjYASoi7lcU1FsQrAH8/K5b
X-Google-Smtp-Source: AGHT+IG+AzLiMQGtSlFoPMZbCjyIVlZSwQQSJOvatG/rHgk08wCvQOFvIicCJd/sEzgRT/WR6JlERw==
X-Received: by 2002:a05:6000:1f81:b0:38a:a019:30dd with SMTP id ffacd0b85a97d-38c50fe7e90mr3136677f8f.8.1738165430293;
        Wed, 29 Jan 2025 07:43:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25e:a614:863b:566e? ([2a01:e0a:982:cbb0:b25e:a614:863b:566e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188689sm17390387f8f.48.2025.01.29.07.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 07:43:49 -0800 (PST)
Message-ID: <c7c2f630-ee9d-4427-adc4-0d982f9e7593@linaro.org>
Date: Wed, 29 Jan 2025 16:43:48 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 05/14] drm/meson: move to devm_platform_ioremap_resource()
 usage
To: Maxime Ripard <mripard@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-5-0d1609a29587@redhat.com>
 <ieknc4dm5ntnqaqz6zdlinphocm2omsn4ll34vlbrohqcddl43@kg35irldnkuw>
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
In-Reply-To: <ieknc4dm5ntnqaqz6zdlinphocm2omsn4ll34vlbrohqcddl43@kg35irldnkuw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/01/2025 16:40, Maxime Ripard wrote:
> On Tue, Jan 28, 2025 at 05:29:29PM -0500, Anusha Srivatsa wrote:
>> Replace platform_get_resource_byname + devm_ioremap
>> with just devm_platform_ioremap_resource()
>>
>> Used Coccinelle to do this change. SmPl patch:
>> @rule_3@
>> identifier res;
>> expression ioremap;
>> identifier pdev;
>> constant mem;
>> expression name;
>> @@
>> -struct resource *res;
>> ...
>> -res = platform_get_resource_byname(pdev,mem,name);
>> <...
>> -if (!res) {
>> -...
>> -}
>> ...>
>> -ioremap = devm_ioremap(...);
>> +ioremap = devm_platform_ioremap_resource_byname(pdev,name);
>>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>> ---
>>   drivers/gpu/drm/meson/meson_drv.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>> index 81d2ee37e7732dca89d02347b9c972300b38771a..6c805805b7a7f675f8bb03944318972eb4df864e 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -184,7 +184,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>>   	const struct meson_drm_match_data *match;
>>   	struct meson_drm *priv;
>>   	struct drm_device *drm;
>> -	struct resource *res;
>>   	void __iomem *regs;
>>   	int ret, i;
>>   
>> @@ -220,14 +219,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>>   	}
>>   
>>   	priv->io_base = regs;
>> -
>> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
>> -	if (!res) {
>> -		ret = -EINVAL;
>> -		goto free_drm;
>> -	}
>>   	/* Simply ioremap since it may be a shared register zone */
>> -	regs = devm_ioremap(dev, res->start, resource_size(res));
>> +	regs = devm_platform_ioremap_resource_byname(pdev, "hhi");
> 
> Given the comment, this one should probably be skipped.
> 
Yes please skip this one.

Thanks,
Neil

> Maxime


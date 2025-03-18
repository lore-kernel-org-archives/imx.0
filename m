Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3792080E3
	for <imx@lists.linux.dev>; Tue, 18 Mar 2025 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294887; cv=none; b=e9cqTi6Km8mdblKmOawkW8wnIYzZVOXEEv2kqcc6B6m8wvqtDbYWVRvz8t4DcQMlQUJHOqaGhk5ChUASDUSQeS+0G5r+4xb7BF6yLi/UjEJ2B36hIkOk6Ot+JTmtys5PBUHaxtcSmQnsoC052hLJqT3Lz19Lu3G8TOuiEnJYUtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294887; c=relaxed/simple;
	bh=Md/XRvHHliyWz7wlhOz6ujqai1U1PDubvuCqKxWBDwE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZmErbzIHWoXr9i238fsgpltjKO+EyukPuKWSUB5ko3qNqh9QlUlh0pYRMbNh70Y95HvNhLKY/cHf9vv+TjpD7f77x+PYB/QO5CVYijRXaLu42qMxfNTTMdIkVRVyXiTQbGxq67CQWgSvCZ6w5vzGtJ9d4acIGzVhfhe/1k6E1og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5hknXhC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5hknXhC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso22622785e9.2
        for <imx@lists.linux.dev>; Tue, 18 Mar 2025 03:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742294882; x=1742899682; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQHq2hCTlCvty8OK/ZzDJdJz20qlST0ei05aCL2P84s=;
        b=t5hknXhC9U0f6yEpLACkWFf7fRtwWeUzDYlbTu7vd3qN5dleN+1CYZUILYjsex4oCr
         EjizKG77C1Lihf+tEjTl/f2uEkTieT+MER7B5q1HlLH8PPPBWHUOtx97iPtz+hAclL3z
         Qu8PanZVCjlM0Kao9lyV3W/sZmBJI6r6QgT3IgQgCdnTA1bWvrM/kbGdiWv3P/8Kqt7M
         n9Ii4TCwBY4sNTsJdCdYfMhQHF1hMnpIRXNXfpXkgTQ4h7dVFiix163fXhk7jUxoJbBt
         1c/x9FAbf7FoT02DApOzLl6O2dBUuymohna3GQ8YH6UiQZ58Y3XOQyJoZZyR5VnNXhtz
         +zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294882; x=1742899682;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lQHq2hCTlCvty8OK/ZzDJdJz20qlST0ei05aCL2P84s=;
        b=wUBUoeZmDsM3hDOfX1s40hH32wbDg3jwbIOc6052nJ/SsOuuZBvY5tlTj7lJVLisyS
         IdakP+93TVLdEOkIZ7pYiNL4vhDYmoaWAezxD5r+pvBvads0fyt+2BBEtuq9RjQtsh5y
         KWSYpAXlCzDj6t6X7HfYSlXd9dtorKI4W7jrTomu2RnLBcxHvYJuajv7sEf7/QipKOne
         bqxMcsZ0blGJ3oUGd+rMLoSi1EXBjFz6IHRHxUjXB5H79VXH2deKtTIXxxMouMFmAaZt
         s/+1yhxAMHhAFYoy2j2o6upOXcq2iVyPFEemGZ65lQO77g/nJnS4OExSzHO9eJu5tyzq
         WNRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQFlHpzRr7L/rn2B93iVUzTkcA/F04bWQMKs6FYGWW3Me5NmtJGqJrdMbPte3dZJnWj1w=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIbkC72C5D1TXqYHUYZjlamJMU5SOdnteTJIQGXByogS+kXgJN
	+2fUQDVOGMOLOPIooDZfqfjIixkjTdo15LHed4v96reKm3jH/xqgZxISD1M5584=
X-Gm-Gg: ASbGncv/OjXcCCsUblimLXbyKZEuraIcKUlLRQ0dIIRTcbHdDzf6L5huHAZsMHfstOW
	vrEa0nxDG/3mxFGSGBqyTp4ny1/4GghThvJKbEcw0Wc0GTwhfPtX6yElp+j1LfrJ8pcxqAvXSS6
	THNAZ0UFijKYKOoKEpNSduOBPlPSUyj1HJ8v2Fv3BlKa1TQ2oFskCNrfCUUF/ex9ogwfvgmZWaB
	054pBsP69h6U5W/MXJ6K2hU7UL5AsDp67GGDGiAaDaMCERNMuEkgzn39sxTGLMYI/B04cTs1UKM
	A1+WGize3HOymyGN+Z7pw8LC0p4cHiOKXERlwU3BZY0yFjwU4QI6iwvMT21bIQJv8xdFo+C5OqU
	nR/GimeDxPr0eXgnf6/9V5g==
X-Google-Smtp-Source: AGHT+IEvqQm0L33zdjtiaR0kLcpkjVK78vmD/D0qYWBavdIvwJwnojSo58SFbe1jRfiwWGTyvooy4Q==
X-Received: by 2002:a05:600c:1d85:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43d3fca93dfmr2270645e9.4.1742294882536;
        Tue, 18 Mar 2025 03:48:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff? ([2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffc4173sm131457905e9.20.2025.03.18.03.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:48:02 -0700 (PDT)
Message-ID: <a2ecebf5-9d37-49ad-9422-f984d1da8c57@linaro.org>
Date: Tue, 18 Mar 2025 11:48:01 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-4-robh@kernel.org>
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
In-Reply-To: <20250317232426.952188-4-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/03/2025 00:24, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> For v6.16
> 
>   drivers/remoteproc/imx_dsp_rproc.c        | 44 ++++++---------
>   drivers/remoteproc/imx_rproc.c            | 65 ++++++++-------------
>   drivers/remoteproc/qcom_q6v5_adsp.c       | 24 +++-----
>   drivers/remoteproc/qcom_q6v5_mss.c        | 60 +++++++-------------
>   drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++---------------
>   drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++----
>   drivers/remoteproc/qcom_wcnss.c           | 23 +++-----
>   drivers/remoteproc/rcar_rproc.c           | 36 +++++-------
>   drivers/remoteproc/st_remoteproc.c        | 39 ++++++-------
>   drivers/remoteproc/stm32_rproc.c          | 42 ++++++--------
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 ++++-----
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 ++++-----
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 ++++-----
>   drivers/remoteproc/xlnx_r5_remoteproc.c   | 49 ++++++----------
>   14 files changed, 213 insertions(+), 347 deletions(-)
> 
<snip>

I get:
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_q6v5_adsp.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_q6v5_pas.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_wcnss_pil.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_dsp_remoteproc.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_m4_remoteproc.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_r5_remoteproc.ko] undefined!

when building with arm64 defconfig. I guess a proper:
EXPORT_SYMBOL(devm_ioremap_resource_wc)
is missing.

Neil


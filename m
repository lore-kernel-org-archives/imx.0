Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11111DDC1C
	for <imx@lists.linux.dev>; Wed, 11 Dec 2024 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936252; cv=none; b=nS3ASLWW3DuBPfTylIGxkwaQawpOaoJcasSm9gifFo35DUvl2GPAosqr5YEdrdMVyLSkIDgqYAsepu/sUwg5rojM5NjBnlFBceEtPAAkoVoyGfGiJuDz4zEwR/I5r0XHmMzbFZbKj7bvN5p/yYe1arhsLkMAQyzi9P3wf6AP/OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936252; c=relaxed/simple;
	bh=hgABfKABfbmERmVSCc6PoQGplBLfsOvN+AwZZnCc+Xw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nG+S5oVfjGVa7lOmxzAcNghYU3REbQF5qg9xFaVetRbzDPkhLtEPH4oD0BarToYfyOa47bFG/0N3uqwOVcEJC2EjGH+DBm7zFKwTAb+rFSoby5u6eftPxcKViqgG+S5+zBdIe2ZRPCxQADxfw7PJaOKILBl24H7osiDKk1gcC9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SlJlPm4c; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SlJlPm4c"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434ab938e37so45642275e9.0
        for <imx@lists.linux.dev>; Wed, 11 Dec 2024 08:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733936247; x=1734541047; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0m9l5oOp01vcv+9ToOizO+wEqix55Pyi80seUL6dtBo=;
        b=SlJlPm4cz0O1CS75N6w380lrALkGUB1GxYIxvPCjP81MDWEX85HCyQ0vw/GJODmQP/
         iOULB/nNxqP4z2o0mQMBz1l4+V8CEbhWWd55MaIpllPdss01ueVXf0d7eNe/Edg9+vrH
         bAqpnk7GU+YuPG7BLcP44BwzHCf3xxynzMqpNEyycm8PCe8n1g47QfFypYzyxxC9g1Hj
         BrunBF8hyGQXpCI0L7bMEwoAAPKmMI0foHe+EmGWLl9CKUyGHUkz35Jzy0PsqOjPim2J
         OwTkRdCbQnj69T+X97fsA4Ylj51sMXKVZme743Egd0ifjTCs6023QAXD79m33CdIkGZy
         EuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936247; x=1734541047;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0m9l5oOp01vcv+9ToOizO+wEqix55Pyi80seUL6dtBo=;
        b=iX1tuuAB4JZr4YJRd+m10Ubi1L0tiQKVbQJGA1Lk6TeqxcNqT8isfSdm1irre2qrY/
         r8vvEil0RU0ABx2IY+QvbuqRB3VVJ9EkK7mdius6ZlbjJ7jjGP3GsRv3MmLtwJS6tTIu
         zVKJqNAYSlLSFsxdYjknbARoOUbnnJgEGF4yFw/tTb2oyY/4Ae/tUVm5b1qDftzsZ0TH
         WvJv07u98/F+5M+d681C0Cohxqk53C9tgms8hYqDFKSEQ8OR/BUoOtF0hacMPRNBEA1k
         mswMz4xEUNusotmfrjj1fZz6T6uh+hueUkG3uh2SbP5DGljvpewPG5yESaI0ckoYduD3
         rBKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJY0g1sFIwhdg8qn8ryrRbMU7kTMATKqZiWNyHPW92jMAaEkQnSJpWtu1ayjGFYfqCV9U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8JW868n8YmwX8IJ6Uyj5Vkc+vavkFc3H1ZWR0191n7MdVA95Q
	XP/dpvLgyl9PPfdgKBOQRJ5d398v4q4oATxT8Np3gWyJKmw8kVvLcd8aSnoFh2Q=
X-Gm-Gg: ASbGncv28KUrorQIsd4CmquLbvOlS2d1WmjvgrvCtz8VBY9bHccJn5xV83Pm2N76ONW
	lYVdRaF7Tp2pzuVz3FaYTlpdjNun64nNjg+wn4BNxzjpy/IAs12MX6ZHrEShs8ln9Qn7FeX4FZg
	82ZyXkwD0kCP5t7LO5hmBLCtWiwcf1Zp/jocMC2MRBLpG1MiRG/z3PvT04beH8nUMBQvlhll8m8
	6zcgiDLRsgrFplsvmSldQXxRHXBvgkN3XBmmXVT/6qHKLA3L2ax8lNZ8SI68ruGadb5tGwesqP4
	JaIaW8nd+4V8hRVv+5MVm1F8Zba4sqo=
X-Google-Smtp-Source: AGHT+IENx0NcRopIXx3SdVXYZNoSpCbTptpp3hxvIhVQS3f47TcSS/8i3UaxgjzRtqPiK5pkEZ+nig==
X-Received: by 2002:a05:600c:1d20:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-4361c431298mr32914025e9.30.1733936247337;
        Wed, 11 Dec 2024 08:57:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d426:8f10:1673:5657? ([2a01:e0a:982:cbb0:d426:8f10:1673:5657])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361ec87bc3sm14005935e9.1.2024.12.11.08.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 08:57:26 -0800 (PST)
Message-ID: <1b3d37ce-a362-4846-bb7f-7cbe4c28608b@linaro.org>
Date: Wed, 11 Dec 2024 17:57:26 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add compatible
 for AUO G084SN05 V9
To: Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
References: <20241210105705.116116-1-festevam@gmail.com>
 <yujvdu3s6v7z7th2lrdscqfxocx2zy2u4owakisvnjppz2udqv@5ok2rcf4exd4>
 <CAOMZO5B3810+4RJsPUtL3ASxqpDd+UmC=GcY6t8-ad7NZXZLjQ@mail.gmail.com>
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
In-Reply-To: <CAOMZO5B3810+4RJsPUtL3ASxqpDd+UmC=GcY6t8-ad7NZXZLjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/12/2024 17:29, Fabio Estevam wrote:
> Hi Neil,
> 
> On Wed, Dec 11, 2024 at 6:31 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Tue, Dec 10, 2024 at 07:57:04AM -0300, Fabio Estevam wrote:
>>> From: Fabio Estevam <festevam@denx.de>
>>>
>>> The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.
>>>
>>> Add a compatible entry for this LVDS display model.
>>>
>>> Signed-off-by: Fabio Estevam <festevam@denx.de>
>>> ---
>>> Changes since v1:
>>> - Added devicetree@vger.kernel.org on Cc.
>>>
>>>   Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>>>   1 file changed, 2 insertions(+)
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Would it be OK for you if Shawn applies both patches via his i.MX ARM tree?

I don't think it's a good idea, there's no build dependency so I'd
rather apply patch 1 via drm-misc

Neil

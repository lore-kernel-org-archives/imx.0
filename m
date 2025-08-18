Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D2E26F2AF
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521351; cv=none; b=rBWP2M421T7RCA978yGZyM3ee2W59qncZ3lZAnDZEuNut6iQmrBI3xYSL1re99ITn3PSdIywQgDS1XOi8wVcT/YhUml5tbhA1c+lThcyf2DVjv5knP51ioPwCwk2jkp0nroE0ergdVntVdR9jCTpoDzkzVWc35jolkC4BjaLvrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521351; c=relaxed/simple;
	bh=d/4oiYyxiS/NnOCFDKJgaU0KOYi66W2tjgszeyBpESw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LdP8nd9e0bQ87Nb1Pp8n7N35vk3t0HCj959/WIWbG44MYgUPo2M/TiWuRisjzOWFmbbohaK3ycxTA45+cL4N8m9yH7zvFhaLYNvogz4t6L04iVa5JOIJXGRhiGlnrifXTRwgSo3p68DJclU4m2kvZlmhtL/xNYt4ERRzCqS5NnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ifcp9AGN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ifcp9AGN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b098f43so24411215e9.2
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 05:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755521346; x=1756126146; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UkGm5z4Z3MyJok0lbrc3ubgHxilQJm5hDG20AA7nHys=;
        b=ifcp9AGNLrYYLTk/ycwULlAXmgkhgOExbG1I8+8O7OmhTA5DbqPaLwXBVkrnHdQg41
         2JkzxVtpvQ23zJCIGigCN+HtcO1tXmuY6X1pITgbWWNnBhXxuY/7Tt9WBcynxrFtE9uk
         xDHiEwFJHw/u6nsH54nz4xo+q3V77pzuJZegISVkj266y2gndXblGOiVJ9FNyvQzYHl/
         0VGtmVvnXoLspX2oVBcxRWYOuBu8O5weJsSyztjWBS/npx0tWxkErnslIDgNQTWlykMz
         AMcLPcgczCevOdcQR0GEEzpd6t+4dtVjI7g1BO0uzCJnuQQkfd9DXuhy5dWGkP18x1sL
         bCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521346; x=1756126146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkGm5z4Z3MyJok0lbrc3ubgHxilQJm5hDG20AA7nHys=;
        b=U7rrLM7AvGt4d905qjBCYYhmVicGSv5aTxX9QTebKjIXIOUFVQGI4ymeUZa78OCc4Q
         oQwdxN1l4wYSkAn7CcSMBVDboZww1TQgbJ/gPA7/oM/uKFJoyEElZXR6IVnwdR7hwb2z
         nkTfiteF42kMm4bcggLl3BZzL6W7eg/pkbJRId/04twf6kEQhal3ZJG3/awkxo+ih9yB
         avu0Yet5iv9jdn7j704Pqw5LYM4l2vf/YJxVfKn9DQWuO6fm/Uhq9M6Hmq6BZh32i7Un
         7FoZmKxPMBp+UGBTxA1cA8HxgKsTnFPlpi5a9v1KbP0J6aU03XwizQEocdU1YNW4vtq8
         /26Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiA1QGpxG3+g9yzPDvMsAQ4OSAgrjdS6d0yG50IK3ivHnPVXHmegO09hNC+VqTn0SDG4Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUJOJWax6u1tdcC78QbY8sm0YfI6DAjGpidDcYL8nF71RCrKho
	mTXc57xmTtINsMa+uKaQjiM4KuUt+LQbbTlYgjS8U942qOIqDCxY3PpuFKInRYJaelw=
X-Gm-Gg: ASbGncvoZj2ODczqH0z+R96ItpZxxS6pUL6ffJL8Su91pVtuN1FOlx7gHCJSxaVN/nB
	hZBF5sYVvNLT1SWtFuxlWH4ecroVb4NbvFdOiIkg6CwxZCqJriszqdB4LApsNfN/i0U3XU3ikf0
	HfHBAecoA/Js8Q/c8/IUuBGZiQwPZau8KibR900ZrFEQzaa2XUWHA8SCyJQfsBdpbCbgqpiv72P
	OThh6Gd5WK/9/p1rn046OnUUXa6k8I0xsy8pms+2jh56sP6PUxeT+EePPKgySZq3CPeQg3jzdrk
	qEoDoz+KzjK1zO11TGbhsFBFBuhjcYzK8SJ+de7Q+p4JvI2Hypi+e2INxSpp4kdzt2viAMTrLI6
	TnzcOnfx0lhqo7WKLr6viHn3Klpo=
X-Google-Smtp-Source: AGHT+IHuiGcAUnMgAsUaVIlfjKsl6OzEER3Y7bmvsDtd892stBZ8UDb+2o8NGAp8q2ZXnC179iYjNg==
X-Received: by 2002:a05:600c:46c6:b0:458:a7b5:9f6c with SMTP id 5b1f17b1804b1-45a26744554mr71257715e9.11.1755521345916;
        Mon, 18 Aug 2025 05:49:05 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a29e6d695sm68912945e9.22.2025.08.18.05.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:49:05 -0700 (PDT)
Message-ID: <ca3f3ed8-2708-4d22-a804-c094b449dc2d@linaro.org>
Date: Mon, 18 Aug 2025 13:49:04 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] dt-bindings: lpspi: Update maximum num-cs value
To: Rob Herring <robh@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>,
 Clark Wang <xiaoning.wang@nxp.com>, Fugang Duan <B38611@freescale.com>,
 Gao Pan <pandy.gao@nxp.com>, Fugang Duan <fugang.duan@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
 <20250814-james-nxp-lpspi-v1-11-9586d7815d14@linaro.org>
 <20250814205917.GA3894941-robh@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250814205917.GA3894941-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2025 9:59 pm, Rob Herring wrote:
> On Thu, Aug 14, 2025 at 05:06:51PM +0100, James Clark wrote:
>> As mentioned in commit f46b06e62c86 ("spi: spi-fsl-lpspi: Read
>> chip-select amount from hardware for i.MX93"), some devices support up
>> to 3 chip selects so update the max value.
>>
>> This isn't a fix or functional change because the devices with 3 chip
>> selects support reading the number of chip selects from hardware, so the
>> value wouldn't have needed to be set here. However the commit states
>> that the DT could be used to overwrite any HW value, so the full range
>> should be supported. This also avoids confusion for any readers about
>> how many chip selects there are.
> 
> If reading the h/w gives you 3, when would the DT need to override that
> with 3? You only need an override for 2 or less.
> 

Maybe it should say "currently the devices with 3 chip selects". I 
suppose there could be one in the future that has 3 but can't probe it.

TBH the main reason I added it was because it was confusing to work out 
what the actual max was. This says 2 when in reality it's 3. I suppose 
documenting that it should be left blank if reading from the hardware is 
supported might improve it too.

>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>> index a65a42ccaafe..ce7bd44ee17e 100644
>> --- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>> @@ -64,7 +64,7 @@ properties:
>>       description:
>>         number of chip selects.
>>       minimum: 1
>> -    maximum: 2
>> +    maximum: 3
>>       default: 1
>>   
>>     power-domains:
>>
>> -- 
>> 2.34.1
>>


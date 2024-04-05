Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A06171E47
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 18:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712341284; cv=none; b=DMGK23nTDPqu2Pq5dJJom+8Ot/A55n3gFB/XuEe56mT0ezXEMS4w1DGuyT5YBhrH3Ll30gwLH8p0uKP02bEjtXJ6GYJYRWFiI2Z6XlW7nne2sxVef14nWp0Zm4RTIZIZg4/At4EO/Pe3Y02ASQSw5+3GHwWqGhfdYistczE2TRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712341284; c=relaxed/simple;
	bh=U1bhPfgZUUHhnsTYnxvS3Dlkc1fZX0KD2x/ZnQur3Fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fehse2qp8Pxc6CZSY8ecrLvWxzEFTyogVywEqXC0K74BtmM9rrWJF0znwKKJvKpdTMox6Qcqc9m3PhEb6ij0BG60lfLcsYCR7MIJ3kxSv1iqtlGmCxay/txxC9I1KE8E/630YozM8PnM9W4fXicEysAg1wn3aETUg+0u6i+8NrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pi4BVjtZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pi4BVjtZ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d6fc3adaacso30698751fa.2
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 11:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712341280; x=1712946080; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Aoqb0ZvgJjDrARAuD79kB80qdeeEZC580nOfAjj2138=;
        b=pi4BVjtZURsjmW+zY5ZmtPVjt+h6Lzsc4UFJHCTLBN8+h3paCYnMNEGBqsnK/aLaAu
         6AxA/HjHuuTMCh8zdLNXfrj+8FyEUGLOZM/EZXH8ECNzcxjdfdLmDih4gwj7Yac+x5mw
         SvgfrzXfJSp4r2LnI19k/ftCNHxYBDMJpwpzVxh+C+6fuG6gYRBrLBM1HEHZQeNwitFc
         5M95YiWzmV4UCNld1u9yeC1cUNqkVR7QNeYhd1oOzISIqq9RyiXI6sHMJngVg8wIVFD5
         QWIVSL49bfO424qzQBcuc6FRV4vfEnbVeJnbFNXNXuppSIQumizt0fq6PrhuBM4L4rF0
         hDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712341280; x=1712946080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aoqb0ZvgJjDrARAuD79kB80qdeeEZC580nOfAjj2138=;
        b=szq7onO3IwyQ2tyxTo+qDvpIZEXNdTNSkp7NUqUAeAnn36T69Q7Qjf7tD8LNAtMEMM
         yRSmNTLS/wZheNGWbRhbCZxLLq46SEv/+8xQZvQokDIJV+SqSQrViHM15kcYp1FXSw7k
         C0OQcJdMpl+cezvU/YsHAjDz9WGEQD4U9DdbO0NWgEr6mp6ki+jZfNKC6vK3gnBRB5ef
         EwHas9maJcE+ZskrlcwDWVNOADnDbgdpY8mra58lc8+hf2k3pOaRtTM8uJgSGpjt+x4D
         w7NXzC8+qO7+e7we4+hYISHx8QJY1wZEFTsJnghVkQPuPzqi9TS+rYGHu0UT++dZnnmF
         HkZg==
X-Forwarded-Encrypted: i=1; AJvYcCWUDKKFfO9GIbaEpmMjPeJS24Y7ARv2dtDq7cFiqPjRZwaZ9AlY68h/uUtYcrkgPVxUx1sVVdVsFAzF1loytsLKYyNH
X-Gm-Message-State: AOJu0Yy/WqiXs8yGy0iFpYFJjXB9C7a0HPKbOkZtTHn7gsmuqJMR2d3H
	rKkA/oZ12EBbw0XtW8SlYftyzQuDoHQKI3nM5nGx0fSk+ka4i0u41qVNr4IAtHE=
X-Google-Smtp-Source: AGHT+IE6UiMSad29esrjwaWubKN7rdr6QVJiWDc4K33rovL4UBL/Z/eUnCeh8MAuY2oVX98VJEPZSw==
X-Received: by 2002:ac2:5f94:0:b0:515:a733:2e0e with SMTP id r20-20020ac25f94000000b00515a7332e0emr1625285lfe.25.1712341280466;
        Fri, 05 Apr 2024 11:21:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id ne6-20020a1709077b8600b00a4e5a6b57a2sm1094189ejc.163.2024.04.05.11.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 11:21:19 -0700 (PDT)
Message-ID: <938489b1-eb94-4f8a-8881-230951299f6a@linaro.org>
Date: Fri, 5 Apr 2024 20:21:18 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: imx8qxp-mek: add cm40_i2c, wm8960/wm8962
 and sai[0,1,4,5]
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240404161914.1655305-1-Frank.Li@nxp.com>
 <efc9c624-6a31-4299-a604-8aad1d0cd878@linaro.org>
 <ZhAO4YWuB8r8k+m8@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZhAO4YWuB8r8k+m8@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/04/2024 16:46, Frank Li wrote:
> On Fri, Apr 05, 2024 at 08:41:59AM +0200, Krzysztof Kozlowski wrote:
>> On 04/04/2024 18:19, Frank Li wrote:
>>> imx8qxp-mek use two kind audio codec, wm8960 and wm8962. Using dummy gpio
>>> i2c bus mux to connect both i2c devices. One will probe failure and other
>>> will probe success when devices driver check whoami. So one dtb can cover
>>> both board configuration.
>>
>> I don't understand it. Either you add real device or not. If one board
>> has two devices, then why do you need to check for failures?
>>
>> Anyway, don't add fake stuff to DTS.
> 
> NAK can't resolve the problem. It should be common problem for long time
> cycle boards. Some chipes will be out life cycle. such as some sensor. So
> chips on boards have been replace by some pin to pin compatible sensor. For
> example: 
> 	old boards: use sensor A with address 0x1a
> 	new bench: use sensor B with address 0x1b.
> 
> You can treat it as two kind boards, RevA or RevB. But most user want to
> use one dtb to handle such small differences. For this case, it should be
> simple. Just add a super set.
> 	i2c
> 	{
> 		sensorA@1a
> 		{
> 		}
> 		sensorB@1b
> 		{
> 		}	
> 	}
> 
> It also depend on whoami check by i2c devices. Only A or B will probe.
> 
> wm8960 and wm8962 are more complex example.  wm8960 is out of life. But
> wm8962 and wm8960 have the same i2c address. The current i2c frame can't
> allow the same i2c address in one i2c bus.
> 
> You are feel to NAK my method, but I hope you also provide constructive
> solution to help resolve the problem.

Yes, we resolved it long time ago. Your bootloader can (usually easily)
detect revision of the board and load appropriate DTS or DTS+DTSO.

Best regards,
Krzysztof


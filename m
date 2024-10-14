Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0681F15958A
	for <imx@lists.linux.dev>; Mon, 14 Oct 2024 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728900529; cv=none; b=kio2ntBx4i72Xx3M/2cqnGyS1HkVHNpqx19Ju6bsno2+1nrNxNhwxtANWA9155LO9o75LQ/MxK6JeDECOTR5EzhuO+gPsHNgdcTlG6ba/8PNl1Ou6KEh+337OrTxbeTTYMLZyyq92s6n3LG4TKFeyxtTwoBh0gahIDmW9yrnLv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728900529; c=relaxed/simple;
	bh=/sWlEGgfHHX9djG/FSb50XLkDF+y1KqaTESwoXdZHSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6WcJFTcJJHl0tO23MdfnRaSiDujw2nBnbuwSWcU+9dTvPWI2fp3JnAoKfqE8bXIubmjpS8oaDYh0u3CiZv8jYp4/dyyGct4tgTNo4lz7k9BVCi1vhIRD7j8qEj41Ewx5Qfd1GYHsWYC6PIAwU5dGUMqk7Pav1HmdLmIpDEG6nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rgP1axhA; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rgP1axhA"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so1194068a12.1
        for <imx@lists.linux.dev>; Mon, 14 Oct 2024 03:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728900526; x=1729505326; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FWUSe6Dna6tclDo/Nzgx/0TudE4bBGcoklr8vby/lzw=;
        b=rgP1axhAGC6+jr8A561xHfnJE+eZ2GC9nU20bPS7Xuno6zsjkYRB8fKoRAMdGePL5y
         SCNbt97YX/L1YrPcAiDXhQ/c8mqLUIBugmC6h00XN+BDCKYDLNJx0PLMx80bw/Rz23YN
         5EIY4C141jIe8oiqSXswwph7WR4W93n+381nlwTWEBX4NpcED5I0ZyEbICTXYmVxWI6H
         fENgAavOTQjXFh7+54dyerQwEeVtUXKKS4D75tJvM+W3sbAn3IbiQZW5GFzEqerHxVQZ
         WJGoOaYtcK1G8z4ck9Pl+QYgOhGQrYZLd8dpzrHRAxJmVJiG0h89kvRu2LCxyB2mEywp
         ClRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728900526; x=1729505326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FWUSe6Dna6tclDo/Nzgx/0TudE4bBGcoklr8vby/lzw=;
        b=IX3vedrICiOqQa3FhumMbJiDMOk+GYyP1yMJ2ZOdK9Z7UBGOHsUwW3NKbS4z4j/fKL
         ojpBbSXDdEN2fBcu94d2AV9hKa85GtsAqdfy85+ZaekfSl++TlrgKsgeXb1BEcR6VG3u
         vw0sCvtDuKfw5Acr0LmGfGOToVlFKjY66xgPNfJSM9dZEs/R02mD9sxT7w6lv6QeSwAk
         aW0UWVGk8dd6RfC9qNZqv7AhgVPwUbu7XJiIYKisTPDWW5BzyPyLhCvzCiJg2wF+Xffl
         RdU59gShT4W3ex3IWLdk7+opyCPXbxBIboJApZ+Ivid7wwx/7QthhuiEYFT4pKjG9nYJ
         +5qg==
X-Forwarded-Encrypted: i=1; AJvYcCXPdZmJI2zS+k6CM6Lk7VKRiaCesWKyzbtSwUZTC0m9tOKrDJ0Hm+mt6ssm+F8nwQR7ZpU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXgb2a7DoY9+MCKbW4BV37I+8TsekKy9D0gSqolwQD+Q8vrR75
	yQMO+XaMZSQJnlog6/Z0MUq0sb2AC6RdSJO9d0tJkRLyfvrFrfkQeMnuu3EAY9U=
X-Google-Smtp-Source: AGHT+IESQDbU2/QoUk/jd6BnyeOUUPQzo77RwiIkyssfzTbI61MYXbPAfDvLUJDHZOc5ItYRiz14Fw==
X-Received: by 2002:a05:6402:5191:b0:5c9:5e43:9480 with SMTP id 4fb4d7f45d1cf-5c95e43f157mr4714225a12.7.1728900526354;
        Mon, 14 Oct 2024 03:08:46 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937152f12sm4802674a12.44.2024.10.14.03.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 03:08:45 -0700 (PDT)
Message-ID: <0240feca-541d-4aa9-abde-c0b0b0b477e5@linaro.org>
Date: Mon, 14 Oct 2024 11:08:43 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: Remove assigned-clock-* from
 various schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Todor Tomov <todor.too@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-1-a2bb12a1796d@linaro.org>
 <w4ta26svh34gojqpakrgp5cpsempedkewkmbllyvs5z5fm274z@jqs3tvunxq2s>
 <ca48de1b-b45e-4b27-a186-3bb7eb5859fa@linaro.org>
 <9e3d86b4-fad7-4467-af7c-9195855cd318@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9e3d86b4-fad7-4467-af7c-9195855cd318@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/2024 09:44, Krzysztof Kozlowski wrote:
> On 14/10/2024 10:29, Bryan O'Donoghue wrote:
>> On 14/10/2024 08:43, Krzysztof Kozlowski wrote:
>>>> -  - assigned-clocks
>>>> -  - assigned-clock-rates
>>> That's not extraneous, but has a meaning that without assigned-clocks
>>> this device or driver will not operate.
>>>
>>> File should rather stay as is.
>>
>> Hmm, I've obviously missed a trick here.
>>
>> I'll check it out.
> 
> My response was probably not complete: this still might be extraneous,
> because maybe the driver/device do not care. But in general requiring
> assigned-clocks could have a meaning.

No I see what you mean

Even though assigned-clock* is a property of the SoC this driver..

drivers/media/i2c/hi846.c
         mclk_freq = clk_get_rate(hi846->clock);
         if (mclk_freq != 25000000)
                 dev_warn(&client->dev,
                          "External clock freq should be 25000000, not 
%u.\n",
                          mclk_freq);

doesn't support setting the clock.

So it actually is a requirement, yes.

---
bod

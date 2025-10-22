Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8853446D4
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 12:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761137246; cv=none; b=jczhZqLIuavNheqcv0MpdcGm3lWBbZjCBkqud+a6d3kZRMEWqDvUS+gXq/Z26D2WZXUHf/Cv1c2MLVjSNdAvQekb4EwSz6HIpZtm6lyRxw+3zHH7Jx+UGGbmDvMnrKRrgzrKTP7gLBqIkplVIiw4b+hC+a0CkpP0hm3iSyIa6Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761137246; c=relaxed/simple;
	bh=i2VcWiJcaFfPTCfVHKG4siZQy2DpZw6VAq2A15maDIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJvpbbORiXEhg+67KKIwY+wJ/YPFhI/V3e98sj9qOPfcDd4lYkPoyjRaM2ldzUyRDEOzOZD7xnm4zQc7KG/MR7ojQNQRb5XxhMr9T0uXRI86MP27u8ICBoUi7pGmuAoGwbU22MA4sjav4bzWqndY3E2NvfgTtZQLwoFMwoN4OU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaMbCe8t; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaMbCe8t"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b5a8184144dso1119565866b.1
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 05:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761137231; x=1761742031; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WLynAwLummNFnWwX4n28DdGVDlN0LC2dmV54+Wl5oe0=;
        b=RaMbCe8tSTGTKsyOiKvdKVXxl5az1YexlydnoExWYxkU2M9qd6Wzqr/d/WNFZWo7C0
         bevKFMakI2W3FJ/9wtRHtc8v8FgI5nYcQqCLo5JK5KjUO7kncQwnztswhjSmYsFSVDZA
         8LjE4fKxloK0SdjJ/4Gy0h/u/vFEH37ZoC5xHCVONOnEpd+jZE2mH+L6M/h/on+YS0UG
         0ABRjAr8LfRESt3UY0VYiuVFtlVYmslITEAGxuzcBxQ7UxfRmKV7xV/cjRd90zN97AY2
         s3oReCNixKmg6LMnTKF6jYE6gAPq6AjnAI2wrLzSnnAsuiUK6g2b60+yEFMuGzSOXQ6h
         UhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761137231; x=1761742031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLynAwLummNFnWwX4n28DdGVDlN0LC2dmV54+Wl5oe0=;
        b=kSheksjF5/9d50lZGXAdvRUXgVrmHop7Y97x7H0FkTMp4p2B/4Lx7xMoAR74F8O9U+
         YT9QBvx8GPRQNgpzO0LP9IMOvqFT3/AyRqhi4pF6Ben4ZOHkjLp79yJkKZosWsF4Hynv
         nDRQz12/QDk0zil4D8ex15hnolZmmzdn6UOroFUSeam1xYkUM01rrRrEmmfvIRJEqio5
         7l1wh1f+pnaM/O7YbCdpzi0NexTKaYDB333sN6z1p5xuMzPuP2krTAvS8XrjqId9X06z
         8k1LqszdR90SZF/gNQoN6Z1ngbKLuUYn8A4jCVQP9K20IKncTKozYsOiA78lN2NXRehg
         Qohw==
X-Forwarded-Encrypted: i=1; AJvYcCX2RqYjCD3tp5xi8DShKhoqy13VteiQhWZoa6CCqzkwU23Nu+Pxry4lsYJOgQc9DjT0ifQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyI2MM5SADfdw+IJu02IB2s7sF6hpkQ8oR0tYWYr1Cd0/6pliC
	U2Y2Cwmqr8PWRmaw82Qk5qA0b3DwhAardVeWJrrsHRwtSu8cpDyxnECQ
X-Gm-Gg: ASbGncuCUuG20TvnSD3BfpmXZzNWaJlgjZy9VRzzwK4qioyLZ/z1Zv+bq7OT1IFiFlC
	Q+iPuF3qU/oE36x3RPoICXoj+ScecQG5NT39vZyEuWGgM6QPSTXTt/KSnorux3cePtFtNPlsgl2
	mXXLacXe3FFEbeq1ZfFv89dy+bwDw5rFzVcuzNaPN2mUyrCV3fke6Dw/Y10AiL1Z/95pAiT3j3a
	vDlv24v12g6SMMpnY6bw/tVHQhl6o6rmWZfiouYmAPrnlkGuf5fjQ29JQNfq/V8zwCUQZ7qEOkq
	f8sTLSp+M3DDwbbMWXQLwPqMlGQYuFzkG2gN5qufw+v9kGMuRQ0dssysbYzha2b6AVbzV3NhbFZ
	wX+Ajr7Us/70Mj4mhf/sJIOQv/6TAKEioTm+hL+esaxFzT41GYQWdXXQLb1NoU5uzFNKeBIYKhd
	BM2WNsgSFghepVdEE2f06AEOxXz2ktndIQ
X-Google-Smtp-Source: AGHT+IGCiRZUzBeTTRPZMe41X5ri9BkZhxAmfickbiqaWRlTqLIQgiyG0FTuaEpUWryBaH8SWItowg==
X-Received: by 2002:a17:907:6ea8:b0:b3c:f0a4:b324 with SMTP id a640c23a62f3a-b647463a1a4mr2231638666b.21.1761137230559;
        Wed, 22 Oct 2025 05:47:10 -0700 (PDT)
Received: from [10.25.209.134] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25c9sm1360292166b.11.2025.10.22.05.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:47:10 -0700 (PDT)
Message-ID: <41ab3845-6d6e-44d1-9bb6-b62e58ab6522@gmail.com>
Date: Wed, 22 Oct 2025 05:47:07 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
To: Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
 <aPJZ6dDRyyl3Qg4o@lizhi-Precision-Tower-5810>
 <cdecae8a-7fb9-4ac2-a412-1a18c4783ffa@kernel.org>
 <aPZTwf8O8tkqnDhx@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPZTwf8O8tkqnDhx@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/20/2025 8:22 AM, Frank Li wrote:
> On Sun, Oct 19, 2025 at 12:05:27PM +0200, Krzysztof Kozlowski wrote:
>> On 17/10/2025 16:59, Frank Li wrote:
>>> On Fri, Oct 17, 2025 at 04:20:19AM -0700, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Add documentation for i.MX8ULP's SIM LPAV module.
>>>>
>>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> ---
>>>>  .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  | 72 +++++++++++++++++++
>>>>  include/dt-bindings/clock/imx8ulp-clock.h     |  5 ++
>>>>  .../dt-bindings/reset/fsl,imx8ulp-sim-lpav.h  | 16 +++++
>>>>  3 files changed, 93 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>>>>  create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>>>> new file mode 100644
>>>> index 000000000000..fb3b9028a4c3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>>>> @@ -0,0 +1,72 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/clock/fsl,imx8ulp-sim-lpav.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: NXP i.MX8ULP LPAV System Integration Module (SIM)
>>>> +
>>>> +maintainers:
>>>> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> +
>>>> +description:
>>>> +  The i.MX8ULP LPAV subsystem contains a block control module known as
>>>> +  SIM LPAV, which offers functionalities such as clock gating or reset
>>>> +  line assertion/de-assertion.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: fsl,imx8ulp-sim-lpav
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 3
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: lpav_bus
>>>> +      - const: hifi_core
>>>> +      - const: hifi_plat
>>> dt prefer use -
>>
>> I don't think we ever expressed such preference. Where did you find it?
> It should come from review message when submit binding-doc patch.  but I
> can't find it now. But at least, compatible string and node-name use "-".
>
> It'd better to add to writing-bindings.rst. It is hard to search whole
> linux-devicetree mail list or brain may cheat me. It is good to keep
> everything consistent.
>
> like:
>      " vs '
>      VCC-supply vs vcc-supply
>      ...
>
>>
>>> lpav-bus, ...
>> Then just "bus" or "apb".
> core, plat is also better than hifi_core, hifi_plat


sure, let's go with "bus", "core", "plat" then


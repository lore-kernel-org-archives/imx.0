Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFF33F824A
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098044; cv=none; b=KwsrAQR9VmmQ9zVkJ00f8rT8za4G3hMPSKGDAMrqywXhbbqlHEWmXCRlh2jgY0G/jpstmqDrYYt6YGH04JWa2Dmf4TJlx/s/0U21+lM/i4Qd8QbiqSolsGdpsxkUMuS7tM2KvVPWz60SYlTb7dVAWD61hmBj1oIiwi4JyPml6DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098044; c=relaxed/simple;
	bh=U9VLoMW0IalIXXKj3TNG3sY26cbk3ZeDVGzH40pQj60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evdvpXvKqf3yFzw+9sme7n3K0q9g9Cq6UNJzDEMWHdCqvWrVzrCyi7tzWXV0jZ/pKf/jp1hYrJbsuvGUeOQDXHHt4HfL/XvyxNuaeAR7s+oi510TL17pGATDUW+I1u7whADy7C/2dMuoRLwaSGDCVLZZXwSxUYp6SuSGpC+ns9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gy6Hbf9f; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gy6Hbf9f"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cdae130cso22833555e9.0
        for <imx@lists.linux.dev>; Wed, 10 Jun 2026 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781098042; x=1781702842; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEtc4C9NcRRM9nTNYMQQDv4iFGCBOEem01v80xMhTf8=;
        b=gy6Hbf9fH9BvsTsWDTX2uOSS4rdodbTjkgxUuDmd30crM61hjrgH24A21qil7UNuoC
         QbDVKORmBV5va+/7kY0i6hphazFSDy8QnMlos0MKaWqGTOZ+whMb00ZajvyyNFnDvQY9
         YRdUDQSCWCN0SwzXrtB+iC0VJby+zRVabazp0T1FaKv503kcXoUm6qLs2SMDBy4UYye0
         OKccO2OVBM+z/3g4vGd7UveAxVQ/9GwfDfCbo14Vjgtbsnjt6hrlrd8aX5OFR/AJUyDi
         liQ8zp7b2UBfPR+HyacY8sSskN4xJoyyMUaPTd0mRq2DPbaCkH/NjhuqN4wSvHEK+f8T
         vCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098042; x=1781702842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEtc4C9NcRRM9nTNYMQQDv4iFGCBOEem01v80xMhTf8=;
        b=I3yA0czXXaNg0aZnA8L8D/U1blEyfiFdw6eo9Jhq/4HyIV8ghjbMMeEMtlY75m42vS
         TtzeMMdlCw09XQJV6WhwR7aYguIsT15+GOBEIEEpsSYm/kXWlZInAL5Iv7g18ElB025Y
         AA7yDcdwtkv0oeQJRhZ3OmDiGL/kBlpLM9mHPtO1Xthq2tHxGUI3/5l2jgBDLrmPZU6l
         ILQvpDUTzDQXzOwxjOxbHhI7Mc1uJEJ0h/nwcZDR22NOKVc646Rkx9t2jRP2qdS9tix4
         vdE9B4CHqmiQyGNwFKWXvOzV2Vx1WWVeldrGALuJTRye9OsGVbTLuKTYRVsXuOi12rAb
         kWsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9p5vmIobBYUJi7KtL5H+xiyFbdJ0I+3FGyfxFKLmtdVzcitEuvLaqSHmxSv3ZubgNuRH4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6YReRzsFhmgROkIBEr9Lya8SlJ//P8zeMZALZj+u4qO162kwo
	MGGwbiYRrlcFh22o4JsIL+KpAhUOPmxH+N3eM1IeLmqyhvMKNdC5F3iP
X-Gm-Gg: Acq92OGpzixqQTFs7I/hEhG4TGKevVhegFC5U0JvTQFaetW76qGFoRGPbvOE/+XsQXD
	lTc6uMYhhBbzhiixvFXW11axdQ5i2xi4zXlfbNZX7CMBpG/K8IE65vvbK5EPNpjzKh7EeGquCbb
	djmqz8sHbJBj28SPL3vjo6VRWg4xfT5aZasFD8Eb9DZ/WBY0G0llZNNRdsaBKjvrYcQw+bSM2sJ
	dHjjq1pLqf/N54Klc0TEy/Cw9dIQ+naLGF+PQ4RoHDVPjNYS7fAVlAtsD3bsSymK1Cr63XHIt45
	3OALnUzg6ADaD0DIsrhbCuCR3YNHpmxHPGb0jTnEHbew0xYrsg9+YdV0+NZ61D+YJl3QYkCn7Z1
	MDy2sa6isvY4oewWOQStnwTjbym7YtmhZmBjZ/A6oOdcg7kX+PC+0zxBQ/Zm8m/iBefzI2SLuBl
	VstjeH5zOZy8QvFTXFpxg3e6ecwYjblSi64Oe9xK7kagGW2iHy88uRkwdmNy0pY5D+vCI=
X-Received: by 2002:a05:600c:441a:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-490c26e1b8amr267071875e9.25.1781098041631;
        Wed, 10 Jun 2026 06:27:21 -0700 (PDT)
Received: from [10.25.222.173] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dcaa924bsm114022165e9.1.2026.06.10.06.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:27:21 -0700 (PDT)
Message-ID: <f9f9c026-716d-482c-953c-373333514846@gmail.com>
Date: Wed, 10 Jun 2026 06:27:18 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
 <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>
 <aik69L0xCW13TCZE@gaggiata.pivistrello.it>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aik69L0xCW13TCZE@gaggiata.pivistrello.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/10/2026 3:22 AM, Francesco Dolcini wrote:
> On Wed, Jun 10, 2026 at 02:10:37AM -0700, Laurentiu Mihalcea wrote:
>>
>>
>> On 6/10/2026 12:37 AM, Krzysztof Kozlowski wrote:
>>> On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> The names of the carveout regions are derived using the names of the
>>>> reserved memory devicetree nodes, which are referenced using the
>>>> "memory-region" property. This adds a restriction on the names of said
>>>> devicetree nodes, often bearing specific names such as: "vdevbuffer",
>>>> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
>>>> specification's recommendation, which states that the devicetree node
>>>> names should be generic.
>>>
>>> No, it does not. Names like rsc-table feels exactly like DT spec is
>>> asking - for a name matching purpose. Are you sure you read the spec?
>>
>> Quoting from the spec:
>>
>> "The name of a node should be somewhat generic, reflecting the function of the
>> device and not its precise programming model"
>>
>> and looking at the examples provided in "2.2.2 Generic Names Recommendation",
>> wouldn't "memory" be a more appropriate choice for the DT node name instead of
>> "rsc-table" since it's more generic, while still matching the purpose
>> of the device? Or perhaps I'm interpreting this the wrong way?
> 
> Please see
> https://lore.kernel.org/all/CAL_JsqKRW-=er+DCTob0HmQv9OyVt7yiej-Yht6UR-mcW=LHUg@mail.gmail.com/

Thanks for the link, Francesco! Things are a bit clearer now. Based on this and the
comments I've received so far, I'll drop the binding and rproc driver-related changes
in V3.

Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F072E2D0C89
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 08:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532697; cv=none; b=qh31eAs1BLH/wktnmlglvG+NsTS1U65aPhWnUBVWVcd/Tvu2cBS60Rr/Npr3hBo0ZjuV2TD970gq324DRS/9a7QJM05Sc+Cjngi3IEvCe3rOPsFuPRJkaKEDxvv5lET7HoCfVtOsqin35nv2i1ulj1ZuniQrJZJRwCsBKLtczeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532697; c=relaxed/simple;
	bh=hsCXwqcLxI8cRSOYueVTYtswWbZ6ub7fGgL17jIiNL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxGMUcEwXx+GqEhWz0j/F02zSXTn7q9/bDOFML3uGSD9jE5ag3RKyP5E8xXqKzEDxSYpPFtnOgEbIO8bvdaHhFJJwmhmq3+iebV4rzO4onDFGc2gS23snvcMFZ6P8Hjxc3qVHHGJwCLTHVgtqRATbEJjSe1LPx7jcSbZcfSlbkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kmr0OGrf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kmr0OGrf"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so11735958a12.2
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532694; x=1752137494; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hsCXwqcLxI8cRSOYueVTYtswWbZ6ub7fGgL17jIiNL4=;
        b=Kmr0OGrf5XURlcar01t5NTUjrlGe5AwA72e987mKP4Hp07B+NasFA6mz1afekZYsUN
         twdlgLEqpN0K1CbpIKxiPN5LsDPdiYoV/aeeZ84K5w2ulwUVpHUT+Qfm9ZI2p+Ig2sjG
         0xF8+yFq9v8pM1PlIj6wAo/pooyRJ5bAmiNoqnbRn/QWxqcWaACjSKSZbFf+fg+6rNCG
         xSDCN8GL+qST3pNK1/zIFSMV9xPRk2QI7OA/3amPriTYAthHBm4nImyAvZQSiMtibA65
         lsII1PTsGh784C0geqecTYAMeWeVM7R6h64dWdfE1QUsoGfjaa7sQqYAC2T/Ycdf778G
         qqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532694; x=1752137494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsCXwqcLxI8cRSOYueVTYtswWbZ6ub7fGgL17jIiNL4=;
        b=dXZ6zZfOqmFTByNUitVFiLC+pTlMhh3RHSQuSXVjNjf3FfPQ/QIH6M2eE6WTLunZnn
         gkfWoy/3hJH+L/+zNuldKcNyzWrcNBhsNGkEUOls2Vz2O0py0jumZwPo5228uYIulM96
         3drar4vRI7V7yXBWWjEu/wnyW1SlbupbpjZjQVrY7qVxjoj6CiegBmQgArZcenw5AqON
         FjSq8ldhFnCiVkA3KdH0rpGsKDwtRDQML6ayBRBB8aouVSPuPi6fa9iFE+vcnDQgoT3f
         TWarvJy2IK04n2Cg/jYTLYvOHTJVssXckRDXJR/ooAyuHgvDO4B1u00PZ6cKF+B6Z2wQ
         B9RA==
X-Forwarded-Encrypted: i=1; AJvYcCUyRJq6fFwjWSxfY0qExxxdzEqGjaUl3MIO8KHEhWgaObfSiTyQv1uY0I+7H+suGCYjTHk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMkXlrKS2Syk4VyOl7Qz9POFcCajxUF8lhcNsf4gt4lwEaEMf5
	+1jsF8zkvtFrLYI6EBXgGIaPVqrOBIKeOhVOhstuGo143fNw3rj52Cro
X-Gm-Gg: ASbGncsiKUYlTfxWxx2S+23vrWcHd+sI3dfpZKEXdt/qunkB1DA+fKPGiTxMbwXQCT4
	yOharqO7XEM47CVzoFde1xNqCVzJwGtMAygtpbEjgmGY08PoVFdz/2C5r4Rzrqfq2GKugLRRNie
	RO94cScogvogPb6EZcvT4DvyF7E/w1gJk0JxWNj5YPin9BE6lmB/ogNaaOIBIIWvSeS9jkObxV6
	AeWiIrpmMuykLE1xlbq4n7THQv1HhxUJ4RBtV8fGVpjgPKv6S7Fa/IZSwGESxFcM70EbQTql2CS
	3yK5rc+pdi7QroK6XeCZumgb2VYyyr50orSMnevCbHdC2BzGQHSdR81GXgFtcZNPNLgD6hFnTrL
	UEe58cVEwBrM=
X-Google-Smtp-Source: AGHT+IF/15k0UhDJHrTcrKwLdwkzfbrEugE0iaN0gMVkMiQ4Upn4VgFsHeYzGWOfl44lDF56ZG+LGw==
X-Received: by 2002:a17:907:8b85:b0:ae0:cae0:cb35 with SMTP id a640c23a62f3a-ae3c2ce87b1mr512443266b.37.1751532693871;
        Thu, 03 Jul 2025 01:51:33 -0700 (PDT)
Received: from [192.168.7.84] ([92.120.5.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3b94b3b2esm388690066b.62.2025.07.03.01.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:51:33 -0700 (PDT)
Message-ID: <10ef8a9a-6d23-4fb9-933f-71ab493d21c7@gmail.com>
Date: Thu, 3 Jul 2025 11:51:31 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] imx8mp: add support for the IMX AIPSTZ bridge
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <3615415b-7ebd-45e5-8d7b-8a1b26ac7130@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <3615415b-7ebd-45e5-8d7b-8a1b26ac7130@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/3/2025 11:11 AM, Ahmad Fatoum wrote:
> Hello Laurentiu,
>
> On 10.06.25 18:01, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The AIPSTZ bridge offers some security-related configurations which can
>> be used to restrict master access to certain peripherals on the bridge.
>>
>> Normally, this could be done from a secure environment such as ATF before
>> Linux boots but the configuration of AIPSTZ5 is lost each time the power
>> domain is powered off and then powered on. Because of this, it has to be
>> configured each time the power domain is turned on and before any master
>> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
> Sorry if this has been asked before, but I hoped the cover letter or patch
> 3/6 would explain if it were.
>
> What is the default configuration for the AIPSTZ before this series?

the default configuration is the reset configuration since AIPSTZ registers go
back to their reset values during domain power cycling.

> I assume the SAIs under AIPS5 can be accessed by SDMA already, so why was
> changing the AIPSTZ settings needed for the DSP to work?

AFAIK SDMA transactions to peripherals don't go through AIPS5. They use SPBA, which
is why SDMA works even w/o this series. As for the DSP: transactions to peripherals go
through AIPS5. With the reset configuration, the DSP is not allowed to access said peripherals,
which is why this series was needed.

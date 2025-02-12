Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC81FECA2
	for <imx@lists.linux.dev>; Wed, 12 Feb 2025 19:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739388985; cv=none; b=n14UrfqucPP9ArNBeVlILAJQUAVCA1mMM/rR92cUmIvQtvZdgjy5WyEO4MMTM1F1hr+wqebsMdE7qjsjPS2tdH1iGfQRWYP0s7IVLDX+ihyzDkqQG3pwRilBPcejErcr9EmA1dVXLjmu89zPRzVNkJHEg9176hQdKmDB9JyiMss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739388985; c=relaxed/simple;
	bh=QO4/KNc9x4dzK3QBi705JZGrxHHJJZS+sDqwNV41osA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lVJMpmqEHMR8Fe0T+bDLb/b2vRqykxj6iL7e+OOwuUw+9iONj2NOdPsqioHKjM5zMRtwI7u9TIRMbxo08is9tcM+bAselakFLjH4yYtBDbpnvOqvQPGGRH6+/HALOwsYJpifg4Ahue6Z3uZJv7qMNhoAUIIiSsB+HvRG0JEY0lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ct5yoKYW; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ct5yoKYW"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab78e6edb99so23226966b.2
        for <imx@lists.linux.dev>; Wed, 12 Feb 2025 11:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739388982; x=1739993782; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nj8WHZGsoOuauuYxbxbB7oKPr0MKW37ni43BF0NAcDg=;
        b=Ct5yoKYWpXHWKZm/k67f/C6DWOc0n09DJa6kWDb50Q0pJFRqIVlq88Vo4FcGiFiNgL
         ONEFnRH0jgvY4LHGNhxYFgWV6r/34qbzsvNyAW+1TAY3QqcxaMm9L5BHws2fdUsujC6Z
         lhnAi6+uT+qyKYaEbyuMfureuPvcpRIbrN59ev6f35WBFVP9kdt7Z7WlaIovcXPAsICF
         Hz9ScewcpngNCWdOMFEShXpj2HP+u0KAQxHkvQhZJT6pilmkJRQJK5Tae46Urq2vie5+
         8zbsfXMrZefxdSVr+Lx3YbPD39s0lVvTDqkUdfh8Erxb10CVHgAWB6vvisHAtoLsiFtG
         QXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739388982; x=1739993782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nj8WHZGsoOuauuYxbxbB7oKPr0MKW37ni43BF0NAcDg=;
        b=m9XXjUoPhJ1zTNgRwflYXFdbOcEIOortKQP9oQGgaHGeOAYc19mJC64YnbRUEghTRQ
         TCoWAkRjxkg4a+bXPaHNzSuWT7/KaZo1VJgEa471pfJF7+Qn1bHDuWTYDrFnG8HfkZdO
         Ii9vetPXAkwC4xUIaTVImwXhmkF68N5c/u2pDDX9uvJEb/QtOljukmdIsDSnaacRevzs
         p4r2GGzBGgWsIoWdK+C0NSX6R1VEydTgqHAoz00qC6ocueoA/OKm0WCpsEqWtbEM28Jh
         dcYdep+VIVwFvt4/GpRspe5h/NzuumqbrBqSjnVInXHRg0fCprHfY0BOGCVIqCaXi6zS
         EM0A==
X-Forwarded-Encrypted: i=1; AJvYcCUwIrUFntDElD63Da124ef5naOpeJqaDnKYKRWIyidvH36p/N1imkaDx9F4FUhqS70x6ME=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTJSWs5wS4rpojkaDgSJELa1+tWXF+Wb07NIrMDxQvkzYwgslq
	W1KgTk0Q12ZkIkKpeJ1E6gLoU+CyuhClvFLk7HRY6rqda29rAOf9
X-Gm-Gg: ASbGncuc56igFenkjTjZ2lF99HIyyQwNFz3aWbQCSuddc0kpp1oNXXQId49/LOMyp6V
	fnBadPA5ymg0XVrnduplIIkN5IZ+j3+3LuFfEwJz7iy5MSNmS3bsTZSX6OBJSKHLnE7MH0F/yB7
	DkP3g0znexDkyfHDMcbyZODZthAa3oFblE9Th55cOLOF9CvVVsCRwrDhL77ewPgk+f2dRLC/Tr2
	fB8s5yMtgxBPDd9PoY9vbwt0kVKAJR6y/qDGAg9aQkt/TKHFPg//EBSY8NIHtXzGBmNIrUWXEyW
	XZWjEsnFbh0e/3eZxqRfwKWzb2znAfGtPccf6/Hldo6v
X-Google-Smtp-Source: AGHT+IGL83Kis97/b459m6UtdYpnAuiWRMSSg5OjvrrLppYn0/cJ+CJ1qwhXz6yKmy+MT4z9GaeW5g==
X-Received: by 2002:a17:907:c1e:b0:ab7:9b86:598d with SMTP id a640c23a62f3a-ab7f33c1e0amr401910866b.17.1739388982053;
        Wed, 12 Feb 2025 11:36:22 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f49361sm1319997166b.33.2025.02.12.11.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 11:36:21 -0800 (PST)
Message-ID: <e45411df-1b8b-4f21-878d-d52e1112e62d@gmail.com>
Date: Wed, 12 Feb 2025 21:36:19 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: support imx95's CM7 core
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
 <20250211225808.3050-2-laurentiumihalcea111@gmail.com>
 <20250212093610.x4ixrackmn3u2xrf@pengutronix.de>
 <CAEnQRZBeQdnC+K92+Udb5awTmom10YHHNt7Ld-pYK4A1i8sr3Q@mail.gmail.com>
 <d66996eb-f49b-448b-9743-d19a3c3eba52@sirena.org.uk>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <d66996eb-f49b-448b-9743-d19a3c3eba52@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/12/2025 2:38 PM, Mark Brown wrote:
> On Wed, Feb 12, 2025 at 12:11:49PM +0200, Daniel Baluta wrote:
>> On Wed, Feb 12, 2025 at 11:38 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>>> On 25-02-11, Laurentiu Mihalcea wrote:
>>>> +    const: fsl,imx95-cm7-sof
>>> Albeit Krzysztof already add his Reviewed-by, can I ask why we need to
>>> add the -sof suffix instead of -audio or so? SOF is a software project
>>> but you can clearly run different software on the audio-copro as well.
>> Sure you can run a different software project on the audio DSP but
>> you will need a way to distinguish between the different projects.
>> There might be different mailbox, memory configurations. So you will  need
>> to invent another suffix specific to the new project.
>> We can make  const: fsl,imx95-cm7-audio as the one used with SOF
>> and think about a different name later for when another project will
>> want to use the DSP.
> I think the point here was that the DT should stay the same even if the
> DSP firwmare changes, just as how changing the main OS shouldn't affect
> the DT.

It's rather unfortunate but based on the experience from the 8 series
(imx8qm, imx8qxp, imx8mp), the programming model can differ quite
a bit (e.g: remoteproc vs SOF) even if the core is the same (i.e: DSP core).

The different programming models also required different DT configurations
(e.g: dif. mboxes as Daniel mentioned, some extra properties (i.e: reg-names), etc...)

The "-sof" suffix was chosen here instead of the more generic "-audio" (or whatever else
alternative) because the DT configuration is specific to SOF's programming model. Other
audio applications running on the same core may have dif. configurations (e.g: use
DTCM/ITCM for memory instead of DDR, dif. mbox count, etc...). I suppose this kind of thing
is bound to happen to some degree since the DT node doesn't just describe the CM7 core
(but, rather, it also encompasses information on the memory, mboxes, etc. used)
but perhaps I'm wrong?


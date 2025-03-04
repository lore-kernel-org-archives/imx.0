Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573132780FD
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 21:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741124167; cv=none; b=UYpzyk6skEIkJ2EDty2iVIzcgikmRc/yi1chowt4wudkOWb5Feba4JsO1obNiVS8yYznmahIHtF5v92ycy72ZTAOU+GsPYPbWEUQec2reE0QJF2hcLjqCz5yFwaecTnFKDQxzQ0cPnyqtZUbj/xF/2HUyN3Ykce6J7IOFbSXCCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741124167; c=relaxed/simple;
	bh=wiD8xusbEKsu2Iali+v+Ym0NExRAdbZb3/jT8bMVl0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRlGzYdEIkJsqz85CwxlGBTDwNWYHsIYeB8jiR0kVEfsh5jry4sOiI4jW0nzZtAFol4q5mq0T/YsdKI0zQSEmVG7vTOcObuZjkGBlf+RQ5PG9/OELdSKkQVMspyBf4UEsOa9mnDpzMwIu+OVKz7Zl6qVwHTTxsM9JrEvi10zK/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYiweUbx; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYiweUbx"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e538388dd1so3884844a12.1
        for <imx@lists.linux.dev>; Tue, 04 Mar 2025 13:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741124163; x=1741728963; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aul07l9GfhwCjHtjGDfD/NfsZREfo2EqSgSJg3nuUF8=;
        b=IYiweUbxa9Ya65fAhqU8508h+QA/6FjUTTn9GiLJmsZAs7YRS1r+2rc10eGsfXd+Gu
         wFJzpnRGbPXIk4DaxEyUsbVrOyTdNELigvhoReMs7Got/AaAjSgGc4hGtrDd1ZROJwJd
         ILm4x230/CqkO4HtJIIMsKpyg/xyMPQe2DE/+m88xTBNBQGGbfZa2qZ+fg+aXbkV68te
         mneLLl39DxrCKd8Sqd9eaF2EhIf9J0841f40WcR/+nspJAfSplQ7FgwajfCnRhA7syLu
         uMsstXOI1PfDX5X1qZOVg8qP/nVq8zak3SGMiNG7VWpcJ+REXTExmOsY6kE9/h3mldI3
         G4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741124163; x=1741728963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aul07l9GfhwCjHtjGDfD/NfsZREfo2EqSgSJg3nuUF8=;
        b=GFj3lSsx0v1zA+dj3voZjZ9ie+oRPiOFA6WbXUUVWnIGewjhdJy1tS/E2nck0mjmAX
         r66X6r/vEjgjXFT3hAA6vdXyVC5Q89NmCQXJHm2GtYRILBzKfcit/6aLhzfsw5Ke1ehn
         JKugkRrKpVnl5q8OpZ2jtZ0Aool9Po1eUO98qmHvexRodAAabYHsKfDk9aMC7cm09Cya
         qp6cUTOCZBJhd8P83L2tgu1Ax38nTI49HXuRpkdVjDXHwV1+zJyPAAO10fiXl2jZiJro
         m2kA24aP05Xx9xY0EAwMO+8hFCzRrjYsq1Pidjbv2ibAl7NMzGPTtPkvUTH43+mY8LCR
         wF5g==
X-Forwarded-Encrypted: i=1; AJvYcCUVgI9qGdoF0WqvxyYYSS7/RhiHpXLTOn2rNR27ZACFFSXsCg/ZHOMyMzORXQ0g1+AqSd8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8UfvnbmBNwFnP/Gd+eCOIBSRll88ygXles2rR0VWPGsyYr3vv
	kmimkLgkjhaV6otZb1C4N5gns1BMRdSJ/QYQf4N65I6KhI2NG3Sm
X-Gm-Gg: ASbGncvcURm4Y0HaxiH7//8CqIAs+jmfpgGiXkWLPOmUw+IGyEHtwQ/bAI18OvAe+sC
	eyexr/gvDRIC1KjFX/BefIIUpP/mh51+9kgYfroY3DYqxZLBBd19l5LMPxx5ozKN8AfOWsRbrHY
	Q63z1HWX3hd+Ywk43Gv1qiXR1e/cadA2y07dJdLr9ZCRCgkMqJ7OqjH9VbzRX6q7a6/0GQBuW+5
	ESLIXfjJtlHWNC7lspyaiX9Nv6apxfHd881VCJ1/5W+gZn+8dSKnf3x5ziWnHU3sx653N8OC9y8
	l36sQfdzbmoPf++AgwvQk6sDOz6gq8VnD23OjsbSccXLRzl6UXc4h8DzH+l4+RYu+q43aEUDSg=
	=
X-Google-Smtp-Source: AGHT+IHs7d8BBwbkw8DJDPW9i5mIaZ+Eha2Wmv+f6E90nzjq8XUloML3x2a6rJ4eSQ3DcQCiw+551Q==
X-Received: by 2002:a05:6402:1e93:b0:5e4:9348:72c3 with SMTP id 4fb4d7f45d1cf-5e59f384ad5mr490926a12.10.1741124163230;
        Tue, 04 Mar 2025 13:36:03 -0800 (PST)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bc8800sm8943647a12.48.2025.03.04.13.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 13:36:02 -0800 (PST)
Message-ID: <88584d8f-e1cd-4b56-8906-461e1e6d9cc9@gmail.com>
Date: Tue, 4 Mar 2025 23:35:58 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: support imx95's CM7 core
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
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
 <e45411df-1b8b-4f21-878d-d52e1112e62d@gmail.com>
 <20250213064724.kbmxsk5szpxwclj6@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250213064724.kbmxsk5szpxwclj6@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/13/2025 8:47 AM, Marco Felsch wrote:
> Hi Laurentiu, Daniel,
>
> On 25-02-12, Laurentiu Mihalcea wrote:
>> On 2/12/2025 2:38 PM, Mark Brown wrote:
>>> On Wed, Feb 12, 2025 at 12:11:49PM +0200, Daniel Baluta wrote:
>>>> On Wed, Feb 12, 2025 at 11:38 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>>>>> On 25-02-11, Laurentiu Mihalcea wrote:
>>>>>> +    const: fsl,imx95-cm7-sof
>>>>> Albeit Krzysztof already add his Reviewed-by, can I ask why we need to
>>>>> add the -sof suffix instead of -audio or so? SOF is a software project
>>>>> but you can clearly run different software on the audio-copro as well.
>>>> Sure you can run a different software project on the audio DSP but
>>>> you will need a way to distinguish between the different projects.
>>>> There might be different mailbox, memory configurations. So you will  need
>>>> to invent another suffix specific to the new project.
>>>> We can make  const: fsl,imx95-cm7-audio as the one used with SOF
>>>> and think about a different name later for when another project will
>>>> want to use the DSP.
>>> I think the point here was that the DT should stay the same even if the
>>> DSP firwmare changes, just as how changing the main OS shouldn't affect
>>> the DT.
>> It's rather unfortunate but based on the experience from the 8 series
>> (imx8qm, imx8qxp, imx8mp), the programming model can differ quite
>> a bit (e.g: remoteproc vs SOF) even if the core is the same (i.e: DSP core).
>>
>> The different programming models also required different DT configurations
>> (e.g: dif. mboxes as Daniel mentioned, some extra properties (i.e: reg-names), etc...)
>>
>> The "-sof" suffix was chosen here instead of the more generic "-audio" (or whatever else
>> alternative) because the DT configuration is specific to SOF's programming model. Other
>> audio applications running on the same core may have dif. configurations (e.g: use
>> DTCM/ITCM for memory instead of DDR, dif. mbox count, etc...). I suppose this kind of thing
>> is bound to happen to some degree since the DT node doesn't just describe the CM7 core
>> (but, rather, it also encompasses information on the memory, mboxes, etc. used)
>> but perhaps I'm wrong?
> Time will tell if there will be any other user except for SOF for the
> DSP but and this is what I wanted to point out: the DTS should abstract
> the HW. IMHO The CM7-Audio node should contain all properties required
> to turn power and reset the core (e.g. clocks, reset, pm-domains). I get
> your point regarding different configs but please have a look at
> mt8183-kukui.dtsi. Here the rpmsg config is a subnode of the actual
> system-control-proc. This makes much more sense to me since the HW part
> is part of the generic core-node and all the software config goes into a
> separate subnode.
>
> Regards,
>   Marco

I understand your point but we're dealing with 2 different programming
models here: SOF and remoteproc as opposed to just remoteproc as it's
the case for Mediatek.

Going for a similar approach would also mean quite a bit of software
changes as we'd need to factor out the common bits (most importantly here:
core operations like start/stop) and placing them in a common driver. This is not
trivial and I'm not sure it's worth the effort right now given that:

    1) The current way we model the hardware inside the DT is not exactly inaccurate.
    The core does physically use those memory regions, mailboxes, etc.

    2) Whatever we do, the information in the DT will still depend on the programming model.
    It's just that you're placing it in a child node, instead of the parent, which is arguably not that
    big of an improvement?

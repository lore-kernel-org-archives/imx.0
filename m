Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFB51F8AD4
	for <imx@lists.linux.dev>; Wed,  8 Jan 2025 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736336470; cv=none; b=r1Uzc26tQN5p9w5UOp/I04HmFvQ1kV1+jWOsBdf/EWGYtQftmKeEZz1JIc5Nui5+IA8arGQZPaRy56rndFYyWZG9pmz+vDlZlIIucD8X/RuPX3rZAPQyoXJPY7dRy8vYEOa2UJeIrtYy9m/gdbSbugLouXmfRonn+r6+AYrSqiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736336470; c=relaxed/simple;
	bh=CsEFc6QCURCqv6tzj9PnSyeNyyn2t4toianYtfHXa4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=elo1h1l7DSCfxzup0UW8I3BhtarOOIlhdeWZuY9QZBx1Lcm3/Iumr5lTgyf38q7h/MLV7clhzzrB6j05pS8kOvxX3JFg6IbUpH27Z3o4y3B9BMo+kxP/JP/1ex+N0FlDsvOljkP0rqSmEEhwN5QXYiwS4W5ZhfqtZS1ssf8ACeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwBvGmCx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwBvGmCx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so10923995f8f.1
        for <imx@lists.linux.dev>; Wed, 08 Jan 2025 03:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736336467; x=1736941267; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6S/HfA2Jq7a1HhJuKKdJo8XxHgRM/1ZMu2JHAvQIhQ=;
        b=UwBvGmCxP5BYlj7bfp7Tq7N3uo0x0014zXN+PYkqhbVpdR1N9rrdB6N0fKM092pykF
         ZxsAcIdbD9/BGwbnN+rD85XtignWniysDBJSRLpIWyT3LOPX6MixCdoL38wGvIe7xiI7
         KRu203aq4GO5XBGoC4NpIQs88WYwuM3CMyGa1XKrBefLTkFcW7y93tK7uud70/GW7qND
         MbAhGzw3TqTZEGtPGiZKc6G3My72+3b4WQk/UU1mN/FvTcRggLzPB6zcLe2uB1EN6Ni0
         RskEeiQWEwZSlqvfvjixcgHlmE/3wBINPNkOAO2Ly/NOyGaO5k3PF9f92Wxv7y3Nz8zh
         x63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336467; x=1736941267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6S/HfA2Jq7a1HhJuKKdJo8XxHgRM/1ZMu2JHAvQIhQ=;
        b=ZkidnUfl12oyDwhRxCn2/49fjxo+PkJxZu9lHy40XKZeictEilNAy9P9NBk29OXAgF
         KADAX5vKUBJwTbmMdGhwH9Y0vj1wY3KC3ipCVOPVZRy8A0KGqNUY6JSYtbc0MF9B31sE
         SKAHEETzwCROYtXLU7jHkUZaOVo1Er009MfJggMmz+r3/HyCD6eROxwG/9m808i8SC17
         mVN+rr8ceQCDuGqBnrLCUtUbPKn0x52gMivyrhCEZZMsBtd5XQi5+t5EbAyYJSN1HYqo
         n2XO276nSjJ+DjDWbQQpjjvjknB8/Vh9ImrYrSXy+8aBjQThwRc3RUGXvjqY0XUELjah
         rPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL/xycbRn5iePZQpkVjaeJxKPBQ2o4FDsD320fIZdf6PsWtSLpfOQvfnsVzCcYpoKSdOM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbnMtvmzloLu3iMO5zvtA7gbgDNOYAtav5iFXvYMq/NBPfyRwx
	lF+6JLXpm99umajbuLbXtQIKoxoNoEJtDke43h5ZmjNr5tsqSxU+ycAzLJdE
X-Gm-Gg: ASbGncsxNhDshkLje8hPwiiG3YPyzEtMQEcNTn/Yz9of6NTqaS+i6lc6uevk1NjanWx
	KOENTbVw6t8t6+YzM4FrfEiA2hynBHbkjGSdOTSzXioC3wGeT0tTBuWnJukjOKZgfg4UeY0kRoU
	4D9jak+9qydG8yFcbVdiwvyN00ylRShwRMfNT2lv3Qmm3tSnnggF0wLs+K3pxWR5goVke+7A9l5
	f5PkjcPgjVrkv+5SaGSw/wDnegC7K8bL1i7hKY31nS0ebOW50qqNejq9XOC+wsp6x5pBS58J+Cr
	iUdIXg==
X-Google-Smtp-Source: AGHT+IGZNzJ0gmJc5uMS8tMi5FavbgJj915mjJboHd4V9ATd3VnrztacUeJqVQLao2ZkraSSlltGUA==
X-Received: by 2002:a5d:64cc:0:b0:385:e8ce:7483 with SMTP id ffacd0b85a97d-38a872faf34mr1961390f8f.4.1736336467305;
        Wed, 08 Jan 2025 03:41:07 -0800 (PST)
Received: from [192.168.4.226] ([92.120.5.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828f8fsm51961774f8f.12.2025.01.08.03.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 03:41:06 -0800 (PST)
Message-ID: <8605a282-c43a-4792-8750-f56a7370f355@gmail.com>
Date: Wed, 8 Jan 2025 13:41:04 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: add common binding for NXP
 audio processors
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-2-laurentiumihalcea111@gmail.com>
 <Z2BYcw6x3zyeBwvE@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z2BYcw6x3zyeBwvE@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




On 12/16/2024 6:42 PM, Frank Li wrote:
> On Mon, Dec 16, 2024 at 09:50:35AM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add common binding for NXP audio processors with Sound Open Firmware
>> (SOF) support.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../bindings/sound/fsl,sof-cpu.yaml           | 35 +++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
> You create common file, could you please change existed binding yaml to
> use it also?
>
> Frank
Plan was to do this incrementally to keep this series as small as possible. If required though, I
can also include the other bindings in this series.

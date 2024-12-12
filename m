Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A0220E712
	for <imx@lists.linux.dev>; Thu, 12 Dec 2024 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733997566; cv=none; b=mL+c14Y5XcScAHJVWlepGYs4VgDEC3yN2yA0plVJrl0wowtYG0AP4U7NdCdhOrAIY7z3aHyJqtKwqT+zLxrhAhU/DtAgQAnoL3hvMKqvUS/ZmJEI0Hu1YznPquCYz26RS1CCgm3xQv1XHqXJ97b8QZSO103LLRK2pTW4Ekg8VMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733997566; c=relaxed/simple;
	bh=f9AA/A46t2LgZraALppz0qz31Q51GoBAgTAWwcSzbKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuKfHY04krZ10GKpBA4Zv+Yt4OL1B5CWcL2aC7fVPm04itsPrbTRZBrq30UHEI+po1MQtCMeHPNAFjrjny2fyLQE6fEzB37HYIINtosu2g7SEHjhoZ4igI2Rl6nk/StFp726W7FxsfPIZ/D1hqOFwZm0UExusEJI/C8+xCPiKTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eS8Fxi2n; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eS8Fxi2n"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9ec267b879so77054366b.2
        for <imx@lists.linux.dev>; Thu, 12 Dec 2024 01:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733997563; x=1734602363; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zk4a8zDUNM2R0E4snQBxkDhcU3anJgMWX77nhsVAD+0=;
        b=eS8Fxi2nHEhdK1niIN971KmzRoiOMTHChWYONsHPBFO2bTVNQSGI89aMjx/7Bu+TJF
         YaV3UOIzfN4+RCMPxDFSIBcrt727fqQ+NM5hwl42dipYIeD7MuuBagNSH4T7IjG6Z4aq
         Rlf+pPRcByVFEmMPF/ZYQydqO0+nWry4PS5E7XsEYaCOwxM3ihFvpmpcd9eQqAI4NvL/
         saQ2637FY+G7C15j9pSNT2Unrtn9ae2d0OupfSpIUeAwaj6zPBJbSXCOGWq08TOBeCiL
         SxHw7wWbT1AlSMNqK6YPy6CloXbXZoar6YaQkTQE56DKWjfntpxUgxIk24xOi5228d84
         a7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733997563; x=1734602363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zk4a8zDUNM2R0E4snQBxkDhcU3anJgMWX77nhsVAD+0=;
        b=Q5KwdbaKML1g681HnLvzNGeAOsFe+0k3J36y7FnqngpXAU/02IufZSlSXggKVwUaxP
         kuFBwqo5yF5CXkjRHPk2TfDuWJflBpgeLscDvfnUIPjnXn0+fqNBVs1xybTQJV7cnCqs
         QNo0QgGT3OHA+NcY/iRelnbSJpN7VRI+sILHzLghyXS04QwijhmJ/1ciXOubG3wEzEj6
         ab7xaaPLjtEMws/qW7mB66zMm8QV4Z0ALNZ/S4v2UHnk0F/t1I8xwAe4KYdUPMzXM0US
         +HOdFo6kVnnLYEd8gw503rbmDDecF0hk4bdjp4yMUYTduZljdYeUm1jY3OJq5i7yKC/3
         NCxw==
X-Forwarded-Encrypted: i=1; AJvYcCW6p74LflMpt0GE3Q5f4HgiY6Sg2B0aqrf9adVkDwRmsbG9aRLTp+gX3D0HYPLMRgArQEA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjr9YTUaIATDf+M4EBx9kJcJ9Eeg6QT3RqBOmwByjtplvOpVOu
	vNF2MfKDa4O/1rowDaBKlRTG2hVsQowsWOqeQgHbdPEwPBzexe5Y
X-Gm-Gg: ASbGncvCTxy05RS1Akn/lZI5crR7qXkjZ9skmqLyzFD9aISMu9JQoVn8/zcq7AOdQEL
	Aarfg4SgVfAFqeE90bp5KrFmz6/I202JeJOJlSJH0gi+b6MGtlze8OABszfWSIOmkwTXpN5uiyO
	rCVgCl6z9u7Bv2hHYM4Lj+yfFnxTGCDld5Vgu+QXFPfn6GnEsWkH2rvbHwJQlPnrigg9kz287v1
	WmcdKq46WeUSQWQ0ux7cq1+i1GYdWRXlZ1Nc1TtY/L726TOQSyoM9na+vr3QcMJogyVxT9aJUBN
	k1bgSQ==
X-Google-Smtp-Source: AGHT+IHsoB7ECXZa+537Kblyf0Pjp2NQCDzrPJy9QJIErcCrbfwLPbPLg6bypSTjvP8hBq30GN5Gpw==
X-Received: by 2002:a17:907:920d:b0:aa6:73ae:b3b3 with SMTP id a640c23a62f3a-aa6b11e5531mr571613466b.32.1733997562783;
        Thu, 12 Dec 2024 01:59:22 -0800 (PST)
Received: from [192.168.7.105] ([92.120.5.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa674a112c7sm683296666b.147.2024.12.12.01.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 01:59:22 -0800 (PST)
Message-ID: <1fc1f1ae-766d-4266-84ec-11dbd67a608a@gmail.com>
Date: Thu, 12 Dec 2024 11:59:19 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] ASoC: dt-bindings: audio-graph-card2: add widgets
 and hp-det-gpios support
Content-Language: en-US
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
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-4-laurentiumihalcea111@gmail.com>
 <ZzUH3n50Vw6RhmNJ@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ZzUH3n50Vw6RhmNJ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/2024 10:11 PM, Frank Li wrote:
> On Wed, Nov 13, 2024 at 02:52:38PM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Introduce the 'widgets' property, allowing the creation of widgets from
>> 4 template widgets: Microphone, Line, Headphone, and Speaker. Also
>> introduce the 'hp-det-gpios' property, which allows using headphone
>> detection using the specified GPIO.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
>> index f943f90d8b15..94588353f852 100644
>> --- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
>> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
>> @@ -37,6 +37,10 @@ properties:
>>    codec2codec:
>>      type: object
>>      description: Codec to Codec node
>> +  hp-det-gpios:
>> +    $ref: audio-graph.yaml#/properties/hp-det-gpios
>> +  widgets:
>> +    $ref: audio-graph.yaml#/properties/widgets
> why not direct ref Documentation/devicetree/bindings/sound/audio-graph.yaml
> and define these again here.
We don't actually want all the properties from 'audio-graph.yaml' (for the moment at least). Also ref-ing 'audio-graph.yaml' will make the 'dais' property required, which is not targeted in this patch. Maybe Kuninori Morimoto can comment more on this.
>
> Frank
>
>>  required:
>>    - compatible
>> --
>> 2.34.1
>>


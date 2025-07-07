Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DAE26059D
	for <imx@lists.linux.dev>; Mon,  7 Jul 2025 23:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751932166; cv=none; b=kLnOkA56kRfER/OXWRh5PdBkvPD5jm5tc/nJBjasuOXjF+U+99ZsygSaH0NcMN1PZrJDzWqrXHDJh7su+0vquma4NdMc4g36W5BAOgC/WVPgNt3zzZOFtB4Q+CGIAHQH5IrFvZZQj/KuCsu+/dqspMPTlBNkNUkhaZfAwP2GDJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751932166; c=relaxed/simple;
	bh=TCFRprCP4msMIURmCuCelD52LF+zoH7SAbFwNKfZ62I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fNwHAUcehDHsuyLowoVKCbB4kGji3RkZkRoEe/q/iGNSaIs/dR0PPmNRZ8iEFVP/dj05axGlAosVDU8W9VFk+wmG8KJJAQlMpEGRdo7ymLOgh7jsXeCxcpp/wi4BOUmmBORuFD9v7ZzWj3EFitJgKy55sDt7pqZZZZcHo3fucLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOHtc98g; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOHtc98g"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso5548627a12.0
        for <imx@lists.linux.dev>; Mon, 07 Jul 2025 16:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751932163; x=1752536963; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96edAJ78aoq+ligp1pRPgUyMQ47YjBrb5R36hN7T77Y=;
        b=KOHtc98gDmqQVESZMVE4CJyFvEznIaeia8pVvBV/5yOZ4aCo9pQ9yx8Z5QsJtTsSdI
         OkOjlUgEizw77WVaxBlYdfuBp1sEQAPbzRD+eFxdQCgI770UGCUw1kEkRvDYaU3MsugP
         3PGdaduKCz0oe9nJCAyplauazknLsoANw5su+NT1dzqXuf4N5KfAZ5gWkocUjm1ci7MF
         oXsaJB7XMFUWEV5FexyAJI5SOPIpav8a0Clakaq1g7JIt1bWZvdrZSIgUoVrSLvC9Ekr
         oh+XkBWhw8l7OQlxkS2W8SUncyb7Y5DkiHZbmm8EJGxlguAkGhOTw4LUaNVfCvxNP/qe
         ewWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751932163; x=1752536963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96edAJ78aoq+ligp1pRPgUyMQ47YjBrb5R36hN7T77Y=;
        b=BwZY855npciOKOFl/+G7FT72DXpwnxOMixxngkbDl+6CsPlM2V+W86rjKVQGH3Yyib
         lnBffgm86T/A/JKB8mKAWxqQObRF7a1ZxL/hz9v9VHTK3VeiEVToA6rib9YkqHUY2KXP
         CU6hbGTg8UodXFeWf6vmn4Zj70WX8f+Ey7z2QFObAovGpGm9T7l1IYjXJ62S1cNYqr+i
         DG/FVfCyPpD2H3uLS37mrnkF1GPuJXa1JRvV7G+KHTv1s3C0IsTpDIMhpM6eyCQ3RSrP
         ctiKXbXM8/ii9uqGKIkQEQsAp4loRRgKFBYO/PiM4Wt2yqvNBmgkKadqgmBsTxEac//1
         PtSw==
X-Forwarded-Encrypted: i=1; AJvYcCVRUVTSsqL4TA0V7fNgqA7VGlsrchuGE365eScCh+ZuX/ldDlmL8tFcC7pegUsJGB+Wc68=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHSEUva6MR4XfCERMqyGvgXltzY+l+if/vgJqtynvf7t/ZtKeW
	1SKRdMLBft+FyTt24l417orrgtP8GZ5u9zWT3OL1I9dUkVPw4EuVy7nS
X-Gm-Gg: ASbGncvitNvOir6Jgn/ma3f5eIut8fKad8wgm5ySMxO+CUZxRIBJ7jA1MpCrkHgk0YN
	vaC1oXUoYqNKaidCbt8N5Z4KoQayddmuHDC09raeoSVgKnFN1iQVURK3WNJqgHOeRxKzhzhteRx
	6kWHWQCUvAQauSer/BStP5F7/tn3yQ5abqp5xQ6SnZAGXJgkzRq2NFWtvclOY9R214YEuOCmLj8
	A2sz+Zovb2OKTqv4rKOBOeBzrbi35ZwXXnzwYkbOsbkfU6wAN7qWNsn/seg9qabRCUdxaxsbXIp
	TpvboLmAoRPSL6EcImKTv4VI3lhONaOXN7nJc9pJNyCoRx1V285QlogZW2+PHF6O16g3ACFTPdD
	6KyygvTzB+POtiA==
X-Google-Smtp-Source: AGHT+IEFkAXubR8nGNnpMMcgpN1NSWw4WX7eaJmPIaLLZ4fC713GtP5JLryHmUzd1bIBXHOSvqiWdQ==
X-Received: by 2002:a17:906:9f84:b0:ae0:b22a:29b4 with SMTP id a640c23a62f3a-ae6b069d5ebmr97623066b.39.1751932162362;
        Mon, 07 Jul 2025 16:49:22 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02f68sm790697866b.117.2025.07.07.16.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 16:49:21 -0700 (PDT)
Message-ID: <2939a44f-a70e-41a9-9203-83a87c9a4be1@gmail.com>
Date: Tue, 8 Jul 2025 02:49:20 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
 <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
 <5029548.31r3eYUQgx@steina-w>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <5029548.31r3eYUQgx@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/7/2025 8:11 AM, Alexander Stein wrote:
> Hi,
>
> Am Mittwoch, 2. Juli 2025, 21:54:09 CEST schrieb Laurentiu Mihalcea:
>> On 7/2/2025 9:49 PM, Mark Brown wrote:
>>> On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>>>> configurations. Since these configurations need to be applied before
>>>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>>>> be their parent instead of keeping AIPS5 and adding a child node for
>>>> AIPSTZ5. Also, because of the security configurations, the address space
>>>> of the bus has to be changed to that of the configuration registers.
>>>>
>>>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>>>> missing 'power-domains' property. The domain needs to be powered on before
>>>> attempting to configure the security-related registers.
>>> I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
>>> system in -next which seem to bisect down to this commit,  I'm seeing
>>> separate boot failures on the EVK so haven't been able to confirm the
>>> status there.  There's no obvious logging, the dt selftest shows:
>>>
>>> # not ok 141 /sound
>>> # not ok 142 /sound-hdmi
>>>
>>> Full log at:
>>>
>>>   https://lava.sirena.org.uk/scheduler/job/1530197#L5119
>> Hi Mark,
>>
>> Thanks for catching this!
>>
>> After browsing through the provided logs it would seem like no device under the
>> AIPSTZ bus gets probed. Right now, my guess is that the AIPSTZ driver is not being
>> compiled since CONFIG_IMX_AIPSTZ might be set to 'n'.
>>
>> Which defconfig is the CI using? Is it arch/arm64/configs/defconfig?
> I'm also seeing audio problems starting with this commit. In my case I get
> the following error:
> fsl-asoc-card sound: failed to find CPU DAI device
> fsl-asoc-card sound: probe with driver fsl-asoc-card failed with error -22
>
> DAI device is sai5 aka /soc@0/bus@30df0000/spba-bus@30c00000/sai@30c50000.
> It turns out that the module snd_soc_fsl_sai is not even autoloaded. Loading
> manually doesn't have any effect. So I assume starting from this commit
> the subnodes (at least sai5) are not even populated.
> Reverting this commit fixes my setup.
> I've set CONFIG_IMX_AIPSTZ to both  'y' or 'm' and doesn't change anything.

ACK. Would you mind giving [1] a try and letting me know if that fixes the issue for you?

[1]: https://lore.kernel.org/lkml/20250707234628.164151-2-laurentiumihalcea111@gmail.com/

Thanks!

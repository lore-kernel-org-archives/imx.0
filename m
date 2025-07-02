Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BE32BE64A
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 19:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751486056; cv=none; b=KJOtty21imeC3WJMdIqGk63upwGTPrNppAxWHANQZwn84FPp9xuSr+IPX4wzjEQjQjFtPnZfEY7ks0goEqsOmJaQPbwHd9NtExt9xlcmik7HeyaHRy4awhpHFXrVZWC7BmuE5i8k6x8IN1CjyoMJoce5GsdnGp5KTDYbb5Bn9d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751486056; c=relaxed/simple;
	bh=wwz1hIB1NXjK34VbesMPuAkjSQZMf2atfDZ/9HclXM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y88Z8AkQqQP6OSG/xV+BM62036fKDqbWcgfmdc6ISc8r6mDsn9yi7n3Tyv9gRs/2AUBp25Xz+htY83fg0GgIzMMR4y/1c/0Ny6Dv9uCjTLBGwT6Wr2UCHy87scSrPynBkzw3BsfXqqS95h4ihVGKV6C3U13uJjAuh6450vUsmmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQnIH6wh; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQnIH6wh"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so58337566b.1
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751486053; x=1752090853; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TmPW8V8zA0N+0RM8g3oXGj0lKhBGP6NeWfr9DyiUeXw=;
        b=JQnIH6whJ9BFx2NNvNNszjtnBbKnorIlMCXWojbRSjCyRIVS444f3cUUnKHgJgLQc4
         6J67ePuIfWjWeyLU+gQ13uGib47ztfMrrHzGczW6e8Ls+suTqZMFeDhPx5pilu6W6Ftl
         r1OXG2Eyi0tzZDe4UI7BOt3UEB2t28aXOEBrSGdT8Ozo6CnBkwYb7KIlAlOu6Ywg8ptU
         EJle+m+Y6KinW0ValpPC8bfl23lCNrxobjeB1XSuoF9rIOudS+OnA7Fa36rkN+M+VqKB
         GTJkdDidZ6kWl9HQeZOORJ4xpKlibz6LpAVxgqbvIGUBeVC3HVYRxwzSWDnvMWam0qyx
         Vcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751486053; x=1752090853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmPW8V8zA0N+0RM8g3oXGj0lKhBGP6NeWfr9DyiUeXw=;
        b=fKO1q/f5zOAW12kXuezWC9EgNYuH1C0pn0boJnJ42oiSITyi6PL2SzO9OcytbKZiSL
         jpPlKRByh2nAHzWeO1wJBUBZOYjPluC5PrhFsbw9VSu5px9xkk655MR80b1omCLgeoeN
         QFtCb/6lvgtJ54QsIX5S05NSx46ehTa+1m7SK7s1XB6vvymeMQdc2nFLRnrfyVRfv7Xn
         sgY7KvwfuCf3IDvbdjdXY7Votr8wCjxxN1xSAoqzXUQcQ8DLb/JqjAYST+sdyFZMHAQD
         gy8boe1OtrCtS9QZt71iLne1fjb/vt4iiMCflmTQFqMHJjdnOae5CKvk0wx/i525xhOi
         uD8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDkxzOQXKv9M37TvoNwvnjZbyuLDeE6j5X1gNluABL6Q7dwA6l2NeZSoiU9mu++3pUUVs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqzH2dsdfqymttAFExpKIAiPsB5kI9MVM4Vf4aq9uEJ7J3D1ng
	C2RqUgintenaonoCqqz9qKRx9vlkPqa1z6kB8uFK8bgCKHGM4AN7SX18
X-Gm-Gg: ASbGncvdSctb5kJUZgqbMEDT/JDpr+muTa/sNscAvuHSi937AmnEuFbgpYj7+UKA3pd
	r6XViqyLUkbFSwejONOe2mWFnPjSOAMbAIwQeCH+6I7WMzWFrnsmRypf1erU83TetAbqDtjmpuj
	GXjeGEAZoR5nI44+dGKIClBF1RR26HyDxC1xQVX6bhVjweVCutzbWeC3zknFh/gw7rfXRfNvpvZ
	QoLxEAllPAe0tqBbxqgMxIWITX/OmQCJYBzgkR/T9esIv1s74ZvJ2ikqrytuR8u0whC/HQFt/gF
	2dKmEqZBWDvglfLH0mrEsu+/mBgErdjEYO+VMR4NejKjcCFMa6qGDBuPx5OPi7OMS8lZgEeS33A
	Y3eGQehmamvB1AA==
X-Google-Smtp-Source: AGHT+IEEv4SAI/kYMvjmT0AuIHDgZyTBNcF2bWLyaYLuZrid3Rgx7jF4/Zg1edoD8uel5WIfiOf7DQ==
X-Received: by 2002:a17:906:ef0c:b0:ae0:a464:99d with SMTP id a640c23a62f3a-ae3dd3c1e03mr18767066b.17.1751486052730;
        Wed, 02 Jul 2025 12:54:12 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca201asm1132959266b.150.2025.07.02.12.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 12:54:12 -0700 (PDT)
Message-ID: <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
Date: Wed, 2 Jul 2025 22:54:09 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/2/2025 9:49 PM, Mark Brown wrote:
> On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>> configurations. Since these configurations need to be applied before
>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>> be their parent instead of keeping AIPS5 and adding a child node for
>> AIPSTZ5. Also, because of the security configurations, the address space
>> of the bus has to be changed to that of the configuration registers.
>>
>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>> missing 'power-domains' property. The domain needs to be powered on before
>> attempting to configure the security-related registers.
> I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
> system in -next which seem to bisect down to this commit,  I'm seeing
> separate boot failures on the EVK so haven't been able to confirm the
> status there.  There's no obvious logging, the dt selftest shows:
>
> # not ok 141 /sound
> # not ok 142 /sound-hdmi
>
> Full log at:
>
>   https://lava.sirena.org.uk/scheduler/job/1530197#L5119

Hi Mark,

Thanks for catching this!

After browsing through the provided logs it would seem like no device under the
AIPSTZ bus gets probed. Right now, my guess is that the AIPSTZ driver is not being
compiled since CONFIG_IMX_AIPSTZ might be set to 'n'.

Which defconfig is the CI using? Is it arch/arm64/configs/defconfig?

Thanks,
Laurentiu

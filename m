Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF3A25FA19
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 22:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741129135; cv=none; b=oGQZwbujmwyOzO4060EsQG/rxHuUvhalXNhnDgDYagV3fO5g/VIis6xbpypbro4d0KBxeP5CIh2M4Qm3X1ImV3tGwJT0/WlbmLosVOhj3JEq4XLRuJizz2Zv/44vlWIcWTNxquLK9Xyyz0/p9ePJ8zsfnom9xfSzv/Cq2Tn3T10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741129135; c=relaxed/simple;
	bh=UQUvyGDPdTFPyPH9MsvwvLhlQDmkv4oUAlzRyvh03mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hDp7cUGl5uiLCWMudqo6qUBUjfwBMglRF0qNx8rUv7X/BAC75YizvQ2Mc7PKq3mgMH8r3cBTnr4sU/RMLDhwPamsf2maHee2BRdYVenWgc9xf5W0OoPcCNrRYXHqGyN7ewUD3bEJZOD17NvC8Pr4FM+T70mnQlfd68HIUAg+J9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlLT2/Sd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlLT2/Sd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bbd711eedso25280135e9.3
        for <imx@lists.linux.dev>; Tue, 04 Mar 2025 14:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741129132; x=1741733932; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=euJMffvlvKCZA7VwIhx2ASa4VsvPUMdrYRd7gnRpu9k=;
        b=FlLT2/SdXUsdCocWhy71oJnIhsh0ROGtw/k6D1fixKppvX7/2OzuOrFGGG84g1Pz0H
         nPvWjnPX8w7EdqU03KvqIrnnbS8VQYBkTfg1muDTbgVHuowzd0cNodb+G3mhOvrv1apZ
         LGRiTq0NH9u26dkYbUEjX78OjKR/ssRJcbbcITKPbIi83W9p2xjSpHluzzZdgDAXHw6U
         qU/TdymAKVa6+kSqxKXTeOozbv+SJ0ZIC4G8RothXM/IIMGc1U5HJTEEdbIZzN2OuSQL
         Of2X8b2NsoYLIPrRQOEiQ/1azpQmVNV7IpS/Zzro2YZ56m0uCIHaMgk2dYyyDLO0YTar
         /MvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741129132; x=1741733932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euJMffvlvKCZA7VwIhx2ASa4VsvPUMdrYRd7gnRpu9k=;
        b=gQaXDOuw8uv/Tz/6Ad+GPFHH9tOFI35si3pbxhpLcCHiX6pmH/Wjwo0h9J7dc+UcYR
         sekJctcOH8dzi/d5h60WICDll8txtL8JbeEjTxW4E9g/oZXqsL5xlbfSZIAgo1WlZVcg
         gGelM34NomwSVguDEgczi8rARVLA9YbfOSIPH5DAX+cTa7E0EVlImL6/4O6vE6DbXLEJ
         F4qGobS+J9+wNvitlPa5GWp/kj3TK6OaeHtf+OP8uzT52CZwYSU/79nkZbfmP3GjRUXV
         WxjD6j7zPwOViicctPLNbBYgjpq7VayQgl7g9wHS9oVavqfcSNDKBOSTlFopzOtD9FD7
         Hy7A==
X-Forwarded-Encrypted: i=1; AJvYcCXdx9d8V32+Ascn/GVPAe0ktPIt7b70ZCl0vmJc08KzMnaF6r3tExF5T2v7Ao+0ZsELQGc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUApgyZ2w++ypOWetGnFA97dexFip6ZO6150jb6RvSELl96IVe
	7rAw4N/V2BBMylp2afPvUOHkb/M+AbxFXfxYQW/egOXtyAMp0HVZ
X-Gm-Gg: ASbGncuheFkWZIqxoRZAJ4ZP3SEA6DM7qnDM1+wuLaO2rEHqVxv/ieuvHq1f4qS+lCH
	A6PNLEqZ7wKDgAERJUh88A3tPj5ICKBwc4kFei1sNQipssbSeetK/v4aP7RB6bYXZSgj8YGz+dQ
	vwkS+VvNet3LUfZOUwtK5Gym0m6ZM47bPW3NCZnhkwJdmWP+XvuDvxXvIej4SDovwJsrrGB1cLK
	0aCnTxYfiCGg8vK85tRNJMZbNGvUgLwd60Dz2Okx8AahgxWnvVE9mqy7kqWVBRmQC61fDV7UFtM
	CgwcznYVptwzI8VD4mVPrIyDa2e/CvUQ8zTtRWwO1vq11OdmKveh1dWfAGJiJnwu1agxaAw+aw=
	=
X-Google-Smtp-Source: AGHT+IEnZTNGMRVDZWEmNMh2Ly2iO00Yysf+lVJrqtBsE5l6FSnrdxxlk5xiRwD/bXG0pp141DVtRQ==
X-Received: by 2002:a05:600c:a409:b0:43b:c2d7:44d with SMTP id 5b1f17b1804b1-43bd2adb09dmr3443515e9.21.1741129131631;
        Tue, 04 Mar 2025 14:58:51 -0800 (PST)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6ddesm18952075f8f.41.2025.03.04.14.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 14:58:50 -0800 (PST)
Message-ID: <541539db-0015-41de-837f-aabbea68486a@gmail.com>
Date: Wed, 5 Mar 2025 00:58:47 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] imx8mp: add support for the IMX AIPSTZ bridge
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-kernel@vger.kernel.org
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
 <20250226212219.lthoofw7nrs3gtg6@pengutronix.de>
 <20250227112856.aylsurbt3uqm4ivw@pengutronix.de>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250227112856.aylsurbt3uqm4ivw@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/27/2025 1:28 PM, Marco Felsch wrote:
> Hi Laurentiu,
>
> On 25-02-26, Marco Felsch wrote:
>> Hi,
>>
>> On 25-02-26, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>
>>> The AIPSTZ bridge offers some security-related configurations which can
>>> be used to restrict master access to certain peripherals on the bridge.
>>>
>>> Normally, this could be done from a secure environment such as ATF before
>>> Linux boots but the configuration of AIPSTZ5 is lost each time the power
>>> domain is powered off and then powered on. Because of this, it has to be
>>> configured each time the power domain is turned on and before any master
>>> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
>> My question still stands:
>>
>> Setting these bits requires very often that the core is running at EL3
>> (e.g. secure-monitor) which is not the case for Linux. Can you please
>> provide more information how Linux can set these bits?
> Sorry I didn't noticed your response:
>
> https://lore.kernel.org/all/a62ab860-5e0e-4ebc-af1f-6fb7ac621e2b@gmail.com/
>
> If EL1 is allowed to set the security access configuration of the IP
> cores doesn't this mean that a backdoor can be opened? E.g. your
> secure-boot system configures one I2C IP core to be accessible only from
> secure-world S-EL1 (OP-TEE) and after the power-domain was power-cycled
> it's accessible from EL1 again. This doesn't seem right. Why should a
> user be able to limit the access permissions to an IP core to only be
> accessible from secure-world if the IP core is accessible from
> normal-world after the power-domain was power-cycled.
>
> Regards,
>   Marco

I'm no security expert so please feel free to correct me if I get something wrong.

This isn't about S/NS world. The bridge AC doesn't offer any configurations for
denying access to peripherals based on S/NS world. AFAIK that's the job of the CSU
(central security unit), which is a different IP.

Perhaps I shouldn't have used the term "trusted" as it might have ended up creating
more confusion? If so, please do let me know so I can maybe add a comment about
it in one of the commit messages. In this context, "master X is trusted for read/writes"
means "master X is allowed to perform read/write transactions".

Even if the bridge is configured to allow read/write transactions from a master
(i.e: master is marked as trusted for read/writes) that wouldn't be very helpful.
You'd still have to bypass the CSU configuration which as far as I understand is also
used by the bridge to deny access to peripherals (e.g: if transaction is secure+privileged
then forward to peripheral, otherwise abort it). See the "4.7.6.1 Security Block"
and "4.7.4  Access Protections" chapters from the IMX8MP RM.

Given all of this, I think the purpose of this IP's AC is to add some extra,
light, security features on top of the CSU.

Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DC425EF9A
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 21:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740605942; cv=none; b=Lds0e875BAZJOUhS57cAu1ft3jKa8r0qIAVIHslWMjf843F4XYWzZaBFI9svfuzoZw5T8k/86HxMdauIAWVk7cmFs0Y7h8QXXPjrTHXLgS0D4zd+NQHmtpdDzmueFxTxW6BKvVry34tJWP6udbeIK4GUllqyhPrhoSTkb8VVNZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740605942; c=relaxed/simple;
	bh=ArH4DXosS6VEtxEnXgez/2JkV2drVRXeyu1zi5Qgjq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChZd8gBku3N0aR6PWL++ccYE9mlYIa/klgdRqH1tQ5m5Gtdx40Fdu9tQ6Ayd0KXy0KP+Y2LR62yE+szZtaI0rZxvUEPBUlVAdBmwuZ6ecf7DDsHreDZRhgk4RvN7eQNwl1ir5YmMCJUFPHDbtYphIbEY3S60M7UwxPI6rVoFaQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXQ7pBA1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXQ7pBA1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43938828d02so368315e9.1
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 13:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740605938; x=1741210738; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PKWXxeyerycjT8mINlrePYKkJ8KjgafF3u1tMHpySjU=;
        b=TXQ7pBA1YqRi6kxVwC7GD6hC6CI4M91w39Lu0g0B5H7rISh0jt1fr9KtPMDfi8qnV4
         poIiPYDDKRpKhHH017eRhIqK0TvTCtHLvoJH1J+WMN02Yu8+TjBGeXl73wmBIQ7GAlnf
         5z3vyoAFY7y8JehO6iUraL10Iwyo4gXQLxtBxccbPKuoaraX0X/F2oGCMhaurFxMH4gP
         7aQ0K+RItZeWMNKLBAvpqiMWOiKBT2NqaJS06HaNPbojrFmdc/ZxFXzGtcYnVmuwyA9O
         iaTJ0Kgg8A69+ZJU0GL9KyV1cVMTGtEcBfD2IahP9BqNZJ+i9cDJHXBpBjDd5dAMbfdA
         MaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740605938; x=1741210738;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKWXxeyerycjT8mINlrePYKkJ8KjgafF3u1tMHpySjU=;
        b=EI2tb5iCZCodCndM8soUbOWZwIXm/d6KVm15LAJZrjp7u3mTHxZ4A1TmpoT4OVTGKv
         tpJ5mVmMAscVMIV91ZudEo5m3QLrRTmJjAwnLeAwBS4CTvlZrTSiDGJCFnFLc1ZBh4au
         sZFrFDoDkL38cu6k+nwdw6C62eQc3vn1wr4BKxq7xC3W6B71LLuiTsp8iyAAA95BXJmE
         7OS5kp49zLzC8Qb4BunCKbb2gZcRvjM0woUX+aHWD/Zdp2icYgTKuYdak3V5LRKyndZt
         0JQEgZ8XO0q24b6W8rf8mVknDWdlVA2l7e4fo770jM7aEj6LDSlFRxSmp6pNIxxuvQUU
         CqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGamPDtI/3I6RVO6Rrzf6f5fBfmNiFCF+g0dq3Sd7CTUyBehEx+SocQ5IhIAqzWLvAADc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIg78yxDrEFsll7fE4kOMJGABhMuS8iuv+6jofUu1e2gh9+TPz
	gld7EBqBK4e+OmBg5sQR0iO+uK+G9cODdBJ3m4Lum6Lh80uzYqcuGsLIuLbLOtA=
X-Gm-Gg: ASbGncuXtK3Y4CHdv7RpwQLgrbnNmGpNmDDotbf8tT2/8wOUg2wW2Lh9Tk2KcVr1EeH
	hYGnkfl8Jb2vLxL22yso55y9NOOMrWpAJGaFsZ3rQhA3HdCULppjDZWBbttTow2d4IUF86MKLjM
	adU/Tf5STy/XtdPMRTgNIhUCLJEXxwDOeDTp++PzkPsCa5VLQZQQHS0XuIMYACAlB92b4P8WNbj
	EoIiHJXbYzPpLVWhZyEWqiXodRa8J0BMbFiQPRvSr6gZ136SEvpFAIxiXdAZuZVGrFoZISasfSX
	FSaEQV3Iu/I4AXDlCT2MNpbbC246/a+Wjpf9rxD5cMua1A==
X-Google-Smtp-Source: AGHT+IGl7z2yXYQHS8gtgp/PqAYtjqjx8GIvMA1PyfTi0fvGywrgelfkuzD4zx0PHjsiR/DbwpgGzg==
X-Received: by 2002:a05:600c:1d25:b0:439:930a:5899 with SMTP id 5b1f17b1804b1-439ae22991cmr84882045e9.7.1740605938535;
        Wed, 26 Feb 2025 13:38:58 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f839asm2112905e9.2.2025.02.26.13.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 13:38:57 -0800 (PST)
Message-ID: <6db6b361-caed-42f4-b319-2b8cd43a73b5@linaro.org>
Date: Wed, 26 Feb 2025 22:38:54 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Sony IMX728
To: Sebastian LaVine <slavine@d3embedded.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, Abel Vesa <abel.vesa@linaro.org>,
 Achath Vaishnav <vaishnav.a@ti.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>,
 Julien Massot <julien.massot@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth Menon <nm@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>,
 Thakkar Devarsh <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>,
 Zhi Mao <zhi.mao@mediatek.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-2-slavine@d3embedded.com>
 <20250213-shrewd-tacky-chachalaca-778a50@krzk-bin>
 <D82KGJEBFQO0.1TX611HMKWB16@d3embedded.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <D82KGJEBFQO0.1TX611HMKWB16@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/02/2025 18:50, Sebastian LaVine wrote:
> Hello Krzysztof,
> 
> On Thu Feb 13, 2025 at 4:26 AM EST, Krzysztof Kozlowski wrote:
>> On Wed, Feb 12, 2025 at 02:56:53PM -0500, Sebastian LaVine wrote:
>>> Adds bindings for the Sony IMX728.
>>>
>>> Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
>>> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
>>> ---
>>
>> Please run scripts/checkpatch.pl and fix reported warnings. After that,
>> run also 'scripts/checkpatch.pl --strict' and (probably) fix more
>> warnings. Some warnings can be ignored, especially from --strict run,
>> but the code here looks like it needs a fix. Feel free to get in touch
>> if the warning is not clear.
> 
> The only output I get from scripts/checkpatch.pl for this patch is the
> following:
> 
>> next$ scripts/checkpatch.pl --strict  patches/outgoing/0001-media-dt-bindings-Add-Sony-IMX728.patch
>> WARNING: Non-standard signature: Mentored-by:
>> #9:
>> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
>>
>> total: 0 errors, 1 warnings, 0 checks, 108 lines checked
>>
>> ...
> 
> I can change this to a Signed-off-by from Stuart if you would like,
> though I feel that Mentored-by is applicable to this case.

It has been two weeks, so I don't remember what warning I saw (countless
of patches in between). It's possible I had in mind the "mentored-by",
because it's nowhere explained in Linux. Does it mean part of DCO chain?
Does it mean reviews or suggestions? This should be one of standard
tags, IMO, with all its effects (because tags have meaning, e.g. DCO or
reviewer's statement of oversight).


Best regards,
Krzysztof

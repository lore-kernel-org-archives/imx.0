Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932701D9A41
	for <imx@lists.linux.dev>; Mon, 17 Mar 2025 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742238876; cv=none; b=lAfStY+R+qEQsDvb+/WHPDQS+Id8s5TsSlmWeEAtQKkOPmpNC/wesvXAj+B8byfNb43R+9hemgKvq0GcKn+iTtt1IM2L6bGSfKf6IHvoAhYTi+6RCS+8LEaM3rcXfOjCxlSFfqHVtZGMSEXYF11KDwTihJ2bgZAfd3riY7lguv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742238876; c=relaxed/simple;
	bh=bTIqEttpvQ/gkRM13zs/WdaTG1uYFQ+x2bb+IMCsFtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNpd0VU9WQhhHEpmPQgkS7JK1qWalPDuGELzNFu2qrQz+guRDr2m9h/s5GBHtXfEliZSC/0D5iVpRNQFLbXVY7lOT9qpPTIa4V8kEDG1eSramPsQgT4Evcpy1hdPWysZKSzDdXI9qiwJBJeBGYCVFPj0/UOWBYJUNY6vUYttxg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S011ETZE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S011ETZE"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39127effa72so664682f8f.2
        for <imx@lists.linux.dev>; Mon, 17 Mar 2025 12:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742238873; x=1742843673; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bTIqEttpvQ/gkRM13zs/WdaTG1uYFQ+x2bb+IMCsFtU=;
        b=S011ETZEJIH9qkl5o3cRvlI7tbiFpzp7eWEzuQ/GZc38gMtc6pBUWUaqSSf0j3zyAT
         GysrygAo6rCGEqWTeHsohMxPES/64pPJUvA44FsWfR+CklGkNjtn7EiRkbSUjE5fjasq
         8nMf60SVFHx6FR/ZVwxdFsXLAX19u0ns7jTLNh/XnCd2KxVt/BY30XPjItbHn/tWkIYh
         H7tDGQoPigaLSz07MfGHjceRpU3M9wErP/sjSz6eiUO6znte8ZKyJfZC9trG3P/oYhm4
         xHQ6EMlw8nnEn2X4LEcNxoiV2lfmeakhaci3ciT6p22nWV7bwa2JXX9WggoAuEdsV+1l
         8lBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742238873; x=1742843673;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTIqEttpvQ/gkRM13zs/WdaTG1uYFQ+x2bb+IMCsFtU=;
        b=lyRH9LLCxYf2V6A1boTHqRvH2aLoJJkOkTQmua3dCgpKbame+GWMVj3u3ByUOIgRun
         +gjumWU4h9nmMpY+rereWu0eRnFCp27EJP6aAr80nEJ4dxsCsNZPS3CW7aNHR2I54Q6h
         RD4g6cW0pV2avjT5VTYsEF38cOuvTldgAvggm/bkGuF2TGzPmxPg/86kUxOnOuJREkZa
         uIzmMiaCIcrdLYpQAaaBd6s727WS4ylVHRu+1AWmYFuNZ44cmWhZQgwpqNWDN3rf6FnL
         5OdNll4d0RDoDAYLU+jxQxX8H3/XF+/YXuWPBk+SgJbUQBKS1V6SaimJii1eU4QPQeL0
         m6aA==
X-Forwarded-Encrypted: i=1; AJvYcCWeF+Ic8tAtyCahcIlO9QHZ+8Ccs+/F65l+UMEDARlhRzXqytwH0msqbQ3+zAJaAOaVXBw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzT/pnZ+/lMSU+E7fz16Tv+ZKKGeoCLiZfV96JoF5yiY5Pt4UY
	DFSE9abYgce3jczE+hZLgzqjIJuUpH8VIY97k4/XBACQGqubdgaQIMTyPFUs2f8=
X-Gm-Gg: ASbGnctCHtSR7axPzhYIWpFv0wsl2rRzwQJq7TV1N13m2kxEaJfK3aC8LkuZY0kdaeh
	Ksiz7Ah1XSSgrRFc62INdJZVTK9ocJ7eERJk1WQZPysjpQo5qC2zvzJmTFaSfD14UMjrS75AAhs
	LmKYra+9wVv4aq0/YFrH9yzbWx31fFM765RGO8U4TVZt8+y/qNwCRwqupoUbGfYoXkZJ2CRyAW6
	qazl3ocP3WilpKvn4vdELgu4BCShowG/NZXoJPQikMzSiO8sP7iuH3gpgChcRwsWAKykFVaY8Jr
	LKFSZ2T/JylNKZ4NO3foEddOk+49QLV0oE8HhQxec67iIldBrMEcz/ONrrA+8/s=
X-Google-Smtp-Source: AGHT+IEPNlsvV91iELo/pNhvH+905voaht1iroQ+4B2H6u3ju91Eoa82UvbCFExYLwzebF1yz25EhQ==
X-Received: by 2002:a05:6000:1a85:b0:391:10c5:d1b4 with SMTP id ffacd0b85a97d-3971d8fc3femr5445781f8f.7.1742238872825;
        Mon, 17 Mar 2025 12:14:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b09sm16097525f8f.57.2025.03.17.12.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 12:14:32 -0700 (PDT)
Message-ID: <88c66c98-7ea3-4172-9c99-405fe449cc5b@linaro.org>
Date: Mon, 17 Mar 2025 20:14:30 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: shawnguo@kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
 <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>
 <Z9hkDqcKG1xOmIB5@alb3rt0-ThinkPad-P15-Gen-1>
 <ef163f08-35f9-4d1d-8082-c826c6cd0aa0@linaro.org>
 <Z9hxKlrrqW4QyzdJ@alb3rt0-ThinkPad-P15-Gen-1>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z9hxKlrrqW4QyzdJ@alb3rt0-ThinkPad-P15-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/03/2025 19:59, Alberto Merciai wrote:
>>>
>>> By default they are enabled as external modules, then until we don't
>>
>> So everything is as expected...
>>
>>> reach userland they are not loaded thus eth and all the mechanism behind
>>> that are out.
>>>
>>> I'm not using initramfs just tftp and NFS as follows:
>>
>> All arm64 platforms are supposed to use initramfs on defconfig with
>> necessary modules.
> Thanks a lot, I was not aware of that.
> Do you have any reference?
Reference for what? initramfs?

I am using meta-qcom initramfs:
https://github.com/krzk/yocto-qcom
with copy_modules argument:

https://github.com/krzk/tools/blob/7c0d1cacad06aa0cae8c2983ae26889471a9aaa6/linux/build.sh#L543

And here is how I append stuff, but simple `cat` one cpio archive to
another cpio archive would work as well, just be sure some paths are not
symlinks (/bin /usr/bin) because then `cat` has issues:

https://github.com/krzk/tools/blob/7c0d1cacad06aa0cae8c2983ae26889471a9aaa6/linux/build.sh#L504

Best regards,
Krzysztof

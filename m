Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495942A9B
	for <imx@lists.linux.dev>; Tue, 17 Dec 2024 20:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734467382; cv=none; b=r06Pf/S5Ge12/YuqenkA59Mbn5SICh6pEVNMeXLPWk+SiDllLWto3M7bZB2VSbHvWNWU6TUvfSvPz0j7qz/hAJ5TWchhZanoPJWD59l6hmxuLXGGpdH9Vtck0LFAH7KYvs90YjdRxzVpDhRYaVeC9KCvWaRNzvG6/reTlTO9eXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734467382; c=relaxed/simple;
	bh=wjtVSp5e/gtP2bPB0gVaig8Ytq2WZDbCWtlVs+teKRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HuoH1jHmbXFNRUhdOiPCR5ynYuYBRyWQlJYIenSkrX4odJhXZV5FO/mjsAZ/eAvxxUCrWdFHQfUgMpgtMIwvMFUU1FCBZn5yYE1RAGlpYD58jWqcWZiTUZYFNioi4GMh83RW5kHfljaWsiGVAR6Mj4irm7e/wwJuCk0GLtFK9kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ar65+oj3; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ar65+oj3"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385de59c1a0so3737465f8f.2
        for <imx@lists.linux.dev>; Tue, 17 Dec 2024 12:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734467379; x=1735072179; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=riuJ6VXEH1r2xq2adD8Hh5Js5iv32b824b2rOzdDs1o=;
        b=ar65+oj3KDLTy5I/Bi79/oDeAdBHklB2/djw7XuKPk3OG3RqqyBYYdUFIEuDaxZlxt
         poiaoe90DgBDjCCBp5Qs4s2YZZ9SRdrRA5tJLSYyzQHsAsbeZoNr8YuO3g0B1GVjUKwi
         r8IS2hzdDwiUYkt6duRJ/jaQ9RvEZgedFjxcRkaK2gFVYF0AWDKpuw2/op8MxqLqOBVK
         M7o/RQCj8WG3c3RtVEYf5nOkn3tisO3KBeDxEYKyXaJQGvg6w95tUn6Ha2i2feIY5R3I
         SZwE4BiLlETNav6OQ250sf24STOYRdx0hCrB/Z66QPSp9dtyAn8vBvLRxpu46QgQMaNE
         Oyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734467379; x=1735072179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=riuJ6VXEH1r2xq2adD8Hh5Js5iv32b824b2rOzdDs1o=;
        b=rCmJaqb8HemmCapO7HVjUJfFQUFQ6SCpFzhnEhK6IE/opz+BbWb3O2agejFtuybWR3
         qUl9LWRsQJNBT0EeJ20v0kNDt0oyowGVoCKhqcX4ub7Yy2PkA3oiTZMd6TmtzXuaSdce
         4l1DcBfC6qUeyeN8bgezhXhTSMGQlfVCCsnXZkhxTdY+INaue/FUDrWUQnTKWtn3x3+4
         gzrLTHuNwmaGychxCc3BxDFIegOlC/Irm3Y1laa/yZe7Qu1/bSODyC9nWhtRGsrWvJ3q
         TBKbwgC0Lo5jvD74Ixi/1XagQAAxSY7Ig9TjTfw9Bv3Y6PueFokeAi3EgPDY0qB3Elhl
         4n4g==
X-Forwarded-Encrypted: i=1; AJvYcCWDe+rlfYRoLtIfaqcciNVZPEL6b6LuVsXG9hqL+9nGiazrjKLbZvBI60mkIlmiXsWtbjE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6fCxx/pz5gwUlTThklerfNEUmIJ4Lxy7L8NwF7rtBoWoGhSDG
	EQENnvJdlbOixXk15W94PU8JWESrA4phws6UGm6TblQHtEhNDecw
X-Gm-Gg: ASbGncsStFEKoNqq6Io7ENGArhyn+NkwLttEYDJ4bbJFdYNAmMMIE4USoTKk9Sz0avx
	yLVlZo5Ajv3I+QO49M/MCUuJhP4hpjLKrvIMG6udmRWhQnYXKFcNpmZakn+osNSkcUGu3DHlqpf
	2SnJFKHnXBGftlW/IO9r6AhvuOFkRPRubrC2ihvlnhwWaXNDizhb3NfDLlnPEE28XpwuFJQAwYo
	DWOykRuUlz/yrfRRRnoqN9MCIFm5kJMiuyTKULu24pvmR7smXjDAM/Z5njEJP8Ua06oNYkHEH18
	ah1WLnRZaopEx4YDDp0cExD4Zx2gd35f6g==
X-Google-Smtp-Source: AGHT+IH/Wtjlwcy/lm0MF5OCpgkb7cKII6hjVT2qz0bgw5fzVp/w5I5vtqsgR9DhW8S+zU/HcCbehQ==
X-Received: by 2002:a5d:6d09:0:b0:387:8604:5023 with SMTP id ffacd0b85a97d-388e4d8edf2mr206319f8f.44.1734467378883;
        Tue, 17 Dec 2024 12:29:38 -0800 (PST)
Received: from ?IPV6:2001:b07:aac:705d:5605:668a:52f3:a096? ([2001:b07:aac:705d:5605:668a:52f3:a096])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8016bdfsm12153714f8f.43.2024.12.17.12.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 12:29:38 -0800 (PST)
Message-ID: <b378e1ab-5699-4369-8fed-fa6973d5aed7@gmail.com>
Date: Tue, 17 Dec 2024 21:29:36 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
To: Francesco Dolcini <francesco@dolcini.it>, Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 andre.draszik@linaro.org, rdbabiera@google.com, m.felsch@pengutronix.de,
 dan.carpenter@linaro.org, emanuele.ghidoli@toradex.com,
 parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
 u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
 <20241217163506.GA80703@francesco-nb>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20241217163506.GA80703@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/12/2024 17:35, Francesco Dolcini wrote:
> On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
>> With edge irq support, the ALERT event may be missed currently. The reason
>> is that ALERT_MASK register is written before devm_request_threaded_irq().
>> If ALERT event happens in this time gap, it will be missed and ALERT line
>> will not recover to high level. However, we don't meet this issue with
>> level irq. To avoid the issue, this will set ALERT_MASK register after
>> devm_request_threaded_irq() return.
>>
>> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> I had an offline chat with a Emanuele (in Cc:) that worked on this a few
> weeks ago and he remember that he already tried a similar approach, but
> for some reason he did not work.
> 
> He should be able to try this patch in a few days, but with the upcoming
> winter holidays he might not be super responsive.
> 
> I wonder if we could wait a little before merging this to allow this
> testing to happen. Or maybe you can just test if this is working on your
> setup using edge interrupts (you would need to use only one TCPCI, for
> the test).
> 
> Francesco
> 

Hi all,

I was curious, so I tested the two patches. I can confirm that if both are applied, 
edge interrupts still work correctly.
However, with only the first patch applied, it does not work.

I hope this helps.

Emanuele

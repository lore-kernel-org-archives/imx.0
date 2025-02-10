Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C31199E80
	for <imx@lists.linux.dev>; Mon, 10 Feb 2025 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177574; cv=none; b=q0n/EnETd7NnAIkELp4ufKKgs8oqa1EoEm1NJsCsFLYoMiluIKOxhZpdO307WURV5s4lbGannVNaZLDQssBvXg/R4kAd47LKqAFV+bjNg4ncJ6KvdSmOmF3WJSNcUvR2vlrHEzpX0M8rfgUt78lo72Noay0wMoCEQM1Mg2oeGZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177574; c=relaxed/simple;
	bh=Mzo8weuAT2mlks7nbB7Xl9z60vdOgIwwxoK6G6Px/mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+2MoKCXyz7SRLVw2SawjtBSVIdQdlhdHLOU6D2tuJeuOLfq/CAaUnBObRHliZif+v8vQGHplXI6d3yhZoeasyMw8GSGloWcxMWQ6viK9toYqn30o9XIY+/KQeeICbBewaNel53N5olxNrwcYPqmExpdmET14RSCelBAa1Zi88o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no; spf=pass smtp.mailfrom=remarkable.no; dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b=GuIA8uQU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b="GuIA8uQU"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5450622b325so1480747e87.1
        for <imx@lists.linux.dev>; Mon, 10 Feb 2025 00:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1739177569; x=1739782369; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYu8yQ/OgSiNEgnJK4K3dO6bbEYi+Xy76mIpaogzGWI=;
        b=GuIA8uQUvBvCmjFr8TIsL4o4UABhjnbTeUhHEZtI+gYtnMxxuKsxCpEdqLYJbSm/BY
         JJyUWQMo5gA3UU2wSQNo4d7sgxnqGQ8lMtr7rL2+vL6xy8e1JOsLU7Wchb5DZBCe3IGy
         uAxyRxFLu+SF2Er3RqFF1Uvs4clXDqAEfwvrz8Lsp5nP+MBretfP7LXAZa4D0+GgNVSO
         VnyYySom6wRVDyf7P4wQS4W21owuPLDrsV+FLn3Qhljn8ocF8TcjLxIxuUK+2vWT8YKn
         zY8XGwz9TZbVeSR8HbXR6/yqVvUBNXDBW6ZUhyGgpzFcLV9uXhCtmwf8zQ8hbhKXXwub
         Gpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177569; x=1739782369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYu8yQ/OgSiNEgnJK4K3dO6bbEYi+Xy76mIpaogzGWI=;
        b=HPN/lCHISoFteIwAwlv/j3WW82pOEnzvQ0cP7gDWGW+T1Hr0AlfK/UZ67eWERGAfCV
         tgcVDcW+0CHxJy+5ioJh+yPY1iI94J+KB0memPc00DoJJ34Rdrtxv2XX2ComlVdvMY/v
         FjwL2n22Dzi3bB4JRDVC6Vb+cmVxc8SrcTTQKnA9XrWTEQbhpN5P+Vv32tbhDkpfvGRT
         PRiAqm4ZHuq0nJyJvK2HipdHQ+/kth8PlosZEvmnvxtXv9exsqafWI4FRjDTUobSA+aF
         aFmPsI43EBROjejUWtKBmMsyGKQpi4csaN5i6RaaN7g+F35HmwkN9OmLgHCEjRLzGxmz
         1Pyg==
X-Forwarded-Encrypted: i=1; AJvYcCUOPv+5pIV7moZpvtVlQBnoQD2KPxeuT02TxvEKyOP/I3wHIz1YnBrozF585K30RwbgxQ4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyNfpnH0BqDmlfCi2HBbeB2hBOa3zXepK98FxoYXM1hfODGdfQ
	/f5ndLpaw/eudnDso++x/SFrGxAISHjCRFJFxN/PoutKRQ2x6cRecq6G8nUJlw==
X-Gm-Gg: ASbGncvV1OQWwki2gPTbWOdOjWP49odpHhIY/Hmh7K3ZJ3KZegIAGczKkTyR5+A/UwF
	nHHN5CVvz/FWUFSQcBklqZcktBixITLzfFXcWWoQ50+OBokfyab0YjvlGK3CDQ8MYprbF0D9BPw
	tTBpVDj2cgtqrjEP+gNIotW+tTVvoDXQ3MItIST2VJiyAz4gdce34Nm3h6WhrFEluREv/ojPEdO
	5PwR+fDmoP3+5iztJV78p/kFo/p89EIfJ8yS8HVEcLa9EVylmNu8J/bFbP7MHIwDVPKwU5+cjAm
	4ZnGLy2ZmSDwn/H19ydnTLKePvzyjJdnygbXdlzirUH8oz16Y+cDSYNezMQPCBrTew==
X-Google-Smtp-Source: AGHT+IEFrSWijx5//WYxrO69alxyK3OwlZnbT1e1oSn0kYEx0Jps5YEkPD7RfAkSs7gwPx91jQfBeQ==
X-Received: by 2002:ac2:4c39:0:b0:545:5d:a5d9 with SMTP id 2adb3069b0e04-545005da81amr2978311e87.3.1739177569272;
        Mon, 10 Feb 2025 00:52:49 -0800 (PST)
Received: from ?IPV6:2001:4643:2b9c:0:a407:a1b4:766f:a8eb? ([2001:4643:2b9c:0:a407:a1b4:766f:a8eb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545064c95fdsm585428e87.205.2025.02.10.00.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:52:48 -0800 (PST)
Message-ID: <cb75162b-de5a-475b-aeb6-9a3c39de108e@remarkable.no>
Date: Mon, 10 Feb 2025 09:52:47 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
To: Bough Chen <haibo.chen@nxp.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
 <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com>
 <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Johan Korsnes <johan.korsnes@remarkable.no>
In-Reply-To: <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/7/25 7:21 AM, Bough Chen wrote:
>> -----Original Message-----
>> From: Linus Walleij <linus.walleij@linaro.org>
>> Sent: 2025年2月7日 2:29
>> To: Johan Korsnes <johan.korsnes@remarkable.no>
>> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
>> <bartosz.golaszewski@linaro.org>; Bough Chen <haibo.chen@nxp.com>
>> Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
>>
>> Hi Johan,
>>
>> thanks for your patch!
>>
>> On Thu, Feb 6, 2025 at 7:17 PM Johan Korsnes <johan.korsnes@remarkable.no>
>> wrote:
>>
>>> Add locking to `vf610_gpio_direction_input|output()` functions.
>>> Without this locking, a race condition exists between concurrent calls
>>> to these functions, potentially leading to incorrect GPIO direction settings.
>>>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> Cc: Haibo Chen <haibo.chen@nxp.com>
>>> Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
>>
>> Looks correct to me, verified by looking at the most tested driver gpio-mmio.c
>> and seeing there is a lock there indeed.
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
>>> where after a couple of reboots the race was confirmed. I.e., one user
>>> had to wait before acquiring the lock. With this patch the race has
>>> not been encountered. It's worth mentioning that any type of debugging
>>> (printing, tracing, etc.) would "resolve" the issue.
>>
>> Typical. I would include this in the commit message, people care.
>>

Hi Linus and Haibo,

Thanks for the review! I'll include this in v2.

>> Looking at the driver it seems vf610_gpio_irq_mask()/vf610_gpio_irq_unmask()
>> could have a similar issue, both write the same register.
> 
> Indeed, and also the vf610_gpio_set() / vf610_gpio_irq_ack().
> 

Could you please explain the race condition we fix by adding locking to
these other functions? F.ex. the vf610_gpio_set(), in which scenario would
the lack of locking cause an issue? It's a single write to either the set
or clear register. Is this related to how the writel_relaxed() works on
different architectures?

Kind regards,
Johan

>>
>> Both issues could be fixed by converting the driver to use
>> gpio-mmio() with bgpio_init() which would also implement get/set_multiple
>> support for free.
>>
>> I have no idea why this driver isn't using gpio-mmio.
>> Not your fault though, just pointing out obvious improvement opportunities.
> 
> I check the code, for vf610_gpio_direction_input()/vf610_gpio_direction_output(), to let the input/output really works, need to call pinctrl_gpio_direction_input() for vf610/imx7ulp/imx8ulp SoC.
> Refer to drivers/pinctrl/freescale/pinctrl-vf610.c, it implement gpio_set_direction callback. Also for imx7ulp/imx8ulp pinctrl drivers.
> This should be the reason why not using gpio-mmio.
> 
> Regards
> Haibo Chen
>>
>> Yours,
>> Linus Walleij


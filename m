Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389328;
	b=iae5F8j2rlK47D0x/E7XebbpKK3JCCjM/x8G8mJxNS3iTrxRvpcwOfaOxFxoBFqcBgA3
	 aYgrHLO5A3T5z0LGurFPxrDLk51UH3bRQQrg2Mh/HpvBX3z8wZZlZCzFUY+oJCQ5Pc8/K
	 83NLL8hJXXoP1ZyjndS+/SK3/F63z2+ksA6GL/prtFdv57WBzWPOBRHhNWnGobTfgCqyN
	 H5G9ogT7e0L8usljV9shSvfZ5MsOjSDpQWdmBxSRooRHNQdEv7pXe2xKe1QOw2BLlFDB0
	 lfcCiZZx7RgR+q4+XCelBohqN7A8xu7LnAGZO5Qr9mHJybFTvdd7xYh45bRuuav1yUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=d7MCCwN6HOlJBYbNqLR3V8gkaaVQT3Llv8fuBoTcrrQ=;
	b=UgcoKqn8YF/P1itcKbzyyE4bguGAQSP5KVHTcWtpwgzpPIZciGASX9zX+9UcQvuQbT4o
	 TSIcvaBy1g8Y51R/7Zi/Xsum5X3lqCrZsd5dL/wQti0GTmBROPZrryum/zNDVwJcf66vs
	 kYTXGT6GLHGf9iE/nPs8UJASm9oqVL2CuQU2lzftWU42FTGlJsAr5G1ZP9kCX3IrScehR
	 X6QI7YpAyYIRT0NfCKQYT7m+ImeyENVCabQRwDoK3DRJ6Y0gMMc6v+MBBDq2K//xnPTrl
	 JpDD3WlzyEy9KVlJEO/v5p0fgzhOE6cw8wWbc4L7HC6e5SgUcLZitL0TVpyWLoc0Eeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AP2FwI+S;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1D8606A321
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 09:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D1D8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AP2FwI+S
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48fd2e38825so1795582f8f.2
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 01:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794389325; x=1794994125; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d7MCCwN6HOlJBYbNqLR3V8gkaaVQT3Llv8fuBoTcrrQ=;
        b=AP2FwI+SEY2sI2iA7XrwY9P/kcA9qkfIIMIDog4TsCuHn8rNECk9NEgj+Q1bSLBbPM
         zInz8a+vsIphH5s/ZaesvfiqMqFdCZvuIIm7OvOxHgkEJ2Oy7UKhwI2sK4asOPM8TWIp
         bkUb1Q9NxD2hFicKEridxQMxxuWPcrEC6eQqhw/Ydf7oqletREbz5NbmFsMISttOASDE
         pTxSYRvI6+ONv2wJjePgroLwF7WTyay8jClF/4gViP/vR27dIGW9ujUo/UtyVs8hUPDx
         2CAha037IXF5mEXiQIaUoBpmeUU5ihWwfAhu+M6kNHY9+iu+DGnYT+c/HHgplIIBsMt5
         h7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389325; x=1794994125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7MCCwN6HOlJBYbNqLR3V8gkaaVQT3Llv8fuBoTcrrQ=;
        b=Amon8VbRnQlSvw8pe71mGHJd4SN0TzCvqafwhSln8xhp46IPNYt3BB7tE0TEBq3Xfz
         OV2DLD9Jo+2mE9s11phwuNhS0f3tSQPZIkIPH6mQp1ktwKLbYDsTYbo8KwMcQS6BethS
         qDzad4c0TxWDNwhGf1AYCY4nCCUyJqOoABRV97ZLjA91j8AohJoWHcbeAC+2JoNwTHDu
         /pyjvBp2I5ZXEqx4AqrIPF2RgteYIX0oYAUnlgrQzi6fmLXnmPRHlEMFVg+ehZGeafIv
         6sUKUtr+JbdAas8aCoDRBmi34cd/YU2FpcD881HgxmT6MnklyD2lW0nIGBtTiSQtHZrq
         estA==
X-Forwarded-Encrypted: i=1; AL+hErH+4YBnn9AW7/bQRB+HeDXLRW5qa5Nl5vxp6MHUTqwLvxyirfgQq0xuX7UD12OAK3iHl1A=@lists.linux.dev
X-Gm-Message-State: APuU4Z+3Gp8GoLYcLjUB9Kf2q1qK3JWtOmwMqlMTD/lJKGmOKngMQXQd
	uAbDDtMDCDLa9IVB2lbiu/Sl7TIYCINVlaqrfmOAfefmRqqtvZqBp3J3qZkEwNarK/17Yo42wsm
	bbrpdgt4=
X-Gm-Gg: AYBFou2LPJ5TFIWcx9NnwbhgT/sawZFerDQ09maRxE6DFQ2mzRTPe0xfc85PH14he0b
	LnQpUvQh86CgQsSHR/WIT+MOp+p6OAflpiWSMEmieh+i7CnqOu/MbDmrfe0wmLKth8SxJH9w4rL
	qV5wr08EqSMMxzU+JiMAj2FXVsvX1lIu/fUMNcOMu2IZqdpbOPv1bIIGabDB2LDzSN/vemPfJfK
	N/0Vsk8zgtJ7ZGdjQprbbR2qZXgn+h8pirL4ziW24IEMvN+A+H7whTL+dwHXls08kpJtz0i55D1
	dKwpuu2TXHZInqfpt1Gx+Juu+yF/sBe4uWjzX3resslWEdVhFOC43JX200cTh78COByxeUYtsul
	qrmGUJ4br7kMJsZchfySjnFq6QXrIyt5WYirtL/EAxNFgCWHiqHDYt/PvdgY4CVUp05bevjQW1N
	cD6fh7NQEeo51ONkUVZgbPz15RqYUob8T3obK0XiM+T6qgO4YyVIOn+aB5tll7PmM2xPclJuk7L
	UCsCZQCWjPEcxNmiNmq2um4ZBa3r3DsWp6lSkimYZKbeRCkjooLTq+gxkax/w/4AKukPY09OGKt
	Dk/Z536QvUXyGJYGqmRhDCp1/YefDrzd8cwsbmNdP21bDaWbLGMc/jD3lRplHERkuKpXcsNQuBX
	ZIudU1KeOw65iOJD0RLr3
X-Received: by 2002:a05:6000:4020:b0:48e:20f9:8d75 with SMTP id ffacd0b85a97d-499c764c4bamr2979548f8f.48.1794389325087;
        Wed, 11 Nov 2026 01:28:45 -0800 (PST)
Received: from [192.168.2.69] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm10049927f8f.50.2026.11.11.01.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 01:28:43 -0800 (PST)
Message-ID: <9f04dde0-10ad-4e9c-886e-1d0ae599af63@bytesatwork.ch>
Date: Wed, 11 Nov 2026 10:28:40 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: freescale: Add support for bytesatwork
 i.MX93
To: Daniel Baluta <daniel.baluta@oss.nxp.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
 <20261111081150.950272-6-frank.obergfell@bytesatwork.ch>
 <23bdf173-93ba-428d-8415-107f64e163ba@oss.nxp.com>
 <34d9b9a8-7f46-4ddc-96c4-131606a01112@bytesatwork.ch>
 <17476cf1-91ba-4530-8c02-90c171932fc8@oss.nxp.com>
Content-Language: en-US
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
In-Reply-To: <17476cf1-91ba-4530-8c02-90c171932fc8@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

Understood, thanks for pointing that out (and apologies for the missing 
CCs on my previous reply).

I will remove `status = "okay"` from all controller nodes in 
imx93-byteengine.dtsi (&mu1, &mu2, &wdog3, &usdhc1, &lpi2c2) and enable 
them explicitly in imx93-bytedevkit.dts instead.

This will be reflected in the upcoming v3 series.

Best regards,
Frank

On 11/11/2026 10:19, Daniel Baluta wrote:
> On 11/11/26 11:06, Frank Obergfell wrote:
>> Hi Daniel,
>>
>> Thanks for the review!
>>
>>> Care to add imx list here?
>>> L:imx@lists.linux.dev
>> Will add this in v3.
>>
>>> Should we enable the nodes in imx93-bytedevkit.dts ? Nodes
>>> are rarely enabled in dtsi files.
>>>
>>> Think if you add another revision of the board with just one MU unit.
>> Agreed. I will move &mu1 and &mu2 activation from imx93-byteengine.dtsi
>> into imx93-bytedevkit.dts.
> Keep in mind that not only mu1 and mu2 activation should be done in the .dts file.
> I used them just as an example. There lots of other instances in the same situation
> in the imx93-byteengine.dtsi file.
>
> Also, please use reply-all when answering.

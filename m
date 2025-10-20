Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AB52C3757
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983615; cv=none; b=TQyF/ONGfNHCC4nc2NouJoZswwgbsKwSmq4uZ9VUyWpeymHc/hZT7XfANop1EK+MBLzaMIv/rGrT7cCh4U2rO49i7cJXNJ/u1T+tblS2G7gXLfPNsMy1W84qdmejHND8X0G8Z231llUldGCqmWc7cn3QkRBYc/MiFrJbVAnpPJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983615; c=relaxed/simple;
	bh=QTpmX6jrERRcIBu+6XueQEVtWkDEmNTcFOC27A5EpZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aEESSbJHpAkn+b8+EEG94+p/QGK+qE4kfI0sEhuE/Ac2kaghzJ6EZzW88a/Wed4/pO3ogvLCcsFhJFYHnc+8huXwL5RxCG1mupHm2J9ifRABAczZWczuIPra/GwCKCnfxSW1QS2X9lJYHAbShqskWOoPfJ/sPsb0IS6/I9TIxkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lLrd/i9Z; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lLrd/i9Z"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-430d4cf258fso8476515ab.0
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 11:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760983612; x=1761588412; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXBtLkkB0DB8TY2tig01PgEU/TWly7nbkJIcjJq9f9I=;
        b=lLrd/i9ZmON4Fi/mTU+B74l02JVNHP+Uca6TkXmgDDsL1KYNmpMnRa0SWmxFsJguo+
         YWWxpC6hS0VABulhXesc8VKuFZ5aPzsuSkuRBJs20RaOGJibrkDW4inii2wH/d2ttfq2
         igucvSL1uhWOineeigBJvVAvf564ZZAyiFVwTVOfXKgZE/ARu96OLUp/r4rhpFdlZrV+
         l/Cdd/FLP9K47I7MncSD/gxUBoOWTU9ceH6o8nUV1FQmBRa62uXgGaGMZQKDWSc+0EAb
         2KJ/6ta4476lLxNK0ZZiq2M5KhALZoyqnFtuwtTc2x3yr9r1Yd76LeDZ/g2ghQ8rGbLV
         UPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983612; x=1761588412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXBtLkkB0DB8TY2tig01PgEU/TWly7nbkJIcjJq9f9I=;
        b=Y02YRqesj9sKQT3/MhMkuKagOaofX8MGMitvpINLIDKmmh+EO79yYBrl6cM8l8YRmn
         oCtRqCYvP5m5vfLtmhmroVPUEgPQH1OQRfoO2T+BFGVE4vM2PjeuGNh83lDsqE1RR9NN
         P+sKJjANenAkoKeo/2o/XzRNkYI+YDGdD76iaUMi+slEv/kDfxOgHDIAAl1p4I5JstRb
         80WyeHsccM+uXuOWpzbG6BAuO/Zfm39BLBEGDwt/q3mWZ+1V/n6wzUBbUclFyL12u9QQ
         PSIUJKC3iFL2Ql4K2hFMPd9saksejBor0C+bHGzf82zJZAI+D2GjlLYDWOwJxXJi8l5s
         7UEA==
X-Forwarded-Encrypted: i=1; AJvYcCXfGLm3mQdEFfbW6AXhtdXRW+JMEcRquGJ05+2EhhdTbfcwy5nUOjonr7gxNeRRBjhJ6M0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0T43JQtpJIqVAOCttW1eS4r3fZHjgLjZpKmWJTNdqUpxMTgYj
	B1ODfJ3bLDYjSrxBSnoY6YQrAs2wa1X5mBL75QrVg8CIioOwAg/G3Yqj/2S2W7ya26s=
X-Gm-Gg: ASbGncuerUxg27RetPSe3X1WRgSKUBnw/cNEI/CC+NaErdYKDJF1NZed40G7KlcqNEP
	m9BsjBmeyUOhyf6RPE8RtNymlDmWSXXcLgPYZiWN1sevfAQpS1207lzrRqKiOiI3lJLyHzdlx8d
	X3wRPrAYdtDzrDpub7HzvR3Xgio3qyYedGgoSIXC/LFc4nHcH0xHxU/oPFkHhgPoMyGV/VQ1WHp
	pc0i1E1KhhvZmV8imhczMFtUX3XmBSQi9poMi0uFxtoe8RVsCGjO8Jsz5Y+tyWq4A3BURO4tcyy
	bv/TcvxNPkVN0+6cb3rPVM8MydxjnDM436NV4Mx3G2vAT144e0ccQ0i4tWQNBDIn0AcbjnT5luJ
	P7lI3Q8PP+lcrcAiRtUmwhkbW1TsRG7+SAuSUrnEkqMkPQbBcD4QI2XEnKk6s/BYOC76LDRfMMp
	uFDchHf3cm9jeBRSIfuujBmMzrx26vgwHbsLphxYr+rBBYd4hQKw==
X-Google-Smtp-Source: AGHT+IGevb4egGjj6KWxQP35Nq0zUYSUBGNvYU6Luo+078jNAKiHY5b+2d/guD5dVmi2NJ4AhRB7Qg==
X-Received: by 2002:a05:6e02:190c:b0:430:bf84:e941 with SMTP id e9e14a558f8ab-430c51ecf81mr209120355ab.3.1760983612156;
        Mon, 20 Oct 2025 11:06:52 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a961e88csm3172542173.15.2025.10.20.11.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:06:51 -0700 (PDT)
Message-ID: <08d99fcd-4d0c-4d81-a314-7e1a8bfaa64c@riscstar.com>
Date: Mon, 20 Oct 2025 13:06:50 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
To: Conor Dooley <conor@kernel.org>
Cc: han.xu@nxp.com, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-utility-remedial-4b4dfc716409@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251020-utility-remedial-4b4dfc716409@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 12:41 PM, Conor Dooley wrote:
> On Mon, Oct 20, 2025 at 11:51:45AM -0500, Alex Elder wrote:
>> Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.
> 
> Also, you should really explain why this spacemit device is the first
> one to be in what's been an fsl-specific binding for now in the commit
> message.

I'm not sure how much of an explanation you're looking for, but
yes, I agree with you, it stands out that it's the first one, so
I at least should have acknowledged that.  I'll add something
here in the next version.

					-Alex

> pw-bot: changes-requested
> 
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> index 0315a13fe319a..5bbda4bc33350 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> @@ -22,6 +22,7 @@ properties:
>>             - fsl,imx6ul-qspi
>>             - fsl,ls1021a-qspi
>>             - fsl,ls2080a-qspi
>> +          - spacemit,k1-qspi
>>         - items:
>>             - enum:
>>                 - fsl,ls1043a-qspi
>> -- 
>> 2.48.1
>>


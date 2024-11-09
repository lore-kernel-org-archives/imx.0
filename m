Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DABB13DB99
	for <imx@lists.linux.dev>; Sat,  9 Nov 2024 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731164015; cv=none; b=tYdFYl8Djh04/ETULcU5QdNrN0H3uGxal5VMviSoPj66bKKZqglGfHTASmbwjGmvzsqlvYv6ezDscwMmzZSTUNrKMr+Qsibpu7dlstU83XSvPY+RtNPTVk4GVYFN0V62U3G1yHsyCaBD3owVSUm1GpU5TsMv9BBTPvpYhZDSaMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731164015; c=relaxed/simple;
	bh=VJ8ompsICNZ2GHQCxcP7VzkTwKcmU79VWOQb7QIr5no=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPsZGWwXP2i657sTuhype2BDHilck2Z7UwsnYveAy++6Qy62sU3kXwUT14RwNmXHA2gRw3UFu4yTDep/6RzeGPtJet6dfOMIM2EpdzIqxjazth+d9kpVaAC70/ofqgY433zZODiCwadPIIDv3RDaAwEDRSW7baMz8C/lRwwW3zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8Blf0v+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8Blf0v+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cf6eea3c0so33336585ad.0
        for <imx@lists.linux.dev>; Sat, 09 Nov 2024 06:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731164012; x=1731768812; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ghbuLAThgkIRMv7v5y1QI1mRj61wYj6v1lVWxgIrotk=;
        b=d8Blf0v+8wTQKwPIhgbj8av+2Mu1FxuVEaYWPTl299Z1hYmHgMtS29JLJBlJiYi13y
         mU6hT9NdgYv9cF+UFI7e0bisobvOtSYpeNAV+1PYTuEr0JjLYboEBZsQhLPKTwRvwhLW
         nIg4tbV/qGzAaeZEuX7E2aNCv26nCR8GzsJKqWec94kVkOorQbkjWmvAWKk1eZ/yTQT+
         OCeyn6iThxY0yUqTipfK5lAksvs6pfeQZmyH89kqkNYxJgvHXHLUShdWHePgLa6dTyon
         YwVGoa3n+s1D2xDwpxHbGxqZCFchQ/7DskwMGRbOSAxMz7Yjv7QHLAIW/t3Af9mC7RZx
         woyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731164012; x=1731768812;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghbuLAThgkIRMv7v5y1QI1mRj61wYj6v1lVWxgIrotk=;
        b=DqDNU5oCHLaif275ZgRidL5i3ej8+NvxFtiq5qJG+h2L0iHCQeaRtDcvaXqJ0/x85f
         rOPhuc7vbKHlrIp697AAtMEGgWXEHDnSSL6uBjjUEQEGhx1TbLFofUukpa7GdJRx1BuX
         QoYO9N72ye9LUkj5nkNBECq39g/mVymiUDaONsTkITpjqCn7WsdAfUV+u4ABKLD1zN1A
         UooxgpEjhaHqagVuMQpo1Z42P1Ge0kcgTuHIHrFmycQQSUBvE6ZMShbGESaPJnQAC82e
         UImqT6Qd89xC1ZmNBM6czRyaNAHyP9L/rYgU8Ehp36gysxEbj2bPPGONyRcYjuiSqfsw
         HC3g==
X-Forwarded-Encrypted: i=1; AJvYcCXmfwn37U9vWvUiI4krB44ht7/shhm+t/Wiv2RsLokR+nATWAjJ6xvN7GHR7xRtHhapu5g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZeVChY1qdaTpw8+4Hnz8dHkAK7Ziqm3lF/l5NaqRqGG4FSnCu
	JOETcH7ix/nVWNrtngUyrCqPHsuTn3H7XAKsPCx7hmc8EFFs2OMF
X-Google-Smtp-Source: AGHT+IHH537SxY8wFxXvHEldQOX00jSQbhq86kY8P4E7+gzAi230SDoUD4kLOapioickwHuD7+FOwA==
X-Received: by 2002:a17:902:c40b:b0:20d:2848:2bee with SMTP id d9443c01a7336-21183507aa0mr95841435ad.16.1731164012349;
        Sat, 09 Nov 2024 06:53:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e87544sm46034065ad.283.2024.11.09.06.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 06:53:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <014410fc-8a4c-440f-a6eb-1fafccc444a6@roeck-us.net>
Date: Sat, 9 Nov 2024 06:53:28 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hwmon: tmp108: Add support for I3C device
To: Jonathan Cameron <jic23@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-hwmon@vger.kernel.org
References: <20241108-p3t1085-v2-0-6a8990a59efd@nxp.com>
 <20241108-p3t1085-v2-3-6a8990a59efd@nxp.com>
 <20241109131604.5d8b701a@jic23-huawei>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241109131604.5d8b701a@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/24 05:16, Jonathan Cameron wrote:
> On Fri, 08 Nov 2024 17:26:57 -0500
> Frank Li <Frank.Li@nxp.com> wrote:
> 
>> Add support for I3C device in the tmp108 driver to handle the P3T1085
>> sensor. Register the I3C device driver to enable I3C functionality for the
>> sensor.
>>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>   drivers/hwmon/tmp108.c | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
>> index bfbea6349a95f..83d6847cb542c 100644
>> --- a/drivers/hwmon/tmp108.c
>> +++ b/drivers/hwmon/tmp108.c
>> @@ -13,6 +13,8 @@
>>   #include <linux/mutex.h>
>>   #include <linux/of.h>
>>   #include <linux/i2c.h>
>> +#include <linux/i3c/device.h>
>> +#include <linux/i3c/master.h>
> 
> Seems odd you need master.h in a device driver.
> I'll guess that's because you should be using i3cdev_to_device()

I assume you mean i3cdev_to_dev() ?

Good point, but there are not many examples to draw from. The one
existing iio driver (st_lsm6dsx) doesn't use it either. I'll send
a patch shortly to fix that to prevent others from making the same
mistake.

Thanks,
Guenter


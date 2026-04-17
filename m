Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8557B3B6C04
	for <imx@lists.linux.dev>; Fri, 17 Apr 2026 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776421917; cv=none; b=QtdiqadyahS4ZNbWVdNMDu3aT61vkwv5VrCSXQVkDgh4KZ7kgBosEJ0tNBLksQlF4fyJVXAPx/Wkm3vuvo7upUFyPI9cXdGihJh+VVo3hQwKP0PAu3tVzF4+PdhGH6H+/IiRkAfFH2tCYPYtUZ5xMJ9UEM88PKfirbPHxUTboOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776421917; c=relaxed/simple;
	bh=dMSa1ZYVHAXRfZPoqn3DEJ0kYY0h2KvNjupT0MmylvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFZlllKEbQQDI8jzw1ZOf78bOgOdfOtf7bAAZcOenbuF4DNgmTWR0bHlWNRVqWFJY2MqjyVXqVX7IoIPqB/471wOG6Vh6684j+KDjKKlZ0pgYTHdWT92hVbmrTpy3hXKA9Ih5bah37Zu3ztk6tHz/2jRCPpsno9/ROc9So3YJnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoBh1vqZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoBh1vqZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so366875f8f.1
        for <imx@lists.linux.dev>; Fri, 17 Apr 2026 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776421914; x=1777026714; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0D9fB9YPS5bWDOTVeNiq3WO6cAOHLgc4jMTJXbNx0ZY=;
        b=UoBh1vqZe9uYlYpBN4/7TKjmX3eKrO5CMzBoF2lt3AjHGKLey2TLeyaglw6ejfqQ6e
         95LHiucuUOqzy0LL98c7w7O0JyOnPuIc/2K/Q4TvA6hwMGFKNL4O8E95SKlzJVajB8fF
         /UbxMHoevbhv2o//TNS9opOnI4ctAHw4iDv1HtxELL/8l6w1RecT/2qSnuZ1wMep82Op
         wIAPlvlT7hTI+TV0ABAOCW3at3J803JNBjbNAyGRxc2jG7zmyvVsTSkYqkaMolMNKdwW
         irm9rKV1YytahZpNvkXm77jkqQ34WNbGP88o+nImJKy4xA+0VNFz9ssaGn8sWaSSKCQg
         EZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776421914; x=1777026714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0D9fB9YPS5bWDOTVeNiq3WO6cAOHLgc4jMTJXbNx0ZY=;
        b=rmnpR4PxG7ewDk0ocT9HwJi2nK4A8bKpExvYdSEWcl5lNWOqJOCqle25dbR9rolN2J
         wr/xky4ApLO20R2XDmPxCm6mSMmw4G8pjwO+EmPv47g23X0/Gg0DMc/MARF29mIAWgqw
         DCpEXqA7vUBlQdhkc9skNg7jv9n9+Rrjr1PQEKl19IcYGkBUOB7oKUd14d5p+wWIo18a
         5xHGuVCsncpUgn++LNXlpqEnGn32C/2unJDGVg6pQ6T7jIy7ujMzRDhffUn1LssRrCXR
         +LdOcRlnLx3jemedkD8A4vepzw9RzNfXTqD6ssKnBwg+z9uzwma8CGDm874SKv8qHGsV
         j5dQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7n/H9sYF9UkbWYlF9+cdfO4Y2+fXB8JbH9jP7wHAWgTXfS74Z0Y1oo/egDTuvFisGVME=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx9MKjcad7pjN1e0IGxbGHed01zKajmlWswzyICJO8UGoCJaza
	HDgDbxkhpKqBazNN3t3K5tki/SwVVxrZvTM0hj7c3muFKqJ8F90/3fLc
X-Gm-Gg: AeBDiesEPuKTkRCarQdFuMFTlbXOxr8YB5T5VmGLDM8OHkcmM0uUFnrReQpt68SB6S7
	CIcdgi0ia2gY+U+TKiwfvaJf/kS66XjncHm1fCeJoP7ki6VNGAzD4QpZUOYToZ47m6cYWdfPZw0
	bVwToB4cf7bMokDLgubdV4sqndj1hrmfnVPvybnhs80l+5yDnRWuctw61FCGbr1P7EXb0F5BYAx
	X9PDmKfARv2MVjRo0yg7qcUI9U1F+cU+3BwVw1yZRzOQ/Vxv/n4CSl7GRoVzT+Qk6nd1Yx6QMT2
	Atli/S40YaCvj2CBP8pxOnoXhndLOi2jzNYmsDJ1FY3SiHgkOBcpViMgnYTcdlAUpzqpq7YQGZq
	zrM0A1r8SK3LWYwbKVP9pA8qZXgyZDV7+mpGDKrvuExBnOPKBMk9dhKo+C1YFjmUrrYpD7wSdzT
	iFYA0DTaWV9iWqPGq8Nl3wGqpqGg4T+k6mgYuhYqq47HAagW4=
X-Received: by 2002:a05:6000:22c5:b0:43d:6fb7:fedb with SMTP id ffacd0b85a97d-43fe3e1645emr3218314f8f.36.1776421913626;
        Fri, 17 Apr 2026 03:31:53 -0700 (PDT)
Received: from [192.168.1.169] ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46898sm3395465f8f.27.2026.04.17.03.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 03:31:53 -0700 (PDT)
Message-ID: <26cd0656-ca76-4cb7-9f1e-b8c042a7e2cb@gmail.com>
Date: Fri, 17 Apr 2026 13:31:52 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: mxs-auart: Compare the return value of
 gpiod_get_direction against GPIO_LINE_DIRECTION_IN
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260416083254.1798-1-zlatistiv@gmail.com>
 <aeHt3c9Fqp6-WdLV@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
In-Reply-To: <aeHt3c9Fqp6-WdLV@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/17/26 11:22 AM, Frank Li wrote:
> On Thu, Apr 16, 2026 at 11:32:54AM +0300, Nikola Z. Ivanov wrote:
>
> subjust suggest change to
>
> Replace hardcode 1 with predefined macro GPIO_LINE_DIRECTION_IN
>
> Frank
Hello,

I suppose you are suggesting a subject change, in that case I will send v2.
Also I can see that automated code review notes that this will not build
on greg's tty tree as 7.0 is not yet merged into it. I will wait for 
that to happen
before mailing v2.

BR,
Nikola
>
>> The GPIO_LINE_DIRECTION_* definitions have just recently been exposed to
>> gpio consumers.h by breaking them out in a separate defs.h file.
>>
>> Use this to validate the gpio direction instead of the hard-coded literal.
>>
>> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
>> ---
>>   drivers/tty/serial/mxs-auart.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
>> index cc65c9fb6446..6c6df4d5c21f 100644
>> --- a/drivers/tty/serial/mxs-auart.c
>> +++ b/drivers/tty/serial/mxs-auart.c
>> @@ -1519,7 +1519,7 @@ static int mxs_auart_init_gpios(struct mxs_auart_port *s, struct device *dev)
>>
>>   	for (i = 0; i < UART_GPIO_MAX; i++) {
>>   		gpiod = mctrl_gpio_to_gpiod(s->gpios, i);
>> -		if (gpiod && (gpiod_get_direction(gpiod) == 1))
>> +		if (gpiod && (gpiod_get_direction(gpiod) == GPIO_LINE_DIRECTION_IN))
>>   			s->gpio_irq[i] = gpiod_to_irq(gpiod);
>>   		else
>>   			s->gpio_irq[i] = -EINVAL;
>> --
>> 2.53.0
>>


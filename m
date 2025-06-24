Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C1C291C20
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 13:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771475; cv=none; b=e8GauShEETen5eAqGGa8ySF8I16KE70PCmrJ+r2fM6VCYBCRfx0JM5e425odITXT/tacESrJUVGpsvyMsucBivRrwYedDGDe1eUJGfheXJgu64Cn48RwHurE4dmbeGOd9M6k2Frn7mfvsxJ9NXdpVEK0CRJHwt7bUWGWrNtSivs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771475; c=relaxed/simple;
	bh=ayCU+nkPRr6n8YMzwOwtPyFONRi8G8Mx6ULPM9Iu10o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqt8FRe5VTDG4TFrUMfiSalbN2UyRoZNPJX/nnJkfWkyg/M9opTL/hIBfT+PpCqvZUEE7H3HjAZj8/nZlBpLI5dzDIS7r+Pv616lMA11QYKrtUj11z7ffTWpb3JvKA4YHekL5ReShyXSBj5xpXnIbgKbPUDrSsX8QcSkCA/ZbHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IhzPEHHk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IhzPEHHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750771472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aK5RkAHQrhrmbMgDmli1jYjYYGO7nTlMC7kAqH+maLI=;
	b=IhzPEHHkjooNBsjJZHfiQtpFNh66dycTd6vIGEq3GRAJ/1ce7kULp8YwEPheTRKNDDalBk
	wuT8BdC2Rk9F/HO6FyIezEU4Nig1MV30KFC9mq6iQHmP8oa1OjLMBQMtsQoSFQR6wQqGGS
	Je4SmYp+yJJbUG/gOClVv9n3zY+j0WY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-ml4zAod0MU2v2FVDnF4tDg-1; Tue, 24 Jun 2025 09:24:31 -0400
X-MC-Unique: ml4zAod0MU2v2FVDnF4tDg-1
X-Mimecast-MFC-AGG-ID: ml4zAod0MU2v2FVDnF4tDg_1750771471
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4eee2398bso250290f8f.1
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 06:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771470; x=1751376270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aK5RkAHQrhrmbMgDmli1jYjYYGO7nTlMC7kAqH+maLI=;
        b=t3lhYv/M25/QfY4SVC0N63GfwaZUrzQJM0N27nXR8UTpL/U0w9BzF2lULzfMDnuQzc
         2L0Uxv7BMkOilywrRQZGyeydbEgsKZF9hIAzP8TAJwxbrDXPkkjrVyvzWvb3Ee/2GMAY
         f8bgaAygBZLsk/+YiGa4ME0kTUTxBYJuOTAto4atoN2L3Z4Q7TVXcwvJPlPk1qgp2xbh
         a4ioHDSAwTdNkgyVSFwnKmc0gFSSujprPz9b7znMQBuUmuW8FyfFwKQjN3xuubPietzY
         +yehdN5HAQJ0i9fVPS3jLF6Ub3s1W55xzTeULuGCbcPrw/BcBr6w4fTK8UllbGd6vWCB
         e53Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtK/PoZC+sY8bqYPKHEPDWkxJdoTMcja7WdrkhrjhoWbomxIPFREP0Tu5r/zq6JpD/7hU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXniFiA1isbW0nE4clrCotIXhukqcIc4TB+Nyl6OzYDHn2rc+x
	peHz1vF3Pzk/aWAm7dvK7vPcPf8miUpqT32DIqAtLXJ8/rzRFJ18N0FDakayv0wnQtSqHn0dlLV
	3rUkEjmhT7MSGx0i+ed34rpXQgfG7gm7WYIFumJZBWBgOIn1co+BXfA==
X-Gm-Gg: ASbGnctmUVaSXAf+Y3fVmdFXdS31ntqMDEl8myToxHpGdzS7UN9gmkyIe82nxrtSjI7
	YjdAQKWSlZ1ThtUa83LwzJ8BfXv/ICyLiAPw6rL65oNXlCi3UZFMn3eVBmQ4BmLB49j4vepGWeo
	65dl8gsJ8U2xdnmNyduLZMvPDVxgC/x2tIgqTRngRj+7Vi3cth/lm3QlOb37/2qrXb3EGK9gTSB
	J2k0hsz80a3JkGs+qy8jf2XhJuJdg+1ayNb809pN25fN4Fix1j6M+MTmd4NF2iQ/j6srwY75cDW
	uEzsN3cKc+KzqiL1BSgWMnr8SjqUZQ==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a6d12da029mr13966788f8f.27.1750771470467;
        Tue, 24 Jun 2025 06:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiFZlAyuiksuIl1Yo2GNzHDQQeq8cn/28qYo/og94VXjH6d5Y5X9A9bCgyxSiJRdNpJZsF4Q==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a6d12da029mr13966735f8f.27.1750771469988;
        Tue, 24 Jun 2025 06:24:29 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2274sm1927739f8f.48.2025.06.24.06.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:24:29 -0700 (PDT)
Message-ID: <b31793de-e34f-438c-aa37-d68f3cb42b80@redhat.com>
Date: Tue, 24 Jun 2025 15:24:27 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v13 04/11] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250622093756.2895000-1-lukma@denx.de>
 <20250622093756.2895000-5-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622093756.2895000-5-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yuF56IYE_eCDfjL63SKMi81EBADulUXvG2c0zebAVWg_1750771471
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/25 11:37 AM, Lukasz Majewski wrote:
> +static void mtip_aging_timer(struct timer_list *t)
> +{
> +	struct switch_enet_private *fep = timer_container_of(fep, t,
> +							     timer_aging);
> +
> +	fep->curr_time = mtip_timeincrement(fep->curr_time);
> +
> +	mod_timer(&fep->timer_aging,
> +		  jiffies + msecs_to_jiffies(LEARNING_AGING_INTERVAL));
> +}

It's unclear to me why you decided to maintain this function and timer
while you could/should have used a macro around jiffies instead.

[...]
> +static int mtip_sw_learning(void *arg)
> +{
> +	struct switch_enet_private *fep = arg;
> +
> +	while (!kthread_should_stop()) {
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		/* check learning record valid */
> +		mtip_atable_dynamicms_learn_migration(fep, fep->curr_time,
> +						      NULL, NULL);
> +		schedule_timeout(HZ / 100);
> +	}
> +
> +	return 0;
> +}

Why are you using a full blown kernel thread here? Here a timer could
possibly make more sense. Why are checking the table every 10ms, while
the learning intervall is 100ms? I guess you could/should align the
frequency here with such interval.

Side note: I think you should move the buffer management to a later
patch: this one is still IMHO too big.

/P


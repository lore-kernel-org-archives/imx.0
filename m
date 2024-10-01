Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFEFB67D
	for <imx@lists.linux.dev>; Tue,  1 Oct 2024 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727774457; cv=none; b=agO/NHQsdNU2/9GUxJXwEN452AsAxg9fLv17pZvNMEHoVokBY3T4NR9zNY5EeB2DEI2xngiAzoNJiws/6dTvJqDFOul6aExozMGXR8gQZQa3Hj6ITJRb8SFGt32k/kqNPSvuik1UpoTOemU7IRIRFB1+qq1DpbaJVTUj29l73vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727774457; c=relaxed/simple;
	bh=52IMNoGjtf99CyRrdB3LZ+pHd2q6WDHjEC/EO7H4MgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXyG/qCzE+iSaIgN+TkZOIglkQdMDX+td0V9c/CbMHOeviFLF/j4GujMDPJYSHDU3rWgIymMPEThDoPV3Tp1cwZqcEqUXlCNxMrVZT9E1HJqjcYQBw8AZDPp918253RbdVEoY/uNv69o0f2dcy9C6yNjDwnUihGPmIrgUS+WrV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AUFEUynd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AUFEUynd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727774454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Z6bQqCmFRAYWIokTtq6KZjfUYmd4+jPRAYrukjBoAQ=;
	b=AUFEUyndFj+em2B0D79/kDVsM+FOYi1DUwJSJF7udOD5/lF8JCvQfIbLV6FYxrNbLAlaz7
	TlGK6vcCxKnv01KnsL/JBAap4oe2G6CHaMif/LaItSuTqkyHaoGXEN33Y45rnJ6wdn+egd
	AOIVq8EWUAEh3gCh0AsLWT4lSTCjte0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-1s6YyH4uORq4r-LlL4wC9w-1; Tue, 01 Oct 2024 05:20:53 -0400
X-MC-Unique: 1s6YyH4uORq4r-LlL4wC9w-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cb479fab2so30449405e9.1
        for <imx@lists.linux.dev>; Tue, 01 Oct 2024 02:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727774452; x=1728379252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Z6bQqCmFRAYWIokTtq6KZjfUYmd4+jPRAYrukjBoAQ=;
        b=tRaFbVDZFCygTMl944EiXjM0Sv5a6cF+k5tk4GAjWYQiPOO6rpB0rEgSzX3n5OYdJO
         FpRXW9jgiDHjevi5dzW5aq7IDEV4OUIQdtQPXL67ncnR62RPiUypBgL84qvfykYIQcJ2
         kotKPLGmNS0UiM+Ou/Rp0FxbuYUNpwDztxN+XgsFa+5DkiwZ0CJvaXJrqBcleDZi8NQT
         MyKAiEW4ilDU7/0aHjWbzdyYrg2MbKIGDlBCD8mG39Pui3ndqhq7d7ltFlEQ6AGmiZ6f
         0ebLsPuAd2dTHcZEp1YinpFMuZ5rUWYrbx5aYF6H1YjdNxhEQL8iFzNmUMWBkv7KkpCu
         LRXA==
X-Forwarded-Encrypted: i=1; AJvYcCVyispBp2PcuUwL7+24evjadnRDm7x49fXaGkkWjLHMCPnHynOONQbkGLfytL0oL2maC0s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIL2JTnNrDEAhZO5qAJdL839UR/eOP3dDpyWvAWU6q6n1wpS1q
	pXzuK+udYzJG0eQCAbclvGQNMuujKjuaXj4qtC1DTbAyeOfh/8/Ju/tB+t2emDtht27rJtZAs6E
	M1LioIbpU/NLirDEhJkkDYVW7X57X83u/G7Sqo1ccnlPVrMhvVA==
X-Received: by 2002:a05:600c:4754:b0:424:a7f1:ba2 with SMTP id 5b1f17b1804b1-42f71385a8dmr13034035e9.17.1727774452500;
        Tue, 01 Oct 2024 02:20:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOJV5mOCGH2U7gQYy/ih7+a9WULHZSwtnUxNtta7gzvyhknzvDfxI3Q/tjNxWfZohulqwtaw==
X-Received: by 2002:a05:600c:4754:b0:424:a7f1:ba2 with SMTP id 5b1f17b1804b1-42f71385a8dmr13033765e9.17.1727774452086;
        Tue, 01 Oct 2024 02:20:52 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:b088:b810:c085:e1b4:9ce7:bb1c? ([2a0d:3341:b088:b810:c085:e1b4:9ce7:bb1c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57d31283sm128091585e9.0.2024.10.01.02.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 02:20:51 -0700 (PDT)
Message-ID: <998a4b7e-8d29-4702-87fb-726117369240@redhat.com>
Date: Tue, 1 Oct 2024 11:20:49 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: fec: Restart PPS after link state change
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240924093705.2897329-1-csokas.bence@prolan.hu>
 <PAXPR04MB8510B574A53DAD7E1256A9E688692@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <6be53466-fd53-44e9-b83a-b714737865dc@prolan.hu>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <6be53466-fd53-44e9-b83a-b714737865dc@prolan.hu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/30/24 10:20, Csókás Bence wrote:
> On 2024. 09. 25. 6:37, Wei Fang wrote:
>>> +/* Restore PTP functionality after a reset */ void
>>> +fec_ptp_restore_state(struct fec_enet_private *fep) {
>>> +	unsigned long flags;
>>> +
>>> +	spin_lock_irqsave(&fep->tmreg_lock, flags);
>>> +
>>> +	/* Reset turned it off, so adjust our status flag */
>>> +	fep->pps_enable = 0;
>>> +
>>> +	spin_unlock_irqrestore(&fep->tmreg_lock, flags);
>>> +
>>> +	/* Restart PPS if needed */
>>> +	if (fep->ptp_saved_state.pps_enable) {
>>
>> It's better to put " fep->pps_enable = 0" here so that it does
>> not need to be set when PPS is disabled.
> 
> It doesn't hurt to set it to 0 when it's already 0, and it saves us
> having to unlock separately in the if {} and else blocks. Plus, after
> reset, PPS will be turned off unconditionally, since the actual HW gets
> reset.

I agree with Csókás, the proposed code looks simpler and more readable.

I'm applying this.

Thanks!

Paolo


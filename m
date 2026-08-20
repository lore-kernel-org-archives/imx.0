Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6D1453A5C
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232537; cv=none; b=Z2RnPpdfXfzMPrZjZPseZ8wn+tAKq2JUeBS46EcAx3n6e8sdNzbd6E2BMocBTcamJrdBbKm8APVPxM9o4eQexil8XFwkPT9j9HLUm0yad32s7u0eDiJD7ucrbVUjQ5j12Hy2T3bzInFRySobj+pS7TopNM//WjfaDPblxtASNE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232537; c=relaxed/simple;
	bh=bgd/aBKkexWU/D1QHpCDp5dKjnRhTgnL90kp3gswrPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nH+Sfv1Vce+QefLT2jS3ilouAgasPfxxqKqFNJ2+PDiKVBy+7As9XRGJ1tWL1JoKbX/UtbyQNWtNIGC5I4h5qfg7aB8eiX7IOLC918yfmPyIiLNXfX4CzTaa7Q78hxh3Z+cVH/lfGEr4LF9KPK4MSpmZusc3z7al13HULKRZRnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VRDoP4TD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VRDoP4TD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787232535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81FXEFEAWoGzBEUkp5WTBnX+AFEQNiURHAaHyp35qfU=;
	b=VRDoP4TDBGoPL5is6NQ+ObAO0hFz8TbZIH2V01l31Ox8pAOYEViaqqZTxQ40vC2C6TD8J7
	Ego97sah4Xwjr/tR/VFG2gnc1o042TW9SXtQLiUeQPg76xq3qVE5gP2tHrFwsbtVfZkWLf
	8R6DmRy0T0+bt5fc0eiiciFrniekQOM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-RK3HtdOmOuKxZMltt5tZoQ-1; Thu, 20 Aug 2026 09:28:54 -0400
X-MC-Unique: RK3HtdOmOuKxZMltt5tZoQ-1
X-Mimecast-MFC-AGG-ID: RK3HtdOmOuKxZMltt5tZoQ_1787232533
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49545071724so22968985e9.0
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 06:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787232533; x=1787837333;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81FXEFEAWoGzBEUkp5WTBnX+AFEQNiURHAaHyp35qfU=;
        b=BT7mM8U6PRQR2Cjpc8AxU3EbJN+Ro2t/uSYuyV4G/tyJrtM5OZXd4a2Nlmfi3bJ24s
         XJ4/eaUAV61f+NIL6CiBrr8tBf1X4+yt0MHNcOuzixUEeE8lqeqnzQWut/6Z2OYfvve/
         sc4D3Q7TMCGYZg3MAlwSkGgVvb1pCigbvHs0XRVmidgAlqU4puIg+QHUJKRZy+YmCo7R
         cxQTT/HjGQd/mDYls7JVnQqiJtPe1LQHTex236MTpAJKNWSpzZeIFpR+33q0SrCuz56b
         nReBCSPMRVhYkggN5Q5oRjjhn8clIFC+aCvFiYEKXYBWLRFguOFY0r2wwI4R6F3JH/Lz
         vggw==
X-Forwarded-Encrypted: i=1; AHgh+Rqi24k2qcrCyBt+JLTZRjkAUA5mdfLHiOiZ2oxYMHC/B3zcCpLwwCjKPklfkaguF84AAuE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK2zKKIMGDBkJlPlYowUa6jQdlZK7iRP5KiuCNjm8cZNr91T+r
	ND5hvWf3OiguOPBXnlKtE+JJF6OPcrOeL5uSInfmnX3cJ2gY7Wn4mKwH8HgFwy3IGS3Tb4xbxIQ
	7DZDJuOX7saVH2cidTuqRmISnGu3N5iwITZUCKR55ClXpuSKIL7FxjA==
X-Gm-Gg: AR+sD123El3vTTw/OSJcw9hkX1Bb5H3HEtPdgWr/F/oZ3YUB6x2pPfwiUbYUGoPJV9F
	eyIK7GkYGtQe4PRK9fwpiMqpP5zweCtLtgBN44ZLWvck61cVrQZd4SJeUarGGskRqNJf72z17os
	imcjDEyPl9ENTBi/iB+Qfa7nkSu5hsIcb1fDU3B75vKr2p07AnY9UvS68uNi6RExF/N0OmBuDZ/
	zvi2jY+t98YcuzwLIBIW1sR5eXfDDAgpcqDUUkdpX569k6xYFD7b7u/QbmEyvhMWsZDK9H5L6uG
	7r+dSqJdTbwCVbjbSzuqHLv6V7y8Ifdb8leeMXSbM95qUvCyH7IB5HU9LcXwZO0c6oqWiEmSyVk
	cORgUvPAaD6wQ4dWEfrN0fo39crAd+/07qUHSAA6LNL6DMD/w1Dceip0UWXJo1UryseMS5a0fKp
	4=
X-Received: by 2002:a05:600c:3b95:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-499aa1b97ccmr211342205e9.11.1787232532930;
        Thu, 20 Aug 2026 06:28:52 -0700 (PDT)
X-Received: by 2002:a05:600c:3b95:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-499aa1b97ccmr211341565e9.11.1787232532604;
        Thu, 20 Aug 2026 06:28:52 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499affa25acsm82583045e9.4.2026.08.20.06.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 06:28:52 -0700 (PDT)
Message-ID: <5dd2fd63-48f4-4f28-b3f0-fd9b7f502c2a@redhat.com>
Date: Thu, 20 Aug 2026 15:28:51 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] net: fec: Propagate PTP initialization errors
To: phucduc.bui@gmail.com, Wei Fang <wei.fang@nxp.com>,
 Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260820111416.97917-1-phucduc.bui@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260820111416.97917-1-phucduc.bui@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eFMZ17QNlXkhLsqP51Dt1GSSIWGMlrax2E_pIrnMZOI_1787232533
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/20/26 1:14 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Change fec_ptp_init() to return an error code instead of silently
> ignoring failures during PTP initialization.
> 
> The PPS IRQ is not required for the FEC/PTP functionality, so its
> absence should not make the probe fail. However, an unavailable
> optional IRQ should be distinguished from an actual error returned
> during the IRQ lookup.
> 
> If a platform does not support the PPS IRQ, it can omit the IRQ from
> its device tree and the optional lookup will return -ENXIO. Propagate
> other errors from the IRQ lookup instead of silently ignoring them.
> 
> Also propagate failures from devm_request_irq() and ptp_clock_register().
> 
> Update the function declaration in fec.h accordingly.
> 
> Found by manual code inspection.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
## Form letter - net-next-closed

We have already submitted our pull request with net-next material for v7.3,
and therefore net-next is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle


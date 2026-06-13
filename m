Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEC43ACF17
	for <imx@lists.linux.dev>; Sat, 13 Jun 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781342556; cv=none; b=j3wiyVY5Xvh++qEkh1L3RylV0Hrb9Jwf8WV1b/vzr22j7hlEUrN1gjOI6zVnjoOoSIqVIMJ2npLjE8HvpIQ2hne4lZAL9cdrgxHqk8SMbHxz+d10EQjdH5OE87Fa4Txy8Ocp9woEMeVp0W69IirpfP7iFdu63pmmVZQ1DNKBpEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781342556; c=relaxed/simple;
	bh=helDrwuxiWtrf/iPIy4Y9R/hkLMVrwdS0rRl6C7Dn4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSOfm+wSkNOZgo9tj0VXxgTutq0tZklBKIjqIuPae4HMjdoF54yq+jeUQFZj6g6oWtI61a7ktc/c8kbHr7ltXrQU5TDkagMVkGP9s6cdY/Xzf2f5w4bjOA1vofN3eOP3/7mio8JV4b3FXPmcKcKT3FlP51XE6q1foByrqcDuQmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZUdzcura; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZUdzcura"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781342553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkSlrlMGjyQ/p88XPP6jRxfxndrJ9//6XRAvhwfy0VE=;
	b=ZUdzcuraVxN0tR4QJtHjX3fl/wRfhoqGYfDmhNfhjFRx2gXExTPMNgBprtslbgAJzh+/c4
	TOLfjmt5WBXgzFcjW54M/l23ro2DGJ5ZFlDZPKdKCesMClOCg3vFJSX+E/6jpnKEAF5gA/
	/VXzmmq3ib9yNhFnjChapll3X2dr9xQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-GgvXaoawP1CuAwuEPfa9xw-1; Sat, 13 Jun 2026 05:22:30 -0400
X-MC-Unique: GgvXaoawP1CuAwuEPfa9xw-1
X-Mimecast-MFC-AGG-ID: GgvXaoawP1CuAwuEPfa9xw_1781342550
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915757be497so259279885a.2
        for <imx@lists.linux.dev>; Sat, 13 Jun 2026 02:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781342550; x=1781947350;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkSlrlMGjyQ/p88XPP6jRxfxndrJ9//6XRAvhwfy0VE=;
        b=EGUqp5VOIp47mN5mwUjrNZ/q2dqP5hcgR2NNlCIp5iS4YJDjGrQicyWiMlVHi+WxB2
         EnSZsaaP+LK76GCVFOkkAn3WDIPOAzizWGeMT5xYYDDOYmF80LPLnLrmk+lkOw5vFHoW
         DR5cD3C2NpeF7cS+r+ZaM6a5oEayGnokCiwd0sGKHQUgT7pYf3xgHCgZMGTtjWs8hYeJ
         BMlPTT6ZYhYcbmpgbiBVL00tEb2C78YF8hFoA0kb3vvDpzL6rKw1tqWyXdbJ0NmKYTmq
         PUy4h7ctUWo0VmryED+g60doYSRyv5dHYNoLEV9VKV0SzT5Jgikwe8dArA5JHBQGZPN2
         LU1g==
X-Forwarded-Encrypted: i=1; AFNElJ/gg8dFNTfTVDqSW3lIC5QCWCV8NkAg9q9Oaxn6YEewi/ZehtxtchZDHpTzwNQzYQ4gi6A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+Y5OLd17hNCea8yPGhQ3PSDnhwwOswcFE9kXh+uMtS8CHc8fS
	HOUiHqBj4LFkzTjWLYKZs0fWmBXavS8aQ6x6YC4P74WR9qKWsTzYtwC2wA0RX0SsIKJ44PrmcwA
	o3TMO6kTF9KVlelgiuIPzNIlMc/JqKfE7uCG3/HHXRQ/wLmVHkC5Ojw==
X-Gm-Gg: Acq92OG+N2Y9ub+7C4kXJpTuAOHQQT4p1h8onGGCnLHfR1yJB7F9B46Eqk3uL0Bjmne
	VZc4RKR0Eg5Pusr000NUV0VVpI2GI5sMrcPgzOrlqtfrmH0vCTwHV7pW5kbw22ZZPigKgEBPX+8
	KK/kuq6edsFTfnVo4twVu9+DTxiK8HyxT9KMBN7bxbBHC8+kQqTh3cbRHlMhJC3C2T2SWV3+uaA
	9MZ2TzDaMCLYD060o/k0BxEfN9en6s5++tDoPLempbL9oLg7DElKz1ABpFxllUDPBdRTIImzGpk
	UZ7bKyf1+YQwYqR7wYMdGq1VM28hKP6kHhFgLfY7wNVFvrT1AFIL5Y/TZJtmTuQKcMRhfW6WBfc
	E+nNg0RCYNL509ydlwPez5+CXQnJozI++cPuR4f8NiH7iDGYJ4ncyn0s=
X-Received: by 2002:a05:620a:4708:b0:915:cf88:1e41 with SMTP id af79cd13be357-9161bf6c4bfmr926953185a.45.1781342549621;
        Sat, 13 Jun 2026 02:22:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4708:b0:915:cf88:1e41 with SMTP id af79cd13be357-9161bf6c4bfmr926950585a.45.1781342549179;
        Sat, 13 Jun 2026 02:22:29 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.72])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f3c324sm454992285a.21.2026.06.13.02.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 02:22:28 -0700 (PDT)
Message-ID: <fe40891c-3fd1-417c-835e-6f1046db7844@redhat.com>
Date: Sat, 13 Jun 2026 11:22:24 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 0/4] m68k: coldfire: fix non-standard readX()/writeX()
 functions
To: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, arnd@kernel.org, wei.fang@nxp.com,
 frank.li@nxp.com, shenwei.wang@nxp.com, imx@lists.linux.dev,
 netdev@vger.kernel.org, nico@fluxnic.net, adureghello@baylibre.com,
 ulfh@kernel.org, linux-mmc@vger.kernel.org, linux-can@vger.kernel.org,
 linux-spi@vger.kernel.org, olteanv@gmail.com
References: <20260609142139.1563360-1-gerg@linux-m68k.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260609142139.1563360-1-gerg@linux-m68k.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z1Xmibfv9x0_CH00iUtq8XR5snO7mTLq9GXGIMUehiA_1781342550
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/9/26 4:12 PM, Greg Ungerer wrote:
> This odd collection of patches is aimed at fixing the non-standard ColdFire
> set of readX()/writeX() IO access functions. Instead switching to using the
> asm-generic definitions in include/asm-generic/io.h. The difficulty comes
> in trying not to break any drivers with this change.
> 
> The implementation of the readX()/writeX() family of IO access functions
> is non-standard on ColdFire platforms. They either return big-endian (that
> is native endian) data, or on platforms with PCI bus support check the
> supplied address and return either big or little endian data based on that
> check. This is non-standard, they are expected to always return
> little-endian byte ordered data. Unfortunately this behavior also means
> that ioreadX()/iowroteX() and their big-endian counter parts
> ioreadXbe()/iowriteXbe() are currently broken because they are implemented
> using the readX()/writeX() functions.
> 
> Patches 1, 2 and 3 in this series are specific driver changes that can be
> made independently of the final ColdFire readX()/writeX() change.
> 
> Patch 4 is the actual switch to ColdFire building using asm-generic
> readX()/writeX(), but also contains three driver fixes that are not easily
> handled independently.
> 
> Note that I don't have access to all supported hardware needed to fully
> test all these changes. I have tested what I have, a bunch of the standard
> Freescale ColdFire eval boards, and inspected generated code for differences.
> 
> Note also that patch 3 relies on changes that are currently only in
> linux-next, and are scheduled to hit mainline during the next v7.2
> merge window. Those changes are also available in an immutable git tree
> at git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
> cf-internal-io branch.

I understand that with this series you are targeting the m68K tree, am I
correct?

A possibly better option would be, after that the pre-req patches land
into Linus's tree, to share an immutable branch for this series, so that
both m68k and net-next could pull it.

/P


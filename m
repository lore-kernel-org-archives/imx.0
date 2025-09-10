Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311A91DF98F;
	Wed, 10 Sep 2025 01:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757466367; cv=none; b=NTGUMUZLLQgJs9qlU65uEY0xekWw8A4VB/wzfdkMHGNs4o8BrJfSrikM06VH7nbXqL4ElxhxE+Hd5fyktAtBRBMBP4Ufw+qMmRh98E1w4gbVuN0b1QtFnWdnn5nKnw5xm+Zn4eEj94btguEHU8y5LguTLAoMWMF356vpLNBo+g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757466367; c=relaxed/simple;
	bh=i4RESWh/U9IijTR7kjtC1xewNFoRiMOQyOIAkv3bc6A=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Kk/p94ebhCmPD8co9iTHM3IWby/LT2d2O1+quS+ja0cfmefjnMQ1F+Vvp5DenMUSkKA6ocUzh5GYKmZlR5WkjMMFlbpGQ1xAd2tel89+2vd/hpNeEUr2XQRKLx0t/9wwLZ0moW+N/5KgM0rWTGEkyEw6K3QJPkAG0u/NxayMM6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEFvyAkw; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEFvyAkw"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b04271cfc3eso835692466b.3;
        Tue, 09 Sep 2025 18:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757466364; x=1758071164; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDZwAXLouP084B9hVHdN4iMIIVS5iU06EyLqPH/Ivgo=;
        b=eEFvyAkwk9gr4O1Ye4jNZCatg57GE/xYkFw2og/64HZAZT8hpIDriYER1og1buZib0
         d0oziNKl6N8VclyZbpRW17ALO5ReaENYZTqR399xYLSC5Uq1kp57kx0Nmt8UJB26Hbyq
         O/2Cd/HJOS3ri2yMkK/6F4iucmPeoWOcNhCAXmuZoyNWO7zxeWlk08PWXIvpI+cKVc1v
         kDp1Z8oIA/uQKZuBNEayYvss1KrMYN1y9xM+9XuKtVrs6G9dXO17L8q+rUZmtJ3B9Kln
         lNElaieBWetmkwNXFyVQ9Wf19MWiwFWWE64Q1tkNc/96jD6gncHhFWUDd+hOFkxIgvt8
         8UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757466365; x=1758071165;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDZwAXLouP084B9hVHdN4iMIIVS5iU06EyLqPH/Ivgo=;
        b=K5IH9mAOrimLc8nNyZJHUTpJWrOB+xHz9oZaalehWckgjYmebLoPHe9JCaIctVJGjA
         6HyPcbL0CsSk2zQdte+Ny+cnhVH8k/EgSlDywepyo0EeD5dS/RyXXLn4J0id+qq1tjER
         Arh1pQBULs7GNRtMmskT+5zmtiJSfIXycoyqEDSnTEqFqwJLEOx3yGcH0Vw5snECc9R4
         hwaLk8wsrKNzwzXS6kGzgEBDOgBSxKsTteW0wCMdpTgcb1E3nXFTXUbWg+qDR60mkq0c
         RDG70FcsHULgl6B6mPFayn5zjQsrFnEzgf06jx8/n01gOuG8NRzsP19HxqRU+i6p1Ahd
         Rwpg==
X-Forwarded-Encrypted: i=1; AJvYcCWjjRP/EA+HYsyIgHBk16hClg3u1GKE6kZLyivy0liyygGApq238BO1k5bpx+FXkCfCsPQ=@lists.linux.dev, AJvYcCXGRkSs8P6tnd/FYwUYrntCIVVxyT0h3Id4H2tyQh52pRTPQcHxqcY7JCTUctja3O2OoDnGCnRzkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWp4GMFvierctDA8KYcunUyzv/8VK3So6C0PsLXJktOJz+++vM
	2qk+5hFuQQkViJxSC5c/y3rO8ZF/eWxTFxFSdb8sS6JFYmYEKgWanj2Y
X-Gm-Gg: ASbGncu9NUKTbSdUsyPhzXVAakS0gIC0Wv9EJqOIJD8cuaA7Msz3kceD66ZFNhlkhdh
	dYL/lObSHWqRGADzh5zEmWL18R/Z/erQ4A0815WY8dpU0CqDeG37gheIOZbBQzLOFSvgB08YARb
	QPD82OC9mhdZ23KzOpK7lXHlxtxXIsPeL87k3v6M4sTbRJYMyFDA5CSKqzwBW9sufHRVIGfhloE
	IY3B5MPaP/g0Bn2DizvKapcI/mHgzgGW0xsaeSv4gP8dnk+WNdF3eFHwT8e4XQ3FK67gOPr5pVV
	B3wP00A2OWPPbLWzg4cWycUC8GZb2EMsA8+JbMPb/79dya57/qPxB5G23p9v/rCrMAFdF2KVKRu
	E5nGJV/OYU3Ra2J0vD96+SP1wHVp68jL0nfnlRrARQ7O8pdQTnn6ON2zomX1gAFNnY+1r+FoS
X-Google-Smtp-Source: AGHT+IFjBmxeo0iihWNvQGW9XaPHPBKL/NIGGGOL86gq7iDWLkzDSZTSGw6FlnjUE/qdjGTpbeIhew==
X-Received: by 2002:a17:907:72c9:b0:b04:4ba7:4e0d with SMTP id a640c23a62f3a-b04b148a54emr1331824166b.26.1757466364453;
        Tue, 09 Sep 2025 18:06:04 -0700 (PDT)
Received: from [192.168.0.51] (217-62-96-139.cable.dynamic.v4.ziggo.nl. [217.62.96.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830464f9sm78316966b.9.2025.09.09.18.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 18:06:03 -0700 (PDT)
Message-ID: <bf46e8f6-221a-40c7-9da5-8003397ff113@gmail.com>
Date: Wed, 10 Sep 2025 03:06:01 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: torvalds@linux-foundation.org
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 alexander.sverdlin@gmail.com, andreas@gaisler.com, ankur.a.arora@oracle.com,
 arnd@arndb.de, chester.a.unal@arinc9.com, christophe.leroy@csgroup.eu,
 david@redhat.com, geert+renesas@glider.be, heiko@sntech.de, hpa@zytor.com,
 imx@lists.linux.dev, ira.weiny@intel.com, ksummit@lists.linux.dev,
 l.stach@pengutronix.de, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, lorenzo.stoakes@oracle.com, nm@ti.com,
 richard@nod.at, rppt@kernel.org, sergio.paracuellos@gmail.com,
 surenb@google.com, vbabka@suse.cz, willy@infradead.org
References: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Language: en-US
From: =?UTF-8?Q?Ren=C3=A9_Herman?= <rene.herman@gmail.com>
In-Reply-To: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Well, while on x86 1GB systems did use highmem, they'd typically not 
> use very much of it.
> 
> IOW, they'd have about 900MB as lowmem (ok, I think it was 896MB to
> be exact), with something like 120MB highmem.
> 
> So they'd either lose a bit of memory, or they'd use the 2G:2G
> split.
Right, 1G-128M of VMALLOC_RESERVE, but they didn't generally use 2G/2G 
but ever since it was introduced late in the 32-bit era VMSPLIT_3G_OPT, 
i.e., PAGE_OFFSET = 0xb0000000, i.e., 3G-256M/1G+256M.

Although at the time the patches died an unceremonious death, 4G/4G 
patches for x86 were also around; I used to be a (conceptual) fan of 
them: it takes quite a number of TLB-flushes to suck more than highmem.

Not one hint of clue if spectre/meltdown is applicable to these systems 
and if so, if they in fact do or should already be suffering through 
those same flushes anyway but maybe it'd be an option to dig those 
patches out of some archive somewhere.

I promise I'll test them on an AMD Duron with 768MB RAM :)

Rene.

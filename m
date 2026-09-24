Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F8F3AA9D8
	for <imx@lists.linux.dev>; Thu, 24 Sep 2026 02:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217195; cv=none; b=PyUZ16snFg+cQkgNReJy5uFp4iokl0Q9VlvpfkL35dV5M1wjDH+ce2c8FY7W1CR6xHPnXjb8Fn38Q2FtxkCYjyeQmKITfIRq5BHYdMm9QxcxAwS+ubYTxlUYemOW43CXB3wmyqoum0A+MuZ9Ch9/t6iT0uv/jaCwRoQ7JLAgpG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217195; c=relaxed/simple;
	bh=0jewx94Aol1IKcOojWLEYdfUZw5SFvsaq76oQocjly4=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=o0P4nd/tmJsSuGzY/tfUkVvP0ts2DFbv4NsRKYg+i7X+zgESuWwbGHJ0PyZvCn/uz8NlvTr5fYP4ZF32lWHoMxQiew+3HtElshUiS7XUjaRXehR59uU819wLO5P4kZXp/YEopUmALojQ0U8wrO0ydSJvjHBR2ZWaCd2GIIjwxd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeKH0wsm; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeKH0wsm"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc515bef69dso779290a12.2
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 19:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790217192; x=1790821992; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z/L1hXpzWJJQOqyHxMdxo06cE7DFt8m14lGkwmdYDss=;
        b=NeKH0wsmPIYu5aVFM1wkJ9W5LJ82om9eRuJDH/vQIqNoRNwthIpozphwrb3XEbi0db
         wv47Vd8QvI/WVJqB1MC/rrDRUSVLAl0tH9u3+evsSnBBRMZ5179N1N+DTaLkyVkQxJDB
         wCZQgHjlcRnj4OufhPS1ETIUTqu9C+b7ZhnUQQgWeSExutfKv+l4lzh9iaw351Dn3xZ6
         Qlf9djWtXs3wR7CYsHW8MP/lfkNtOjx/kCrDQ8KHwrwgAhRbrz9REcWaS5n6KvVCrHZM
         oHzyo9Ehax67vosKDgcD3vGODLIQE3ywvpuZ9/q3p/NyBsmuSxI1TIZvihBYM+oMhAPC
         ouxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790217192; x=1790821992;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/L1hXpzWJJQOqyHxMdxo06cE7DFt8m14lGkwmdYDss=;
        b=O/WDziixyy6+pWHBZxX5p/8uquQ7NcbtkNvG2J+a9hfuJIErCh0apfJyqvYWxY4AqW
         IIOpEg+BpFnNq0+HJ8n/Of38cT3+mrWqA2yCw/82rYlQce+8Z/DAeJJ8w3Gvk1Yhag0u
         0HcfZfH3AsOhEk5uDP2TEKKPcA2zf4MQlyIgxkXuJs4XGbPNlr8ip+ukDcDtvft5brRX
         qSXxRyzcCr6OA5n8L/ymhXGvB53k3tryKRLKfp/CFlSUOmFjkAi+IOOmUdryHTr9zaAX
         MOLST2t0mJDDcHXFsolba+thDxC7iUsHRU1uWn/VnR9dMxYyRSAL9lLo3xg1lMktAuz/
         JZhw==
X-Forwarded-Encrypted: i=1; AKwUvBw2CjUfECp5iyWSGxtb2TKBNwy3nOBpPqmpWic6wwQzwUnRYjUjGjHVXDioo+ETEI5v8yo=@lists.linux.dev
X-Gm-Message-State: AFuF++n5Z0bVCG8JtGymAvQ2Rw2KUX2ryPWTWEplPXrH/BLCtU/YjbFW
	5ltb1e84Aq6HnVQ2zFFGiu6QYQeKmT9uf9pd42FM89LF7m2ecQ9L+DFy
X-Gm-Gg: AYBFou053fk0aaR6xFPLP8FZ5AYIv4vYYHL/TmydWFV/6N+nGuHLVVh2mrpmpcZWt1F
	3PBfcY94jH9W+aV9ixy45xuIzo3DyM79tQX0lVhW+p69a8Pd1722Y1fjY18ntWmTnJ8ns9rbY1v
	D7ahX6fqCN6N+DezM3GH4ncFRuSsmzxZZEeWzqJ88WIkNsT7rEoAAP9G9EZ+uJi5FrIBIGBS/Ev
	4oo5OnSgggUlyh+DDy77fh5hXfUPwlbUlexcIlOQqnZ07q38Vo1uZSb+Th17ytOUcf4/Huddf5a
	GHO+Z6fOqoHrlMjz9XOwJREC0/t4EiN9fhG02LTV2InO36ae8AbEudQXuYgg5NE3KGOBuCzXAtk
	WcsEMzYd8xFDi7tBma2Wk+VIPYqN0pgg7nfIUylGKdDilL6mD2r3rmtpzWUuLIQrrwLm63utRtr
	yUX2WZOnbnw0m/EurVOkSEQPTd43CmlYCQCA9hCZ8+0GMYYNah+wXyuZ3Nlpq5ziL/By55wQupS
	2k8+M6F6JjNapzBjiDl7QW9s/nkFK9/xCrjXDdS
X-Received: by 2002:a05:6300:68c1:20b0:3de:1526:4602 with SMTP id adf61e73a8af0-3de15264efamr5628637.59.1790217192226;
        Wed, 23 Sep 2026 19:33:12 -0700 (PDT)
Received: from [10.1.1.24] (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dad4e06sm2075342b3a.41.2026.09.23.19.32.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2026 19:33:11 -0700 (PDT)
Subject: Re: [PATCHv3 1/3] net: fec: do not use readl()/writel() for ColdFire
To: Andrew Lunn <andrew@lunn.ch>, Greg Ungerer <gerg@linux-m68k.org>
References: <20260907134037.1855408-1-gerg@linux-m68k.org>
 <20260907134037.1855408-2-gerg@linux-m68k.org>
 <42ad1525-fceb-43d6-aa03-d17e844a9ad9@linux-m68k.org>
 <eb987eb9-f368-4d28-bdd0-c289c3039c3b@lunn.ch>
 <46246a5b-3e95-4ecb-bc52-e374dc136514@linux-m68k.org>
 <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 arnd@kernel.org, wei.fang@nxp.com, frank.li@nxp.com, shenwei.wang@nxp.com,
 imx@lists.linux.dev, netdev@vger.kernel.org, nico@fluxnic.net,
 linux-can@vger.kernel.org, linux-spi@vger.kernel.org, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <3cc86de9-9007-42af-7291-70e52f6b0dd7@gmail.com>
Date: Thu, 24 Sep 2026 14:32:54 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

Am 24.09.2026 um 02:15 schrieb Andrew Lunn:
>> The driver will always need to support big and little endian hardware, so I
>> am not sure how to avoid some abstraction like this.
>
> I was wondering if there is a linux standard set of macros which is
> supposed to handle this big/little difference, the macro knows the
> architecture and does the correct thing?

Knowing the architecture may not be enough - there may be multiple 
platforms within one architecture that need different address 
translation, different endianness, access quirks, the lot.

We'd need a 'bus' parameter in all these macros to avoid what's in 
current use in arch specific code (take a look at 
arch/m68k/include/asm/io_mm.h for what may be the worst case example. 
Don't do that on an empty stomach though...).

Like, use arch supplied functions if needed, fall through to the 
standard macros if no special handling required.

Cheers,

	Michael

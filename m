Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BAC234971
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749726331; cv=none; b=TgMTZicHpg8UTJ4er3jGuIJ56Z755Mt3VN0FUgZPXWQGV0mue9yh8UCcdPxGD/IFhYUsjRIxYmjl1SLvUKMZNgpVJOxefEBnbEzm4RCjRabbgvg7d8AHW+KCBrOUTMyOtQJZz/TiXVzwnNPVJM+YspW5ZfOrobF3yR95pER/x2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749726331; c=relaxed/simple;
	bh=VmVdPGLJWVp1Q+RRMP+IPcIfqsGTNRzvggSjlNeCNHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oEy5lTaI1uTwcem3QD30Y+7K3KWL+wV4Ug5m0PT+mszV6xQDzK91huAjkBxrw8mG1Vq0kcBNo7Sz+NXu9uJc31hVGheKLGIezTOtwSI5wazPxkSILRoqbeQGi1Q4ajLH+YPvhWq+XaNfQNWIyW79rdLLAHSLEfH51TQGiW9pi7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gRR+8XfE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gRR+8XfE"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so506253f8f.1
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 04:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749726328; x=1750331128; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7u4uVBYqmPw4TM6JxOSbDHprNtjOfckENCh20/XDzs=;
        b=gRR+8XfEbkwQprBM9Yi4fc7iQ64znQhbQ134pfx9vc1ZIDd1zBIoSTgrgYkShfjOIC
         +cnb2hhvj+TITT9GJv2mvY4C9krQUCstrjnugN/LLby19MfguyQImnYgQQwSzAIAau31
         pLw6M3vMb7QD0Hjl15F4Gh6H5clbR+7vpMy1DjGNZdC7TwODEsvNW9TV2nLi6Zp8Zfwa
         pU9T4cRu75yR700z9wQyBn8ysyLkZzPmZTEP6K7kZ/49OjcvJofyULtVVYvHcs2CLaf2
         r0wJZSjHGdocyjmO2UDZp99Jp0CM4XyXaTH8Es/pguWsf+ZfdmbMc9XKDbPLAKqlegEF
         KtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749726328; x=1750331128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7u4uVBYqmPw4TM6JxOSbDHprNtjOfckENCh20/XDzs=;
        b=rL43Wh+upVFOA/IfgQyIpeAvgkK64jszExEiUE8MQVN3PTAjJwD+ZN8S5K4ABSg9Ai
         OeLI/jTYOyqco5ep7JNpJ4ed+K5SOHxbgrPJ1Ed+eMmVV6mnXdPOn+36ZpJlDMrOQjNL
         i/XnvMcNlXChDnH//DlYjBpd52dck8ztlkZCTJ3P5K3LSBfbwBgirq+HxMYqyG6TqIOr
         Lq6uf2lw6BVuel9N7CaSNho5c2OOQL1613kk1YaIxwSRLvFBGd/dkp92B9LOvINIRFAS
         t0beyPfANAnbs2kWL/wIq/ngUMIhlxrTeEtGQwonYjvcjHnEWxoIVB1wFEwXkZDp90Sc
         vX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWO51KnsTc5slvEcgOmA/AbbGRwLG60IgR15Gd7OZkWDF6rnTVFKpycSxtIkvBCoPa97EY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdKzWcJVDv4ifDuLnnn01xR3GDaJe1FDaHu7+tYmBlkzWxy5xm
	7WfSxOROrVh1OKAT2xmxYgupqwrMe3SO7obpqURZvM73xgIUtdVPHY1WQZo+cPD3MRM=
X-Gm-Gg: ASbGnctmkSvHYZLVbeVUtel+o5RH8tad2ZptDgvepojC+irQaxMARUJKEvQTDW5qDvf
	7yThMOKyo1nx6yhNUHd1vyvkOGynsaLI7XAs0bRwYZoCChV5A5eJOOO57Yr7ZNXj8Mz3/s/RQZI
	dp0PUUznZWQ7totEXA95knkTkCtV8XyaJ36VCCUXlJkaH/FXbWBIZDy+4izJZuPx5bRUazNwvd6
	2d85XK92bjSQCE+JYAJ3CLp4y/olrhyk0zkGRQqybC+Ih7lfOVQd59qCdgtMGuQodUkWJoWhN51
	vKAGouphXvfSLuwZWItdbrl/hFp6LbWZzNO11z0YpDrEn0EgzoZ/APxUgTJia8E55ZI=
X-Google-Smtp-Source: AGHT+IGqh+W+S3heXakioz/3q0T976hhBdPRspmk0RARxwVhScFCvhjgC58QG45FOLgAchX8ykqp6A==
X-Received: by 2002:a05:6000:4284:b0:3a5:2fe2:c9e1 with SMTP id ffacd0b85a97d-3a56075a5b0mr2326130f8f.30.1749726327860;
        Thu, 12 Jun 2025 04:05:27 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5619767b3sm1719322f8f.13.2025.06.12.04.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 04:05:27 -0700 (PDT)
Message-ID: <c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org>
Date: Thu, 12 Jun 2025 12:05:26 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
 <de7142ac-f1a3-412f-9f00-502222b20165@app.fastmail.com>
 <aEhVsrEk0qv+38r3@lizhi-Precision-Tower-5810>
 <20250611090107.t35zatn47vetnvse@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250611090107.t35zatn47vetnvse@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/06/2025 10:01 am, Vladimir Oltean wrote:
> On Tue, Jun 10, 2025 at 11:56:34AM -0400, Frank Li wrote:
>> Can you add performance beneafit information after use non-coherent memory
>> in commit message to let reviewer easily know your intention.
> 
> To expand on that, you can post the output of something like this
> (before and after):
> $ spidev_test --device /dev/spidev1.0 --bpw 8 --size 256 --cpha --iter 10000000 --speed 10000000
> where /dev/spidev1.0 is an unconnected chip select with a dummy entry in
> the device tree.

Coherent (before):

rate: tx 385.8kbps, rx 385.8kbps
rate: tx 1215.7kbps, rx 1215.7kbps
rate: tx 1845.2kbps, rx 1845.2kbps
rate: tx 1844.0kbps, rx 1844.0kbps
rate: tx 1846.1kbps, rx 1846.1kbps
rate: tx 1844.8kbps, rx 1844.8kbps
rate: tx 1844.4kbps, rx 1844.4kbps
rate: tx 1846.9kbps, rx 1846.9kbps
rate: tx 1846.5kbps, rx 1846.5kbps
rate: tx 1843.2kbps, rx 1843.2kbps
rate: tx 1844.8kbps, rx 1844.8kbps
rate: tx 1845.2kbps, rx 1845.2kbps
rate: tx 1846.5kbps, rx 1846.5kbps

Non-coherent (after):

rate: tx 314.6kbps, rx 314.6kbps
rate: tx 748.3kbps, rx 748.3kbps
rate: tx 1845.2kbps, rx 1845.2kbps
rate: tx 1849.3kbps, rx 1849.3kbps
rate: tx 1846.1kbps, rx 1846.1kbps
rate: tx 1847.3kbps, rx 1847.3kbps
rate: tx 1845.7kbps, rx 1845.7kbps
rate: tx 1846.5kbps, rx 1846.5kbps
rate: tx 1844.4kbps, rx 1844.4kbps
rate: tx 1847.3kbps, rx 1847.3kbps
rate: tx 1847.3kbps, rx 1847.3kbps
rate: tx 1845.7kbps, rx 1845.7kbps
rate: tx 1846.5kbps, rx 1846.5kbps

Ignoring anything less than 1800 as starting up, coherent has an average 
of 1845.2kbps and non-coherent 1846.5kbps. Not sure if that's just noise 
or an actual effect.

With stress running in the background the difference in average over 17 
runs is slightly more significant:

   stress -m 8 --vm-stride 1 --vm-bytes 64MB

Coherent: 2105.5kbps
Non-coherent: 2125.6kbps

There's not much variance in the runs either, they're pretty much always 
2105 and 2125 +-1 so I don't think this result is noise.

(No idea why it goes faster when it's under load, but I hope that can be 
ignored for this test)


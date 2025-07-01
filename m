Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58603273D91
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373771; cv=none; b=ArS0up0t+EzDTrtUPBGt7TeBMCW7erVXUwlIG8L6gwQI241pSBr056Iz+tfh3+RcBWYK7lIDy8qoTNfa7lWh9V4eDgU+K+QSpXNvziX4mjrAiYtFOayD0V74Tp/8+Tohv4r3nC9WkJ00eSdu82UUvDXeRoGYbqNJdzkg+/1wVaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373771; c=relaxed/simple;
	bh=2USRWzkHY9LDDjXfilZDHGMHlXswQOI+HCwfX1yZ/fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C1blZNvybiqslEiRTy41Tk2e1GsjILs95R1+sxrxNr5t8E0satczIAooI8bw5M0M1JsKmXkWfyRNTKLI4Fg2gEm2SSDq8HtSRVl5xcxpt+uOzYbDQNzsPKetgQUz+IO04a5o2JzCHbjCtNpOzCd10hMPrx8DVtogcbBvc3osRZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qEPnDgVr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qEPnDgVr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso55799875e9.3
        for <imx@lists.linux.dev>; Tue, 01 Jul 2025 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751373768; x=1751978568; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tsVCbz5zR4RqV+iuMQyZvIjkyF6mk+aRWwFqzLZi86I=;
        b=qEPnDgVr9r6Ltkxy7eErffTRH/1FNlSVTp0cWh6s/GiDbjfaVTz3tkdSrtnMbBE07a
         S0pMH11a0RT0QHdE+kZj0Q7hM8zF0y5cIJZhpiTnySI/oziqkEkAS+VQFi8iWKg2dD8B
         RfggYTFMsC5rqjwtujNBqW/o9JawJniXcGPh9p6JkqJg8O/Nu3Vsp0WkjlX3WUOdFMPe
         oyaQoSs/RwxPX1jqBQNqvBwk1E+TwGoflxsHZ+ZGPsJN5UGyej7P09OcUoDr/aozn4fm
         w68C6Kb5A3LoIv25mmkY0TulpmicwP73Sey8CJn8oHmpxCSgh4I/EOJ7UNphtzAxZEly
         E9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373768; x=1751978568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsVCbz5zR4RqV+iuMQyZvIjkyF6mk+aRWwFqzLZi86I=;
        b=oKr0Enk7zanaJgftcR+1FtQbzOiTEKEMuzzuPAdbox+4FcR+qTo3X0WmhePuOlb6w8
         xUQDBKi4VOkyiYVe8xoId2JnXARKz3Qlop2/iNfz3Kf+n2XulFgA4cnJs1XVt7eNi2NR
         R6C593g7wy+4dCx1Clb7ffha7V39I63YAqsxzPzJ1BCS6tuKZbU6S8g3JvJUm8u/Zmbh
         CyJ2DXQO9FUXq+IaV7dAS2Nh7DL8DyBuKeEHMTR0kqOpttXCVAwZBFX5HmT3Lldk3162
         42RPtRLQe8y017WV28wu/THcYQKN4/plC7JTCR54fP2O2N8GPKIVIwnCr9tusWFxAh1E
         dQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUCdWWILyIdLVDLOx0zC0cx824fE5uvoWOBq3Jy2ghzTzhHJu41G/j6eSQug3rLWv34Qk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoftyzGVxgtZEhUgwrBFASkeF7+kfP77CJ+/5wyjAcWZ+sVwAo
	vAaa1PZG+zCkyV9cu4b6joaYAi2G5fN6P2rFCb6ZD/g1NmBl01jroMcqsHuTF1XCzEA=
X-Gm-Gg: ASbGncufuXTyF2B6kp4UHjMopuAabjddt2TfQnIPFPKgwes7ZYmgBGMd4adSH98JRoA
	GTHXBZFRnOUfBrQYosWBghfV23Q1pD875mSvAI976zO6GC/4b4t7mCloF4Q27hP9xn1A1Ud05Y0
	lDaHrv4fnjlfph20qbqPCxUqWkAL9/IdWx+Bs6gefiYeLJRTGnO9U2jwie6CU+CUTsx5o6p4W+a
	uBJhlGO6AVXTxXuC4UIhabV6gMCV+Uzk4T/XvxsNbAP1x9PGxaDpeuyCv5A5vOT7ElW0bBa3EpC
	wuV51+SLJFAu6p8EnXgj1GbBmWr4d6XZbmAY7CQ78+jrEMfLmhQmGCb4LHRYBMMUCrQ=
X-Google-Smtp-Source: AGHT+IGzGtmISDr4u15qcknVybwuXswS0vgnEq/kCyZSCSHrqvkYh2GXlp+x4RvRaQKJVW3fIdsSmQ==
X-Received: by 2002:a05:600c:6986:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-4538ee278d6mr164093505e9.13.1751373767557;
        Tue, 01 Jul 2025 05:42:47 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453966eb3e0sm104937695e9.28.2025.07.01.05.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:42:47 -0700 (PDT)
Message-ID: <c9bf945b-9fc6-4829-addf-2fb7a7d4eb36@linaro.org>
Date: Tue, 1 Jul 2025 13:42:46 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] spi: spi-fsl-dspi: Target mode improvements
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>,
 Frank Li <Frank.li@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
 <20250630152612.npdobwbcezl5nlym@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250630152612.npdobwbcezl5nlym@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/06/2025 4:26 pm, Vladimir Oltean wrote:
> On Fri, Jun 27, 2025 at 11:21:36AM +0100, James Clark wrote:
>> Improve usability of target mode by reporting FIFO errors and increasing
>> the buffer size when DMA is used. While we're touching DMA stuff also
>> switch to non-coherent memory, although this is unrelated to target
>> mode.
>>
>> The first commit is marked as a fix because it can fix intermittent
>> issues with existing transfers, rather than the later fixes which
>> improve larger than FIFO target mode transfers which would have never
>> worked.
>>
>> With the combination of the commit to increase the DMA buffer size and
>> the commit to use non-coherent memory, the host mode performance figures
>> are as follows on S32G3:
>>
>>    # spidev_test --device /dev/spidev1.0 --bpw 8 --size <test_size> --cpha --iter 10000000 --speed 10000000
>>
>>    Coherent (4096 byte transfers): 6534 kbps
>>    Non-coherent:                   7347 kbps
>>
>>    Coherent (16 byte transfers):    447 kbps
>>    Non-coherent:                    448 kbps
>>
>> Just for comparison running the same test in XSPI mode:
>>
>>    4096 byte transfers:            2143 kbps
>>    16 byte transfers:               637 kbps
>>
>> These tests required hacking S32G3 to use DMA in host mode, although
>> the figures should be representative of target mode too where DMA is
>> used. And the other devices that use DMA in host mode should see similar
>> improvements.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
> 
> My test numbers on LS1028A:
> 
> Baseline XSPI (unmodified driver):
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 8 --cpha --iter 10000000 --speed 10000000
> rate: tx 2710.6kbps, rx 2710.6kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 16 --cpha --iter 10000000 --speed 10000000
> rate: tx 3217.5kbps, rx 3217.5kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 4096 --cpha --iter 10000000 --speed 10000000
> rate: tx 5118.4kbps, rx 5118.4kbps
> 
> Baseline DMA (modified just DSPI_XSPI_MODE -> DSPI_DMA_MODE):
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 8 --cpha --iter 10000000 --speed 10000000
> rate: tx 1359.5kbps, rx 1359.5kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 16 --cpha --iter 10000000 --speed 10000000
> rate: tx 1461.1kbps, rx 1461.1kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 4096 --cpha --iter 10000000 --speed 10000000
> rate: tx 1664.6kbps, rx 1664.6kbps
> 
> Intermediary LS1028A DMA mode (using non-coherent buffers but still
> small DMA buffers, i.e. holding just 1 FIFO size worth of data):
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 8 --cpha --iter 10000000 --speed 10000000
> rate: tx 1345.1kbps, rx 1345.1kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 16 --cpha --iter 10000000 --speed 10000000
> rate: tx 1522.5kbps, rx 1522.5kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 4096 --cpha --iter 10000000 --speed 10000000
> rate: tx 1690.8kbps, rx 1690.8kbps
> 
> Final LS1028A DMA mode (with the patch to send large messages as a
> single DMA buffer applied):
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 8 --cpha --iter 10000000 --speed 10000000
> rate: tx 2247.0kbps, rx 2247.0kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 16 --cpha --iter 10000000 --speed 10000000
> rate: tx 3477.4kbps, rx 3477.4kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 4096 --cpha --iter 10000000 --speed 10000000
> rate: tx 8978.4kbps, rx 8978.4kbps
> 
> So after your patch set, DMA mode on LS1028A becomes more performant and
> should replace XSPI. This is an outstanding result. That can be done as
> follow-up work.

I wonder if latency could be higher despite increased throughput? It 
probably wouldn't be a big enough increase that anyone would care. And 
based on the structure of the driver if throughput is higher the latency 
might even be lower.


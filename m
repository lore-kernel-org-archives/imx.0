Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6682459E7
	for <imx@lists.linux.dev>; Mon, 19 May 2025 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747650358; cv=none; b=qHuyQnk5XsPRND4LCdvIsJYzpy+EX4YmcbsXul5ypsY31iYGWVSc+urW75fVQ9UrENhtmkDQHOE+GRDQQCkVxA2cqVQrFUlHWbRKdX3TmD6owwAZMk5bwt58MluQ6nDip11jOJWI3kVCd4T6YsNeHIo/k2W7SzFhzhR3GsDbR8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747650358; c=relaxed/simple;
	bh=YShpb15KXh+rmJ913JTGgVe+ZLU1GE2+pipwYbXGm6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iv4xTSEK+pjwWpqy3uLjE6c6Br+3Fjk0XV5egc2GG0j8Ij0E2nVtM0565qt0xLc3vV4hE2IY6wsiFKVMpasSUUwWp4vHv4wGghMeP4zefV59/Dum9MfecEq2AA0bidrn+uc1g+4V+b/CllrHi+JmJKFz2kp8bVvBmXeF7uOzCpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c25CbhtR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c25CbhtR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edb40f357so33874685e9.0
        for <imx@lists.linux.dev>; Mon, 19 May 2025 03:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747650355; x=1748255155; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6fKl01pepPz++C68YkR59kWZjoR1MNzkY+R8bRjab0=;
        b=c25CbhtR+YbVuL7rsb76J3U5Zc8BEe607o0JCQbCE1rlbGNeKpp8UyxTxmkhZhSjKd
         sZSiIRSvcXOrdlwY/5kMLfiwVIDaEtq0CjNSG3OgkgBqksHkDAoNZxpteg9rIa2DRfyX
         hyp1l/7BtDGKHRsf4fw1M8L+GtoCUhE5PXnHvuBtXjIsOQKyDPVeGclbqRwuKxx/Pdph
         rDH8Zy6b5RfoKx7aU33wYGFHsXg+AqcyP0iHXRLQtz8hlri4pqytUpb+u7skMZ3Cj/+5
         rYRGYdi8KMvxzjcp9cTTs6o5dB72FL9XqDRX5vY/URM9Qy16gNZcLYtv1lzUgtWUT0PL
         JaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747650355; x=1748255155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v6fKl01pepPz++C68YkR59kWZjoR1MNzkY+R8bRjab0=;
        b=QDEhMc77/ZayAJrcurr99MV0Wid+oRyw029KLrLdovwaKpixmyfCnHIh2/TzD15guW
         QrvgiW4g3rDeTkjbqKa6GJs+dkwQ6GoUC3rJsweZujJdD4gbWvokdk7lXTJYkGXp+4/U
         +dbQF9XezNEzs8bQNmuWAJ8qPhOe9msoeYHNSkPQ/Y4felYW5x5+kYOo49WZW06cSrmW
         eaf1wD1654nZaTWC1Eq+mSbHITDoWZw35i85uK8iHBfQ19lGGxHqAuuJme8Vx6Vsu9bb
         349VHdSjfTGgwi0aqKEjb1TmdQvRY7TkN/WLooRH4cnK52fBOb5fHrVSStW/zvfCjkso
         C+lg==
X-Forwarded-Encrypted: i=1; AJvYcCUpIzUgwHEDMcwfATHxdhf1Oj7pPyMgvNOO2w4QOKpzLNTaASIha3Ljw4eDSUpmwDAvM/o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwA/0d/ZZqYgFQb1xBLwOpfReDFFeogANZyZAxEZEncUUNOeIDy
	U5mEBr5ysBCpB6akvsUoiDJJ0kdenBjcYwxIrbVa/8UbiZnroaNeRSl+736iOyM8/wQ=
X-Gm-Gg: ASbGncuMr93xUaKC0MhhuhKbTLwo5fXfU6R2U7gr64FTfjQ5pfBjb3wtvrwJuOHDwJk
	A94gt4tKpywvaXjnsK9XH06bLzlKH2iIhmORgQlBU/PeCIPVbGxRJwPJNqn7uPz46qcmCAoWJc+
	SdC0sDD28KH6mvNhSZ4oS0ZWP36AwUw8mlst3Nm+33O+K4PNgGJfJ+HgAziVdLRCLRD5xJME75E
	UO9gElwdZ6GbYPLFM2fvJf8Owhinis7gqWcEpE4tJAbS1241WelOoQuZ/pTp9moCgPmjABzAIgp
	zF+ipU1ZSlwuf7PX1JAVwEGI2q1vAR/zGXXlejzNj0vccM9HWTJEb/v6
X-Google-Smtp-Source: AGHT+IH4gcowvuA8DujFFeHc07e+oNKUAsI8ShmqZmjzECudwGDbx/+l7QdDfmfB08rAOTsCA3h/rw==
X-Received: by 2002:a05:600c:4f42:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-442fd60cb7bmr106438175e9.5.1747650355085;
        Mon, 19 May 2025 03:25:55 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb85a8f8sm122871855e9.0.2025.05.19.03.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:25:54 -0700 (PDT)
Message-ID: <8b7be083-cef8-4b68-af4a-2bb5b30a9b9c@linaro.org>
Date: Mon, 19 May 2025 11:25:53 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] spi: spi-fsl-dspi: restrict register range for
 regmap access
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org,
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Xulin Sun <xulin.sun@windriver.com>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-3-32bfcd2fea11@linaro.org>
 <20250509140622.n2tc3dd23ylyux72@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250509140622.n2tc3dd23ylyux72@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/2025 3:06 pm, Vladimir Oltean wrote:
> On Fri, May 09, 2025 at 12:05:50PM +0100, James Clark wrote:
>> From: Larisa Grigore <larisa.grigore@nxp.com>
>>
>> DSPI registers are NOT continuous, some registers are reserved and
>> accessing them from userspace will trigger external abort, add regmap
>> register access table to avoid below abort:
>>
>> Internal error: synchronous external abort: 96000210 1 PREEMPT SMP
>> Modules linked in: fuse dummy tun hse sch_fq_codel openvswitch nsh
>> nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
>> CPU: 2 PID: 18231 Comm: read_all Not tainted 5.2.33-yocto-standard #1
>> Hardware name: Freescale S32G275 (DT)
>> pstate: 20000085 (nzCv daIf -PAN -UAO)
>> pc : regmap_mmio_read32le+0x24/0x48
>> lr : regmap_mmio_read+0x48/0x70
>> sp : ffffff801123bb70
>> x29: ffffff801123bb70 x28: ffffffc873b5c000
>> x27: ffffff8010b408f0 x26: 0000000000000001
>> x25: 000000000000013c x24: ffffff801123be40
>> x23: 00000000000003ff x22: ffffff801123bcfc
>> x21: ffffff801123bcfc x20: ffffffc873a9e500
>> x19: 0000000000000024 x18: 0000000000000020
>> x17: 0000000000000000 x16: 0000000000000000
>> x15: ffffffc876189160 x14: 0000000000000003
>> x13: ffffffc873bf73ff x12: ffffffc873bf707e
>> x11: 0000000000000000 x10: 0000000000000000
>> x9 : 0000000000000000 x8 : ffffffc83fca4e00
>> x7 : 000000000000000f x6 : ffffffc873bf7083
>> x5 : 00000000fffffff9 x4 : 0000000000000002
>> x3 : ffffff801061f058 x2 : ffffff801061ee18
>> x1 : 0000000000000024 x0 : ffffff8011490024
> 
> I think you can leave the register dump out, it doesn't seem of much use.
> 

Will reduce the output and add a reproducer and fixes: tag.

>> Call trace:
>> regmap_mmio_read32le+0x24/0x48
>> regmap_mmio_read+0x48/0x70
>> _regmap_bus_reg_read+0x38/0x48
>> _regmap_read+0x68/0x1b0
>> regmap_read+0x50/0x78
>> regmap_read_debugfs+0x120/0x338
>> regmap_map_read_file+0x44/0x58
>> full_proxy_read+0x68/0x98
>> __vfs_read+0x48/0x90
>> vfs_read+0xb0/0x130
>> ksys_read+0x7c/0x108
>> __arm64_sys_read+0x24/0x30
>> el0_svc_common.constprop.0+0x74/0x168
>> el0_svc_handler+0x70/0x90
>> el0_svc+0x8/0xc
>>
>> Co-developed-by: Xulin Sun <xulin.sun@windriver.com>
>> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
> 
> Do you have a reproducer for any of the supported SoCs? On LS1028A, "cat
> /sys/kernel/debug/regmap/2120000.spi/registers" runs fine and does not
> crash.

On S32G3:

  # cat /sys/kernel/debug/regmap/401d8000.spi/registers

  Internal error: synchronous external abort: 0000000096000210 [#1]  SMP
  regmap_mmio_read32le+0x14/0x38 (P)
  _regmap_bus_reg_read+0x104/0x140
  _regmap_read+0x19c/0x2d0
  regmap_read+0x60/0x90
  regmap_read_debugfs+0x15c/0x330
  ...

Not sure why it wouldn't be the same on LS1028A because the register 
layout is basically the same. Maybe it just ignores the read instead? 
Either way I think the fix is still worthwhile to backport because we 
won't be able to test every device.




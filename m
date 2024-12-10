Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC301A9B47
	for <imx@lists.linux.dev>; Tue, 10 Dec 2024 13:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733838739; cv=none; b=Gsy62vYIGC1MkgUK/Gp84eV+zdKYRkhS9hjsXyOVW83U5GPI/6R41TvgGAPgjSyo7um2im+963UTgT21I4wU5St8qI7TIIXGU5bGtzwMXKKySWfRzuSBvaIW6Bh8IajypmvLVCKxLn9/LjAgK2Bh52v7kqEUvyyQi0hrfmnHoN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733838739; c=relaxed/simple;
	bh=x0YzXghQ+gAKuEwKFhdi6SRVXz39dHzpMAssWYnJg+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njSjeOKr2xC2ZoW6aVn+cHAiR9w16DAvAdste8GlWQerlsEmngVokgvDzvvQJB6ovUXOturCYbKMKkv0ZUbPOJdJ6olRxtlw0XoLrS6wpPhvbA3417WejuMySjRo1l8t/IALeew/0ELLerOnw/xaTmSUxWBKQA0uMZWbnwUqPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZvsgl2A; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sZvsgl2A"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3862f32a33eso1769632f8f.3
        for <imx@lists.linux.dev>; Tue, 10 Dec 2024 05:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733838736; x=1734443536; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvsJcHnWFJkaRdXIOYYPtjthmV89MakBwrZsJYDK4Qk=;
        b=sZvsgl2Ap6WYgdHvQ5ObggCx5Pac9ereSc15ph1Xbw1uq7pnDYfPACF9ROylUjkTnB
         8POPetQYlB8GVCGdLr9tWxyzFDGxKADE+4F18LKYxyMKIBN0v8Vek2qR2RLsoup8GDHa
         WzI5gibLc5vb6aJdIrrU7EbyQhssz323EeiN83NOHM/g3w/BsC1TP1I4K+vmkdXfVruT
         ahoHwKRdhCE3yDflAd7PKhFO4I7RMeuNu40PlW3SG6CtLFMQ0PsVvi9qUSMyqMnfa3MJ
         wn1iVqV8jBiZO74lhgYv/bMcZ7ILr0P/oLTSu4CqVabDi7sRbNRCYhd3qzC0SNd3Y1EA
         atuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733838736; x=1734443536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvsJcHnWFJkaRdXIOYYPtjthmV89MakBwrZsJYDK4Qk=;
        b=I2nTEO/wN1lziPzT8BaVteSRlGbr9b0lN7C/ACd45ZTt51oTw/RKqbF8smKFiUWXH9
         bRuDOAJXKswZd0TzKXeioUByI4vdLYCbcFwn4qHkw6RoJzq2vfAw1LVXmB12kuaeVqjh
         h0GZdtJopCOwE45HWLEON+zv4KyYS+c+6tI3WZUKfLgb5MVmI4uFBzBJGmCU1KuBAkvj
         6pgSfUrL/bDbEdAu3A2pABZao0BGXPsuEtX1G6D6OzWsYSBn5TBB5+npsD7TRKuef+iK
         cNtQsRANFYjf78BqJhMWi6RIqFVfbMKt0Dbg33wH6NGyC0vYjfqBcCe7ToUwS+yMIWdi
         DUjw==
X-Gm-Message-State: AOJu0Yxl7Y+uTQQnfJ/oUV7gkYwetNojeukmw3R0TQSmZAglsT4Wa2OT
	LNEbzsRClyiiVHVUxQ+B0YKYyWka3gDLg67JPLGDaZ7K2ik7vM+Rdo694JbYAXE=
X-Gm-Gg: ASbGncuFVsdi5mNaE+Za6fNpPlptT0MrNPTSpvx+lfj6JDwW1BeyEaYYR3UsEjf1tKR
	YiKqM4FjpI37/DWSR2K/WODDPy9GEPicc4pMp6hOQALahPT6Wg9jvnNoHBV0xV8RSlNrlLIL2eD
	NxcvFSH51kKG0G2D/16ExpSO0Qxd6fiXOjph88j+ASk9AQ1peBWUWTfChTcz3mzY+D3NrDVFT+I
	rv45KThWsT9Z8aRRAjo/mF4St34yyTYLOl7jUTH1GJN/RDvRzEPynBKDEO31PNaZWwCV8FH
X-Google-Smtp-Source: AGHT+IFQ6nYMzgv6s9MPm0QEXnXj8O3sBLDqM8CxTrOU96IG8xBvdz2PcHy2jFxRyvN3ca+1FwMClg==
X-Received: by 2002:a05:6000:42c3:b0:385:f1f2:13f1 with SMTP id ffacd0b85a97d-386453e2a8cmr1917700f8f.22.1733838735834;
        Tue, 10 Dec 2024 05:52:15 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3861ecf4119sm15806378f8f.14.2024.12.10.05.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 05:52:15 -0800 (PST)
Message-ID: <3e16b2f5-5aeb-4988-bf6f-63c7309f53a4@linaro.org>
Date: Tue, 10 Dec 2024 13:52:14 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] nvmem: imx-ocotp-ele: fix reading from ELE OCOTP
To: Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peng Fan <peng.fan@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable <stable@kernel.org>
References: <20241202-imx-ele-ocotp-fixes-v2-0-3c021a97eb5d@pengutronix.de>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20241202-imx-ele-ocotp-fixes-v2-0-3c021a97eb5d@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/12/2024 11:22, Sascha Hauer wrote:
> Commits b2ab0edaf484 ("arm64: dts: imx93: add nvmem property for fec1")
> and 0d4fbaffbdca ("arm64: dts: imx93: add nvmem property for eqos")
> introduced NVMEM cell bindings for reading MAC addresses from the ELE
> OCOTP. This doesn't work as expected due to bugs in the driver:
> 
> - imx_ocotp_reg_read() interprets the incoming offset as 32bit word
>    offset, but it really is in bytes which means the driver reads bogus
>    values whenever the offset is non zero
> - imx_ocotp_reg_read() reads wrong results when the offset is not 32bit
>    word aligned
> - MAC addresses are stored in reverse byte order in the ELE OCOTP, we
>    have to swap the order before passing them to the upper layer
> 
> This likely went through unnoticed because the bootloader normally adds
> the MAC addresses to the ethernet nodes and in this case they are
> preferred over the NVMEM addresses.
> 
> This series fixes these issues.
> 
> Sascha
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> Changes in v2:
> - Add Fixes: and Cc: stable tag as requested by Fabio
> - Link to v1: https://lore.kernel.org/r/20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de
> 
> ---
> Sascha Hauer (4):
>        nvmem: imx-ocotp-ele: simplify read beyond device check
>        nvmem: imx-ocotp-ele: fix reading from non zero offset
>        nvmem: imx-ocotp-ele: fix MAC address byte order
>        nvmem: imx-ocotp-ele: set word length to 1


Applied thanks,

--srini
> 
>   drivers/nvmem/imx-ocotp-ele.c | 38 +++++++++++++++++++++++++++++++-------
>   1 file changed, 31 insertions(+), 7 deletions(-)
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241023-imx-ele-ocotp-fixes-f7b216171e1e
> 
> Best regards,

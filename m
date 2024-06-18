Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28021581EF
	for <imx@lists.linux.dev>; Tue, 18 Jun 2024 11:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718708730; cv=none; b=O44UXASR4cMyUYG0mk6BCPEABpYsloqb5U45AK90mcKqdnOEtpRhPbUwWVmDSXgWgtMc3ctdQMI4nVgMOQioVvAIitvk/BBxXfgdMEAIKyu0smersArWuMbkUxsVch33c+VkGtN84GuSdb4LsLsQF/TRIYj0oYc0x/3UXY8LcRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718708730; c=relaxed/simple;
	bh=qQYAU6pzROoBuuHRkqrRKpetO1lSkUzkb0VMCTaossc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TSwPX2FU+pZyLpk83JrlPUCi0kuh5KSrv6qm2Njp2MCn1xlZ7yrjEHmXFJBa78/WVu5JwTa0H++9kE+xXd1ttBpMKzZ8KY2Xc/p5+b7bDpzIDllKLHvmLA1rhforc5Qa1WjEj+M/D2xGkDhfc04Q8pqByx9pjiHfo5JsFWmwkcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=SOJH50Tk; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="SOJH50Tk"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cc1528c83so1056174e87.2
        for <imx@lists.linux.dev>; Tue, 18 Jun 2024 04:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1718708727; x=1719313527; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQYAU6pzROoBuuHRkqrRKpetO1lSkUzkb0VMCTaossc=;
        b=SOJH50TkGbsVHLNtQhd8m4cPe915ES0Y3XskIffJ4mQFLQNusXQ/v8NF2l1q47XueD
         8ZVt+YXZ2vR66w0SLwNFaM4YnGK4aXG+3OIBdIiS368tO7W/YcLP8/3exf0/RrA4dZkt
         EAqC+3iRHz0rDGTDD6G66g7DenHfMgVUApL+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718708727; x=1719313527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQYAU6pzROoBuuHRkqrRKpetO1lSkUzkb0VMCTaossc=;
        b=q5EypVVDJeEbOzIUH4YJMIlRJjfZLIH3ABFHTNcclh05ULroRziEPMfmfOyXjPhALC
         a4c//xgOU8vjGmKUmXYs5KcWcKtlsGVdD11IfwPzLpuTRx7kMUenS4z6IfJIufD9PIkT
         jA4bZgsu9pcsbkGhH6R8GTpuiHtdVG3eSP9PpH+M7K2JfPZH/hvU8NsNK9FYYojwewVC
         m9gQaL/wCgHvrVU+xvfiwqQPm2NzVH54liVzlVDnDsQxF6STGP7OGSfvY2qGJxHLETYl
         CBVchSdRsEKroEHR/pvQol8mctXVJlnRjgIPnWwgbvKtYmj9SgmJrr1PlLYojkQ02TK9
         nWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnPDxnIV6mzcfwLrp9cTu3NGmjGvi4I+53sKmdi5cYbFl/zAbwDRBMI2EsJWMHkrvpmlxNKrcVBe5nHmgEjQYdGpCE
X-Gm-Message-State: AOJu0Ywq1eDepH/awg+PR/FuCn254SAcMwZ9TQpBYUtnVpusiC10oIAa
	EwKHOsOxCcB6uCWzctjnL21K+9JvkEqUHdj7ySMWQijEBVGPniU/dxstZePM7yo=
X-Google-Smtp-Source: AGHT+IFNlsfM3APxVmAxEWghwl5cNejfef9/uKTOCWJh/jMtDLGzSKZtnGgEwqQDQ/JYkfU811H5yw==
X-Received: by 2002:a19:8c5a:0:b0:52c:88d6:891d with SMTP id 2adb3069b0e04-52ca6e5637emr7505157e87.9.1718708726703;
        Tue, 18 Jun 2024 04:05:26 -0700 (PDT)
Received: from [172.16.11.116] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca28722f9sm1481146e87.167.2024.06.18.04.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 04:05:26 -0700 (PDT)
Message-ID: <63f0a3a4-f1ea-4b85-afde-d7b82bb95ade@rasmusvillemoes.dk>
Date: Tue, 18 Jun 2024 13:05:24 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: imx: ensure RTS signal is not left active after
 shutdown
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20240524121246.1896651-1-linux@rasmusvillemoes.dk>
Content-Language: en-US, da
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20240524121246.1896651-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/05/2024 14.12, Rasmus Villemoes wrote:
> If a process is killed while writing to a /dev/ttymxc* device in RS485
> mode, we observe that the RTS signal is left high, thus making it
> impossible for other devices to transmit anything.

Ping. Any comments on this? I'm of course open to discussing other ways
of fixing this, but I'd really like a fix to land in 6.11.

It reproduces completely reliably for me, and I assume it affects any
board with this IP, not just imx8mp.

Rasmus


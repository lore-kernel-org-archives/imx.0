Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700D3231A23
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 06:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296543; cv=none; b=o/osy/UWq8Q/JuXUSx4azR/8LjKI8NOga9pY+4BykYzk7bwd+iNen+3suLKhcgNNS6u5Cu9eKeJ8Ll5RG+JAdWN6ZrMeP9npeDmHJyewhhr16YSGzSttExXgj4Tq4vATvjvEHmFi/TbdiWdseFo6MX0NnnNKPwxbmC1uOD4cbaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296543; c=relaxed/simple;
	bh=y4/ouupBjoYRS77m3fiaKDERYhLyJZEdAdivWI66SqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWaGmT6MaHl+Ot5bl/WXaYQQQhP77FsRWzsVUD5C5oPgMJQQYEunecmc2oPEef8F+NMQBFZqWS0KNHL9NFHCQF+U8U3BEJ5kijQlGew4Os4Ev9kPKB+XlkZ3ckylwRBH0Mg+y5Ua0E51w8MStGhNjZcG00KVtTViYzq/TNguVCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gu6rjTN4; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gu6rjTN4"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3965f215817so17831011fa.3
        for <imx@lists.linux.dev>; Sun, 31 May 2026 23:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780296541; x=1780901341; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGxbL9faVDVgrvfQsBar+KVqQ+FJr+nh53Wa1vgTsOQ=;
        b=gu6rjTN4pWCuTZsYyKnIVX9rDYs1yl+zmsuKbYQqQYXFzNKIKv3zs6ZzvjWMOopyeC
         6lomPK4q0jzDi/oO2/VJQnNS4dAMZWLkwuqXtiRydpGx0q0eEaZ23Uog6gZLBBh4HvMY
         ah0cKuPWXkamnCC7k/UaVHpLQA+psKlu8IZFIW66lrjOi/iAKzqAdiNcfFWcN67ERgu3
         KQ9CL/KhJYhhyqmItz/vbiiwAQg5Db+AIXLvk0OSMJGMll+FtMKnm7Kn70ftLO92OG3D
         gNpaMvHJZuvQy7lhEIOrbFKBoPqchceenyZ6HuEVNvSAJUqd6Wa1U4a/LUxWyBsWTYXx
         oKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296541; x=1780901341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGxbL9faVDVgrvfQsBar+KVqQ+FJr+nh53Wa1vgTsOQ=;
        b=eUkszjrQ/xdZpUdM7KFU8+h0pWnFfpkjROrovOBtzusSzbLnY3YvPk+jVBwmHUNdo1
         0CvdX7EwosS7TUgn3uhUG3hw0NEv8g9zWCvMm5+mFE7M7qDOX9JnZ72vOvGf4pO9Zt5m
         c75HIEXfFEtGEmcXpAKzf+hYWQOa2X5JLRy+W0dLul4DluhK3wCVceTYY8DEyfMeCWuB
         pwJ2VFL4/rwRo0ukC/KYN5uud7NxJr2IN/+tyT5R7kHT+/pVvfUjOD4TPFVJA8bp2wpk
         JCy7rDxRSmwGpGeExseniGPXEkpvVrJ0KgxT50J0c9+qtCotOFJrXYk2VU1NAhrdKtn3
         WfBQ==
X-Forwarded-Encrypted: i=1; AFNElJ99SRFBKz4kRLEUXTNw/Vn9ReGSFYMpgvOHE3F2lXHN2MxDQFLqDk+jVjuIDyZODNNVq0I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzqcqXIZ2C7Z+oLB9qiY1MLJOipSm30dbSf1mJ/pulcTlVcY4s
	G0QTAyIqyl5ltF+3JpLAAEeznEiTSArEsXtmu+7Y/YgkWbV9x9f3Bini
X-Gm-Gg: Acq92OFuYKnBipkG7+J+NUDDmEncs01eqyYxDIldBfcpmjzpeSb+9oEk9yuvyagiQnM
	f3aX/uzv2W2Sx7mmwnhoM7Z4myvQo0utBfWe5sgmFQHVri2zwnOk5I3wEt2XgS98GcflEBY5W7A
	tStEm4NGIdJDLE2BqeBlHmh1nMCXVp2BCVU7xPGGT2sR0byFpirAXEVqx/ZPUjFRnDiiRDkKO+U
	nX5vH+YmWlzqpGag+EDaiUeGalkN7hSQOlnZ7duu5SFf1HK8m2GVo+iPbPj9NSFctUVJDnyp6G9
	UzRYOjxrjLw6M/l/Vr/WRVJMdU8LKgIyJJ0Jc/8iIbRDgUfNpwNAuHF09+fRa0aM6Us+kzjMw5Z
	EkGU1NrlMn0ajWVeH/dZgZWjON6aBddS6SRLmVrWjZ4iZ+EGq2Tfu/arZ+eZ0JaY9LEFiST29bq
	CIdOKQHBOONBS1tICdv/p7nyFpkCNnLLw+j5Evy3WYktuazLyhEXdv7itD8glQFCWu9kCcEvAAV
	JSFzL+O4mcbUw03FNg=
X-Received: by 2002:a05:6512:2306:b0:5a3:f25f:cc30 with SMTP id 2adb3069b0e04-5aa60a32f56mr3289885e87.32.1780296540285;
        Sun, 31 May 2026 23:49:00 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b793e24sm1898970e87.73.2026.05.31.23.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:48:59 -0700 (PDT)
Message-ID: <b509c623-a47f-4216-9202-2c542f3c2e7b@gmail.com>
Date: Mon, 1 Jun 2026 09:48:58 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Sebastian Reichel <sre@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Amit Sunil Dhamne <amitsd@google.com>,
 Samuel Kayode <samkay014@gmail.com>, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
 <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/05/2026 13:18, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

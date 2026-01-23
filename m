Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2037AA75
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162918; cv=none; b=JCJLS0y7NR8IrEYK+WD70jLywDZdA4sxzdAZd5D3HgBWsjHb+STX4/YBxklX0v71rwHZ5lv751U6W+2AKgDYk2O7j3hqVv9+9mLNeBUWmxQ3pwTPdwTkFVz/nA7Xi7L1b4Vn9/vw7l9tFf/G9EokbC4abAcuCKkUAfsPfWX9EDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162918; c=relaxed/simple;
	bh=5hvYFZsBIqIjGbr9Ml6H1R2wYB8kasoO6MCg/Dn7FLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pqfXjGNoj3R/URz/Asr7/5KkH6ieC5UR2ZyJQcDAHohpTIkbGSfJak79ynhn3G253gfsduVH/s6Xs7G/Mflyv+iSClyKJRd5kATgMlF5dpNcrD5t91BU7qZi7MIUSh3eIfb5olBunfKApB8L3GIjKY932XPIOL4J2k3qBX5dWjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAv3dMny; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAv3dMny"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso22362215e9.2
        for <imx@lists.linux.dev>; Fri, 23 Jan 2026 02:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769162911; x=1769767711; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WUCxTM0YhciBvG+Wu0fAfickBYXzp1a3MFu1VYYkG0Q=;
        b=KAv3dMnyheI1VNLcqo2LJV0IzfArOn5cOtIbKiMJ9Be6k8VOk+L5OknSvXtFNeRQT4
         AjHYpTNR0q4OqLuAgthpZaT4XikwLUqnQqW/Qrbg58Rnp1I69IA+AsEt4KjYT+qwBp6K
         rb2hp5+9PtFdib21WuREG/z/KvK9tahZfuQXebOrwC1Jr1hJ0lrULLjJIWBnsw40+0hX
         PTnDNWz8ZFJDzXgdpvo5DO08wUIBgZGWB8XYCy4BSZJKJxzO24Hjj3b6r0rZ/4GxBGeP
         0+79S5nTBZ/YdN+9f4xt/f4tASncLzoGz/JhNAY7zz28YkteOQwSznpGMPLRHgHO9uMF
         1G6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162911; x=1769767711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUCxTM0YhciBvG+Wu0fAfickBYXzp1a3MFu1VYYkG0Q=;
        b=N7v5lBq9FwgmtJ3QQ/xuY9ZmNa7W/gm2beiFNMxHfjNR50p2Bbko43Gw3RhQMf7c0P
         NzTO26YHg2wHeI71+I/mO/kQj3rseD6bX0pO4uNMjSFioVEYpr2gOQxcLB0ZWhtrb4f7
         36ymdNWF54XH8vvhC97X6ci/yCGPO9EOnz8dThyHWikCCB7ifqsCZ8BHFG4Qx1hY7X8n
         /vHYj0myhJGW7LKNw7xOuHuSM84d6vOLhCNCP+tOhkjoG7IkaJMpvB+rp90svGzE208l
         S24pbi7PziHA2RNvGmHKnrHWwzqSbNOjmpiD/rvWJw5h6pHlLjH5b704kbagcOHSE/pf
         I+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXMHsIIRP6GoB/Azt+UrJVG/TsLeQEFiDz/5xoBCxFNdU4BYGeuosEF12MtSSgLXL2lo9c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOYrXXqTO68ws333e9/U6uJUpgJi0cRKgUP8RMpBYy3MoxuXOX
	asvKxk8a7r/1EEGEaaawvIWSInznEwOaZUi482BbcvAxtQeWt6NOH3Jn
X-Gm-Gg: AZuq6aL6RaIHrKCjEOfLCRbcv6YCYdA1Tuduur+1KRMfuhg3ov8wMWCFJ3zzr+BMPXz
	Lp5aKuF3xFKlSCVImugyk9xfqGVCD5r4Mf0ZIsKn3HYbKrZhw2v9ZyINe1t1IiuEj7IbzfVchwB
	PiKdJsqT0wagAX8Zmd9y/gcQHSRmVvUdGhogGfi/wgVZOcBZlY8gnU02rTgnebZke+YnRiAX9f0
	Op4SEP8Z1DyenZt5/VaR4gt55o4wOceEllNz2ysJXP1Pko28KpunjBiiuCyuW2mBiFJTno9n2bN
	LrSZjBMNgMBTX7LaUlgCFuJwc8/d2CEAOiTcozsebSbIXh4tRpY7Y4XkPXXtDjG7HyB2YtV+i4u
	TA1moBDhUWsNlMhOTEGk54LR53E09+6PyBsDwIIEyTA4GoeAJ1qvrAsUbIKbPIfLjN4KzFmhmgz
	fNsQQ2v86GhwhrXxDe+4waffBvi3FO34J5Sj6Cw69IZAhP
X-Received: by 2002:a05:600c:548d:b0:480:1c53:208b with SMTP id 5b1f17b1804b1-4804c9cf3c0mr41244535e9.36.1769162910876;
        Fri, 23 Jan 2026 02:08:30 -0800 (PST)
Received: from [10.25.213.222] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7b4d8sm5236892f8f.38.2026.01.23.02.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 02:08:30 -0800 (PST)
Message-ID: <86970fc1-c4c7-4a52-91e4-f9f93be5990b@gmail.com>
Date: Fri, 23 Jan 2026 02:08:28 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: imx-aipstz: set default value for opacr registers
To: Shengjiu Wang <shengjiu.wang@nxp.com>, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 laurentiu.mihalcea@nxp.com, daniel.baluta@nxp.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com
References: <20260123084844.4051570-1-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260123084844.4051570-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/23/2026 12:48 AM, Shengjiu Wang wrote:
> The sdma script app_2_mcu needs the permission to access the peripheral
> devices, so need to clear the Supervisor Protect bit of SPBA2, otherwise
> the sdma script can't work.
>
> As the imx-aipstz is a common driver for all apis bus, so set default
> value for all opacr registers, that the peripheral does not require
> supervisor privilege level for accesses.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/bus/imx-aipstz.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)


Hey SJ,


I'd be interested in explaining the situation a bit better in the commit message.

The 2 most important pieces of information are, in my opinion:


1) SDMA2 transactions are set to user-mode in your particular case.

2) Your script doesn't use the peripheral interface (connected directly

to SPBA), which is why the SDMA2-issued transactions are subjected to

AIPSTZ5's security-related checks.


Of course, please feel free to correct me if I got something wrong.


Thanks,

Laurentiu


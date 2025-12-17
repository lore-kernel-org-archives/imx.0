Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A23344023
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765964338; cv=none; b=BAKb7UOt1nyR+CKzFvdpeiWutWYUZoK0+81fvhotVafDm1DDSpOP+LdBVhpqTd4Wy/Z7VAZ9ZOfXm3p0tV/aSBJB4amll+IZff44o3MPHYeG0dvqkYea0RF3YVY2JGXX1z6NVAhY3cgjq6UpxxS+Vmgs0jPEQyuTDQrx2rwcI08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765964338; c=relaxed/simple;
	bh=6U8RmIsmmCspUZaxmJtWvDEjx4lOFUFJmBZcq1fdU/U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rYli+YBCvEicufZU01jeKx7SbaPntqrTQMfhIDovvQruS9af4uBcxTw834AaxBr/lV5vUx1Hl8XhhYT3wKW0npr8Vn5svoTPBKLrkgqJBIKt9E9JpLk9KYAxsjNgnufaEZqKMCjLbejGVgoMuZg4oPR6jvLHXYdJds6s4rWVn/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuG03UXx; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuG03UXx"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b736d883ac4so873143466b.2
        for <imx@lists.linux.dev>; Wed, 17 Dec 2025 01:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765964336; x=1766569136; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6U8RmIsmmCspUZaxmJtWvDEjx4lOFUFJmBZcq1fdU/U=;
        b=OuG03UXxMTUVXv5eu9JJw1ifKNNTX98MyKgdZXuNZNbr4HdPa4zBXizyqKZx6gLXMI
         3vIc91slfOm7BWeTdRPy93AOIvQdPapvkJQG0eKJcaQANFwQszo2SuRqmOfvZ9pbpf3J
         VLHrN3nxcpQfPitCubG8k9WZBWh51bA8x55zPAW5gndaBJgwRl5vqsuqnl+v68weqgMg
         Rl+xaz/7k/dfOC+rwkGiFseGK5mpt5juPO3KRuivUM1ckylVkoAj91JU1zDCgz2TDthc
         DTPvhd/OiKNrrNRoe28In9Ce7GmYvRGIc9jaeGBfuFymd8U1VQ50jtRrDkRyzPqwXK24
         SFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765964336; x=1766569136;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6U8RmIsmmCspUZaxmJtWvDEjx4lOFUFJmBZcq1fdU/U=;
        b=qpdKR1+YpGeJs8tImFisXY/OG81tCCWJlDuupBa2/ybcpPn4dwTZG2RQnTUo/ZpraG
         MX3020aF6ou4fKUgMrZEJTWM13S+O2Okokm5zcSBLkuSTboA6MJMcl/a3ehtKPcj4lRC
         RQdYKDtlxnzCHsPkV29wGfmSCeqa5JKQpuZ0pRLMTrZCzS/oCHl4ZjT9FYfgt9LFw+W+
         eTNUeLyu/sSozTiq5U7sPck6H53omKsBQhGQQmvglqVgD/RVKKISB0SfSgMy8tGzQBSx
         YB6UPuubw1nXN+zGzYA4BUJoUEizGCU71CUUpr0wcmrKLRD+Agu5SYw2vjHoit22/pPY
         F7tg==
X-Forwarded-Encrypted: i=1; AJvYcCWUY4wPWwDHlZpxe6I/QIgr6FcKyWXiiY31z/jxBT0oTu88wE2a/Eku6IVvtd9ewBd6+vg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8IfTsx25ngmB2zxS249tsmtcgaPnhMwUeJV8cKnQahJUgjkc/
	duWCIlaN/WXPVji5T//AJqLft6CQyRF4YkOexGCna8pdg2o/8bhYRkcc
X-Gm-Gg: AY/fxX4eIx36HgkhZ95SICJyf8YJYQsLJXcmUy99QDg01mvpfUeN+RG4zbr9z14Yean
	HWh54lXs0DF5nJu6303tRhuZ26G504DKs9M6MxmDhuJ0ov4VSpEY9c90unU1FhvrrwBA/Bqa5RC
	zi3h2wahV6BInhs4M9VIFnOYULyKcUR0F+ahjKqXOjc3SI885GUZvWoelCe35d4APJeYIL2nfIa
	BrTQvY1jrwa2yXQ9pTvzQlVrHeYt5qWnTHsAamgrw/QWoD+hidzOT5gLeM5uCKPLnx9B+u0kOr5
	hQYaIvlO7y59Ho+gTjkTLOjpl1v0lXJczguV0hjuIMlooPyeS+oXTdD76rG2caeVu1Scbmzr4Wz
	Q+xM8J6PePO3t6ua0C3LJc8kiAci3R5bJ67W48/GurWhlcX+0BOsjnUWNB9BI0+8WyUyyhqUFFI
	8B4mne8zvoiD2SrrEHXUpQKpog+b13JYE9bIzaGy949Uo=
X-Google-Smtp-Source: AGHT+IFzAKXXuZny9gStK6VTzPjayW/7SjoVngvkKhxYreDaWZMWb0JOiqkX6kUUWkxYAZiqBvU7iQ==
X-Received: by 2002:a17:907:d92:b0:b76:7b85:f630 with SMTP id a640c23a62f3a-b7d238fa0abmr1684969466b.34.1765964335319;
        Wed, 17 Dec 2025 01:38:55 -0800 (PST)
Received: from [10.25.213.104] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7fbd7a55dfsm1070592566b.25.2025.12.17.01.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:38:54 -0800 (PST)
Message-ID: <23326a3a-fd1a-440c-acd6-28d2e7c0f186@gmail.com>
Date: Wed, 17 Dec 2025 01:38:56 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Add support for i.MX8ULP's SIM LPAV
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
Content-Language: en-US
In-Reply-To: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/26/2025 4:42 AM, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
> LPAV subsystem, which offers clock gating, reset line
> assertion/de-assertion, and various other misc. options.
>
> This series adds support for the IP by introducing a new clock HW provider
> driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
> allow it to be used for i.MX8ULP's SIM LPAV as well.
>
> This series is a spin-off from [1].
>
> [1]: https://lore.kernel.org/lkml/20240922174225.75948-1-laurentiumihalcea111@gmail.com/


Hi Shawn and Philipp,


Gentle ping on this.


Thanks,

Laurentiu


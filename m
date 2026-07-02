Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371D03859F4
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019539; cv=none; b=GgaeHSxpTI/FyWVsD7vq6bkjFVnolazfChh564uhoRdLLsS01Ot3DeQmiF9/OM+twn5ZGaLVObdc7D2Qd4nzhROkv/YxKBegjHC8TO5XAewbSL4XQLeeRzKgNO7SHCZy+bhHF437r/XKKtOgzwNla0phagLZp7FTZH7FlCnxti0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019539; c=relaxed/simple;
	bh=AVIYuPCgubCuYve1OA2lx01GpnFJKVLmIPNWXCKWycQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3x89jnmjuz1kMrl5HPlYi+JhrhF9Bq/UpvIWhaYL2FU00h02vwePPMPzuQIU47yK7+amO5rJWcqPYfyWMCha26K1Hbyysf11/LQj9HFoUJo0T2JOmFhxmj+6wQQTiMWgCAEYc7NWfsar2LqlJ/vrHN3BHoYP2PCuzr8LPBuCJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRq3tbHt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRq3tbHt"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so10446185e9.3
        for <imx@lists.linux.dev>; Thu, 02 Jul 2026 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783019535; x=1783624335; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWVl92ySB0LOea/djTBKxUFhK5i6uFHRlukNHQHiJp8=;
        b=QRq3tbHtqZElUpwKtkkl+hdnXiEIIscWIIH13glEE98++t8Gu/j0VQEDlO8ewpQooq
         DQ7ADE+Ksf9h+L+ebi/Pdaw9vpnvDnH4tSb6T0v++SXLs+xPtzUTcT4frhwGt0l864HZ
         JzxJWNZ3b+Nka1GlOAX4vON4EYUc+d8nEnvfOOMsxw3kkGmjrg5/kchDR9LBLTGO6hln
         rQe5HjNOvScYfb96/1tV7J4xUB33Csra2O+j/yBZcxI0Sb8l6YzBAExqTDLsLBJvb/S4
         nI/5jNq/CvnrKktdmQCbLxVFGJrf40C0ZbumMB7uzeLiIEqn+oKvShQAlVfXyI+Zamj8
         553A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783019535; x=1783624335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yWVl92ySB0LOea/djTBKxUFhK5i6uFHRlukNHQHiJp8=;
        b=WUoBm7WNcDoMHotXo8v100llYnCyVL1IHc1RvSpvUIFlBpu2h/8c05QnFrgCPL0WP8
         IdhQmCU3TDxOsQdPz9C8g2Q/Q41PaV4GXj2OK2e/R0d1JElysBIJGXcFqfL6PUgPs4Mx
         Iv91vd51XFf1TQJkVillpSqrlxIC6Gzg3nuOGka+eNOqhPC43OfSiUifQ7UHoAKOTvC0
         B4sXzYcvLjUZJ5j/3cmZFcHp7ujPmG/6r/Vb/Y/b/6YKn1kgH1IJdJalZqW9yz7xUda0
         YeIB+2ZpKDhRZUuWaNZkujRHCkYbDdhSSWST0IYgoA1lyEdjUXy96hZU84SfIAYToBfd
         AVRw==
X-Forwarded-Encrypted: i=1; AFNElJ/ilCb/lpO5lqjpuQMr+wcksi796QW/sei5b/VqR7jbuE3sB+Ghq1/dxK72YU8Yw/ei9jU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzWrBMqa9B8xEUzctT+h7tFUFZgT2rh3z3l1tgkPGFL36ivGY5
	chmDa2cy7zFxsoET1W2MSQ6HTW02wk0aY55QeVbbOrZar/yHyZCABbvh
X-Gm-Gg: AfdE7cnenQnuYCYKP0jaCvY3XI//7beNcWaGbtNSlX7oIZXK/Y9Fyj807ITNwlj7Irh
	lS1LprHrdi8DqyNWZKFB/MZiE0PnwLw7vJwxH7vvcfrYgTpGIGkONuOcmEed125rnOe1jFYN4CN
	Pz27BH3MB9JRBenPDsv+QlmVAfeino7SMosFd3w/aHTytyknwVYpgyrXAb07RaPdInix/cC1PKM
	rcmKHAFLyDZ9XN6i+ndSqhxlI06q2KtKot6SKpGizuWsQgxAc5P+8wf3pftbCU0rM5ay20uMAVq
	qR3pHjmvgPEXSifYnh+jhQfs4Pato4blc1VL9cYmvnOguCtLH45WzGnyZW9GKyLdA2lP6NpL3hx
	NOcCE21iO67FO6nolcojy6fd4e9ZLkWTdqlZNld+ul6wI2kLjXGnOjfGLlNvdsogzLg/liJWXSD
	ad28Q0urk8IFrd6DufDQIxSLZ0IH0gmIn6Ao4bUjxTZwjxYqvVampKNgOY/5ruY0/lWLH45jgGN
	tfXFVP7
X-Received: by 2002:a05:600c:290:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-493c3cd5967mr65147035e9.8.1783019535315;
        Thu, 02 Jul 2026 12:12:15 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636cc08sm83399065e9.11.2026.07.02.12.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 12:12:13 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <eff80e31-f833-4790-8114-1ece4ed3a044@gmail.com>
Date: Thu, 2 Jul 2026 20:12:12 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20260630-dev-b4-aaeon-mcu-driver-v6-0-d66b5fcbd2f0@bootlin.com>
 <20260630-dev-b4-aaeon-mcu-driver-v6-3-d66b5fcbd2f0@bootlin.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260630-dev-b4-aaeon-mcu-driver-v6-3-d66b5fcbd2f0@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thomas,

On 6/30/26 13:51, Thomas Perrot (Schneider Electric) wrote:
> +config MFD_AAEON_MCU
> +	tristate "Aaeon SRG-IMX8P MCU Driver"
> +	depends on I2C
> +	select MFD_CORE
> +    select REGMAP
> +	help

Your REGMAP select here strangely indents with spaces, while the rest
of your kconfig attributes (and this file) are using a tab.

- Julian Braha

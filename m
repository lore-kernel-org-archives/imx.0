Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB49280A2C
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543130; cv=none; b=goeU1ey759iC95k2ZwyuUFw0ItaYJYB9F89W3mxO0it/BBhe1fijxm13gVYPrMNESDFoFbWU0iPEVexSILdrwJHHwJMlHCSI/aTYT1Puz8fmA7RCJi393rfs3MoWvS3fgFL5SdRtD2A0MCuG1tRcadWU4UIezCr8eEJIDmZGUp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543130; c=relaxed/simple;
	bh=v2CT6plJIgNl22pzwKw1D3YejkQkKza1J01LiUDlcu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jw6ZpeLLshKLTZB+O5cHJjeE6fsV94bIFB4PfWd6tWn8g5sB5QgdwocnFCBtCBc+RLw4M43qYj0pVb1+3virhOHSiZFptTuhiisRPpkhHDq7xP3uYOD5a8albxuZurh9pY/j+tv+dlP3xvNVpuLSO3kU2xqCZaG6Tt7jS6k5hGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=orTTXpHw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="orTTXpHw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442ea341570so33147195e9.1
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 01:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543127; x=1750147927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yho1AYPPcSyhpFNf11EN63wRjrUMMghOh4GvyBpFQxk=;
        b=orTTXpHwEOL79yV29/bQJ8T3RqqNA1JQc7EJYEYvj940qpAELmn+kjx79lJC8kr40o
         lUmyup/1X50zDm4c3Q8GF00an2d6Z90pvL7CBVAn0reumYA6i64PMyLj4fG5NLraDW7e
         TXPFbnSpohNtj7BrENbgs73HB4pQ1SZRy9oxPbP3N9o1RUWogq062MqaLwqxuXg9YyIk
         4mU60aTTWq7+M/+DjarNWhEZexsz+cpyXfA3nnD4eZO1KPC3zi8wdIbQt72xLGGbqNY2
         O7gvWrrmOc7tkiY4EJDHwtoukNethCHhSOJcd0FcLsOtpJv6AU6JbPQ31ArA5qoKMGEJ
         OvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543127; x=1750147927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yho1AYPPcSyhpFNf11EN63wRjrUMMghOh4GvyBpFQxk=;
        b=BWV5LkwWFCHnY1t6nBlJo0sYsPXEtVpIEyZ/vj45FRdS89Y4uVkr3ku5ag6j6qhi3A
         SMoxVeVhrMxn5hOTNrz/awZQgmzUElkVxD8XZsYcyLNh589GYtSkZSexeKvR9YKTkIPH
         GneTV9GGUFvkbDRNpTQylQMAbOYg3nK4wZBz/S8c4q2rCT30ja6GmqQTNPfqdFJL4iEp
         GDWfZWTimWIxLVNlUFwE/YPjRyJotn5Kabaxj0ei7yT0ce0PlFsT8nppikLJRIpQz6LV
         fxpd0ajsIunoVNrGL5kpJJsWBNQGsQ6J74phT6f/w6snsQVg0mCfIk9/VGdgLsbH5lum
         JzvA==
X-Forwarded-Encrypted: i=1; AJvYcCVIY5xltY4YfK+QIuwWAXcIpTxErILmKX/xeosI0rOG6SmL8b9X1bJxuGqVWQt3ZHOaT7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/pVOqazZXFEq456PCpChfihWu8L5qauW8pLR9rK98ZY+zBpZg
	slUdErWnntyO39xzVdukKR8haH+rop6Og3FtdBYY7xuI1pL0MBhK8q5sdL2y8Lg4M98=
X-Gm-Gg: ASbGnctmCE5GIvuF2KXYPdJc2N98+IcQoKyqkOoRHhK43zV9LtSi8pq0sKRqD1JD/6z
	QrnxHpZr8xker9HXUpLlacHJSPuFbwRE9xAkvAk2LBqY0lVGfa+zbENA5n1MYGS131bhgvewtHR
	CXRcG2UtBczm/P5FubH/4M4Mc2UXE+bsACTIF0kmEZ4/zZ3AHZ41QZSJYi3gXI6e75rmBPuvOXK
	MVi/1JenPm9bo3b1ZzEeBsm0Ez0gV/ybi8KPaduMM+LGIXqhdSbewOcPWrP6Bq8XLUqkIhGZgFv
	r5dU/FIy4tA7LqDLriqZS28jrf7TcyAuUWY6h/VQvkjfCBwO0uYJg3EJYVsIFcAF3iFM3t4=
X-Google-Smtp-Source: AGHT+IGOtNoadr72JztV6ZhAT+ubSCYHDknKz2gb1C9ZO0My9Ib2KVUPVReo+n/L60M1Q/VEFy9cMA==
X-Received: by 2002:a05:600c:3587:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-452013ab6b1mr159226445e9.15.1749543127060;
        Tue, 10 Jun 2025 01:12:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: gpio: convert nxp,lpc1850-gpio.txt to yaml format
Date: Tue, 10 Jun 2025 10:11:54 +0200
Message-ID: <174954311123.28634.2017679231712927757.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250602144259.944257-1-Frank.Li@nxp.com>
References: <20250602144259.944257-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 02 Jun 2025 10:42:58 -0400, Frank Li wrote:
> Convert nxp,lpc1850-gpio.txt to yaml format.
> 
> Additional changes:
> - remove interrupt-controller and #interupt-cells from required list to
>   match existed dts files.
> - remove gpio consumer in examples.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: convert nxp,lpc1850-gpio.txt to yaml format
      https://git.kernel.org/brgl/linux/c/114ab5afdf6640d40c8982170ea78c127c983dad

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

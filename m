Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21CA13E3E5
	for <imx@lists.linux.dev>; Mon, 22 Apr 2024 10:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713781528; cv=none; b=XOKkLeAvYIx1S6zHQR42W4sZwoWXwvOobOiNePCm7FHZ6PX6JHsYaCvGcu0su6q4x7PM7erJwwY+Zty2hPTQCLbV+Q1HY5dn1WzqnyeT2vX1wilvtHyUCdgRsH3D8tXD/L1tN6PbtjqTH+5EgQIE+RZw638VjAikKqbfkzOmxKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713781528; c=relaxed/simple;
	bh=jJqY3EzcXGU+nKakTn7MTvOCbow73aPwa+neDvl0lh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XsWkWl5FO9n98JuvRxT2BY3sch9LhT/S3EtB1pITqjdT7DtsdH0J1rwUURbsOkgNzwxTmcrwHmqoiWHFSTige5ybqog6XKPjphDvL9q9qHAwUFZRx7NRJUnZHHP/A9/WoZ8ZJMNhYxMXLmnVo0ZW+i6BMQJMx99pwQjzh0gZ7mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ch0xaLnY; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ch0xaLnY"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a52223e004dso392211366b.2
        for <imx@lists.linux.dev>; Mon, 22 Apr 2024 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713781525; x=1714386325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjOFtSdcuWQZYN13n2HXTmueHu30sawDV2mP2f/7YqE=;
        b=ch0xaLnYeQ0FN5MB1rRIn/lKLMRJGTzZ6rDnXT7VokWeib1pSxgaMjmsmnBqzbWL4Z
         AlEyVO7kcROHmZsDbXFXfbLTBxFidIlkStRREuavLkqdoXG50OEVZErbjS7+YKiJSaQe
         XiJvvLNW+lqJx7Itu+ZelhjJUZldzYJ8Nl501WNghaTK5aD+j5tw3AxqLUuPoDFQkxQ7
         xfKgnhMDdqJjDKk9yVk7FQyHuwZrJjc5Zg/k2fhuOTdYFa6u8slipFN2ZxEWMKaNZS0X
         zEFbgpm18mrs31S6greI66tSOnfsQc5mXYkcEbNHYrfJzI1ZqvOfQSt4TUoWSthCISWe
         0RjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713781525; x=1714386325;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjOFtSdcuWQZYN13n2HXTmueHu30sawDV2mP2f/7YqE=;
        b=Pv9nldpyh3Rp/1N2+/ZQviiXJVDylRD7tmdd0C/7FMda38N2brrGCZ6O8mFV8UPHwd
         IQ7O/jyQ5VOHvVYhSRsEA/84rnTypFlwW28l1FyuiVgmVnMX7X71Q9/4vitd2AaT3ezV
         UT5jxCwkv6Mjgm8Nt0bF+d0JMB0HaS4pQrdE+9dnoF1b+CSSp8FI3SGkJPXQF67MFGHv
         zPuQJRQH4v06vSRCdXxw24qrcRoqzip3GE/r+9LKcQwscsmd88a+vduo8hT0UGnxVh8Y
         FtH+cpKYY8E3iMmaIeHZ5nBi1sUktAeYRp/5041tokgCyPxlHxSDL0yx5ztD4T7LRloW
         Zh/g==
X-Forwarded-Encrypted: i=1; AJvYcCV5D0Erx4D2+Xfj8C7zF3Je8XyJiTHBazgSWYHn09CPKJrRb43HfUzZaHCGnkDd292L7SIfFepHQXaC6HYlhPjRKjMc
X-Gm-Message-State: AOJu0Yz4QjK4UzJ2W5RD54NFYuvbD48k+nPfwmjhA/xMLpTRHTAjBi9p
	tbIyoy1ng4CMa9X1v9/Lsm55Csow/QBtLISkpQg6BmP4fOXGuzJsjBdGP5LJqPc=
X-Google-Smtp-Source: AGHT+IGJbFE/xk27S/lBooXeZazvrQf8V1BxKpteLDJyf6SzZbXaMCLpiQbsqNz9JHTqiEI/1HgXqA==
X-Received: by 2002:a17:906:3ad0:b0:a52:57a6:2f45 with SMTP id z16-20020a1709063ad000b00a5257a62f45mr7820235ejd.21.1713781524763;
        Mon, 22 Apr 2024 03:25:24 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id k18-20020a1709063fd200b00a524b33fd9asm5553172ejj.68.2024.04.22.03.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:25:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240401-imx95-blk-ctl-v6-0-84d4eca1e759@nxp.com>
References: <20240401-imx95-blk-ctl-v6-0-84d4eca1e759@nxp.com>
Subject: Re: [PATCH v6 0/4] Add support i.MX95 BLK CTL module clock
 features
Message-Id: <171378152318.2944518.13528932834119248200.b4-ty@linaro.org>
Date: Mon, 22 Apr 2024 13:25:23 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 01 Apr 2024 21:28:14 +0800, Peng Fan (OSS) wrote:
> i.MX95's several MIXes has BLK CTL module which could be used for
> clk settings, QoS settings, Misc settings for a MIX. This patchset
> is to add the clk feature support, including dt-bindings
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: add i.MX95 clock header
      commit: 977b07f769970aec97b907cfc93fb681ecffc9fe
[2/4] dt-bindings: clock: support i.MX95 BLK CTL module
      commit: b773f5ad2bfd2d00bd2c5ea7022bc5b86d23a1b7
[3/4] dt-bindings: clock: support i.MX95 Display Master CSR module
      commit: c6e87b066756ec4b3f5f9061b508f3bd724ec652
[4/4] clk: imx: add i.MX95 BLK CTL clk driver
      commit: 5224b189462ff70df328f173b71acfd925092c3c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


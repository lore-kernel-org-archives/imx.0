Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9CD4078C9
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199880; cv=none; b=ANk8iI8dioMWOOUsIKeV1556D/SWzdW/sA14pVFF+XGxxbkRe+Ip1ZhTurXhJ1rQ2lux0KLz+mZ9kcL4OTXgbDBJSbN5WHRyLCL0aLflL40h1mUwU44YaYVWgXgaH1qdr6cyO5cm5q7q3qHRVcLcwzBbftHJxRdANEhVdVrny9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199880; c=relaxed/simple;
	bh=zBdK1iiFDwTHqOyTQyYg4l3HxFz9CENCyVT51LTKz4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DTV7B7PjGJFxnD2TrYVnRvP7chHrHqLZnPbNEeWLWfRqYafqfHB8TNJPH0AMg3T+lqqeM9vTaAfVTiwN4tU8cebMo16vOvnPbkgF7YrmZBjaGieZv8k8ebutRvC7wTvV+Dvbkm6G8NZ2pfiwfoqUmOD7CXiZnojwUPN5YpLDDCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Xhm0llmw; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Xhm0llmw"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so59719a91.2
        for <imx@lists.linux.dev>; Mon, 31 Aug 2026 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199878; x=1788804678; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYKJ5VPlv39onDgpizRA6tuCgoTPGQMQ0bB2xHAAOlw=;
        b=Xhm0llmw12Z1/F3RUMCPzX4ULlT2l81r/vOIYxbHh+pT/e6qsEBJLfSLPc9h/BzVNT
         0aVOI41NmV0HN2i134uU/WFfDw7j7gaUPneK24Y/DlA8EbWN+eBT2kQD4cSRGKugZniU
         WWsA0RhnCj3tJz6gg54gqPBX4CYuu87tgYuR66xgYkl2EUJmCG7sZWVS5ORXblaqC72l
         cQpCjLB/h+MWQwHTMbB5vsGn7sQL5W+xAXoLJdzFdKQpcsOEUMUcedlm75CL0drlyIfV
         /Lnj7yrgPLSW0LO1TIX+FkbiUZYCIYDEIKcLZFtZidvALb4z5s3c9nb1k+Cf3Uu3992K
         J6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199878; x=1788804678;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYKJ5VPlv39onDgpizRA6tuCgoTPGQMQ0bB2xHAAOlw=;
        b=pznVReoDPXSOFeF5Ds3vBVHSQptB9Hl1TGFUr9kDVsqwwjdt6VI479XljHi+j4Bjyf
         cE5fKPBjeXDxISYh/vux8QChz9Ic8XCQ7Va7jiNfnws45SSoX8McK8V0ts+gFeCr0i7J
         A8BvWpntQ7wOB+fu3kyHcloVEDne0ftHzIIc8mWH7sUe3WJal6rIb7630GB/4BvW5fSl
         S4xEPS7RGwmO6WVMaMY4nFcDlhD9+qOL/CPPlnaJzkvtlpn/Rp32I54gsTTCGXtx10SU
         TLk1KhZSyNK3wD0/0jezetaP0EM40LDlqSjYYHeDbWrQdD3yWP6c+M2D0sJDYVCIWbnS
         3hIA==
X-Forwarded-Encrypted: i=1; AKwUvByQZ544x8bxFKbLjUAXlS3sivIM+1+P4uOlxKhOW4qMAoI1oGfOz8xqcmw6OgQVOxCO2/s=@lists.linux.dev
X-Gm-Message-State: AFuF++m/zvD1G5WbDBM8dNVRcZbCQWrxaYX6/rKY9dDgERxPskIHfJdT
	TTY2hmwTajiQkGyXxwawIA1YTznqGv98GkjM7V2WL08x1jY9t2A32Vf5oVJjwfslzAQ=
X-Gm-Gg: AYBFou2yCQBwq/+XSwpZoRMalTB8d9O3U5RbfxpFudNAqe1meiWviYBCUV3yHgjuUsD
	mdedSoo5QQv0x5TeCI/PEBZtR42X2grUCw8NihjcmDvjGWXSnSZRv4okcT3I12g+pTseUSLaVMq
	DvU0d2/Zc25sa2Hh9AScwbIwc9dMAUWjObJWyG5pPH5T9G7KEiufx1R4zupzhcI6onpTV4QlOT2
	lAFfXG2vJQ/SGjqElwgx5jcb3Xh/4vBTlqyXqiZW6pj2dTQdiTH/aKTc/Wv587fc5k98NldbjNj
	HJF4PFtGodGGa0WYODPhO75qovxiFgL1MpT1kcGawEW2Ry/HUNwrrGXIGnFyDzE+CiNiNrDaHd4
	I9DWhBBQzuo8bLNAabQNR5d9dmjeYXIBYTSSxGXD9/PCXRH3+Vp3wGgzU79FImQCYoRrzXc0Doj
	noHUel+GFZvnlv7OtvClNjTiYY84tK/Ndp3LAlyJLXn+n4HmzRkacwz+geXg==
X-Received: by 2002:a17:90b:4a8c:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-396d0f69d10mr34762737a91.13.1788199877917;
        Mon, 31 Aug 2026 11:11:17 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990baaeec3sm863336a91.0.2026.08.31.11.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Peter Griffin <peter.griffin@linaro.org>, Roger Quadros <rogerq@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
 imx@lists.linux.dev, linux-omap@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
Subject: Re: (subset) [PATCH v3 0/7] ARM: dts: Replace clock-frequency in
 camera sensor nodes
Message-Id: <178819987707.2869653.6455595386601883422.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:17 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Mon, 10 Aug 2026 21:05:57 +0300, Laurent Pinchart wrote:
> This patch series contains the leftovers from "[PATCH v2 00/72] media:
> i2c: Reduce cargo-cult" ([1]). All driver patches have been merged, but
> DT changes for ARM platforms were postponed to the next kernel release
> and ended up being forgotten.
> 
> To refresh everybody's memory, a large number of camera sensor drivers
> directly use the "clock-frequency" property to retrieve the effective or
> desired external clock rate. This is standard behaviour on ACPI
> platforms that don't implement MIPI DisCo for Imaging, but usage of the
> property has leaked to OF-based platforms, due to a combination of
> historical reasons (using "clock-frequency" was initially considered
> right until before the introduction of "assigned-clock-rates") and plain
> cargo-cult.
> 
> [...]

Applied, thanks!

[3/7] ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor node
      commit: e74a8fe7c2d85e314ead77064ea671b71de44b14
[4/7] ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
      commit: 3da3c1f84d4f1d14d321ffbec742d4027b503827
[5/7] ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor node
      commit: e59ab4d7eaed22ba714c57801262a09ac1c32100

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


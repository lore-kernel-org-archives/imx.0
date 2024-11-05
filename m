Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40CC1D1F76
	for <imx@lists.linux.dev>; Tue,  5 Nov 2024 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730802050; cv=none; b=nvb0QRhAuiOUr1JSUKU0KZeuaxWqJYFWDy8f1AePqrAXhfHZ/vpbYhhDvoOXsTuC8Ep/2bjYD+6iE0sbSCvu0jKnponTO+If0Qy9r1hjhBHULhy3ljwHr1hLVeolEcEl16GPScdlaxjzByXqxrhe7fP1GFeDrnWPwXEOVm80xYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730802050; c=relaxed/simple;
	bh=n1xZDNUqhbesFuiMzQ2YOyPMXWGrOPosEm+4pCyIEIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mHcUcHNVfaw3flkeuxi43b+5VNJBUx8qydT43cSAJ/z7CPK6cKEkMpJ0FtoImB+KDf75UufFwbESUtK+CY0OGtrwNOaK5N6wh2RpnQXIxj2+S9pgCr7L/MhVic5+OOoDBy40oUF3URNu04sdA9Us13VDGHq3ornPmW2CfewyHV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a6r2kEmu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a6r2kEmu"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so44427935e9.3
        for <imx@lists.linux.dev>; Tue, 05 Nov 2024 02:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730802047; x=1731406847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6HBjokQWj4T4+WepKSLqPJvgW6DqwGUQ8oY/ZOD6S8=;
        b=a6r2kEmuliWr5IBEXcts2sDtFhpwtupkZ4azYZLRwTCtcvMSgfP7aLDuxKcjkbev9g
         Dboehszr7Uudim9UkzElmjvZYMoO3iXYcJQZwNfgMsW1FGp5Y5tkz+I3Lr4no1PRu+DO
         ybaVQPvzZwDx5DozK07h75M9L1v/8VHUOikWMqzPKTuD5g7f1WEyAjF5zGNjV/hTrg95
         v4FbeeGTrudhjJOTjvkbiD4EbnShIZp5We3XmmKrKPolFitAxyoaMsW9bemmwAD1ZD7Z
         x+PftvWBpt0IW5tmmB9NRfRV3X1l6eCEpN4dwr2oOZBaVS18ryIGZN3ecXETYA3n9uh9
         sr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730802047; x=1731406847;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6HBjokQWj4T4+WepKSLqPJvgW6DqwGUQ8oY/ZOD6S8=;
        b=A63SoYYrTLJggHFYLO5BGOMD5dQvimrIOM0IOkS73iDDttCLRwYlG3awlq1qmP23i9
         XXSuQRip2eHCCZkB6leMqb/xvwaUGxxTvVN0tSb0Eu5JjFwP2/BLnYHCszn/ogBG66yq
         dAA+1V0wFUEo9GT7vpukMkvkGGE8ruZot+evdcPLuIBDQLxW2/Sm6Zx+jXfJa5bau3H7
         CjVhnbdCWil4JFIYFEEXBtb98cAa4BsSs4p0VGcE2IngfQhkbpLyRWKhOWcX97zSGqUM
         3XqY5q40c4aeANnEid9oT1Xr2/Ayoatc0Cmby8NhM69t/9MxITZXL8nLtEH90fXeyn6f
         i1cw==
X-Forwarded-Encrypted: i=1; AJvYcCUjmV/z5chTz+67Gn4DzJIjqmy6VlmIPPHbIUqWZs7e6zV+OIfljLo/wRDzbs5mCJjgnE0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzS8fHOebotk/umjbnY1O61xFIDGIWq1Tk98GDr7C44sawDYziO
	Q4kMY0I+izqYcFmCfyspYpV9E6PewX8LPdAYkdUIzHzjxdyrWl0voOQ5m4U5cGg=
X-Google-Smtp-Source: AGHT+IGiCKZMB9E+p4Rzra+IUjFqsLZgXkfliq+gY4mk8e94l3nXR/6qBBzd8yl42Q8JhaJlQ14rrw==
X-Received: by 2002:a05:600c:6046:b0:431:54f3:11b1 with SMTP id 5b1f17b1804b1-43283297a21mr128723995e9.34.1730802047103;
        Tue, 05 Nov 2024 02:20:47 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca7ebsm213412005e9.42.2024.11.05.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:20:46 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: krzk+dt@kernel.org, robh@kernel.org, abelvesa@kernel.org, 
 mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, ping.bai@nxp.com, 
 ye.li@nxp.com, peng.fan@nxp.com, aisheng.dong@nxp.com, frank.li@nxp.com, 
 Pengfei Li <pengfei.li_1@nxp.com>
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241023184651.381265-1-pengfei.li_1@nxp.com>
References: <20241023184651.381265-1-pengfei.li_1@nxp.com>
Subject: Re: [PATCH v6 0/4] Add iMX91 clock driver support
Message-Id: <173080204542.1890849.11473057431035200273.b4-ty@linaro.org>
Date: Tue, 05 Nov 2024 12:20:45 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Wed, 23 Oct 2024 11:46:46 -0700, Pengfei Li wrote:
> This patch set is to add some new clocks to binding header and driver.
> 
> IMX93_CLK_END was previously defined in imx93-clock.h to indicate
> the number of clocks. However, it is not part of the ABI. For starters
> it does no really appear in DTS. But what's more important - new clocks
> are described later, which contradicts this define in binding header.
> So move this macro to clock driver.
> 
> [...]

Applied, thanks!

[1/4] clk: imx93: Move IMX93_CLK_END macro to clk driver
      (no commit info)
[2/4] dt-bindings: clock: imx93: Drop IMX93_CLK_END macro definition
      (no commit info)
[3/4] dt-bindings: clock: Add i.MX91 clock support
      (no commit info)
[4/4] clk: imx: add i.MX91 clk
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


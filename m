Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56F124FC16
	for <imx@lists.linux.dev>; Mon,  3 Mar 2025 17:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741023065; cv=none; b=mWO/+V/UCZnJKfRTYLQSydcVMLXOl0VEsuX8i35Xn8ABCmqD2jqS27jJOsHbhVoFz3VYy6Dh9zfQ8GO1d9wRi7Nv1QcYrFSGe3tmYAGQePlHskn05hEyqoag8AUi9KnWBoJFUFjJGIxIg5J48QgYXdYK/yKvrZrE9NKth4Lzd9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741023065; c=relaxed/simple;
	bh=EwUNeYrjXw4Abxl4Ekempi49OOEBziqDKshlyOT2j2Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=de9EGqg2Tz5Ku8OuV2rwvKk3WQIqDZ3VT5Lw/q4WCNLQgTmIfZOPBdXHP6bAQvVpBgjA52zAgU7jYBgcRGwqHb0+BFXpVGUI07cuKc2jPRzaX8HBFbzhWxZ7YOAE0EFYVR4Pu8N6P2zzkms1l0XzkPu/MvXxMM9aPjO4DMJqy80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=geYFkNtf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="geYFkNtf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abfe7b5fbe8so168504666b.0
        for <imx@lists.linux.dev>; Mon, 03 Mar 2025 09:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741023062; x=1741627862; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tn2H88qy5fJsuv2JITum7avWFZmr0OiLNZ9SxsUWXM=;
        b=geYFkNtfTv2hThnHTvFJ8rHVxjYHU5i4veP9nzrWlPzH790DbqBePcuqpGU9IcCJeX
         nHe3STZ8+2K6tG/Bc/JeICH00D6PHLBPFp3qF3H2Y5vukjuIPQvOgup7DDuPRMgLEeAJ
         wvCVygV0CMxDl86n8qUGV3a1OQn5l7ZuV9wxiSCkuRIc0XBLd0ry9+7qGvruE9kxf2G3
         w6UtnO/e4H1c4n5TnH+5bExVn/MS1JyPPP7pfXVjhd2e1hu2W0NZwIWP/8eVKlCFRTdu
         dTZMft7o9FRI5ESAawWnS36o5Ykda+b/kGSKBUxlZbaMY3ZFNgHpGZF8f4HWwFysN1Nd
         jqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741023062; x=1741627862;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tn2H88qy5fJsuv2JITum7avWFZmr0OiLNZ9SxsUWXM=;
        b=lj8Pmyn4vK2slYw0108IYP6WS7V2CWqsTn9A7qvNoBhDpCLqRaTwtQQIFY+aNMRsaY
         zS5MbA78J/znDhPuDjW4Qdj85xEbjXSSx/rjuOqlRpWPeD4BYUc3iI41TBBTcdj3Y7rP
         HaVdDLqhAwpKIHTQMRjOzmicwXg2iZYzeJPvdUFzu5RV4zv/Ah4QzrTiTicxFRb6ZFM2
         KmFjUNgSGXE0yu+8zoTydsE30YpeTW62GsMHnzgiT2xyrG6q5R+XoQ4C4S4t7D6Yf8Ss
         ckW6qRpz5haptprO6wdoUPK87kO8DpR4O5+g6FWyBcGR7DWTN7f24uO+Qbcd5Rw82Sin
         EauQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYi642HSR5G4fABr3A9uiXnHUd/8BHrPrA+IbopKbvh5AnOLEBNKrDP1APpjLQhpHMgZg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzC4gOnShyc7wPGcS7gGo5435z7H4dYkNZE70WgQV0dpih2/lY1
	xAGU1FKCztx9UP35S/zskcScaT1SQkuncqNJWLnss0WgkvzzfYBp0Yo/uNY+7h4=
X-Gm-Gg: ASbGncva7Qlzpkr1shAc6WJ3CTAkWW2lxA8wmmHI1TzKHDN8KrmdMbNuUHKTeuB6QuW
	RH+lXHI7l3kkfvZE3+XHPq4qHqGWWtHWukjZupuibm4fljO/gDtjnF8JgEGoHCgpg/ot43UN5xP
	WGl8TYvdI7+8Miuz3fO9vPNdp0awMwydo6Q+JUn4onR6WuxnOIArMViCfTNBkklN1A3v9Oigmu6
	mUvXKOJ86hDkOAxVvZ28ujCwdIe+YBabAacaIocDloIYa63fT1JZzD3NgeKrkQFwSnuHzYPWHDr
	kqMXeKI5lZwWMxN5Iyg/ieaZ8VUthduUMcagREMHIcU=
X-Google-Smtp-Source: AGHT+IEDCHbXJFeVr35xZXSASXjjlWalAgEpW0iSBToGQqWlsuonpEUcEGYcVr4M4CEdy1EY0ZamnA==
X-Received: by 2002:a05:6402:42c8:b0:5df:25e8:26d2 with SMTP id 4fb4d7f45d1cf-5e4d6ac58fdmr34237245a12.5.1741023062067;
        Mon, 03 Mar 2025 09:31:02 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6d26esm7085355a12.20.2025.03.03.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:31:00 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>, 
 Stephen Boyd <sboyd@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Adam Ford <aford173@gmail.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH v3 0/4] clk: imx8mp: fix parents of AUDIOMIX
 DSP/OCRAM_A
Message-Id: <174102305899.2928950.8837177294161174759.b4-ty@linaro.org>
Date: Mon, 03 Mar 2025 19:30:58 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Wed, 26 Feb 2025 11:45:09 -0500, Laurentiu Mihalcea wrote:
> Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by setting
> it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT. Additionally, set
> the frequency of AUDIO_AXI_CLK_ROOT to 800MHz instead of the current
> 400MHz.
> 

Applied, thanks!

[1/4] dt-bindings: clock: imx8mp: add axi clock
      commit: 2471a101938b0d1835b1983df08daeb98eef1205
[2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
      commit: 91be7d27099dedf813b80702e4ca117d1fb38ce6
[3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
      (no commit info)
[4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


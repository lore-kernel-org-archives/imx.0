Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471E1A0BE0
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729607784; cv=none; b=X7pauzcSEPXa9Mjy5oZvK1zgXB05/dYc8iHQb5KHWGQqggBeRL30Sn5daGg4lYE0BYyRItQS/Li9LukWvr9YepfuXgXMVoQeQjjbYpiEOK2QfolRsuLObAubIxOFpLf1tCohuMKQiInru4/rZAD/uR2WMUDI89P57bgehLzS62w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729607784; c=relaxed/simple;
	bh=XPTt/DRcxaXM3jq+HjKo66FdsyRj2Gi2+pHUZZljpsY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nAyOb7aw6sfTnmdHUJ/7k9sEDQq5yj6V6wu6Mh9u/i/5wXU0A46E8dT4rCU+25YshlfodgsOi8wAJLimr7q8u8cSFn2Y3BCK7pNdhxvIq0hZFCdZGj4IaoeTx2x3APGX/mhn3caN5M588aO+Yie3/PzAW60ny6prde8zVpQ7eA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XNSDEYnS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XNSDEYnS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so4225971f8f.2
        for <imx@lists.linux.dev>; Tue, 22 Oct 2024 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729607782; x=1730212582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrUWXWfzIj5zJMMGxBfqh3qOh40//ZAdcEGnfXtiphw=;
        b=XNSDEYnSDd93wHVOYnNpo8wLdZ999p5mLoo7tfKRotwnjWsZcjQ6Krxa70E+lxwIO9
         nNoAk6mIi3BNY0vIv2ykKekoJzZgIH9by2fvhNx8Nkbmw0Yws+CVnm+feF9CH3Pz1E87
         CNPfOkt7yfBzkczKZD1IBLy8eM/x0K0zwUH+3jYaWChonWZNpvm5apc0T/tjfw7DuRoB
         fgz/MWmd2hvo9qi6rtfLMcTgz62xdy71OxzdK214W8bmou3qEYNFgxcDzchEGLafO4Mg
         phL8F2bvTATMfdVw/KZmYT1wwxd9UPNYKQv3/zHn3VtjAQP3Rec3Fts0AbYVL9O+1WJO
         eCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729607782; x=1730212582;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrUWXWfzIj5zJMMGxBfqh3qOh40//ZAdcEGnfXtiphw=;
        b=mWTfBVr1C3ogGkbMgeBe39vzhMnsHoXWO6HqbUTGTxeR4GxyfISxJrU2R1B6kcpqHu
         McF4klFHxwH9uZL7YDr12ep4Suv06Oaiy6Lw8cvmf+U7McUV5w6L5ifYb9RuvVEyq309
         19n4tpPFNuUj8yTYS0QL6nFXeRFsPnKXKa2tSAAc240Zcdxi//WHa7AEYryUB+Yn916i
         0D0YUOQqZ0lT60jzMXKj95G/0FjI3RatvueGW5l2xqeLlYmCnuk7Hd5estx33aXIfW25
         qI3JhB+Yk2PABT1VazXl7i5RgLHqNJ6SZIWYCnI6n9w6fuEE63HRtqSpW/xkm5w6VV5x
         k0fw==
X-Forwarded-Encrypted: i=1; AJvYcCUuPbkGy1z08Flnp0OzP2dgdQUVY00dp2FgqjZFZDvaTokWh4OPIdpiSfG781JJIUrnOl4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjOvfQCe99QoWnnrRm0+VjYeuGEDerry7neU5DIBVRlAZ7x3on
	9+KqqcZ4VpBFjN5rmDbmEfqfjln8G55U4gBPwy6tWpLMMUlQOf3LRu6JsJX7WT8=
X-Google-Smtp-Source: AGHT+IH1gDK1/uDRHCxw8RYMyjPcimj1r1WhkfVOpVJ9j0PYqU0pkA6VBIa7LJdkDoJQNlhbE2+Oig==
X-Received: by 2002:a05:6000:c85:b0:37d:4e74:68a with SMTP id ffacd0b85a97d-37eb5a59780mr8701399f8f.46.1729607781629;
        Tue, 22 Oct 2024 07:36:21 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a47caesm6723587f8f.28.2024.10.22.07.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 07:36:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
 sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 festevam@gmail.com, Richard Zhu <hongxing.zhu@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, kernel@pengutronix.de
In-Reply-To: <1728977644-8207-1-git-send-email-hongxing.zhu@nxp.com>
References: <1728977644-8207-1-git-send-email-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v5 0/2] Add one clock gate for i.MX95 HSIO block
Message-Id: <172960777824.2281007.10515356955760469298.b4-ty@linaro.org>
Date: Tue, 22 Oct 2024 17:36:18 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Tue, 15 Oct 2024 15:34:02 +0800, Richard Zhu wrote:
> REF_EN (Bit6) of LFAST_IO_REG control i.MX95 PCIe REF clock out
> enable/disable.
> Add one clock gate for i.MX95 HSIO block to support PCIe REF clock
> out gate.
> 
> v5 changes:
> - Rebase to v6.12-rc3.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: nxp,imx95-blk-ctl: Add compatible string for i.MX95 HSIO BLK CTRL
      commit: 731237359d83bfb4f27eea5b7a8935af5c72a5ac
[2/2] clk: imx95-blk-ctl: Add one clock gate for HSIO block
      commit: cf295252f0d88410d5793fa6db56a7192a65d66f

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


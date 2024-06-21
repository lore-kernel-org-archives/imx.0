Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6F11534EA
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 06:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718951242; cv=none; b=szRdx3fwx6A18BucvULiRunQosv9y6+rq7lyaytfYtemAEhwv7OjlpzY87++QY3sgBXW4InqgZwPpQQxlaiA7RHCKcFUBFCrs7zzDMsvd+OrdV1Xl/rLzQhxMQgge+iMd79ZmHmPGKPvIvBCRBQxDVLRyRMWTDf8JZC7cLoJmQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718951242; c=relaxed/simple;
	bh=O6MjZswWxwntHXClsDM9YbpgAlLq+nr38VNJ9W/j6i0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Nv5V07lDz/kVdzqQiw+Z5vydyYCpJNd/tm8mODUC23TEivPsPsZh26O3GF4GN/dyh7l2y96eWWnDRfqSb5QsWYZekg6CeXyuJTGRFTODwpUvrWtYTvyHDaW+3dUqxLrPluYKmTV3emwIAzBNZEDj9H1zn5Yj0RF56GRA7EYVwKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWK/LdNb; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWK/LdNb"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57d20d89748so1542554a12.0
        for <imx@lists.linux.dev>; Thu, 20 Jun 2024 23:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718951239; x=1719556039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRT2G8wEhc6dH4aHQrzIOLEXVG/hN2dtlzKi2u99ZHg=;
        b=nWK/LdNbceTogBZrXU/84ZuIf2DUnNaFgbvlqxfQS4ST+E3INV1WeGN0YLHNdoiZS0
         PW2+VQ6egVm6r4vmI0LgGPESP9Sf48/2PV+UbSSiYjpqvFNQ1KW/tepAI6M15xj74eCJ
         FzVMBeqhgLqLaguefaKXdtjwBTtrxb44T/4juYFarRkzsULsCS1ITE4JnQFk2XBQUShJ
         JuGK2zoWYfzDBbUQo8NvHlNefkZfX61P/f6QDUnCY+hcfkDrtVadeDO7YmWno//ko8/c
         Y5oqoiGPeHtwlMzOmPJ6YE8mtCAoKyRBHXTRwClrpy6siPkVhpgZD+OhYqTLl4N3K3e/
         saUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718951239; x=1719556039;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRT2G8wEhc6dH4aHQrzIOLEXVG/hN2dtlzKi2u99ZHg=;
        b=qaXsLjdVvqRmCRsSxHqfdXyxCkGSyoYKqonUdOtitbecjGMwiMSBe6HDispsBdCzHo
         axunrtri2q0hKAWvbitVzr4PkjtO1L+BCWncGWsZdVnk+cdptoxFgP0o8Shgj/6Bkbnt
         MDAV2v7w1zEOG9ytcylloK/WBjMAo14qXZRNSYfsurecB4BVzYBw4Nj6okuSd8I/nkCO
         2cYiKKrU4GRfhVcM3t0Lx+hpl15NhzMJfy681K2JPUjoqx9VPFYtZqY3WcibL5/cPAQY
         Cy51AtFLmF/ImCrwjKUhPdqgpWjFAng6HqiKevsP2ZoRYugTiT+5NcHLde8HdAiU0hz7
         F2lw==
X-Forwarded-Encrypted: i=1; AJvYcCUCJi1OGgZ5PXeAc16gbdktPyRF3nY2i0lIe2wJcf0ECTalgSZK3XZII5oG4FXcRUsIgDgSZAYpjAa1R+bRvbnfg+o/
X-Gm-Message-State: AOJu0Ywuua/xR4OtoNvxnxFsb3fzJ8+QDCW4KLEwDUrtlWmCmnhiTNk4
	9WjA/nHbdLOj7TKzcMemRXdx7Qt/f59mtM5phlYWS8uXz1WpTyETztHuHti/HUc=
X-Google-Smtp-Source: AGHT+IFAv88TzuxiL/3SxR316E/tKMIQkz0tc9LuhcKrKV31IpsJ52gkEFzP/J41BcbE1yC4bD7EVQ==
X-Received: by 2002:a50:9ee1:0:b0:57c:abf9:e6ad with SMTP id 4fb4d7f45d1cf-57d07ee3198mr3680772a12.42.1718951238856;
        Thu, 20 Jun 2024 23:27:18 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30582262sm470860a12.94.2024.06.20.23.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:27:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Sebastien Laveze <slaveze@smartandconnective.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240528151434.227602-1-slaveze@smartandconnective.com>
References: <20240528151434.227602-1-slaveze@smartandconnective.com>
Subject: Re: [PATCH] clk: imx: imx6ul: fix default parent for enet*_ref_sel
Message-Id: <171895123748.3617543.12435143750010864537.b4-ty@linaro.org>
Date: Fri, 21 Jun 2024 09:27:17 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 28 May 2024 17:14:33 +0200, Sebastien Laveze wrote:
> The clk_set_parent for "enet1_ref_sel" and  "enet2_ref_sel" are
> incorrect, therefore the original requirements to have "enet_clk_ref" as
> output sourced by iMX ENET PLL as a default config is not met.
> 
> Only "enet[1,2]_ref_125m" "enet[1,2]_ref_pad" are possible parents for
> "enet1_ref_sel" and "enet2_ref_sel".
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx6ul: fix default parent for enet*_ref_sel
      commit: bb2c2aa7db67d0e13adde59c823606eba7bb06a4

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


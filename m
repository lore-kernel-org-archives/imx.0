Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8E03D902D
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229862; cv=none; b=bmCDc0w7H5EhabI6zuGeVjoh17E4MmwsqOVqiDiq8iqeu8/reeZXgfSf0DAF12Gt4sSWNyIyP1dl3naQZUoj26Q0rBf4t03SO9wofNON5Ewr+SFdRKZnh6KOoRpHKBiDbl+qLEjQ3q182j+hx6cNgukW6vBacdaugjGwVSUhFZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229862; c=relaxed/simple;
	bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBH1AKT7DdEIARtTD5j3oKdpnkmg6z/trznJYOjLfEigDt8SsKC6IXOsgolkTQPb5c0lvBpeQQV85CXcv+leqEMupVEDMn6WzLCme5QK7rbR5ud8QPyEnxTIkMilh0v5IVYWO1sx9aFk64hD2xqQvnY2v4ySSH9/zpxxsGf/UyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wKI0066R; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wKI0066R"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b9b1900bso7585220f8f.1
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773229859; x=1773834659; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=wKI0066R/HmXtMUmG2ovOGCSICAVPxNKxEdGBLOGJJvNDysvRzd8rKLBvjc1c5+lZf
         iQmDjA+pbZ2rwX0N5Eglfs/5yvesOQ4pdwh71dCuX1lEKUotNlS78BBegsU+wWJS4jh5
         V1rQwUJwbTOghugXAqKYTzzQqb3BKhRH5A6ZIXjK0xlma+u0IQ3HiRhPsEt72oVW/iiK
         0tTTnn3tilvqVl3FszlmUJCOtusGNvTvMxUMyVmrmtp8iRH/u8xCQGIEQnXFLNguKxbx
         cEsMWu72Se5v1Wu3DvmSd/uyolYbLiu2igXQlaKnQb5Z9ivtDVTDZPRB44BXNjOe4ORL
         1AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229859; x=1773834659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=ccA1xdERVknHI+5Y8RChU3sDMso90cykQHkgwhzng3nwZ9x+9CO5cXmTZR+80uZ1Ra
         cvCICjho3Yg+7OWXAgvzbk3DcW8tR19fuZmD0deURFRbkaGZHlU1XwVotEyRw3+E7ZRS
         RzcjEVneuYNvI4evEyRx3cQ0RCXK56P2Y605LFL4HwAzkcMaDnaIShR8chVuuwIldlAq
         Zayi7ZQqw/PGZvL4HvCEw3OEgzhTHs5yYHXiepaS6aNzOdsbUPX4Q6/ovWHIXcIpZgrA
         BLwSLjt63cn6tLWvkA+Dhvb5Fa7fuZcuEXdqGQLq7Zsyl6MBhm4kT3sgPVigcqwY2F18
         6heA==
X-Forwarded-Encrypted: i=1; AJvYcCVVIltuC9TA0cBSjfe2s+ITb5X253TAtT5kOlBgcmVh+XpKJKrenKCLDX87lmWw8HS2ZiQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8BwMXPbTkoc/fxLdn8skMzHEH4LYyhfZA+oCNzWvCAHiabrDe
	pDno8GbtGy9ta5vJU2UFZTPDYD//H7zK2UT1oZe7u4HjkFQxetGv1vfEgmyT28RtIvw=
X-Gm-Gg: ATEYQzxQxYLX3YiT2EsU//LJDlLf/5DQiVorotcVczji9Yoo5pP2jvKVw8Xnhfh2NG7
	63AbxpS436ZBRe7hcZibaKA2LTWBBd/yGWeK4lBTbAgQsb+FlvjXS7NXcYR/yzbTgMuo2rMklR6
	gBefvs8LW7Nig+BDXRRBWi8JfaOzS0+7Oa5odngwJQ8cMaEqo25VN9LW77BNmzVWwgX0d7Qh7VJ
	hvCHngv84LuOHNlfG0CEulugLoudeQ80Roh78PcNjrPKCunR1SC4r7qGhXZFvcZDRG9AQIWpzaC
	4Fmg9RYHRarKlhb0beFw7QoGQMx3be65Ym4r9N2PQK6myqq0mnefLlLa0hG2gc4Wd6Rg9QoIVcK
	tLeKppI16rPm8ZhtoNK2ERnwb/KGFO4PlvwbHZtB1Uz2EUxK2oKY8ohLSGuPTF2kfE8VRQiQ7zN
	aRxsZVUbsmS1n6CM6waTI6Oa3dTFvw3n4=
X-Received: by 2002:adf:e94c:0:b0:439:cb77:aa6 with SMTP id ffacd0b85a97d-439f8222fa6mr3599215f8f.42.1773229858683;
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d209sm5881724f8f.5.2026.03.11.04.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Message-ID: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
Date: Wed, 11 Mar 2026 13:50:55 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi
 <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

On 3/9/26 4:38 PM, Brian Masney wrote:
> Note this series depends on 3 previously-posted patches in this git pull
> to Stephen for v7.1.
> https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/

There's no tags/clk-remove-deprecated-apis-v7.1 on
https://github.com/masneyb/linux

Cheers,
ta

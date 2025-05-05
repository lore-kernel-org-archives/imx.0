Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E57E1A2393
	for <imx@lists.linux.dev>; Mon,  5 May 2025 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431569; cv=none; b=TRmnUWegZEafq3K68S/V4vqblbLUx2jhH3srVV44j1OL9Jbdku94NeKVzU01QBJONfkgwX6akFgKnbV7JmJsjUFPFWKgTzHyzd3A7Fg0eOYEPnMcTz4pecZ5IeHwqzaY64psEC+CMTkC2mYkr5GIsPv35eKNA1KImQG59aA6qnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431569; c=relaxed/simple;
	bh=ZjSUP8jmlrb5+uP1brciCf5mZMhZ6YlpFsc/7NT/y40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDiqJltEqTW1536q/L9WR5JuTO/PaxJIXDJTKSUjaDUmR0zSOvNW2Qq1oNDqBM/CVLl6hchefT4a51MFjk2bAKKXxHuZvmVHKm2asofSlnxyrFJ+/Z19yJA2OYBqEtKrYtdrKhZOLzdpnjE0xiA6/GCrEzd+lJYQgVOYTxp3ytU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z57JZSxm; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z57JZSxm"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ace98258d4dso569628566b.2
        for <imx@lists.linux.dev>; Mon, 05 May 2025 00:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746431566; x=1747036366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMDm0qfjOuYWTzr0Xo2QLnRNDzdiZPn1MuFHomJVvBY=;
        b=Z57JZSxm1Hr//kRBgDcihWmDPXv/Y1oC7RxeIpywYRrGbbSAsINwO9kXuv0easUyUr
         WnDqcSbR3AdBKaL+mOctkiRHuWTiUjTUGR6QXZBFq3hSdEE+rN0GaRhow9tj6NYbiADn
         CGuuVUA92OT4sZfqon8qbSioksQ/Q0lNMv+WW0CM5abpof5kzdZqsynjze2b4sWXNhjc
         feni5zaPlhMrNBUdWPVoWmf6AxUuPoPuhvRl9ZHUR846ARYgKuEOOekfLNzvFw1ZJdBP
         1i8kboWpFhwTB6qxjX1StsTB1HcNpQtCl2G4GdLcu3b7Jgr+2eq+StM3VZwCudnhRV7F
         l8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431566; x=1747036366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMDm0qfjOuYWTzr0Xo2QLnRNDzdiZPn1MuFHomJVvBY=;
        b=MQ4zqukK4vpVdQ/o8lbJZeLPk9dpbtGQVP+Iv0MNvu++sCqWi4HRGpuEP2PHI+6ZVQ
         r3nTH9v9QWqx+BglvQS8KzRAM9PIhQC6ooT9XOI+7t49MocbOtt4WPurMX7Sz8CFgdPR
         7bWbZ3zfjq1zwnl6Mq/RvB1hjDkL30yAwSYAWkbB5ftnyQ51u/gkg8aQ6o04mQoPowUK
         sqZvkAVLW3p3wKVX09gseRHVsBwHgxHyIyVq0TR8t0K12Mgsq2qKjzUXr+538G8VHdlv
         7/jkOfp/SFhAA5DggKM1aQFp80KoBsdVTimK23oux9+EvrPM+Aqfthsr5+mtXICt6Ojw
         8Zjg==
X-Forwarded-Encrypted: i=1; AJvYcCVvhK6xfwbGtkE0gMgHRXDZ1xMbl3tPLIS8299s/14gWlmJZ9YPTvp8UbUqvtNc4gRrgfs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWjgn9MhGTUZWbw2E5H4mQ4uE2ef0appHLcWCNoaYPve09bAmE
	YpJfsmP7dDGocjKmkwDjHT+sW5EFNQzUQsjXckjunjMH65sFIgBLGT3iV3OGhrI=
X-Gm-Gg: ASbGncuREDsOaYWS03lIbbCYC0eoihC8flWi4ap4hFK7aGG5u1hKnPslgE+7BiZ/hNL
	REo9LLIFlD99LYlbXVrJytAg4R5auaqZiGrDyUS74pilpqG9nqe5JqtPaEmg2g/TdPmvsndKapE
	wIx8qkb4iSWTVpQanDvWNJ1NDbghNPYSmfqncyJe11Pr3VNF/l0MSDHPL3uiTb/lnRQGlM8+Dlr
	5tokKMOBsv43uBMINaWiE9TDqm55Sr24c+cIWPURs2y4Z1xxAL+k+6BfRlDNk5q5KqhzPr7XIfz
	P2hykZcatxoXefuesbOupJkg0C9SKHgkUC9rwTZA0hDyffGjOQ==
X-Google-Smtp-Source: AGHT+IFKn1amEuiEsrKWv/SJZ/kZTwDtb/a8ekD/9m9gKUzOyHca4mZtzNEFzhzpC/nVZriKwygVQQ==
X-Received: by 2002:a17:906:c08e:b0:aca:db46:f9a6 with SMTP id a640c23a62f3a-ad190858be1mr564437066b.59.1746431565639;
        Mon, 05 May 2025 00:52:45 -0700 (PDT)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540d94sm446544666b.182.2025.05.05.00.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:52:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: linux-kernel@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for i.MX8M PLLs
Date: Mon,  5 May 2025 10:52:35 +0300
Message-Id: <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> This version keeps the version v9 patches that can be merged and
> removes the patches that will need to be modified in case Peng's
> PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> The idea is to speed up the merging of the patches in the series
> that have already been reviewed and are not dependent on the
> introduction of the assigned-clocks-sscs property, and postpone
> the patches for spread spectrum to a future series once it becomes
> clear what needs to be done.
> 
> [...]

Applied, thanks!

[01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
        commit: 20e5d201b5d8f830e702d7d183f6b1b246b78d8a
[02/19] clk: imx8mm: rename video_pll1 to video_pll
        commit: 26a33196b5b68cf199b6c4283a254aa92d2aaf4b
[03/19] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
        commit: 2d50415e2457c6f6621c2faa3b01b11150fb9c67
[04/19] clk: imx8mp: rename video_pll1 to video_pll
        commit: 21bb969f608cefd8d847cf6eb50a193d9f1fbb87
[05/19] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
        commit: 2ba124053687c933031a6dc5b2e16ceaca250934
[10/19] clk: imx: add hw API imx_anatop_get_clk_hw
        commit: 17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8
[11/19] clk: imx: add support for i.MX8MM anatop clock driver
        commit: 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
[12/19] clk: imx: add support for i.MX8MN anatop clock driver
        commit: 80badb1d7264e83b512475898e7459f464a009c9
[13/19] clk: imx: add support for i.MX8MP anatop clock driver
        commit: 4c82bbe8b5437c7f16b2891ce33210c0f1410597
[14/19] clk: imx8mp: rename ccm_base to base
        commit: 1a77907dbbecfbe5e6a1aec28afd49a1dc184b7a
[16/19] dt-bindings: clock: imx8m-clock: add PLLs
        commit: 6a55647af3334f1d935ece67de4a838a864b53fc

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

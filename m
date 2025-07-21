Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E6288C2F
	for <imx@lists.linux.dev>; Mon, 21 Jul 2025 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753086295; cv=none; b=JC59vRcigpbVloUUgZp35RuB9O6QIptVGgXWcDkryt3DzTbva8dLLgMTmo9AIfIouKNmIW+0D11xTXBFcuoyNW6GMiT6Sqj25YOGqVjxsL4VD85tLcyEtIZsOYRYrAY61jUiVQi6oR9ppNiJtO+Q3vWataXO+4kOjfkEb9MJ/jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753086295; c=relaxed/simple;
	bh=GToabdAjteaGCUpBSIfqJ1avVfcQNejcqdkif1y1MYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kAYmWfdbes33dZSIDCoFGL/Is67bsqjAQcPp6b/Or4mYw1Af7ElnnvJQbLdo1iAZsaA6C4Ha1idq9QpAqvk/o/5d1Fk4P0dnT4P++WQFsmJIIveXC+dEzWpVugtpi4vnE9sbnhZ21gFGoHh/f2JJZeyqJD4Zh2SRst/A0ebT+Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ekc/MAQ0; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ekc/MAQ0"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so652596266b.2
        for <imx@lists.linux.dev>; Mon, 21 Jul 2025 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753086292; x=1753691092; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdywicGMC8PWpQoI79nyLjxZDbmHom2ul/36bE097Ak=;
        b=ekc/MAQ0N2yDSaAuRWUGqhsj+kE7rAK3KusRxvZt66hHxqa+X/0WMUtXN58/kZdnFe
         mgSxPs0ZkAAGgwdhX4ziS4IDY2uqbMG7M4vLFgiG5rTnqL+ARSJroWRP/aETcw6PYaX5
         2aP3b/KYMRJkvSwleKWFySQQLcAQ9LuZB6k8Go27cTzMNksdfotyivAFHPdT7Svk2MuZ
         G97f1tVuVgs0oORyjTweEA2OeAMcuo/6rfoCU4Xtv1JVvp23OYub4Bzxp3qJJQMVuzgN
         /xmpTvx/1w4I95q564I5bW9G5b+nAvrhK5YN1/mMry1MA9TNAujhTyB0gvmWna3ZBwQt
         nAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753086292; x=1753691092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdywicGMC8PWpQoI79nyLjxZDbmHom2ul/36bE097Ak=;
        b=AOLQBfPKC1dGKKOI3Z5jP/B/dhaYRPLgQwmY28g1EHc/cS6wF7wdcN7TJz4L7ohZb6
         T1qYqSM/faL5hkrV7fCuxCnC+r2kNQnBE9hD7Ow+mZvauqHhzaScRMHnZGfAJZ2ndH5u
         V+p5m8U/m4wyt+AtteAqzwCGn0DBZhRRaH/zAgg5ByFRr+rgHGNznrXheu9TS/WEMvQg
         ZXzhw4OfPs8wXE4FClOvQeRRxjbzOvN6JQKpXuk5g3hg2aHXeJ00hhf7MKQ4iBrq88KJ
         de2PMPjhiqXfMEzW7INC7xSYyKGQ2fp5o+Pddp7lDQGJJ/RFEkNsP1ClRiqJsaO3Facb
         JQng==
X-Forwarded-Encrypted: i=1; AJvYcCUKw2CQQIq1fhpKq0UU8ztTylByKr9SSCJo3xt0hjNDs0ObcqBv0PxVZ/rkKX+hcnr9Th8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtRhaS1iPkLTJnP76EatCaIlHTSzNQywP1+aOfws/9k+6ygaFF
	6SEaJXjB2cJyK140AS4hfmt7fDBFTclt31L4imk5ybW/2wr4FTej7EyNxIpkCIhzwI4=
X-Gm-Gg: ASbGncvzaNNI/2tWANoLQEwXqheaCNI/wffslaYDfYyLnHqELFVghyP1XNZUemezjTA
	Ls+zJ7cRJw3Kwpc801j5PhvygufsMbGtsfso4HyiyFwOZO6IHVuBRQ6CNPMD2SHQt060RD3DtKx
	k2tkZZWoHcCoqjU1mnHSR+eAT5bCeC1VUExPhQ1Vr+GMMr75fgtubtY8kbsXxiZtoDl2ctTl2gR
	rXk6tFVF1Qw4mvHrMXMNIwjGMmW+KpfOtx6nbPMDgIHyO4bgdij4TEHDdzW3UCtSAq01uK5r8jl
	wnFdDN7YXiKbR76Lwkqk0zLoThwCoRdsCVBLac38SR/b/m6I5hGX8v7a1dt3+RXph3Sl2v4utdP
	aHlPTl6m3u4VaHqbCD7Km
X-Google-Smtp-Source: AGHT+IGXBWkrr0OYxAUb4JL3ZpYz7yNfjNojugUdotLeKq4sWMewk8MwN0wQ2Tv8Q662Ax1Tz4MBzA==
X-Received: by 2002:a17:907:1c17:b0:ad8:ae51:d16 with SMTP id a640c23a62f3a-ae9ce198bf6mr1960198566b.55.1753086291837;
        Mon, 21 Jul 2025 01:24:51 -0700 (PDT)
Received: from hackbox.lan ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7d330sm633826566b.126.2025.07.21.01.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 01:24:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: (subset) [PATCH v3 0/6] clock: imx95: Add LVDS/DISPLAY CSR for i.MX94
Date: Mon, 21 Jul 2025 11:24:46 +0300
Message-Id: <175308625432.1291588.12529765608002208630.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Jul 2025 10:24:36 +0800, Peng Fan wrote:
> Similar to i.MX95, i.MX94 also has LVDS/DISPLAY CSR to provide
> clock gate for LVDS and DISPLAY Controller. So following same approach
> to add the support, as what have been done for i.MX95.
> 
> Patch 1 is to add the binding doc.
> Patch 2 is fixes when supporting i.MX94, but the issues are
> also exposed to i.MX95 even not triggered. No need to rush the
> two patches for 6.16.
> Patch 3 and 4 is to add the clk driver. Patch 3 is almost picked from
> NXP downstream with a minor update. Patch 4 is modified from NXP
> downstream with a few minor patches merged and updated.
> Patch 5 is the dts part to give reviewer a whole view on how it is used.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: Add support for i.MX94 LVDS/DISPLAY CSR
      commit: 0b0cd1857b783711b4bdfb8eb513c263b8a84f6d
[2/6] clk: imx95-blk-ctl: Fix synchronous abort
      commit: b08217a257215ed9130fce93d35feba66b49bf0a
[3/6] clk: imx95-blk-ctl: Rename lvds and displaymix csr blk
      commit: 88768d6f8c13ede81b248177fed3ac285499f77c
[4/6] clk: imx95-blk-ctl: Add clock for i.MX94 LVDS/Display CSR
      commit: 9678bc7661cb34bec4be92685039eec68ca67dad
[5/6] MAINTAINERS: Update i.MX Clock Entry
      commit: c78865241ecffaff7ce5db00ed5b71c1a70c0ff1

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

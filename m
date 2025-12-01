Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C50311946
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594502; cv=none; b=h0W64qnyLpqtDKIuwP2aCiFMH5OEi1+3kHAj2X6Nw+uuOvbdS6smMLAsJgLz1lI2lOPquRRg2QvA2IdhnhVcjyf2gMR/svBxBMKx0vidAuotAIT0VO1XLr34VNkLDWObOf/9rgV7K46nwuqMbdra0zi07NDn2cZP7WcO427dJL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594502; c=relaxed/simple;
	bh=1jljBYnLYrj5OzlfckI0vPQHKYIf0MNNW7lVPMiJMvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UTeJCTH98jAxc6aYmU5OjijYfWm3iHzI0OktiA11++AanaKfJNVY4E6v4IzgPl0PygY98b0E5gglLacBHK3sBwn6AyPpq/IPRa0ZS2IEaQJXyM9AztHUrN4Q1tKRM8BsO1tc7OC0K5Fw93apUzVPnD5G0x+6VPTlVGkXU91zYKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SnlPq3Gv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SnlPq3Gv"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7373fba6d1so655138866b.3
        for <imx@lists.linux.dev>; Mon, 01 Dec 2025 05:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764594499; x=1765199299; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmWOE8tsVdZV+/3MWOEyJyy+ZPffvlIHcvjJiju9iok=;
        b=SnlPq3GvoDlUzDPenyuxlL6URKWqvrBEFeqh/uA1goDxSYrENNh+sDv9VIFxJZ0oi7
         fLQOKGyKIuXFNe2wSAwBeYvMHtrY7alydOggy9S34oJt4rBSQuqhG3kcCggppSvNqLP2
         6ca9TXPLJMkPSO6jhyHbXAk/aQQ+LbVbiSdEGug+AosWa/xyaJ1k8bhr3LXoI+Fp9oKx
         P9iSKkBhhzbiI2QsM12AgSRuB02UZcG+W2+cPxgGklNcdfJyGs4XthtkiDKFX8QepiIh
         Epn42YcOByGiMTiDxggKW69kIaZEaWRO02CVvlu8gmKhQyF8lTDvj4Lml8tfKZ26qZ5X
         fJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594499; x=1765199299;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmWOE8tsVdZV+/3MWOEyJyy+ZPffvlIHcvjJiju9iok=;
        b=FS9KQAB7kBFqkFpKDpvaF1w8cvEZVhbPQpih5hb6Pq1KBoGz8KotnpM0rLr3SZKa9k
         eKF2LJr1gnrZP2/Nq8rJosrX3vDBZwXKKiPq68rnEaFPtKQnemAHS4XNT4h+ZoMZZ+Fv
         Yb3FwNfTKM/BCLxpVapE+lx/I7P73DixWk4kkk10b53ab/5btn0Q+TVII4Ip/pKHZpsr
         JGwLEDoFdDpuUY4jyJe9sPvpHToJl4P1wOm1ufTysKm2d/u2iCV3x3aUdUhXHnLt0Iwk
         MftL3q/iccMeCdswbZf4e5mEqzH8IueI35cP3WcclHX3zs6FqPm7QM+loy0H9kRRPNex
         8HFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+YqQimPGhSjGFqeqALarohbuoBstFpGxfDQOUW3+OummdM64KbgoPdg9h2Z9NKHmob44=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOms9ivivk4qXVysdDFWOqJRAnNvxBUJOt26CcCbd6fcHQXGsS
	/eFCQh97RNrf+1tzUIuXEzWQG861ijRXeLzY3OpEUChXs5mKwU6qmc4aaGQ5BliskHc=
X-Gm-Gg: ASbGncsmvzRYKwAW5NrjTXMoHnzpVlqciUuh04Hl+LEv5dMb5mbll8fzSMoxq7ETZ1l
	zYAa18hjwko2CZOgo8dybsdjN2QYDF9nK8BGm9++aOzXzSuyJibTaf7iuYDsyZhqW1JjcvxutiD
	81DPJbPJFZWI7qyexASVLs5xUVJUcdU88sQmjc2EIQ94oD6RO5KBSVjH8aCr0LTvMdQoW8nJZv3
	45PhLdhPE1WUvXLMsNAtfFHEGr3UiI34c4e1vLzGYGZK57EVwyrxhaIV7A8azZmyF48Y8A6OSBM
	CK/mNA4opQuIn/0Xvw/FMnak679L3PgEIPr8F35XK6tq/cL9CuUvxCE1XPEDdZ7PXG6gagjm7qt
	CqNK/BDNyeRiokWTa7fkaVEW83p457IlAxhJCiO5KlBN0/6doAyhSULt8dEzvh1k+CNTb2NaV+v
	tiztsdGgLHIuq3k57Q
X-Google-Smtp-Source: AGHT+IG+9MCSjBtPt6W2+zBUhes3WpovLtX4vLeIrokTyK95t4Xc4QrjoCg1IRxwpvpD0DbH6J0bKQ==
X-Received: by 2002:a17:907:e8c:b0:b72:eaba:aac2 with SMTP id a640c23a62f3a-b767173c3f7mr4361122366b.26.1764594498454;
        Mon, 01 Dec 2025 05:08:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f59aecd4sm1238751566b.44.2025.12.01.05.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 05:08:17 -0800 (PST)
Date: Mon, 1 Dec 2025 16:08:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: [PATCH 0/4] s32g: Use a syscon for GPR
Message-ID: <cover.1764592300.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

*** BLURB HERE ***

Dan Carpenter (4):
  net: stmmac: s32: use the syscon interface PHY_INTF_SEL_RGMII
  dt-bindings: mfd: syscon: Document the GPR syscon for the NXP S32 SoCs
  dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
  dts: s32g: Add GPR syscon region

 .../devicetree/bindings/mfd/syscon.yaml       |  2 ++
 .../bindings/net/nxp,s32-dwmac.yaml           |  6 +++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  8 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  8 +++++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 5 files changed, 42 insertions(+), 5 deletions(-)

-- 
2.51.0


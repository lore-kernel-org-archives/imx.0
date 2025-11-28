Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F0232ED52
	for <imx@lists.linux.dev>; Fri, 28 Nov 2025 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764342046; cv=none; b=kk34QIj5Uiam5gemdKYhOY6/92ZwzI0mnnrTlT/P1S8UXcQcJnyEx8jVW5yeccZ3wmtH3Shh21q+gOls/idp7m7PMwy/FkbFFt/3V1Iq2sjmjYkjfwxpxO4PbIC+IGZJcFfJoszDYvzDNJhVjFM724lhIe+MsQmBV8J+WdLNsck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764342046; c=relaxed/simple;
	bh=s2B9NGkEnUaejgEZuS8NbMN+acHyrFZnwnWMuimegO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oeQ/+Y8102U4oUCxfe1WNcfH0bv2xIvbNt18OFqgbg0jq83bPUAieq+sMDhDTXK6QAPsHd/hdKiJG20/9w62eNxx3zuu55WiSDptgv+hzUNtlsu+e+zX+aCqqH6YU9vrvxXjNPFze5bm9+9H5cqfjaX/Y5iS0b1mooirX5F5rXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/SpZFhp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/SpZFhp"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47755de027eso12742595e9.0
        for <imx@lists.linux.dev>; Fri, 28 Nov 2025 07:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764342043; x=1764946843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apczRWkrHKfV9oaltwvcd28nddE2zoSisgUmol/eatA=;
        b=K/SpZFhpRHOlvZp7Z5L4rO81hOtSxvidgwCxwECjTz+OKUIWPjpeVj0NyrQEvelGpY
         Gpt80Nbb/2b5pvzb3wZsfmIc9FfWIYBD6OaKgt5NQjcFmQfxMGMe7ox+qrGLTljuKyu7
         G8Li3noaosLWPU73YKOo0Hv/WRsbA9d4cWFAqOSoFYmjKJdAP21njhfR8hd5YgkS6LT8
         7nYdda/u4yT6aYYBhbzVdfqytP+hzbhwGBjBFuStza8Y9Kq1mvvgQFMdt0F5MOUw+eVv
         Aoa/gGOUB+cah6X8RagfMgQFcU72jcAOuxC/9mKDMj5ip6Iy46OpfMsCacWhLFcXWzBk
         AwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764342043; x=1764946843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=apczRWkrHKfV9oaltwvcd28nddE2zoSisgUmol/eatA=;
        b=ZTWgx5seIvVyxCdBBwNm139xWsCudkgvcQS8w4/ITpuL/dR2rQtokjpDEWznq7ZeCu
         l4bXhQsmFiTKqmbHU0u/nfv0iwj53ZGYpp5kCLWRNNkwM4MvfDxUxhE/qPLWEmobSNTi
         fuq438/IAMG+460lc6dYzgZ9qAG8GJa+cK90bMSMF6yqw0RtmgkMXdqzkOcWizxyAfwn
         GcXFyUjQZT+t61UTGx6QbN+lxeG4jODQA9gnrsiSW7clZLUpbiKjTyRzEB3a55lFUKMX
         PFHU/xf0Ef/il/qsIFeN5A8+8pEQB8BuHGfKva27rUPQ0eLSYgdiIJpDyKzbp7l3loEo
         lXMw==
X-Forwarded-Encrypted: i=1; AJvYcCVlor6pnRs0iRXwfZjuTnQA10DBIWVMySI7BkfoTyKHQqTvceMRPxALxNu4/iM5jjWyrc8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/5ZJ/LhsR0swXd73FUiaTFW0vbf5WgNTm+OQkg7jQDBMnBmj5
	GqlG4Z0HnQG1VEkbUi829106GqIRzYFhk59KRDIX8zZBVHcPV1n2D77W
X-Gm-Gg: ASbGncsJd+nb6jlAkbNV+06GfmvVSBhWZlQfTtwAeBtjroq+m4wkzLlXCJdr3WAwtMF
	/V1A0zzN6hriHWy156jPTxVuLzuH+OA5pIhgFVamAaFBvJ6BXdUpoZ2l8Pjle0m0Z9nVZ8f6Db5
	sjW+G8SUAQjAxqAY9zmeTOHADqRJGLf70aBmUWR+0CTeRJLwAimXbKPUwKjcr5P+z9uAa+QChwP
	pgphohJpX8k4VaFM7rGhJ+fx7fdG9sNg/shY+hIFJSs10Aoq9D3nyrszosAkyfFqyDFpLT87R0A
	J0CmB5KVgpkoY/WhKPQOMib7z8dPoR+AJSm3Bm2zKcMaSMuQm969XEAFWmA1q3jTdB4ejwoJXrU
	50VAfn3GcD3xV/Q5P0Df3g10C0uLm45elBeLdZamoQ+DZbJh4lBzwyso4bzPJhzkRp9BtY9fNTC
	+R3wa+EvMK6YEcb5eB3nyPLb1oe5s=
X-Google-Smtp-Source: AGHT+IGZ5phRRYX+v7P/fz+XER6nFyz0G4tY9Gcl8oDgTYqo9/i0jpjq8twM7C3UskdUr1BNUjh8fA==
X-Received: by 2002:a05:600c:1c24:b0:477:aed0:f40a with SMTP id 5b1f17b1804b1-47904b1af90mr189698325e9.19.1764342041970;
        Fri, 28 Nov 2025 07:00:41 -0800 (PST)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47905303963sm93117975e9.7.2025.11.28.07.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 07:00:41 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx95-toradex-smarc: fix SMARC_SDIO_WP label position
Date: Fri, 28 Nov 2025 15:00:28 +0000
Message-ID: <20251128150030.35931-3-ivitro@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128150030.35931-1-ivitro@gmail.com>
References: <20251128150030.35931-1-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Fix the SMARC_SDIO_WP gpio-line-name position. It should be on line 15
of som_gpio_expander_1, not line 17.

Fixes: 90bbe88e0ea6 ("arm64: dts: freescale: add Toradex SMARC iMX95")
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 2cbd5606cb19..115a16e44a99 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -406,8 +406,6 @@ som_gpio_expander_1: gpio@21 {
 			"",
 			"",
 			"",
-			"",
-			"",
 			"SMARC_SDIO_WP";
 	};
 
-- 
2.51.0


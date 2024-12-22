Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D292E198E84
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887152; cv=none; b=Ch9zHhy6ygajZ7FcUfuZxYr4TPUlrallBbi8ChFUmMTRiVlHdfeMbc1+eD98Xp7NuzOqnvT3Z/Z+siCplTuw455IT5zuvgKaA3HntacHWPlcMj9KqNG2FbHrf6eb1REUzAHnq+lUKKliyKoFbfVEGVf/9BnXrIokzrL5TCOd588=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887152; c=relaxed/simple;
	bh=4JJzIfTPYd1xwS7ML8LLTZkwdWqlo3aofGz7RuYx0M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aca4WcMuQfbJUObXSd29dvL6xwD+AQp3iAbVbPB9iWlKN0soxpp/LcZxO2ptuVLjZZcwut0i6Afak5aF1pcDWsTsdFVJZF9YvqB3Uja51y14F1W/eORERuZn8Pco9Eg4UjdMwebPzHoW33T595+gLT2NBVOwtpUDWTWSb2/hm0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OoFUErZC; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OoFUErZC"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaec111762bso154135866b.2
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887149; x=1735491949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=OoFUErZCVePx+4mFyguA5yDTrt0pwgPuINZl3nsvaQVKY6pczK4sAAJxaIIydlu1KK
         d2w4oS1cVkIMnNbAnRF4D88nheRvAjvTi1GqsIWrr5r0Dxp5uiSsizDu5kWikxw9JAbB
         X6Pzyqf5+kYd0ZwFwgKDfPCMMMfClSnrUA5ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887149; x=1735491949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=XxnJidYvhouHAoXDunAZBKWDUPMgkPvvmRssYy6AyJDvBe+j1IZk628WTa08bJSoqW
         8klnxFQp995aPgOzPd//g9zMa8Be6WMtvrOIiXdTMFetO6jEMJazn20mSi0YBuBRuPH3
         MlJYzsnXVvAl7xykxoda2CfpoyadZnEGElfB+p6TNAQPhwMqlpQuwWr1yTWqPoDUdeul
         W10kMF3j90mbzK23vrpjf8zuk82l/KLLOb2X4Wj4HP8RlR/AL7cFZAt86hgxZPaVc1TY
         QdPXSDdSV8IALAVL2f7Tg4rstWfxhouEBY6QN5WDtKsYJmRKCnqrd6YmPDx4HiOGGxg8
         VMzw==
X-Forwarded-Encrypted: i=1; AJvYcCXm+ERMM4D6MXyTAkYxKCcP7NuM1yt2R0MEWHQiEALy0ZrlzktvD19x6ZjV4yWQnh5+YZo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgZKvGtcQPLNWrWVV6I4beHrMZL2LWXbuhHil7wVOkcztik65+
	j3v+kJ8AasiygLLC8zhwpes5koMR39RVmCzYF56F2u9uzFBGR9gnDQnrdIkice2g8AD6ETPkF/a
	I
X-Gm-Gg: ASbGncvI+iovJ65x6AHgLQ2h2kscT1+7dQ2rbYaYRI8Y0n4tbD3Uh/6HxLqww/3NXLe
	trdCMw5MX9fYE2StCUW9RN/hIUTMiKGPjCklry9xkrjHETJ9moLW3Mozs96DeBR+dfaWgTKqFcM
	L8kxtYthh+XJvdagGQBN1+Xd+5e4e2UQqZVpQbBYiiSSkdiFuG9sf1mpXQMMgtERxXcfmt6oUDa
	b0xa0mTO2M5quX7ibFp0Apno0hBAS3c+drybhgYZUAtKHjpG7o786HqmDqSw02NDhmsFsMMQ9Qy
	5tY3Wx64pVbULAwQiutapuW+uvBeioA1j7nwsVmnal7m4g==
X-Google-Smtp-Source: AGHT+IGSlHwq4B58SjzQGkgABUjEiVbfFXilvkHQNYopTfPmITsuLQgwRjnV1F5sR2WhlM27g0eCtw==
X-Received: by 2002:a17:907:2da1:b0:aa6:730c:acf with SMTP id a640c23a62f3a-aac2adc603fmr930499466b.13.1734887149146;
        Sun, 22 Dec 2024 09:05:49 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:48 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 06/18] arm64: dts: imx8mm: add anatop clocks
Date: Sun, 22 Dec 2024 18:04:21 +0100
Message-ID: <20241222170534.3621453-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


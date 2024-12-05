Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF4D203718
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397595; cv=none; b=PZShZA0stTVMBHT2+Un09n/jHhkE8HSd/TEdY5VV1OuNTacVE5asXNdZZJbEhDk/XSQ1DZt9k6QtgZIpdlUE0YNd53havY3nFX2DBR6LFsVBv0srft6cDw4TpX9g2CQqymJ1JI/dXfsp5byZqnmldqOWKI5xsmtCBFDWuKkty/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397595; c=relaxed/simple;
	bh=4JJzIfTPYd1xwS7ML8LLTZkwdWqlo3aofGz7RuYx0M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JppD3LCLU9pHCeyq2zXy+7sMQXBwkGorZkmeemLCbMDjJXm9dtzu1dHX9Mh2lUvRDk+RmlzyRMCcYVU7Ejwhpiof/8/f6nbvYVaECcK+L++R1sDtOdL5/eUMqzKoej0A+PomNsPGgaZ7LzLyx0KqQV4FiF6O7pbfhz5/hFtQVxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=U22/M8n8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="U22/M8n8"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa549d9dffdso109893066b.2
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397592; x=1734002392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=U22/M8n868NjgfDq5RRvKeS5ZHwXCAEXw0SJBqBkCK5SP/eygNerPLTUO4tXxoytYA
         +hyoxl8Xzp7AGWdC7BjttQkhUFXjRviQ/pwVpSmMQOz5nzmFa3lKRAcIlESZSyTKuDB5
         Sm4tVuwQF2DlRhfJp7szGNeUccWfG0p4wzT0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397592; x=1734002392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=AjYrgeDTh2W4n0vKKiPzfOYRwn2lhdnY9/zKT8Efw2ynbVrh3GvhWk72VKDDE4U2an
         wYiOCM2E8ZRLKzuBsaa6M+xEgUrdrECH4onQx+haeF5L439c1N4ijVcc6SmGN/zoGpc5
         Xo+QfBvcPyoAjIFH/J2tQk9KL69HoIWcsSJOsZ35E54Lf4ZYkWRZIENzLzmDsLCg0rtq
         cwJ+9uSSRafoeWHXttnSk9PJ2OHj+S3oMulJUOUDjVYFjx+CJBOF4HhwEB1cPp+HxRYT
         ESHUH8fQjXzl83ZrdbtYipL1Bs83w1RzD3zSjXRYCQk7Tg/vEINiXAJ1gbQbXZD8tFAi
         TIgw==
X-Forwarded-Encrypted: i=1; AJvYcCVJz2xektdCT1HmiPmq1lt4usjFzes3mwFgOIn7C6CiFjYkjFryuFPDH/bMVQLzaxXUGK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKz+lq8117h5IiAiwWGa8Q6BODcufOOM8/zhwS7dVXFWWgX5Ei
	dEyfJ/O/bR36ZIqx9VE5Nxeu4I4GFooaQ05XRmhkNor/w+H2Se0C/eNzyNHUBIU=
X-Gm-Gg: ASbGnctEM8ZqqDhxjgZ38U6SRjW2yG7NBvZrxaGfdYrpofadSTD+YxvN0E7+sacmS1/
	yEQlZscxYOok3TUYUYanp7d7U/aRikStwLVwS3WgYwVicczf2Qeos0GGSXo3kSu81g++QhMHAXg
	e9LsqTaaqmma02Z/jXp5cUEN8e81l8LzuumTeNttQ1IAupmWaqk0isox8nZq6yguZJGBxUXI560
	VyAitUqCXPXB6K400EJRRco5d0ehzTCIdfXjAcq9nT1sVqjBT4GPfSYGG2PEgcVHmTqoq57Oj8h
	c687UWLDYas88RVsLu3FiPpqT4+UOGyBQtqwvk2CLJx21g==
X-Google-Smtp-Source: AGHT+IEKdcdUCceUHogmpJQSkfQi7gvSkiGqFxS5Oof8+cN49W1U5s4xMeC1Lw+OiTYCvRjxODLcuQ==
X-Received: by 2002:a17:907:7758:b0:aa5:3f53:ad53 with SMTP id a640c23a62f3a-aa5f7d8d1dfmr756999466b.26.1733397592064;
        Thu, 05 Dec 2024 03:19:52 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:51 -0800 (PST)
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
Subject: [PATCH v5 06/20] arm64: dts: imx8mm: add anatop clocks
Date: Thu,  5 Dec 2024 12:17:41 +0100
Message-ID: <20241205111939.1796244-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
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


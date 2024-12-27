Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F7C1F8AD9
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318660; cv=none; b=qlssErpLx7FFNWDNnOAacaRVJMZg3zb0GbRzBupdmhjMzrCKlXe+O9Fij+8Yo4bhNgZFbAsf+wqe+t3PwEuvPKqsd4Lsr9DltBV/Bf2+L04QNQG6X4MdGKUTTkDVLx18LtXGdqks4pIpWtdovGJxs1G8Rp1DsQuptBrJv2dUnNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318660; c=relaxed/simple;
	bh=EfuJYR878rJ4Cw+YuO97nDjgeWj+F6WJVMj2hzhOd0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6HupRhBH5EpV11JMoxQXs4y7+bHrWMB3G5L/9IiD9xxvWk/79WLhLTm3LglJLjkeZ/LIwHr95u+g3Nty/v8Fu4DVJ/YITcXwGkbayHomeEsyZFXthaPCU+XikMWtqTI1s/Iq42IeoRziboudOt5G8siertD1yvPioQTOYy9pMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=N0TguKar; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="N0TguKar"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaeecbb7309so523294166b.0
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318657; x=1735923457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=N0TguKar2q0if7cgxLoea7AsmWHceIoVNl4RIUEjR3yiqH7DrS938keIH9vKUBWe2S
         U9rkFnt6K29v+qGS+UYeFGscKQ3QiVkImNqqKtwSweX5pPeeHgxQ7jjzkspkXVHGKuKT
         qO/GovvZ1L7aR2nlcyIcbqHtkw4Iu0nRs2SRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318657; x=1735923457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=f5noGu//yl9vcNPiDNzc4YOO0gmLcaTyW3BmYZUWR0amUOgNqSyWsNJ0TtSCNfzRW8
         xRCjg8PGfsQu9IEgfAu+PlakmW5or0vwFJIfoocc5xlUHhgFB1pg/1AtxrGuy5pzXX8B
         WqOQTp5HWMWubVPkbgB9WqOu0lMmeh0XychYBCDosoIINifRBiSlRaBF6SGi2i1LFdA4
         V3mWXBJjlV8x/qWHFMoM35Wsuz4xaiU7X3r/8UP3WoLqScMC3vagIspE4npwqiTNmwSt
         Xe1LmBGSmMcJx5DmCA2GAtIngrkvMIagxjWD+rupw57187ZS633Yl6lPEEfvX7mRJ4fO
         L2+A==
X-Forwarded-Encrypted: i=1; AJvYcCVJ3g6h0cyqHMUEfBso27pZpbhGHvYQw1rbM3pv0KfjcVHIAFRQUlbt1DZYZ9iF/iR/HQ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXA14aFoRxiW86C+hfGQICSbYf8Zv8AQVjqRmE4M24WdlnnzMW
	abiqg4oPztMdDOAfzm7Pm6Iym3ZoAGbydDGWj6kVX8rFpz+CLKlX4sFmNUBaqg0=
X-Gm-Gg: ASbGncteisd0S80SECc09zZU8yur0Cu5aUSij8ck5wg596DD7ExcSybmGgYVcfxzRzj
	oBRLCXXFfbamNa/G7rAYXT6Xc2yM19MtibuWSB9YSLFpbY+9XIQX9//JmnvgsFygvd3u7qUPI8G
	FygcizLrU+2AFUkEhdOBwgelMvdO+ZHRVXmFbuKW5Z1rMBuRo/CD08gUmfjGn3HkusJrwEjJjzQ
	L82amJgEzNszYUiVtegaXZLKLReRQlfdB3MBhwKTX/K+sxJ37PZUgaDMobwayWEFEmn4dE1LaLX
	tjgdkEYLaWnsMK80YssCYQ==
X-Google-Smtp-Source: AGHT+IHqEpKvPrvAcl6AfnqPR2zMpwbkTUBZZsaRlEKFV18gzQEhapMBi6kOkudHyHxl8CuL5KGNTg==
X-Received: by 2002:a17:907:7f92:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-aac3378ef88mr2400967166b.56.1735318656917;
        Fri, 27 Dec 2024 08:57:36 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:36 -0800 (PST)
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
Subject: [PATCH v7 08/23] arm64: dts: imx8mp: add anatop clocks
Date: Fri, 27 Dec 2024 17:56:11 +0100
Message-ID: <20241227165719.3902388-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..0b928e173f29 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


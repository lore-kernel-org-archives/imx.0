Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCF71BCA0C
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 13:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736688792; cv=none; b=NVQfyA0Mtm8hdkEjUrX7C2AjoCyFf8tRKqNsQ4QbhuNTWR6zk10Sd8GOByqWTY0qxNjzTw72wbq6rb6g8f8fc63fcGPw4QlO8DSNQnXK5Y7eesXEN/9czgKCfX2E0pZ53JmlTWSc6yOu3tbYM0fSBLaT3nVz4A1jb0xS18SH9uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736688792; c=relaxed/simple;
	bh=NXMkmgaOV2RUkC4HwkfQVhlGXXVP2A5zrSYO2RnmBmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JOj2k+Hvgbh8oak4U4ldnJ+P+wrlDq7FQ5q/osycHGcU1gUHhR7jUxOhyyQmiInQwG28oy5bNJVvnHfnkTd2C9cYyu8S2lMP2DeiFZflVHhKl505t6XGvh2KiR9r71KqUPHF3MnNxIVaPI9ndLfYg9ATlIn5Mrq7lBnIR8Zynew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ujQV5sad; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ujQV5sad"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3e5c225aaso702007a12.3
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 05:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736688788; x=1737293588; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkxcGNEB2JVbUM+gOy8SUbx7zqelxFkMblu3o9jMzUg=;
        b=ujQV5sadED6Zuky1AsuWMYOnoPFSRucwBSfkRXmmeHmwcGO15fLc7nRDVRtK8FNm5o
         VApF/LNt0sF4f+suoqeEa/EQJS9HUh6s9rkfUbgh9tNqQrGSTIQP2EWiBH8VpA2ujUiX
         pYh3bf1/AqoZlz+U2+d7HYfp5TY67GwdXvSanYkBfsshjQJypnUzpYr0BUHfJ7wDeYW7
         xzpoAADbbaXmyYZ+kH9gwbh8Ong1y9oVYWRQG5e3jUt8JARyNw3L1FP5+ebOJGCxkhZk
         kzbjHEg+lMJnkcWcIEdSRVfIu1okp95+3D84M7h9Us+TsSWiMsHht34pXU/wmcwIeC++
         zoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736688788; x=1737293588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkxcGNEB2JVbUM+gOy8SUbx7zqelxFkMblu3o9jMzUg=;
        b=gJiZTnSltBINP8l0QxRqq4NpwtgQNBRSo10YK1lQ9BuyiBrmiaEI5uOIqGWv4w61pN
         IQWsZN6BDK7w+25KspqyHUeLHiHHJABvc9oJHlr15bUQvaJJboM/BWIHDJDCHOj2iUcx
         wO5AlbYbqWZjpQEzMr85PvWSB7IWwl4VLIcpWO2bIp6eS/OXS5/0s57dZ8t35A0yJnnb
         6v2woThhAWbg2Vt3+R3x09xmKd//ruxvvtOLwFeoVdXIeGKPrqH1JauovTggVYc4HaUQ
         Joj9hspps02GrMaWuVdSeYASXSPErTPuKQoKrh8QxXdB15Y+REKCRqu6REvuDVUMG1fJ
         Kx4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFoYvkvnoO0KcsLbI5Dvm4ZGskavBkDQ8l6i6KcTOp3cNAZ7btymSjKBaGMVoECpcDNs4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqLGstTl4Cb3jsYLb9LYy8m7JgeGP4ljqkDLxWbHFjt/jVPyAO
	Nd58KMdqed74K9stXNQYZHiiyfWkC5sgYUlXToOlMV8LuuNIdN7R1sgWPPEdJQwnteObTJVtARm
	C
X-Gm-Gg: ASbGnctxZqqbX0sFTCLCaScSBB8eBofXCZ6dKZEDBOibCDzRmkUmhgX+fXQZuALU8UU
	KLqUuejGrJFhgHPzCAjdyCqvtxb2xEAYw4E/+mPKy3LaryIxtHQDnPIkF1CFVEIOj8jrvYSfUPt
	Yf9n8Px79R1ZdKvuree9PCOBk7WdUkuOq7am8kToyfzQB08IqKV19uFG/2h55TWuVHTPFlNdjAJ
	v0MUpfOEnjl7RJ2n2/eTgWQ8LfHxPhV084bumrlCxFfzXlgBO8ljCxRzNQg2gk5JYAtnHB3
X-Google-Smtp-Source: AGHT+IGF6bnQlGOOJSwmTTavg2zo5fkx649YuwkX2KVGh7yeql8d0d2LdpF/plNT/VzyYLuHpWJzKA==
X-Received: by 2002:a05:6402:13c8:b0:5d0:bb73:4947 with SMTP id 4fb4d7f45d1cf-5d972d26b14mr6157273a12.0.1736688788499;
        Sun, 12 Jan 2025 05:33:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:33:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:46 +0100
Subject: [PATCH net-next 4/5] net: stmmac: sti: Use
 syscon_regmap_lookup_by_phandle_args
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-net-v1-4-3423889935f7@linaro.org>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NXMkmgaOV2RUkC4HwkfQVhlGXXVP2A5zrSYO2RnmBmE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SEMvfAj1e6BkujbTFZ72MSWMgcm2SMXQBGK
 GiE3r2n/mWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEhAAKCRDBN2bmhouD
 1+CtD/9NYfzUH01iViVY6CFPIesUd//8aqafZv/j9gif1sZe4BnpQWtWRxsUu6VQdMZlDJKE9W2
 glDpCZIW+8lLh+IbsiXM/flGx1S/efHzGzwpjeK7L/+01H4KcEeR/NDg1+8TsGk3d6NX1yF1/js
 HwaSYCG5gF43SPXB2xa/7mE5PMEKpV30x5gImiU69/kQEkU+hG0h7SsxJIgj3xt/HOP5Z2VjmRd
 c4HXi8KAUcvDdEeAC1MKg7tZ39OjLQFztwEufapop5grKUL5tbxEaeZ8o2BlJwG/uCvWOTpXYyE
 XEW+sImdFKOMeKn464A5PXwEu2KkucXyL08nDihzDzhH4RmuG9XNtHs8yCTXvRmIAMtj1eYy2OU
 idW1s7RxvW3VBVusNX1ehUd05WYPYctpK+gqlj4H6DzxGAUuHu7b+vdVjnbFX+XI4UuUpXlkztG
 TkLWHNjvzf6OnOYG86bYh4Dr8IVPiD9ikN4N4rK+xw3ax9d2rsVK1/7ap4qJJt4iRlNaFQa5x89
 prfGPAHxKBpsWwTTUQYDTjGg46zzir0mxKHPl+GxOyLo/9S+3xMdLTt7AAI874KFG7SjGAIgHcr
 JNJ2MvA9XFr3QF2JPTvtkqonyCssxtjXflAge8uhZAveyDIMEC1DiktRW+Y3V0P5Xxfzk03OH8G
 w23Ba9WErAio4Zg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index eabc4da9e1a985101643908d2efdb0b4acaa9d60..d30d34fa6ca52e32b10c312c96d462bd6df859d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -199,16 +199,11 @@ static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
 	if (res)
 		dwmac->clk_sel_reg = res->start;
 
-	regmap = syscon_regmap_lookup_by_phandle(np, "st,syscon");
+	regmap = syscon_regmap_lookup_by_phandle_args(np, "st,syscon",
+						      1, &dwmac->ctrl_reg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	err = of_property_read_u32_index(np, "st,syscon", 1, &dwmac->ctrl_reg);
-	if (err) {
-		dev_err(dev, "Can't get sysconfig ctrl offset (%d)\n", err);
-		return err;
-	}
-
 	err = of_get_phy_mode(np, &dwmac->interface);
 	if (err && err != -ENODEV) {
 		dev_err(dev, "Can't get phy-mode\n");

-- 
2.43.0


Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156641BCA1C
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 13:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736688789; cv=none; b=FFEId/4dKYLv+W5QfxwVCWFJrK2t+C0jfOP2FZiPCBBBw9+iTsbELbSIgFcMqZzF2DkVleCG+u7R6xzpgl9GgUMa0d4i684KZ7whwi9Pz+WBF0dgtoBRYDhiP3d6z959P5wwArOJG2slys4rRgdJM+lfase/teXVsfGiVlGSWkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736688789; c=relaxed/simple;
	bh=BLKjHvMGwRWG32GZtZYj7md0qQ8nB6LVGjC0kEjtJ8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oLcy99Kx6r5i+YBxSOn+Sa8uFFl3aIGH/icrR44MCEJRA3rv0GwQS1ZQWi5oxOBmUMhC0iG335CWnKetjXIrNps7wwjmiwiOwOR+GWckgr1N6A3djzqsHKf27NW4cDRSRKWDjcmWtLxHBK8Kn4qhXe8unB9aHYUbphPCxZi4YTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TC/ppfud; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TC/ppfud"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d44550adb7so597026a12.2
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 05:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736688786; x=1737293586; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ld8ZPAnxgwhvLaqsgPKYU5t+3ZDPQJl13t2skco9HCk=;
        b=TC/ppfudry0XyeRC1jAufx2UJ1OTJJUOQG8pR2KUycL4uP6O5LwO2SlCBePn32k1al
         oSD28o8SMQ+PT+KB9BMplSQANQH3JGcGHUzqs2EqE8JP13idFFYc7ABfun0Lo8LtuXp0
         M30g5MkCJk0BPTGlglKnXgalG7le3YqdeDdH+6JSIRq0/PRgfBqB0HESogS3gNWSpRrX
         yPKiOukeCRROJ4pSkyGK+ve50/Eu228Hb4PP+K7RWJkWxQBOmW4T8njoAyYw10m+sq8H
         0Yn7Wlz7k1gTuJkubsV6TDHGuF2v9qVU9gXZs0Cxjekm23KcjCQTJePRBRqragRMutMn
         kgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736688786; x=1737293586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ld8ZPAnxgwhvLaqsgPKYU5t+3ZDPQJl13t2skco9HCk=;
        b=cnSEx7euqf4YPm/OEEtZ/nXdyX6Sc5dEfcs/4ErjJ77KchQscOnXOeYayGHgdRwJuT
         PxzUc9R6EhEknz8VCqaoJenpaifR2zsV38IUpM3V2szbBg9HBNcDqS8hKJPApCkZF4yV
         tYUzhneVnAstSCvVvd63BGVx9GGLrIlBjHX+Te71T2crwMfPYwSLjoWYuC3hbnxMTcrC
         3ZhtiIfNcJkg1WPGwVUSeeM8FityzrxEgFkM+9PQ1IVU65noLyXl514Z98cuKWPF2CTT
         EQluExrc9RqKlhsfrRvUvtca03dzQ17TvhKxbDZlowBKWV3tYfa2FsYTPc194jEyvxln
         AdGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCxPCtflAPhfUR7/ZpIqytlyEsrneJJvnetNrCxtjpmQEWvsGDs8N2EGH4KU2J+cm/Z+E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSVgMD4X4bJLcbrg3bVg+0kYfh2ykmYSbQkImounWOFASN8GHa
	Mq42j+lF6GQN05g3NwZprR1fx37B1ijyjUt2RiFsf0DnRv7sJscfCC2feYoNMllZ0KRPP3t/j3B
	f
X-Gm-Gg: ASbGncu+CPcAaY3IH2kwYq5ORrU1IfsWMihD2vUk0rK+kA59uPHvKRj+F5DJo+s0tsJ
	IBbLzy4hGlll0BeO+Rfo+LhPQ0z1GGMbuqCWmJw8ECoTIp/j17gKbUVVqhv1HnOPyOdKvMTV0Jh
	PC1Xl0llxMCvjM0XCMW/KedQ7sLv6KXIt1WzWBBY0tprKJm4Z6KFyZuvgQkPR65KGtXf8mZXqYa
	VCapNBEuUQyW61T0XB7Y677A1dKWFUCQEwrujdpUoQxo+jgblVCUkLNcEioGd4JqIUhl3uB
X-Google-Smtp-Source: AGHT+IFHwHH4KKIrysGLvqwXWCgJxLn+t19M/gFmLmYbS8NY9BWAcFiBlWXc9XqfFSlrFDFKeUN0GA==
X-Received: by 2002:a05:6402:13c1:b0:5d0:bf79:e925 with SMTP id 4fb4d7f45d1cf-5d972e65777mr5439603a12.6.1736688785817;
        Sun, 12 Jan 2025 05:33:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:33:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:45 +0100
Subject: [PATCH net-next 3/5] net: stmmac: imx: Use
 syscon_regmap_lookup_by_phandle_args
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-net-v1-3-3423889935f7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BLKjHvMGwRWG32GZtZYj7md0qQ8nB6LVGjC0kEjtJ8E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SDFkc9BxhB/j87J5OokfF6ZsmgjWIg1zax0
 EyCdFlFVjaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEgwAKCRDBN2bmhouD
 1x8AD/9Aau/f9uUdyr+OxKVQyIA5u+wnl31VUsMUYoZKktqRD/7R89XQcAZ4Ihv5P8LoYFUuGSk
 Ietj68aVH4LJP5HlzhkuI0R7ergp7NNod0odUeR15RVmyU5WQ9YSj5PvBGpfHdFPuefkEFt1kfw
 6FNRml6vfFv9oNkE/EcY+g5RtQoSyyAzH5P42KSjH5G56gOJaaeUOQzRP45DP89NXKhbwdOz+cV
 IoU4HZYVAU6EnU0frwulSeum1/Wg4j+Je/kk8DjnQqGSTYQJisj6bKHLettlVZ900rN9Kbfcqow
 a+1Xr5Ja4Lh/z7Av0ogch3QekPRI6lnIPkOX1TpY3BXstIKjyO1KQqVuNTO3qUzj7qlei8hNN0e
 kzDgRqCIU6AqAvU+T43YltB33DLbadSqmwoIYu6ezF7TxsYDGuMmqp9DMpPf0sZrlxHKBI4kkYi
 rX+2JHrdxNjwS8F9F1y2KD6jCrNdECHTMq8e9FY3rhyHN6HQE8kVCV+/JvnwQvxdDbtT8dnjQzX
 /7r7MIXSBoXplzcK1f0vBwLGGxL5mjR3/WmzgH5zpEQth7DJvvIj+FU1F2ZZlZ45Tr6t9pStmgb
 P02MIOsocH27LT2DgRYEF7Qv0xxUSKyva8FtwrioyZg7dKpYTmtz3UkJn7bGdPUxEGY1A5W2OKc
 ophfP6EMaGl2RVA==
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 4ac7a78f4b14b95169787538b56dad7f7fe162d3..20d3a202bb8d16743ba4f31fa8ebf19a246e8236 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -302,15 +302,11 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 		 * is required by i.MX8MP, i.MX93.
 		 * is optinoal for i.MX8DXL.
 		 */
-		dwmac->intf_regmap = syscon_regmap_lookup_by_phandle(np, "intf_mode");
+		dwmac->intf_regmap =
+			syscon_regmap_lookup_by_phandle_args(np, "intf_mode", 1,
+							     &dwmac->intf_reg_off);
 		if (IS_ERR(dwmac->intf_regmap))
 			return PTR_ERR(dwmac->intf_regmap);
-
-		err = of_property_read_u32_index(np, "intf_mode", 1, &dwmac->intf_reg_off);
-		if (err) {
-			dev_err(dev, "Can't get intf mode reg offset (%d)\n", err);
-			return err;
-		}
 	}
 
 	return err;

-- 
2.43.0


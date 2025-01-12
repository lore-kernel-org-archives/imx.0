Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435691BE23F
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736688795; cv=none; b=mQM87bOm+K4jGLrvGggPXWJDqA3mbY69mvVco6abp7BOKScqEZ66qseeK8ZbQZG2B8ZcDEIKUx3bBSFrUdBrSPJBud/xlTY3k86to0d6DX9YaZIr1NkM0WcDDtx9S/YSv827cJwJIYOnX3/R+vK6rZiORj+74LKem1BieUqClxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736688795; c=relaxed/simple;
	bh=56BLcFVoX+7Lw71cTwO9yffs0jhx9suVmg3Qou8SBBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfXRishREl5NoabhXsG/dfD55M2uighXWUqimAGXChk6GyrdDaNDrSvRTiK10WlG4+VrvRNvZWGYdJki7Lyn/WZMi92p+ZtXCmg4B9xFKL+gKiMsNXWi7VpclKgO4LFbxkBfvM7wbFmpXmPmZn/ssPWaihmVCod/Q0+fyrVjmMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KlqEYEwq; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KlqEYEwq"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3c1f68f1bso504805a12.3
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 05:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736688791; x=1737293591; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TB4adxko33N4lxV8vB34w9Deg0raCbTSnaXjgezepI0=;
        b=KlqEYEwqyMbHaR85GGp7VPeFAyS4K1yfp+fglGMzBTaOZNNnkTeHfXUYVID+QGmZhx
         pa1foEUGFcK6FJ+UJ6lMojMau8UhfPONKFu/OPYR4bzlwuBy78C/mya7F0IVSdxhrjim
         lYFqeDBqSAwHK3I7kluZf8ltCqTBu14HEMZpeOwWhUCkXwnGfaj37Pzo9nyMPmKHfdGs
         eec7tjQG8FwMXzaO/6v6QqrxEJvjW5Vp89+l26BbWzh0x4kAUSagoprxtR4zaXY6R6Br
         EK3770NBAsqWuPZCZWm+tv/ViYt8cmGW/AvYpbMCOrf0O2+4PYNDmCoPga5yBmaGVq0X
         5U9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736688791; x=1737293591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TB4adxko33N4lxV8vB34w9Deg0raCbTSnaXjgezepI0=;
        b=G348vlKeY4/+FOUUOgpQ+uDmIsGGGyoLjdDEIt/qKDv5rvS3j820AMRFxFlM/BtL3e
         wUSYjXuuTW4DSW4zjTj8FKsyMeiyvDms2ScafBUwtGisLW8gt5NvsBZtJSc570UDVJ4q
         le9gh5OvQcib7sIK2zQn/klFcqfxScHtfOHr/wzsuyUpC5T0jDVkKTuFkxwWaqsvTaRy
         ab9mMRNNHot998Ci8CbKEiRC1tvIpHRM28cxc3dXu39/Mx+RgOdbIMdK2xQSYHv4l35O
         kD8JESyxnDAySBACOZgl+sn0uMFpIhBaMwpl3fEzHh/kWVUqDk1GmpSroMLcNurumGuJ
         q6TQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0GrD2Rtyel09/sG2Vv4DJojgJaBFRkNQp3VEM7RaCmkiXTCeYmX0zn00iz/Lu0bD/eyw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKHdOGftOxK8WfIKP8gOE5oL8NYpiOjLTGVgdjBCYvg/xB0qVO
	K034I7fTinNMXOfgGouFm1QAPayfCc9IVDMAnWWkGa1lJ1640Xwsxd05e3rnzBwH8oH09TiOvYM
	Z
X-Gm-Gg: ASbGncsPCKDcQ3bbfULWuLkZz4xi0D7+GW/9FbFks++PdcBHXdapdNTPCxI7DCIFJth
	4cqipklhashKa4tNUnJmRlvmFzM0YduCoYGBUcHzJXrghDPwMsbGe3JIoDTG2J8ClzSW8bf1YxZ
	yayBe77bE5Ktr2G2O1vTqubG5PxJmGWfsiQXZudMjeDAUygdaLI/Slo2k5Lgu0/WUTNAA23Ehsm
	D2Lvf4E1lFHYUyzlPMMCWAW3KVGJKFvYTTkwjE6Ph3yEOCEkyg0ooEMGbrn6qZMFOD0ehxl
X-Google-Smtp-Source: AGHT+IHIeA9RUVsHVjCtYBXrSzIpeTFeEgLh0b/t4eC6XNfpXfMITPN9fmFvIdYvwM7BkZDK6rGKqw==
X-Received: by 2002:a05:6402:2355:b0:5d0:8111:e946 with SMTP id 4fb4d7f45d1cf-5d972e15f45mr5790801a12.5.1736688791295;
        Sun, 12 Jan 2025 05:33:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:33:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:47 +0100
Subject: [PATCH net-next 5/5] net: stmmac: stm32: Use
 syscon_regmap_lookup_by_phandle_args
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-net-v1-5-3423889935f7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=56BLcFVoX+7Lw71cTwO9yffs0jhx9suVmg3Qou8SBBk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SEkQmvfABZs7QuVyVH4wapih3fPoh+Xo3JF
 lM90gZIsb6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEhAAKCRDBN2bmhouD
 14yoD/9oAXKquSceP15cb4gscg+NjoZ+s/tq5Q7p4hSunWTAFL8/Wd9T3H6hKFgZZce+fKazJeH
 OuMNJ+xcL0SXlWwVY9G4b9YXdEuYoJA6TSXQUiajhx0AbWHblwVbebmLTEJVyYxSPWKdYMkDOM1
 TwZdHK7mwNYgdJvCSJ5ND4AME0ONupR57eCjYKJHW06hflFBoqQ8JoXGpkG1cVrGrD5Yc/OpRdL
 qs0TPrx9Pcx0TLduLA4Y0WEIwAjWwQqipQVQXuiGf7bJDAcmgmrl3MMGhztBFz53tcAzWArA+wz
 vb3OxaD76FgG1AH8bHu1gUF6XiOMqGyO5MNclKzxnq20cnvmD51A9HJVo4AZ6Kn5iyQ2Uc7JAmX
 f852BpZXk+tD20hJ4LWw1CunjrtcZMKrTZs3KwJJqwhYUcylqd5+Jud0bH/kIJ0hy0kr4HV12ME
 3cNiRRBx75ErXkyDnOh85zzcqJ1wHwyKln9Bu5QVcuOFmneuqUyzyCf1YYN/Yo/V1dGEMoThVcc
 Q91OFMfYpRjz4xynGG/SP2H+RVf9RMxS4KE0TyKWEUrX2T7KR3PB9WV0SZsrOss40nqpKqD7WaP
 y8K8kyRxarGD7SGNq5RqQXaHmQcDpKew2kHjLq1oC/56T8THHvlHWulDPgyaCHBrlE/uSvzogDW
 bj/Ib9m93TZhnaA==
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 1e8bac665cc9bc95c3aa96e87a8e95d9c63ba8e1..1fcb74e9e3ffacdc7581b267febb55d015a83aed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -419,16 +419,11 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 	}
 
 	/* Get mode register */
-	dwmac->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscon");
+	dwmac->regmap = syscon_regmap_lookup_by_phandle_args(np, "st,syscon",
+							     1, &dwmac->mode_reg);
 	if (IS_ERR(dwmac->regmap))
 		return PTR_ERR(dwmac->regmap);
 
-	err = of_property_read_u32_index(np, "st,syscon", 1, &dwmac->mode_reg);
-	if (err) {
-		dev_err(dev, "Can't get sysconfig mode offset (%d)\n", err);
-		return err;
-	}
-
 	if (dwmac->ops->is_mp2)
 		return 0;
 

-- 
2.43.0


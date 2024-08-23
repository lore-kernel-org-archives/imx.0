Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FF31865F1
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417495; cv=none; b=UlY1WdeW+yP7lCsQWyEVEYBm0lRP3hNrAJGyuJ2xiQhlpkaCGfpFfDCNNhhlblrqGO5mbzkitnETNADSrYE68GxbujKLk61Al5isUb59DRby4ehkt9/E2J5jJDMJq/ZD8lHGm55cicfQmkz7iOdI2y+r3oSwchCfF3qpqpnAVng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417495; c=relaxed/simple;
	bh=tKIx1euz/voqGvTWXrKxtVVbTahOhXCIVgZ5jLT/O6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZj2WH2TyM5Ou7gB1gAx0xhdj7nRUGCwYEFVMZjb9xzcf8lF5Yh+FNhL2ji8v3adJzy9qM2MtxqY2v4GNhCVvhVIWwdA3u3uqSQOIGzlEb5/CNbXBQvOeT7XKdvovFQNtc3rFnXVHhlE4dSOFwdEogru7t3EMcVaYmDTkx+CsDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZgEUrMbv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZgEUrMbv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42808a69a93so3368255e9.3
        for <imx@lists.linux.dev>; Fri, 23 Aug 2024 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417491; x=1725022291; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=08WjYAlBBFEeMm+hEjWVyH9fkJaAAMN7ZuFtniSsgzY=;
        b=ZgEUrMbviTMtjMJOSNOpkYo1SYPcjs9xMW8uj/AZf1vUD4DKcetpvXCUMaBI+hSkhQ
         rejw46Igs4fDXcSl+C52oVmzHNc7z5XaeYvjnVBtR4VtAwToOUYJyzQYGIlCFTVnPhxx
         c5uW8V/Kw+9uiKY3DGjmO9tqb5wvzbryY4S00qrNtgOmSQBBus/f1eZsVtEhanU/BTWT
         lAR3HXSM7/G9621M3s20RiroNIWK6riK/glDJpDA3iSPs4S6j2vwdwC6ewqPAjsPbbHm
         xUIyKFeHWLliMBe3jslEUlEmEzQyuotASa0npPHUMnqEsET2vqF72VmF06C/znrNNnnn
         GqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417491; x=1725022291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08WjYAlBBFEeMm+hEjWVyH9fkJaAAMN7ZuFtniSsgzY=;
        b=NPdApqVxogbGazi5kQKTmwuOvkonR0yeOvAoVlqBkjgVw31/TyPUsQGKeoeuTLT6TN
         NrfKxlNvuRaYkmy+TSMgSBCp8gPurwgSabkjJYt3kiisGQuMkx9Q4kViRVGaogSzjxvz
         R2Q942XpUv6SEtusJwiY7jKjUP9CDkjqsekyiOiEvH7qdc9RoSTgEBNgWyfh2gBe2mlQ
         RjFB+m4DhjeAfJaXpeesYLaVIY3lRhxxQsRURCetsM1wSk6APnzi5twEKF46E6VaLlf1
         2w/x2mtpCI2uC+Sxvdmr6MymzRv/hUL91bcTEBrR1SFstlDztcD6B7j35Nm5EbX2wNc9
         dhSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4lGKO3FpMCfUOfoDy76gW4AYlv1Uc+3bHcZoUFaf5l655vGBjIb2W31QLriNzlaQjwzo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwFXkE43VsyMP5hhgOrKheg0HPTTn0KEpZodVSeLxagZnM67ec
	c96TTok2kKQLHE+XTSrMVwNY7yDRVovqQsg0C03LVGNS1clGJDkOMWecn+nwT3w=
X-Google-Smtp-Source: AGHT+IFvESEynb7DEBYY8hzcsJgziySe0iFY1cy2WIsrs8d5Dw+VUq4IdBOvbW6RhGMnpPDiy3f+xg==
X-Received: by 2002:a05:6000:402a:b0:367:95e3:e4c6 with SMTP id ffacd0b85a97d-373118310a2mr763684f8f.1.1724417490919;
        Fri, 23 Aug 2024 05:51:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 14:51:06 +0200
Subject: [PATCH 02/10] pmdomain: rockchip: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-2-8320722eaf39@linaro.org>
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tKIx1euz/voqGvTWXrKxtVVbTahOhXCIVgZ5jLT/O6E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXFrRydBY7pj/F8sriEDoh64iP0CNuv6npaj
 HfeNRwU4H2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFxQAKCRDBN2bmhouD
 1ydTD/9YGdRcqk+Zok98MLP0sxqW8OpRmhtYJW2V4NNNbYyyky4ZJr4aGR1Odu+U8AtBgSsNa47
 2nLXZ2bJ/5YbwBxRXa1l30xja/ULnh17kbIf7MVIbVbbuXU1oqsAyqX9zuje16YcLC5qF3v5ATI
 BCrONFjJ2VsbJgn4GHfBK89oDUSVCXIPjrzONIpHVL5vqBv0hBtzSAYjXcqtBAzvCcpGNRT0zDf
 LLAB5t2TCzU0sxWRUhXWVTGXcq6LRh178lslP4leZ0m2NrwNTRR2A2xbY90vS+yjVEXQJOGh00m
 VGi/TyviAJK/vok5UfhiiCnLk171BkRPjlAEv6BG6Pc8qLj/LWjCPJNlbwqD3LT+yvv05kEpmeP
 R/BGeiUEtv4xxgpRxfIuSZJhx8iDXIoog+OhAqs4FsFU1CY3Hz4SgTlVI2nkPthKcYdS8U2V16R
 452XzYefITynrpOSYMuxMwfO/7/lil34uB1lR3L2Rc2ltoMqmrUpCr0p3qsuxfZdBogfQsvIpEZ
 dPcBUzyYD1q8vqQJveSoOBN1E5cDJuOiT39Yar1sk03UVz1B2MbvwJiE0L/ORWvknPaKPFbvtEX
 QY243Ebc6HD3s/4s6YzaO097h0Ba5tySJAZBbSKWoAHDKYpgQ3/NaSheTq0SdA+D6L2xGHJQ59p
 WJa/6IY/F6V89qQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling (smaller error handling) over locks with
guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/rockchip/pm-domains.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 5679ad336a11..538dde58d924 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -910,7 +910,7 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 	 * Prevent any rockchip_pmu_block() from racing with the remainder of
 	 * setup (clocks, register initialization).
 	 */
-	mutex_lock(&dmc_pmu_mutex);
+	guard(mutex)(&dmc_pmu_mutex);
 
 	for_each_available_child_of_node_scoped(np, node) {
 		error = rockchip_pm_add_one_domain(pmu, node);
@@ -943,13 +943,10 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 	if (!WARN_ON_ONCE(dmc_pmu))
 		dmc_pmu = pmu;
 
-	mutex_unlock(&dmc_pmu_mutex);
-
 	return 0;
 
 err_out:
 	rockchip_pm_domain_cleanup(pmu);
-	mutex_unlock(&dmc_pmu_mutex);
 	return error;
 }
 

-- 
2.43.0


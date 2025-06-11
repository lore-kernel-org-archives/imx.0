Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC0528313D
	for <imx@lists.linux.dev>; Wed, 11 Jun 2025 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749649178; cv=none; b=mXnar+RjR7mF6vsheHc19uJZVOg3WKo8hK2zkF8i7b/bquFXQS7fPKqQb9eUOIrXlJjTi6EENCWa9uGAymCWwYw/2FmX6ehLMAcYk7DkCh+ZZv6VNtemFX77hbdccBEpJ0e3vA1qjbOEIVOsLxvmNeND04c679FSOge8Ob78dXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749649178; c=relaxed/simple;
	bh=5JaOacqFAetTQHP/6uBPTMlQ7/J4216HlL4n2Z0BrWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nSV+OcsTD2wVdrqnI7YsBFI4PBvs+S4m2cb1FShj9Qoo7ARPCjBmWHMeCLB84sq1DsYrOa9Cy/EtxK5ZzgqewdKaQWL97tNWA2iqLD78eGI2dJfr4Hfh5AGTiP/IGda1nW0Xtf4n0hwmBmtxCZeFTiVcuV57+UU/eiTNb2/9/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+rmRpTb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+rmRpTb"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a3798794d3so5805409f8f.1
        for <imx@lists.linux.dev>; Wed, 11 Jun 2025 06:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749649175; x=1750253975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9OUAwlLvZYK3shMSnqjjuC2PPRPGLPZ13mljQCRh5Q=;
        b=f+rmRpTbrKBozPKUqzDDBGBWuVJePGzSs5/60IEG6H1Fw5PoXPjGPHOkQh/abrLuRM
         U7Ifvxg3xM4edFYhKjix8UTHeHdj5WnopDwUalSUg+vGD5PowtJYaC2kTLK9EsL2EteM
         WOF/0mw58OkFQ+d4FguVNot1XvpGKu9Ucm5CsVUIMoH7QiwIa7O6d38bzkZXY2FCxIFG
         Rny78alFgEftMUq9nr9JtheGR2d5wlbgZyLHZ70D3oFngm24gbWZ+7NJ9X8ZjOJP4m37
         axVFGBnNjiiyJegBAi/9eX6AN10TP0tKPl04le489fvPdty2UP5tme/IHhlf9HUrVXUF
         iOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749649175; x=1750253975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9OUAwlLvZYK3shMSnqjjuC2PPRPGLPZ13mljQCRh5Q=;
        b=nKtMlBMt4w+CVfXhxsTKQizNPoRUN1Zq4WyppW5Z4JuzB1qJxzeUHlzKjt+46VVTNF
         YfDx3/ZwHWRESioIEXDC3GtkifWobGy7BQuToRBFqjJZ84cyfrT6rC76FoF32yUXy/9t
         lVoLLIot3LYnY0PTi5G3Nu0DVYUamBnJRjI4pSmm9GC6ZgJG7jbB6AAZ2D2AEvfEzezh
         8rVfi+0uAve9xcgEYkc0vRWgBg6pUKOvf3hy0B6JLcerRXDz0Jr7kowvF42LstnonvXY
         FZucazFXMXMa24x0UYpusdR9mj8X5inJGaN6jrRRRyJEfcjmS4iPQX7+Fyr+c8Y4hmy7
         +h3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0V94FLwRNvA4o1gW+ndzp5tLinNr0SkYHZDqLOvRl7CezZyE6VP/EMlrP0qvR4owFGp0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxksoyJpwab2728OWp24DUi7RQ1erl2kL93fEkdvP/OY88EAtqO
	3lHnxTxLpKBUsuotIV2gXQi2F7D2ChvxhQ9gK4afi1rD+eBy29/kZXiN
X-Gm-Gg: ASbGncvI7Di3UvJYlTps4v4KL89WFwtkN0DdyMyypymqmtX7pl0ScmX1BraK7tEXFTv
	OQMxCkZ1+SfQCcId0c3PzrQvC/dzqrDlU30WGX7t86od9pk6uV25DXunStNPq56AvfDHnRImkfm
	Z9QKQypBqmOubUCom99IpKYyaIXeUM/ih0blOgXoV2Nk0Fs88JfEQBWy7m2zlWvab2twuSdnihj
	WPLq0ffgskXPtEykHehDiwEftfARn6z0qwG8lh4gn0Zt2uENyyIGq26lkswSyIqe0LNBd9mwjQT
	3lsHtMIBRRWSsKVZDtQCbRnFYAYjEJD3sudRZkOfXnmO/bZMETCqPF5sVi7a
X-Google-Smtp-Source: AGHT+IHpYQTbruYDidDeB7dU9KJaK2k3lDmibncj0a707Hx+03zVcqPkk8SaraSqhwcSRXdxImzQ2Q==
X-Received: by 2002:a05:6000:2888:b0:3a4:e667:922e with SMTP id ffacd0b85a97d-3a5586c3053mr2264184f8f.4.1749649175173;
        Wed, 11 Jun 2025 06:39:35 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453251b6c19sm21702805e9.40.2025.06.11.06.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:39:34 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	imx@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] perf: imx9_perf: make the read-only array mask static const
Date: Wed, 11 Jun 2025 14:39:17 +0100
Message-ID: <20250611133917.170888-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array mask on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/perf/fsl_imx9_ddr_perf.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index 843f163e6c33..267754fdf581 100644
--- a/drivers/perf/fsl_imx9_ddr_perf.c
+++ b/drivers/perf/fsl_imx9_ddr_perf.c
@@ -461,9 +461,11 @@ static void imx93_ddr_perf_monitor_config(struct ddr_pmu *pmu, int event,
 					  int counter, int axi_id, int axi_mask)
 {
 	u32 pmcfg1, pmcfg2;
-	u32 mask[] = {  MX93_PMCFG1_RD_TRANS_FILT_EN,
-			MX93_PMCFG1_WR_TRANS_FILT_EN,
-			MX93_PMCFG1_RD_BT_FILT_EN };
+	static const u32 mask[] = {
+		MX93_PMCFG1_RD_TRANS_FILT_EN,
+		MX93_PMCFG1_WR_TRANS_FILT_EN,
+		MX93_PMCFG1_RD_BT_FILT_EN
+	};
 
 	pmcfg1 = readl_relaxed(pmu->base + PMCFG1);
 
-- 
2.49.0


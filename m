Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDD828C2AA
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349102; cv=none; b=Jn7YrYRBERkloycSP168gUhSG7a/ZB08pMHEeuBb/lY/t6kia+i77ecgE8nRtcNSIGOLNrHVVckAxCDPzCqyWgebd7ILMBYfSMnK+WGbim7Szs7SFseyRGofKaOJ6zjBYKpYdbcH9vTRBkrZDL/TelOsozwOlqbB5lhRUxVUw3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349102; c=relaxed/simple;
	bh=uY+ZOwQz9NTow62silZ+dNZ7euYQDbRWxGmD0jBRAJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXt/OM6xzDXqAuueH3cp2rNiXXnzVO/9Z4HwDsiob6fEYH2k1ptJGVUoSvC1c83HlZYKniEHRvrfNnYIGyws31H99jhhRbkhrjTcDzqI7kyMhPudFqbH27fE1dsLnICV8uR8reBt9KG+Cps4TGztiYvRrvogVaATwxGMYTmJd/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZhSNCvHq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZhSNCvHq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a54700a46eso350632f8f.1
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349097; x=1753953897; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zi2TjXbns/ZB5tY+tLJCSU3ZnVzRbewv2i116bdMct4=;
        b=ZhSNCvHqxBo0kUFiRnEwnRJxl1k3O6+3Hqe1LhrYKs19MvL+ACFp76AR0SiZTZAPTz
         qmhZJM3ajyFwPojUopkQ89Fb7h1+cbyXRSqU+pLyifBUJOWVfJLshi7a9kdovC7F4szd
         SSkzzM04jPmRgHGq+hEinK8HbYjfSKjRISL4gS5WgR8TQpPf2w+9y4D8ffgPcfV1Jqpn
         rqs/cUkY8RL7xNc0dAi5ZV/YLoc1VFDLnppM7xyDmeM9e7T/4YpUpAKnPqzFoWnTfDQi
         lcOxQ5r52B4OsUSIjU324fXu7s37AmpoxkZoG8ktS10Mg8wJ2UjqylsEaNXzWKR+ZoSU
         WEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349097; x=1753953897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zi2TjXbns/ZB5tY+tLJCSU3ZnVzRbewv2i116bdMct4=;
        b=A7BLg2MGt9quwrIubZmaPJJTHMDAVB4gfyl1QJBJec04u8XukpuiwwFzK5cVWywrHi
         vOKhJ+G44723uQCDdFi8h9Vr51flXMb9fmNhobzpRw9toptI54/X+WWQ/CuvlToNzfMB
         GQyLbPwwcO8WP2YLjxm0heiiSlbllKaTbukqiTGrzuEe+jwIRzDWQfHKffh8oCr+9FS4
         DspukM06jFQG7+3rxw6LkzIlz4b11n0e1gYkyMofG8tvNvsea9CNb4CJyKqkrsaYO4x4
         ODUdrnqfK/Ka7r8X7Lca7U6mKlS67vPZJMA66sm74ArvL7FqB9OUib6QWESLGQZnUmLT
         4HoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl8MAJuwQ0SHTdAFjUN1vYY8W1K5BvwoFeMW1xr37j2xiJ4boWc8K13SLpatcQMRfl73Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrkSI1OpVcRd6SVHmV3nKGsnrAR3pJ53A2Y91rcf1GZo/RwHyF
	yOCc68+gno2nKvMdQtR7+tmyTDWGR5DZtKal5oULILbXF6rVxTQb9cfZCGDjU+vnrc8=
X-Gm-Gg: ASbGncs4AFJRKW7CQ8WSFpBM7Wq83O5VM7AJFgVunSUCNDtqaHrvlhosogwsLeb9o42
	3PWPTqT7xZmVA48FlIEe8THUTPrEs2ClO8/JRi3ds4R1/nXZ5tb1cOPC5xuMz3Ycou1B1MDkU4X
	9BzLM4DAHGAIVGaAY7+/euujneKFiaHngTsYuNZRZGylseTMMiTNHUB/bLInUjgX0YexM2sVW6F
	VnJoyG+QxMWs1kWNt5htoaIH5Kva+1omnmKUx3k8Gmehi2G7wNehWpMzw/ImJSTg/6xqd8XVFub
	mEIX0WmWRI04nT+JI0U3/CuAqJ5WNUZ4t01bYBJuvrYblj1Dk5O6BmT2faBYEsvyyYOxTWrTDRP
	yBs7Pohhd/nS8760J
X-Google-Smtp-Source: AGHT+IFjtwksIDz+7DSsBWeS97i1ZBqpIGTXCOjdZdeq4tlTrWHKVCP+IvRPyXYuhcRL3QY2eNIWHQ==
X-Received: by 2002:a05:6000:208a:b0:3a5:25e0:1851 with SMTP id ffacd0b85a97d-3b768eb077emr5529569f8f.7.1753349096652;
        Thu, 24 Jul 2025 02:24:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:39 +0200
Subject: [PATCH v3 11/15] pinctrl: qcom: use generic pin function helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3208;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=j23TQRNjGh0BJR8XFxZqqg+wPRm63XTzB00GHcaNVhk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvTk7yHYlcFQMyWoiWjPshDZZtgzQDFYrODV
 Z1WZPc/WEyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70wAKCRARpy6gFHHX
 chVRD/9eeVGld+ATTL9+JqtQxPOrIZwlqhXFRCYZlyZazFTQwwHsY0fRCWqUY8zJDUpWJ58dICF
 jGX8CnvpX/qLEAuVRoRHPDvawkmoIZ7VML54qi6pmuB0YMtGcgUNj2YkriHA+g6fdE7LK+D3e78
 QQofwNaGv1MFuYFQE+hOnDOirVK6VIc8XhYsyL07YDN1qnaEDHtLkBZHefcIJryYxC6wlNBcz1p
 Cd3S05INSHpxvJstk5w7pofJEtTs0jl8bbzR8F2pN4QRtW6JfIKpD1otUHL+T6Ny7Qg0vUXNtW/
 Ibk72PLoLyTo/yGUQS0qBtRGzIeVRaxeAlbL3TC+oIXA8n8knMwcZsLnfQ8WJiygL6jWKA/bLkd
 XXXexkgPtnZPj/2q+WJTsC2+aVYV6F9bXeUOGEZG1tPatCwGN5qcsd9Fpdx+lRDxEmecZasPxgO
 IyNyAkCsvk2nERY1KT1vAZeJ+dgl63R3L79Rte7IK4nvIFxQeIP1p1hbSc7vOUV8Y8MTZg9RNKW
 pWMHGEJJmNENd2gZl/1mIBxCkfmnlDE8ymlKk6Rd+DK+e6X0sWBgvjj4so9LtIKeO8CmRsTNYoo
 4keB8r+QC7KS0dwAvoSEOFiNm3p4pkvhVsR7Oy+hpgrltAAF7eE9GT1MfhLfdxNVC0w1dagDftW
 5csm15vDv1NWXdw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the pinmux core no longer duplicating memory used to store the
struct pinfunction objects in .rodata, we can now use the existing
infrastructure for storing and looking up pin functions in qualcomm
drivers. Remove hand-crafted callbacks.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f713c80d7f3eda06de027cd539e8decd4412876a..965f0cceac56697bc4cdb851c8201db7508c042e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -31,6 +31,7 @@
 #include "../core.h"
 #include "../pinconf.h"
 #include "../pinctrl-utils.h"
+#include "../pinmux.h"
 
 #include "pinctrl-msm.h"
 
@@ -150,33 +151,6 @@ static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)
 	return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;
 }
 
-static int msm_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->nfunctions;
-}
-
-static const char *msm_get_function_name(struct pinctrl_dev *pctldev,
-					 unsigned function)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->functions[function].name;
-}
-
-static int msm_get_function_groups(struct pinctrl_dev *pctldev,
-				   unsigned function,
-				   const char * const **groups,
-				   unsigned * const num_groups)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	*groups = pctrl->soc->functions[function].groups;
-	*num_groups = pctrl->soc->functions[function].ngroups;
-	return 0;
-}
-
 static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned function,
 			      unsigned group)
@@ -288,9 +262,9 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 
 static const struct pinmux_ops msm_pinmux_ops = {
 	.request		= msm_pinmux_request,
-	.get_functions_count	= msm_get_functions_count,
-	.get_function_name	= msm_get_function_name,
-	.get_function_groups	= msm_get_function_groups,
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
@@ -1552,6 +1526,7 @@ EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data)
 {
+	const struct pinfunction *func;
 	struct msm_pinctrl *pctrl;
 	struct resource *res;
 	int ret;
@@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 		return PTR_ERR(pctrl->pctrl);
 	}
 
+	for (i = 0; i < soc_data->nfunctions; i++) {
+		func = &soc_data->functions[i];
+
+		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = msm_gpio_init(pctrl);
 	if (ret)
 		return ret;

-- 
2.48.1


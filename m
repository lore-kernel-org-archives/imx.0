Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112164582D8
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 19:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240378; cv=none; b=PucoKUKpAYAegW5PR0DbIYFlcueL4W82nwFRBjn1T/tBfMLYtbyOhnHINa+OBDvPBN3nDbx8BaQgtXF50myfPQwfFNo1vhXhuF7ncaMglJXEu+88rqkiDMovHP5d45wTNiqOn2su1dMzjCFldNUBI4HCDgFKEkplzCqjISTDtu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240378; c=relaxed/simple;
	bh=Ix38TazmjpNN8K8bcbbXrymOYyLkk4HmlfbglpAUeqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qoGmJJ2BqI9zv2HKTElotDlNi40Qs1bTRYmXeV94Aog9jhC4UzzKmIAUv9lC7nH1ffFBGEnDD9cNCtqdDpKYDC8WR2Rqnk7G5iov+rAxHaQ9ubOC+4HBGce1z/X6o/g18aydYukSfa9FC/B3NHCDHSCtFP9/xOyjSa+tt1nOHg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrUS+9rT; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrUS+9rT"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2009534a91.2
        for <imx@lists.linux.dev>; Sat, 12 Sep 2026 12:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240376; x=1789845176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=LrUS+9rTsNBKanAK6BQ95GecVTcro9fUpeykgPRHozA8HCVO223eeG+NEEPGMb32ly
         y+Vae70AjwamG1ReWPMiVFKkhuCrRD7cR7RhYMEu9Mh4HqktVq6ziS7+M2cF/3efnT8E
         4ACMGEBApUg1BREf7RyMO9SC310uRjM6uVvTpc87YRKAxQwMB7JOTR5lFFicSXvKOkrs
         fNFDQnmbwBKm7h1E6Yl62S8dK3doYgKAhVYlWo8dR9vvOvafo7hjZn3vOh1EN29W85Dd
         EUxuF+EVCKE0RSPrki7Dl9bgK7/1F+iOCXnRlrsIsUkWwqZj7gEbCwxRK5XhwCYlOMXd
         pung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240376; x=1789845176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=KcE2tC0q1BeCZrfQ2YbRl03h2q+NuWCn2XjJhrh/Ikccu7iVYcsUz28+TjYGqUh0Y+
         hGmsKu3xcUN8xSbvkadduWgjq442sDHI9zpllmR7x1cca5jcYL+7DO3RShJiLAMlHBAE
         xsZNZsiXqX7sasnA6faXomdkjvHNgI2KVKwAe0dZeaMq6ibIghsCpTSlfa/JlttStr4W
         XAQwNEMojm4tCJYSkHUdjpkZE9vzYo+UDsTVLezvpi49kapsY0pTUa8szRtud3BH6/Xf
         6zK80ZrqE/r2/FL/j34LmAoe2yx8eF5KQeKfl+iCDLpPj2lKa7OyfrfrvtS5jwl6k2pP
         LQZA==
X-Forwarded-Encrypted: i=1; AKwUvBxB31rF2EZ3Zodi1d9GslG8lPb1SzjYb1R+aru6OLHKSxdS+6MSpnDw27S0rCrKLBSdZMw=@lists.linux.dev
X-Gm-Message-State: AFuF++k8yvm6r8JyEzldXSDkiT2osI/6XtLR1ZwSwrjA0kq3iZNNZMeX
	eMCEnOQk+VFA2q3LAEXWCB43EN7Vbb2gD+quBppCKmxn/i3oPg1+Uo4K
X-Gm-Gg: AYBFou1d7krmi/b7iHY6TkiIRYjyXPVAJ1Cn71iKuImRKxxPXJAMb0ERRDf8KPH9bQG
	+md0X2zfu8NyUs8jnTk+yFQcdS5PBE01VhYcCaB5ZTtnozH5uPhF8xPGlv8iDIBy7vyj9CQVyUZ
	Xyik+IchbZBcJqQ+RrqA9II2QW3QJOTgENwZCSvXaj02eOKx4RttPyJTBQsT1PqKZCLrNNkuTpL
	XgPHZyVZeegH90IiajWDBkpJCW3AjkhqGLN0iF0uagT9UijsuqGdiDcrdORTf+Kp5bi9IPskKjC
	UP97DEuoCBCS12aWKf/Pqb7bl7DqgYidhosgiR7gqGJRTEqVrfr6klFWe90gvH+0LTyTJKcfUhG
	nvnhDHDyfh0XB05lDxSI8TuDl942Bf+u9m3JxHhA17wIXKO1z2uab+9UbVEoQFwtEoONpVpt+1q
	/TNnau5FGTULclpR0OT+eR6Thc8tMrZm9334laX6Evy9yJuRwmK107bH8gSj9LrPrikP18
X-Received: by 2002:a17:90b:5745:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39d9bd685e6mr17887143a91.10.1789240376247;
        Sat, 12 Sep 2026 12:12:56 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:55 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 3/5] cpufreq: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:53 +0530
Message-ID: <20260912191156.185448-4-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
falls back gracefully and prints the raw integer value. This makes messages
more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
 drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
 drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
 drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/cpufreq/bmips-cpufreq.c b/drivers/cpufreq/bmips-cpufreq.c
index a8e35bc75fb2..389fff5e6f65 100644
--- a/drivers/cpufreq/bmips-cpufreq.c
+++ b/drivers/cpufreq/bmips-cpufreq.c
@@ -132,8 +132,8 @@ static int bmips_cpufreq_init(struct cpufreq_policy *policy)
 
 	freq_table = bmips_cpufreq_get_freq_table(policy);
 	if (IS_ERR(freq_table)) {
-		pr_err("%s: couldn't determine frequency table (%ld).\n",
-			BMIPS_CPUFREQ_NAME, PTR_ERR(freq_table));
+		pr_err("%s: couldn't determine frequency table (%pe).\n",
+			BMIPS_CPUFREQ_NAME, freq_table);
 		return PTR_ERR(freq_table);
 	}
 
diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 80893844353c..f767898ebfb5 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -230,8 +230,8 @@ static void cppc_fie_kworker_init(void)
 
 	kworker_fie = kthread_run_worker(0, "cppc_fie");
 	if (IS_ERR(kworker_fie)) {
-		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
-			PTR_ERR(kworker_fie));
+		pr_warn("%s: failed to create kworker_fie: %pe\n", __func__,
+			kworker_fie);
 		fie_disabled = FIE_DISABLED;
 		kworker_fie = NULL;
 		return;
diff --git a/drivers/cpufreq/qoriq-cpufreq.c b/drivers/cpufreq/qoriq-cpufreq.c
index 42edb41ad459..0652e5df0278 100644
--- a/drivers/cpufreq/qoriq-cpufreq.c
+++ b/drivers/cpufreq/qoriq-cpufreq.c
@@ -57,8 +57,8 @@ static u32 get_bus_freq(void)
 	/* get platform freq by its clock name */
 	pltclk = clk_get(NULL, "cg-pll0-div1");
 	if (IS_ERR(pltclk)) {
-		pr_err("%s: can't get bus frequency %ld\n",
-		       __func__, PTR_ERR(pltclk));
+		pr_err("%s: can't get bus frequency %pe\n",
+		       __func__, pltclk);
 		return PTR_ERR(pltclk);
 	}
 
diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
index 9cef71528076..9a01592425ee 100644
--- a/drivers/cpufreq/s3c64xx-cpufreq.c
+++ b/drivers/cpufreq/s3c64xx-cpufreq.c
@@ -152,15 +152,14 @@ static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
 
 	policy->clk = clk_get(NULL, "armclk");
 	if (IS_ERR(policy->clk)) {
-		pr_err("Unable to obtain ARMCLK: %ld\n",
-		       PTR_ERR(policy->clk));
+		pr_err("Unable to obtain ARMCLK: %pe\n", policy->clk);
 		return PTR_ERR(policy->clk);
 	}
 
 #ifdef CONFIG_REGULATOR
 	vddarm = regulator_get(NULL, "vddarm");
 	if (IS_ERR(vddarm)) {
-		pr_err("Failed to obtain VDDARM: %ld\n", PTR_ERR(vddarm));
+		pr_err("Failed to obtain VDDARM: %pe\n", vddarm);
 		pr_err("Only frequency scaling available\n");
 		vddarm = NULL;
 	} else {
-- 
2.43.0


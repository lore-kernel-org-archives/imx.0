Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541B0481A81
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 19:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240391; cv=none; b=Nl1Fj0EJLyuqX2wmMQsf0JsphFAOh4dMEyptsiLfm8j3njuLLIy4GPYx6VTiWCtKRPfSzQI5FgyPyyTXC09yumqk9uUNCGj/W8X2izsLEh+OCUHWU/U3PAKPl+47UNQ27QoKLZXa472pjlusuXxUCbCKU4KrRVhAzGr94GTGG+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240391; c=relaxed/simple;
	bh=3EjLPMtvKg2GmNImlqYJqrTo1wBe3j2XE35A47khzrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=elCKa8iJMlkYDKlWVhZBvpBljmwfZkN+NNWhXiUDuInfJxU4oSbENJH9gXD0UCl1NlHvMbPR0+s47rWD01wcEPEzV+vaSCb+90RMsesFAn9R1wO0IMHyy4fksODirlWP3SxRX1z2VumNDFtD7eo3/U61L4Awvw3aVhDTf37lIN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jnkeug02; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jnkeug02"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so1058591b3a.1
        for <imx@lists.linux.dev>; Sat, 12 Sep 2026 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240388; x=1789845188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HIyoexeJaOf4GZ5Mzi02CK37U3A8OAhoynQEmxQpvQ=;
        b=Jnkeug02cUgR0kCtA+aChiCJ7oqSLyt4yfcZurZQ4NA/sHXhp31mGhrb2ybEOwCN2h
         4Tym8w4kn1avyMNV1v1tgbWCumNRXR3MHlT9d4bRXhKhoOIP9Qp3CrxDKi0iILtvpTYk
         FwkirIkQiuoAbZi2aimL077UPsyFT/WN8LJGeldGV5+ZDmE7msaPIA4DoXE6Xw1PUxqZ
         w7WWZGCLf2vpJUWkwcIpqzcmPI9KomMBLsuNWY5/8r/vqkV1keu25eIomL06I6gvW2T9
         GmSHybl2P+3x6Mc/qyYnOeJC+4KaHsaE8loJQ3eLtBseZ5GOXIV1roBVKe4BdsllQ8Mx
         8FUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240388; x=1789845188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HIyoexeJaOf4GZ5Mzi02CK37U3A8OAhoynQEmxQpvQ=;
        b=XaDvzEF7l7nc7fPmdZOz/6yb40FKzL8PIFHGOwZt+31kpNly3GLm7qnHfbnqIIbctM
         34voh9BwRLJMkyl97GhzhwdMkK4qhgYLkAVKGj2Ryy78rzMmANqusowvD8rcnppJqP49
         0eew17y0cNXZtbkmhG1RgBsLPwaWRY+QJpcf3Qur8GUgzpe2Lai3k0aDviszSK82Kqm/
         9gEYr6g9Mqm/vgcTmsSJY9IyZM+kNQSNZAo9WGKDg8VCRAxnj0oVKMQrpueVfXz7jReu
         GuCFzW37H+EPULeRe6xLGigaqJvk6H1y3f7mXQf2F8tU5MPBjrrou1MFxO3WgEJU/+D5
         V+bQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfSdqcpueu9huu/yw225DXM/eFvEpmTecdX+aE88djmOEaiSi7ofgfzP8ibxyhDTY9z5E=@lists.linux.dev
X-Gm-Message-State: AFuF++kGPWSt8FRmj9CUmj3Urth1VpiqQrBjDpOOvjBI+L/yAId0qb+T
	PlQ75S/SUQVk/NUAty3Y37sQY6UVPZbxAFWZNiz5aUa/ozMqp1JTHrd/
X-Gm-Gg: AYBFou0vg5Sjc+WR7XK+TLq6d8Q3mz7qy85gozW/5BZ6D+UEVSj6Fvpp9jWEmHp2VST
	IrvYypjgvcU9xPsE4XNPUAPkDKdIv5wfuIsx5ZHTNX8DgaZi5+L8P577uMRdaiJeNEKr9lx9Q43
	SMTs9sA17ezRL0QSGNxvrnVN5Y/bn+iWBpeyngVqnTcVv17LbLNIA/eXq2UeLH7YmTay4+Ju6VO
	5XOk3+lREo2dkuJyBLtpzI+k+Q+zEF08db3OMBTN+R5QQ9IXYDm1Ly6AnsgkHrCgmlhvgfQMubG
	tGQwdEMD2iuG6EmhR3bF+d8BzUya0FOvR4T/U/l7wSNFyxGisTIVBrxjFRD76lSKg3TBv2+Iyof
	GTsxHDML/a+PbUwWt6NMmfMeVWlxqI3NNO2c7WJfMfjsUnrvRgwy96zlehmWIggHvzCRZZ5icRg
	tldQhwsC95FlyjOSHNnUlHe8S+0vmSwCrWW2Kp88cdEOJ0hbYMduUPLuY+a4DzSfWDuALY
X-Received: by 2002:a05:6a20:d807:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3daed15f5b6mr20435411637.8.1789240388372;
        Sat, 12 Sep 2026 12:13:08 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:13:07 -0700 (PDT)
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
Subject: [PATCH v2 4/5] thermal: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:54 +0530
Message-ID: <20260912191156.185448-5-sumeet4linux@gmail.com>
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
to pr_err() and dev_err(). The %pe format specifier prints a symbolic error
name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
falls back gracefully and prints the raw integer value. This makes messages
more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/thermal/cpufreq_cooling.c        | 4 ++--
 drivers/thermal/devfreq_cooling.c        | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 768859a7aed0..856d619370db 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -661,8 +661,8 @@ of_cpufreq_cooling_register(struct cpufreq_policy *policy)
 
 		cdev = __cpufreq_cooling_register(np, policy, em);
 		if (IS_ERR(cdev)) {
-			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %ld\n",
-			       policy->cpu, PTR_ERR(cdev));
+			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %pe\n",
+			       policy->cpu, cdev);
 			cdev = NULL;
 		}
 	}
diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 0330a8112832..9ada52cbf7dd 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -156,8 +156,8 @@ static unsigned long get_voltage(struct devfreq *df, unsigned long freq)
 		opp = dev_pm_opp_find_freq_exact(dev, freq, false);
 
 	if (IS_ERR(opp)) {
-		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %ld\n",
-				    freq, PTR_ERR(opp));
+		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %pe\n",
+				    freq, opp);
 		return 0;
 	}
 
diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index af72db6299cd..4554a6fa55d1 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -680,8 +680,8 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *adc_tm)
 				continue;
 			}
 
-			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %ld\n",
-				adc_tm->channels[i].channel, PTR_ERR(tzd));
+			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %pe\n",
+				adc_tm->channels[i].channel, tzd);
 			return PTR_ERR(tzd);
 		}
 		adc_tm->channels[i].tzd = tzd;
-- 
2.43.0


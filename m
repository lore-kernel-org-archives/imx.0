Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C168E369D7A
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 05:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785992951; cv=none; b=fYTRcVEVGXiC7RJ3XurL8dvu/v90RGUTATqfVpGPEnUBXb6MFcxcGgKB5bepumauyJWhfR/wu5DvnnXcHruE/Nlakd/750T9LWW+yZ5LgJtIcDlhw/Wp1Lz8mMBFquqB6zmLaGrPiE5BEZllaoT6KsmkSjBpfKA8CIpN6kSR9dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785992951; c=relaxed/simple;
	bh=oN4Rl3edB4mJV9TlJ8etemR3rqbOYTSNlcZJeSaUlcE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Huxoi7IsWWo/y1ME/4XeZsJnHnpHoS9ifeU0hjrNUzSjQGtIkgyF1Q53ktNOEP10n3+afqpJgitDp4+14SKPoZuo6g/aASU4LJRk5/CkvdUDfgNrn9w7TIz6OcAMc7LLV/OKkgj//o1LAPGlAs9UDOS+PYrWEM0Hup3aemramr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dquoDQIC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dquoDQIC"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fdd674e17so1042729f8f.1
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 22:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785992948; x=1786597748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+oWKqgV2uBxAga3aUXb6pt+JmIGNx/LBE5DxnCPtLR8=;
        b=dquoDQICam4NCYqjJK4mZHjnNJrZ5eEZGOcPWd28LNKmvv3Ls5JamQCsadZSqd0DDq
         5IjGg73LnL0lvJK/PKRp+8TYMsqi9gwqNlgZ5NyNMns/tgOfMtq2jD5R9UblWQqsr7dD
         0vZNh9xemzYkDXKcyL9mFkPfbegvbvWPaKxcoaTKYJUMfwf2oBYPgn0JEZe5UQzxfk4D
         Avc070S/8iSU+cE9bNC9FcglkCOKXGAa+rNdrq9qmWBow5lQ9w4zxaUreYWiNOVpo/YK
         gP6E23JZDzksCBgUEhrcXiTeLsV6Bcb+z/h74Gg53oTDPQ86Y4o//Dq/MN+xSvQAI+6b
         FkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785992948; x=1786597748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+oWKqgV2uBxAga3aUXb6pt+JmIGNx/LBE5DxnCPtLR8=;
        b=Uud/U1EsXNYvoKSvdxn3CKAR0VDmb6K4q8LgRtEiELIj1q7G7/cmElG7EcAfxBS4tV
         Vpe8SsTFJWPOOMwGunvuF2XIyXskgmoeKOKG+/WTboTEyxRERgnKQPrsjmj0Cu+xlLSh
         3fDjVlp5Fketv1KuZLOQ51mqz6AoYqIXZ9I5zG9DRKPRecTKa3BNCH6kjmXszgoUn/pz
         Yt8DjocUOANOCcQaxLkplWM9x+q0p4nbgDYaY0MolOqjwrr8xmCnC5wL9S14xdwHY0Ao
         vB9ekvP0wItZVWAOO/VmkrpaDZurg1yeueEQo9AnLFwKnNC9CJf9airoE68noDSyedot
         Pw2w==
X-Forwarded-Encrypted: i=1; AHgh+Rq6Q8ob0X22d3Ab/0vyoxipjSIekyhsW0w2iwMvXE4Vxmyv01FLJvaxZ+R2Ut9Pqr0tQDA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe/DS1mnJUGpM6ZHsepaOIoiK8ROijTFzmFCT1vsLpilzn1j7p
	F6cVMIF5BOH2JaS5oj+RTxJw6T6jmwOQUtrED7lc++GRgx3VKqm5/bl4
X-Gm-Gg: AR+sD10DBs2JLTKbscg6CPQuaIBUTB0woOGYsUU20beT9Ic6YUa1ndwT3jY76OM8qgO
	7E+BirfkVhzC/a9DqeTLF+cxyQb1deX7mSdF5hQfFB5IwReG8jcNcliKZLAC208bLUMGGVIAK7j
	adSUQJiwvy3GziS13EiQFotqaB5MycB/+cW2k2paumG3wr6rA62001TsBEHCSkgbmOhMOsIJwxZ
	dAbZLOs3xhuW/xSbCGP5PPPOervM9cx7rFP5jLLOakjCr7G5dX+aXhzE+7KFGnH/eiWxN1hFDW+
	NQK36Nb5AMJkcqe9vg6CbcYXc5wutWpq6CKf7UJCEsnFk2KynJO32O3FzMjC2VLIYsvVLWNKsK9
	jCCYfUKu400KoRA6oeg1bxPK2h3HohAbHfoz0cOFZ+DCxR+lvSIYIWiSccUWJB57XOS1nebfHdV
	gxz7xEOU7HZhc2MfI69zY3Pkg5xQcKKqnwT0v2+RVrsCkEYQ35P82gvFOoH6jf63SrvnnplJJsL
	bM0AcVk8MD8n2CDS0m5tIHpylHz8Kes+i61iPEQP1js+XnvLpOyf4eGcmOisuGr/KIy3PeXh7xZ
	atna+ZBMAUMasDK0rf6yHBtAeUryMkpuUwRJG6K6etJPZrFMK3QjtlOyOV0J499Ldp4CuP2mi20
	K7I2ulcce
X-Received: by 2002:a05:6000:40da:b0:47f:93b6:8d06 with SMTP id ffacd0b85a97d-47fec482347mr19399636f8f.0.1785992947779;
        Wed, 05 Aug 2026 22:09:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-adf9-2301-8c14-6be6-a9e6-a2d4.310.pool.telefonica.de. [2a02:3100:adf9:2301:8c14:6be6:a9e6:a2d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm3315505f8f.24.2026.08.05.22.09.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Aug 2026 22:09:07 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawn.guo@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Anson Huang <b20788@freescale.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: imx6q: fix devres accumulation across driver rebind
Date: Thu,  6 Aug 2026 07:09:02 +0200
Message-Id: <20260806050902.90550-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx6_soc_volt is allocated with devm_kcalloc(cpu_dev, ...), where cpu_dev
is the CPU device from get_cpu_device(0). That device is never unbound, so
its devres list is never released, and imx6q_cpufreq_remove() does not free
the array either. Every probe therefore adds an allocation that stays for
the lifetime of the system.

Allocate against the platform device instead. Its devres is released when
the driver is unbound, which is exactly the lifetime the array wants:
imx6q_set_target() reads it, and nothing may reach that after
cpufreq_unregister_driver().

That makes the array actually go away on unbind, so also clear the
file-scope pointer in remove and on the failed-probe path, rather than
leave it pointing at memory devres is about to release.

Tested by rebinding the driver on qemu's mcimx6ul-evk.

Fixes: b4573d1d657a ("cpufreq: imx6q: correct VDDSOC/PU voltage scaling when cpufreq is changed")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/cpufreq/imx6q-cpufreq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index e93697d3edfd9..8110c95059e0e 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -400,7 +400,7 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 	}
 
 	/* Make imx6_soc_volt array's size same as arm opp number */
-	imx6_soc_volt = devm_kcalloc(cpu_dev, num, sizeof(*imx6_soc_volt),
+	imx6_soc_volt = devm_kcalloc(&pdev->dev, num, sizeof(*imx6_soc_volt),
 				     GFP_KERNEL);
 	if (imx6_soc_volt == NULL) {
 		ret = -ENOMEM;
@@ -485,6 +485,7 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 	return 0;
 
 free_freq_table:
+	imx6_soc_volt = NULL;
 	dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
 out_free_opp:
 	dev_pm_opp_of_remove_table(cpu_dev);
@@ -506,6 +507,7 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 static void imx6q_cpufreq_remove(struct platform_device *pdev)
 {
 	cpufreq_unregister_driver(&imx6q_cpufreq_driver);
+	imx6_soc_volt = NULL;
 	dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
 	dev_pm_opp_of_remove_table(cpu_dev);
 	regulator_put(arm_reg);
-- 
2.53.0


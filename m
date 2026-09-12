Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD7147A0D1
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 19:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240402; cv=none; b=Tr1xz92RFX1gYU6izkDphp4zpCJQljo6rq59ecLA92k8B+cnrhhsrSRissEn3T90Kdi7xSZ1ouyJ/gXXFh1S6rwlpz32RkW/wkUk95xVSpUok50Ll/8H3tYskUEWE/ogqH9jYohEpegv+mZKoPnjzlQN/Y/eOh3JtWG5maXyrj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240402; c=relaxed/simple;
	bh=rzU25QtfHWStXyf5JOAOYagDMlPR8E/O7UUr9Hj10z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOX3vDTrWaahHkz/qGEFgpff8Tb2W02MF/enyX6LMY7fF6rYQBIT8EuOEQOmIE6dc4KEcpDhKT4jH7lg3jGv0BxwqSobpatEPpQfCp11NbAnygAi+o9oFHBTqINg7TCrWcKHWcBL2Jx7uqOXMngEoGG71xUVv/V/k178TfvjVJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZ1yMuuR; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZ1yMuuR"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2007500a91.1
        for <imx@lists.linux.dev>; Sat, 12 Sep 2026 12:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240400; x=1789845200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epJRaVobxvGM+/1VLnT5WJdru54OJK34KQRZKM0LI5E=;
        b=HZ1yMuuR1M7CgUv0AuOvWgv4MfOjleh1B9msZnIXiuzaPHRS/Ea09vfmCIXp0UKijw
         KsKwDuI5kDYcMcadlQ3DWr7YHPssXXfczOtkGt/q3SKZbDsoFAsOMVoMedIuoU9GcoYt
         JzZRxkd0HrFbqhyY1yPlhYeswr9haUOtOnReQydXHJi32jdN4HcXzth7LR4UESTcOxfj
         i0FnsKOe7HPQZv2eEVhJ6eweo0/yi6alzD/dFyFHxoguo3PjMUcuNVXwi9xUJltuH1iq
         DdZUgMZ0RIWLp00QN5Gxn3aHx+Fs3xJMZVi1nVX4/VzYNMNqahWfUbV+3lASWSGPiaYh
         2V0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240400; x=1789845200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=epJRaVobxvGM+/1VLnT5WJdru54OJK34KQRZKM0LI5E=;
        b=IL8CIHsYzQvZL7oCswcigPCLYCBPnEVe2GNSBHJ0hSvjE2+yvIFZ9Jfh7q06/7gWRG
         EI/zXrgkasP7UvBPjBX2gkwgED3xqeBuiNlEbrVr+egBDYMb1I9vReXCOmYhAUR6iC+n
         65gE9Uob051y9W7gf13muNhIiBthevw5JzDNh8sH9Qe6SyC7Y+asiIh631taT8kcRaT1
         FFResGKNdT5/PyjO5mJu0jz568GOplXQrVn51ZdbnrhNq65XYIxRmTb96jxmoAWkLVVI
         0btbywo4rG6gLUe4/gV8/tXZIuj//kXy6fTwEqoKF3HY10NDg0oR5GufSoKFj9XppkUx
         DwDw==
X-Forwarded-Encrypted: i=1; AKwUvBzP7Eo+hkJXzxfZv+syrcMqNrosxahznXGFG6ODl4rS6/YmcwTc5kFIwBEtsX0/mL3cumU=@lists.linux.dev
X-Gm-Message-State: AFuF++nJR5Kjahfsf7mPGYs/u6UuubxaU9Jiw8BQISUW3J5qe95fCXLA
	J+lHvc2f+zs6WUx58EUsF35pQ1EMpMPGpq23mF2JCvNxM2seLR2WcAtG
X-Gm-Gg: AYBFou1jrp3pMIcqw1aNHZCcRo6h/dXKxjH3VqdlPU5zdS4E1iHu3/hmNDG8w01tPF0
	3Yi4bi8iUo8mqlpMP95U2EJ+zbVScknUmYqvV5quoYCMZcefa7f5eEX+8dVwVzjKoqviF4aBPr6
	6mTJygi+2rx3YQ90RSqtvZszdT11bVfkkXztNGl3YWoJRXHYp/FPgh41TWr6B/rZsHzUxs8Juag
	YUYBwkVLtR7NZP3CiYsnwAFTfWsgQIoAAoTAZUTYiSHWC22oOkWcJuPH98NS4MrTEmuNqd8Tuyy
	+IfnIF1vCTZmBtxOXKL6ad9dRf5/IwuFRfBl15ib/N9wFTEZDh2MfBuFBRS7aEcFfyMNUsVoeaL
	TZud+CNXQ1POrTQ32KEZ5K/s5ZRZqzzn2yl8DHPRm4JPy5UBbhp+g+4K+ecYKy/OTXfw4s0ErFJ
	v9XuEdn9B+lVNqGpthhqPR4B2n0NlPTn7HLuMR/qM0hZtUheo5faaW4OcYF99zECvR5090
X-Received: by 2002:a17:90b:4cce:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39d9bec4d91mr17930859a91.10.1789240400257;
        Sat, 12 Sep 2026 12:13:20 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:13:19 -0700 (PDT)
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
Subject: [PATCH v2 5/5] powercap: intel_rapl: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:55 +0530
Message-ID: <20260912191156.185448-6-sumeet4linux@gmail.com>
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
to pr_debug(). The %pe format specifier prints a symbolic error name
(e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls
back gracefully and prints the raw integer value. This makes messages more
readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/powercap/intel_rapl_msr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/powercap/intel_rapl_msr.c b/drivers/powercap/intel_rapl_msr.c
index a34543e66446..46972ee1ff84 100644
--- a/drivers/powercap/intel_rapl_msr.c
+++ b/drivers/powercap/intel_rapl_msr.c
@@ -582,8 +582,8 @@ static int intel_rapl_msr_init(void)
 	rapl_msr_platdev = platform_device_register_data(NULL, "intel_rapl_msr", 0, def,
 							 sizeof(*def));
 	if (IS_ERR(rapl_msr_platdev))
-		pr_debug("intel_rapl_msr device register failed, ret:%ld\n",
-			 PTR_ERR(rapl_msr_platdev));
+		pr_debug("intel_rapl_msr device register failed, ret:%pe\n",
+			 rapl_msr_platdev);
 
 	return 0;
 }
-- 
2.43.0


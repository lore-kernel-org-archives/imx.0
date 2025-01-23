Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1C212B17
	for <imx@lists.linux.dev>; Thu, 23 Jan 2025 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632316; cv=none; b=CN78NjFaR19CSHqXjXMfyrZY31BBJYOYpF/Kqq3spOakNx/XRrLCRx7HQ4eOa1jbQhiUsOlyO8TiMuJu9lq8eJ3PjVagNZOWskSqsJMQpCwCB+yHu7+g67+5/Pmnso9GYMDx7Bjjd5oI8pjq1l5956ZAagynXFRrVsZGan6px7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632316; c=relaxed/simple;
	bh=eqge6iGc84vWezU2Z/6+14UXJ7R2ONxOtI2jhRzLc18=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qN0/cMuJnL7J0RNnEXmgxB5fAuBaiiWwH0muAYeFTYSYVQuB6WK8C8iFQpzu7KTOD4gUEUcDHpy7ZBHmRZV/8/fPDgSZInCcnsQp3ctdMvg3uxfo/LVcT467vjJ76tu9902Y0ETa4zGEnaVl1U+XKo5/LA3bCDQqob854KUgtRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R+kBcTBT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R+kBcTBT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-215770613dbso8682395ad.2
        for <imx@lists.linux.dev>; Thu, 23 Jan 2025 03:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632314; x=1738237114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYbiAMRoMV0hiAkufuN0q0TYEj4Lvw0IVcfL3LWIkWk=;
        b=R+kBcTBTPMj1W8Q1WJSsUZ74Bh3mI4D3aaEyyr7NNWoI5AxColJgj6njNEskZyVCVX
         delZmQbVyFtnlYm/hgpmgEIopKn/5uPWMbg0nLWwFB9JSOiyKO+DzC0nEMNHXX5wX6BV
         6jLQ1eV1W1fn88qhlAXZYuky3s6izgyoh90R152MF35udIpMKbwwzMR6FEWQdmXHo/Zf
         NiAaqAzxPhy8HkYirpSs/yBKeIwVhoSH9F6i8ZSbk1jIA30x4ujYlPCTLiT++rgVI36L
         OMIOJJ7ip/u/fmWlNjZ0R5PP30IkCAOHIEPwcDrOSHSoSdjFkchKYokt8OvlKgQcUJPG
         7i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632314; x=1738237114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYbiAMRoMV0hiAkufuN0q0TYEj4Lvw0IVcfL3LWIkWk=;
        b=oIYFZBO9LmZE85pGNWWJMdvQHw81zDJ2zsU1/XOpD2pU2vuo02PC2tVJbGBLMfXTCA
         dofx5moVZ0zhG1SNmRz9BsWwOVtFZHQkTdxhv8/1mitHd8KbXhJEwQ4VqLW/w0PUYvp9
         hMh9TuZAgIi6TqTaZLHRrrt1IDpxk4rg3izCRnncOB6HDeUiINnH1spN9INWZhOKLQHN
         jZPdOurO6ILp5NpGG7giiuaMaO+ENMu3wwWH812KfnBzr9C4ta3/8lD8leV7sYyzjou7
         fQiQXRfFK1tvfFyPxxg0Uez/7g2LVuPoUJVtzv3vxR1S8cRhEIxl8UDH9ob62Rboil30
         HwKg==
X-Forwarded-Encrypted: i=1; AJvYcCXJKEwt3Lm7HMMN2ZAU71TLEExPFfL37QHNFSL7qVl6uuv9LWX9YuDcyc+lCwPej/hTDjY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrisAzS51Qpc1urc7VLWVNaDP7+QNivXhATTsttlUdEAr/qpNC
	cLKdGsXuMFQg0InJXDqE8KEIkJO5aOjQznI9QlFiIZkzVOXFDhFWOt2Di2vGXBI=
X-Gm-Gg: ASbGncu0wf16lmGC+5VayGIaY9U1Eg3OoqRnNXmxbQYHnmZ4pHmX2S+y1jCYOkviYDX
	fngdJ0vrNP5QDhrL4qXcvb3RvqCVaYCLpEQD/s9ovUx+MwPaetarld3Ytc9Vst12duuLoeG3xEm
	qwDyziy/kG8TW4HxA40NkE9USt7MXiLecPfN1iMTaKUdHW2PBhrHxHhAPWs/XpzL6ZZX/z2L5vH
	FVMVhNjeXmM85+t+WIYNlZ81sORfYxPV8G+NtIf+zCe+kbOpp2s1YAyQ9A6A2caU7nt/gtLoFjM
	IoIMFl0=
X-Google-Smtp-Source: AGHT+IEWmtbirwXj+IQSwqe5xIcegzpevjEjqaadAFbmkiVSRl3S49VNOuJSbdJ9u4+HbITo37I9Vg==
X-Received: by 2002:a17:902:d2c9:b0:21a:8ce5:10e7 with SMTP id d9443c01a7336-21c35530380mr379810615ad.23.1737632314631;
        Thu, 23 Jan 2025 03:38:34 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ce9e938sm112035515ad.44.2025.01.23.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:38:34 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/33] cpufreq: imx6q: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:05:46 +0530
Message-Id: <5d3f8c59063edeffb48671025685f0189b052654.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpufreq core handles this for basic attributes now, the driver can skip
setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/imx6q-cpufreq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index f3c99f378ad6..db1c88e9d3f9 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -207,7 +207,6 @@ static struct cpufreq_driver imx6q_cpufreq_driver = {
 	.init = imx6q_cpufreq_init,
 	.register_em = cpufreq_register_em_with_opp,
 	.name = "imx6q-cpufreq",
-	.attr = cpufreq_generic_attr,
 	.suspend = cpufreq_generic_suspend,
 };
 
-- 
2.31.1.272.g89b43f80a514


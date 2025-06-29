Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F258D238151
	for <imx@lists.linux.dev>; Sun, 29 Jun 2025 17:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217938; cv=none; b=Qi0GwYId8v22eSc6NYV0xQg/bdYaDytSHZ/egJetTkH3uxEhdMl26Z+T5GDlJw0naDUrkx2KFDCr/M6Zy/2URXbZjc/zFmjHWOedXyb/CQ3m4g6GEdPIHa/dUV+oxVWoV4V3/840hGw9r0ZVeWAiYL4at0pD53xGXTPe2XpsBMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217938; c=relaxed/simple;
	bh=Pzuko6p5X7nNXZXr5mX6MGJAHdvlnWWK8W+rzZlOCQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aXdiuvl+e2w4uheNIaej5nS5FvAgBOjQX1VndNMVgG9mhLOk9dr9NxQBRoJENT/PZXm//tlfkhUBwJahxB1pCCCnDUF3r6jtN7K3pj+qNHknUe4caWRWtj4KBqu9cHG9K2xV2iGuXKAqNj74y90d/ArYTLzJdWztSpfR1kwUS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKSaLtZo; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKSaLtZo"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a440a72584so15895341cf.2
        for <imx@lists.linux.dev>; Sun, 29 Jun 2025 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751217936; x=1751822736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=do+WrCyUk54RUggZsmiUqY5/C6vOQx+Ug7MOVtvuvcQ=;
        b=kKSaLtZork5FJdK/tWY9zPg1Oy7MdVDMCsBl9Y1SoN5eGpe0I+miG0xKbrWEzMMGUa
         7Tn4dC//pgxoepdLKcpv/wWuJOtEiNclT3FtRBZ9ddD0V1WiHP+CmQGsT70VSLrGij/l
         a31gvMKiMapvHJisi/D8TWvOIDZV+p/uoYJylCHhjrRoaET+md4GQgM92tXsr0/qbgk+
         AoA3KqQWf4C3PscMNNzA8SVzmDMU5QJbt8ZBbyhypzgZP5B77HREno/n+bVVxgkXVxYo
         9HMGviVNIUzVG6xNaZKCwqSkSMY7oczihFWZnpGZTe3Nfn5thJtE32Fezt0ckUPspnVV
         zL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751217936; x=1751822736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=do+WrCyUk54RUggZsmiUqY5/C6vOQx+Ug7MOVtvuvcQ=;
        b=rQ4wmrFmLQkYQqHUAbHlvLBK0Yrq8KIIikiwQn/Z2/bOkSl7ZCeJAVjGOlJ3hIjLMZ
         qjB/gEx9lj8BQr935avhZL2kMf541/uYD5s1l+zvLx89NVOq+9nuxBErWtMx8T2xXmOQ
         suDbGaeEakpetjKzNbykWr8ZGfJEkgOKIJqE5bAj7C4HWT7BDjMHFKSfAafx0ku908qQ
         qtuegqde8u2gHOtiWeWFw6onSAR0GzFtzhvQsR+dS3uni8y2VPubbZG2ybSE0798uE8Z
         guKM12oHIss2tVihYpxzdH2y8efi0itGYFpMcIklk9ThGRcBlYyfsJbPKA1utz78ZAPi
         t+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4IN4WP/tkLzNkTAdibKoHS3p2YcvwlPdATSsTdDtXS/3JBbKUpGuPC5952Y3qJGyEiKg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwpa4JULlAZQB+2WaFLltL3KxrvjD3irXoHjzDZrh8loD/qgde
	Cvhfe+F8G13NB/ma874viFFTomIKnsPufnY+7yg25t4INIxn59Va7UH4
X-Gm-Gg: ASbGncuGd2yrFuNwrFcegr0MLfQjLMvpxW2d0mR3K1i3oYbP68Y1ldsG7xtRaRLFJwq
	z/Ts7TT2CRNQwCObKZd9Ye136VH4FWKKI0ON0vkACRaLwAVBxKl49O5O5WobEUe7N1W8NYurUyO
	O4ydoHJiqADCocfGIr6MsS4JD3da4HoY1mUxdFfnV21NzF8a1tOlcnYTPwtbSEBzSiq4NICiuUp
	4xJO7h76XP4z4LSR/Ud0yHCdQ9lF58uWX9e0itn3dGMUaRfwDn9cgB6hWqTwagXdyTOE0yqng8n
	qU8bMW2naTfvHhogsQmL7tv7HwUVoB45wZSTUUNbFW2XUgLaqt8/rgBDg1+78rN1yK1CirLIygX
	p8gA=
X-Google-Smtp-Source: AGHT+IEtbacLnJPOYdFPR4Qbf+3fCv4tbuGcOhmfcatWVey4R8ndXu0J2Fw9Zxydr+PjYKNsz5WN+A==
X-Received: by 2002:ac8:7c4c:0:b0:4a5:98ad:5640 with SMTP id d75a77b69052e-4a7fca4e44cmr189456211cf.23.1751217935798;
        Sun, 29 Jun 2025 10:25:35 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d7dcsm45549761cf.60.2025.06.29.10.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 10:25:35 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v7 1/3] pmdomain: core: introduce dev_pm_genpd_is_on()
Date: Sun, 29 Jun 2025 14:25:10 -0300
Message-Id: <20250629172512.14857-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250629172512.14857-1-hiagofranco@gmail.com>
References: <20250629172512.14857-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

This helper function returns the current power status of a given generic
power domain.

As example, remoteproc/imx_rproc.c can now use this function to check
the power status of the remote core to properly set "attached" or
"offline" modes.

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v6 -> v7:
- Added Peng reviewed-by.
v5 -> v6:
- Added Bjorn reviewed-by.
v4 -> v5:
- s/dev_pm_genpd_is_on/dev_pm_genpd_is_on()/ in function description.
- Updated function description to be explicit the function reflects the
  current power status and that this might change after the function
  returns, especially if the genpd is shared.

v3 -> v4:
- New patch.
---
 drivers/pmdomain/core.c   | 33 +++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h |  6 ++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index ff5c7f2b69ce..2f387e15cb75 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -758,6 +758,39 @@ int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
 }
 EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
 
+/**
+ * dev_pm_genpd_is_on() - Get device's current power domain status
+ *
+ * @dev: Device to get the current power status
+ *
+ * This function checks whether the generic power domain associated with the
+ * given device is on or not by verifying if genpd_status_on equals
+ * GENPD_STATE_ON.
+ *
+ * Note: this function returns the power status of the genpd at the time of the
+ * call. The power status may change after due to activity from other devices
+ * sharing the same genpd. Therefore, this information should not be relied for
+ * long-term decisions about the device power state.
+ *
+ * Return: 'true' if the device's power domain is on, 'false' otherwise.
+ */
+bool dev_pm_genpd_is_on(struct device *dev)
+{
+	struct generic_pm_domain *genpd;
+	bool is_on;
+
+	genpd = dev_to_genpd_safe(dev);
+	if (!genpd)
+		return false;
+
+	genpd_lock(genpd);
+	is_on = genpd_status_on(genpd);
+	genpd_unlock(genpd);
+
+	return is_on;
+}
+EXPORT_SYMBOL_GPL(dev_pm_genpd_is_on);
+
 /**
  * pm_genpd_inc_rejected() - Adjust the rejected/usage counts for an idle-state.
  *
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 0b18160901a2..c12580b6579b 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -301,6 +301,7 @@ void dev_pm_genpd_synced_poweroff(struct device *dev);
 int dev_pm_genpd_set_hwmode(struct device *dev, bool enable);
 bool dev_pm_genpd_get_hwmode(struct device *dev);
 int dev_pm_genpd_rpm_always_on(struct device *dev, bool on);
+bool dev_pm_genpd_is_on(struct device *dev);
 
 extern struct dev_power_governor simple_qos_governor;
 extern struct dev_power_governor pm_domain_always_on_gov;
@@ -393,6 +394,11 @@ static inline int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
 	return -EOPNOTSUPP;
 }
 
+static inline bool dev_pm_genpd_is_on(struct device *dev)
+{
+	return false;
+}
+
 #define simple_qos_governor		(*(struct dev_power_governor *)(NULL))
 #define pm_domain_always_on_gov		(*(struct dev_power_governor *)(NULL))
 #endif
-- 
2.39.5


Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A56A28D857
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 19:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750188966; cv=none; b=WBfXsmMxD3JVVdcMMVjWN3TOdkTdXGaaDTleHTGeX9GXccRvqho3agp6d6mBcTXQu9R+QHvUSE+cwq+iEAcHqmbbkO2KRVsFsAXd011rtZEt97IVkxM0yi1rlHR+XXNcnnIwjtVJBATFGfTQL00c8jcnnXorQcQFWajbUuob3NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750188966; c=relaxed/simple;
	bh=OYtfVADC3YbaOkP37R0UIhy3l79PKRTWkTBXrHQnV+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=isYX5qoHDNE/adsrmPLjWXEU17cSm59nUh+Oavab5xXkEnmpK93/TQ4altEd57Zr51V1FAOrTW0eYZlftGrlHDKgfL5VAKfzM4/XpTgjmRC9In8uo4A202Q3G+Yl/IRCGZgauTMaa/CR/0FLahhSZj58yglppzJB8MTzB/07kxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyPqoiZ2; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyPqoiZ2"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747c2cc3419so4793843b3a.2
        for <imx@lists.linux.dev>; Tue, 17 Jun 2025 12:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750188964; x=1750793764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+Jp9u/wRva4rrnrWzobzjZRnSw87IvFwB/n0IWH6u8=;
        b=RyPqoiZ2gDxckpEf/f7hLqL8+HygNVPCGyjnHfY7t8GuJNBbhqWK6FI8NMbv7maOSe
         04MVueaGOARGu1Lzz/ATBypeFbQWagnu5YKOPfY5trdBeoMp7ujb35iEZF4pykzIyce8
         QTzMseHS+YHngo+ZWJPsFZh4FzJD5yeeJh9SqEwxyLZg2/atAu9YWg/6Sfh0dTHZp3yi
         SwQwvUhZBaoZk7S+ydjRgGyX712W4aGM8fL7rhbhwrTx/hdig4L3ANaU/igsa+A7YJHG
         21br4slIuQW1mc5spZKQmvNek4bnnNiVVspV3mDJjhpkrjLZv2f/+a8cNZGJ59FcfTCU
         dzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188964; x=1750793764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+Jp9u/wRva4rrnrWzobzjZRnSw87IvFwB/n0IWH6u8=;
        b=kEjPi0/bO5NnmHCBOzR9l3HYKs1cU/pGzUG516bsR01fz7/bHm2Zxl193O1qYDi95q
         ryrhfpW8TASySEDy5ixSoJCvmdwhSif20pZNxKMlHyaG2kX1M550G34XzHqrwmLii5L1
         doSEmIrwlznutv5FdSus1w2yCiGtypPbxbDJ0tz9HXCpNcpk4fEu6TBhGgrUoZzMQj9z
         js3h9SIGU/wmQ3PoSa2ch/ChyHr9xvuSJJufBOiDdvoJzN/Cv+ziDtWNxvLXwGTRXDLa
         oFNzrZtnOWWZpxmGR9jpOJhOWkhFkT5jQl9sc6oYdl+CgnlPbzFGzl+2WGV1ShR0y1Y/
         LIGA==
X-Forwarded-Encrypted: i=1; AJvYcCVbq1iD3tUYqt13/PDwnxhP58ZGe3PhfSrF/oJiyHYFVrf9avXYCSRMW0C/uRPNR81/HV8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlNNlMfIdpG+kTYVeetNDhwIRLzMTT++JSqnfavHqBE1slzaFm
	0MRI9VHZmDfZPamvu91rEvwdujgCUOsgEOJGRSZZt3jQ2+P5xtJzFe7K
X-Gm-Gg: ASbGncu/PpiJd9pYh6C4eLPA/VxK/yDoYDP17B+k0YcKHWboNIfnJnkRpv9CqS0gYCv
	6QDSldw417jHPy4SsuChey60RN/+pMWl8nilfXJH5f8vfN0LJ+Q/Wr1kT821TpvSPt1spUOI9WP
	kyuTyqR+FKhccyraLajrrZitv/1pYEAHDRf81bKJlYUh5B85lQtZ5KcQEsJ04qSyZUXp/oqqIZe
	bInSO+R7M+I7tJbqskBlNqyBbgYNw1rr1JzTJSGPiu6NkT6qJ7mjDQ07WXtezwX39YXq78CDo7U
	AsF4iyQTUEsF4M0iBST2Fl4T/vhgoheeTS8BNTXND7jiTqSBWPzJKfC46WshqdSK0g4R6nv/E5Q
	YsBhsJLGomW5Y89dpfm0=
X-Google-Smtp-Source: AGHT+IGcDSspfVbPpwb0f/ablI94JBqFeuuwuuxpXOVNcm2A90uM3TKWTA7DXqp9K6lERbNZaC1dhg==
X-Received: by 2002:a05:6a00:2d06:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-7489cf62aa3mr20044531b3a.3.1750188963855;
        Tue, 17 Jun 2025 12:36:03 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7340sm9648582b3a.179.2025.06.17.12.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:36:03 -0700 (PDT)
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
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v5 1/3] pmdomain: core: introduce dev_pm_genpd_is_on()
Date: Tue, 17 Jun 2025 16:34:48 -0300
Message-Id: <20250617193450.183889-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250617193450.183889-1-hiagofranco@gmail.com>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
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
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
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


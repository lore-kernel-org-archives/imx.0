Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF071DEFE9
	for <imx@lists.linux.dev>; Thu, 26 Jun 2025 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750975179; cv=none; b=PBan5fGDjHrya7rqihCrME52fUX7I+WSqgXEhJYkywssfNyh+5OuutQ3gnNAS6rZMYa+hyEhD83D9N9Y2CghiKrlSjTcQHNLB04NkRMwIN1eyh95UMUK6S/uXtV/WWAbozLh19i4DYFSs04N/ryL5X7YAwtZON1x72g+TDDyFB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750975179; c=relaxed/simple;
	bh=UufGGLlkb3UuTQ0EXDh1Zt5ACyC08b6N5Er0XaAmRE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DpxmWwxDt3I6JwZWW+VYqFLNJhc03BJ2AvDkgQ1tguUvu5I6cjioj3243toCZmcyxFuZ0+tSYIG1bI7YMbap/2ZXdObELGbAtav5h6WVyu6+2+ZLf3gx01KNq2EoUvanIErRdyMkGokb/A17TNlfC1xnRYwdflrXjnJFbUezElY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdJ4Mg8I; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdJ4Mg8I"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso1810508a12.0
        for <imx@lists.linux.dev>; Thu, 26 Jun 2025 14:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750975177; x=1751579977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqUm180eQDox8Xlw05sxg5F58P/BrEE00f+0gmB6rO8=;
        b=KdJ4Mg8IKRNmOGjMpukitb/Rv+sZQi9TA3czSjuqHx0xsrgRykIplBPdimkFOhL3WM
         Qx64JNu6d4H1GdZCHrosty2DoOj1YcRMjmICHDivnOdzRdJf3Dz1LrFqQW4EFhy++89F
         sLN/sYu/hwDpbs0yaC/4q3Xn55BWn/dyRhzyDBq3xRojDOTNEyHL15RAV0m1HzKYHONU
         FbdfhEEQSK0FqpGqnkvRDV1Etm0Hz0d/vi+O0zPeB1tC4mX4f+JwfMHF30JA++aXv5xD
         woCtyd0KlNAQHB1rvk15gVIgNjZbu9IB2aBbMEkJxtmgrcOw1FOUsqg46x3FhY36vHn7
         2Whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750975177; x=1751579977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqUm180eQDox8Xlw05sxg5F58P/BrEE00f+0gmB6rO8=;
        b=qXuZpvOq5yLeocMIBHFVhsDLzGQEfFFThmrbjXNCiBq3RxS6aT6Epk8STS7V99JgJ5
         5tMXlbl80PKClJY5G9Z0zzuk8LHOqHWlOr/QN4+YNxXE1GeyRi1GoQdVlrvfQEFi9/4b
         OGzKSmJbnfQLGR6u84ASNGTg9LvdSs4bRI27ROjAVO9mlHYV/wAT27inVwfYTytQB9DH
         CTifRMkkgqU9FqqOZd/vCVLxFIQ8gg79M/GARCLpHi8udhxWWV+KHAM6FgU5or7tOGB4
         1TxgYP+rILqoTRDCru6GCkVx/vuRlQNYfo99m3t3lZC4+w4TtsTDtOKIk/vktUOGIIod
         nNvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0uYjfswsFEQtsGXlA8Ekvdq2gk+yTt5FkQtcxwfwIOhoJAm57WarwjgmUiy4hJvb6VzQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaI5lrPFBwNUtHghOUYZhH8XWQr81S/5amH9C33busY5yWrL5P
	+dqhwtSdVKCcn0cwEt+sRy1gRNMTW24DuBSGoDYNLlrk3/0LnSyFpod5
X-Gm-Gg: ASbGncuquMfp2eWcp9COGaJmvUKUxUoDC1HpD7buZJ9a+yD0emK6XPCIeVb2Zr1SRKe
	RuxISf86qcrFI7sl9zlMcRRvl3ScTK99sGabN8XeRE3J6g1XcsrESZKb6FeKPn/g7CT9belatSR
	fK4Uont3KH8WowyLbjMYsQ7V/ULfaWP8UlGKHJHw0scDY7/LWK/Z0rQoXEcjIPmMzxWBwSMxfcr
	Wqhj4KytCBxFMpEfK/Rlp/3AL35WULZR04IaeMkitH2Sg9qr35PH3KTtkOXCxobnNawWkb4oMmu
	/+mpu6zlCDCXryqk0p95YABUieqQsyvXzUzepvg5wBdRpdd74GfIsZZlARBWv5BufuM44kjBaav
	OC2I=
X-Google-Smtp-Source: AGHT+IEj6BGM+Mz3MmkFvPoHUKb7LLDLDubf4oTZNcLqHe+6ea1uskvJ137D58tQnmG8MNIGyCBZFg==
X-Received: by 2002:a17:90b:1643:b0:311:abba:53d2 with SMTP id 98e67ed59e1d1-318c92ec11amr909084a91.17.1750975176799;
        Thu, 26 Jun 2025 14:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b8b9sm585275ad.118.2025.06.26.14.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:59:36 -0700 (PDT)
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
Subject: [PATCH v6 1/3] pmdomain: core: introduce dev_pm_genpd_is_on()
Date: Thu, 26 Jun 2025 18:59:09 -0300
Message-Id: <20250626215911.5992-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250626215911.5992-1-hiagofranco@gmail.com>
References: <20250626215911.5992-1-hiagofranco@gmail.com>
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
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
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


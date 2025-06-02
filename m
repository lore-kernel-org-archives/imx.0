Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A986C22068B
	for <imx@lists.linux.dev>; Mon,  2 Jun 2025 13:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748870394; cv=none; b=SVexnVQ6WfLGwciDhcRY0c8Eh580Cof12Ql++i3kWgWIxDJ83EPbVcsBji5cS0uvIGJkUUlue/hHBm2OkXcL8UhLdssyGEZYsZNJVKOdUUXdR1D5viQDXAuzV6wfyXmKM12cqNPk2AiF3sYGh3BUn7CM+5TVT6VKYk1jB4MWMPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748870394; c=relaxed/simple;
	bh=GPsdVxlMIyFLjpYoGg3d0W6mL1zKPBYJinSVZjWHCvc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jR/STUcs8giaeQjnQgLUM6e6BGiCuvpZREKF3KectEdET9sjLTzhT6DXz8jeAEo3pRrUD3+BEOmavwwT2SP9SPQp0M35O05cP85oU4AFM4sT2KBz5yGdV/ccqdl1mpUkm2DBBwiJ93RvWJrK1IESUuoTlbjsfKiLelGoGI2NxR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKBDSAeW; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKBDSAeW"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-310e1f4627aso4768025a91.2
        for <imx@lists.linux.dev>; Mon, 02 Jun 2025 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748870392; x=1749475192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ6sDs0ap5mby7PucN1jBOGKcXROdaugyvIe6KS1zRU=;
        b=iKBDSAeWgDn38v09kIHGSScXsRMUHORZDjWIeJ69BKs8MFoNGxC4aR6DZqo7K53hFE
         bPMcSJLSk3YvbffgXD8FkejZInppIp1LayDTlufuBzlo+1uSBFvsR+Mr2WABWbRcOdcq
         3lXjsiqa/NYyysNyFK65RQjHl5shy5p179F4pBl7ruMZFBFdE1Xymc8XG4dPiALP1Tuk
         i3k09fBCbpEGvN1a1r4LS4Luh6xh23GcLhY0JqMEIb1+Rgv9DmRFzBmMx1GE8dy6qu50
         PU9WXxKiPPW5MWjDLfeql2d4QL/xKJsUwvyIUFJXnF1jZ3WKDfmDa8mHx+ICoQ5jjN11
         i3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748870392; x=1749475192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ6sDs0ap5mby7PucN1jBOGKcXROdaugyvIe6KS1zRU=;
        b=WCf2wYnH0FwzHZleoMidsjMrMBJGi28plxwI8XUdWl1FYlmiv2KwaHU013ioE0I027
         Z5COxd65rslRKOovFbHfvAuBwx16mqPV9c6T3vNYNmeZJcSgR9Zl7rhoFMBZ1lMf5Im/
         O0WVEtD+cItAwpaAKIDz3xXECgxEPR9LSxViKAKP929X9phN7D/Al5FqmEe1C+zdBrPH
         whV5+uw++OjaGFXvo8R+h5uI156ZmVTrOYN4VqhqUoSmWWejbGejkKKSU8H3sT1IIYxo
         zt++NxBso7OaVTRWkEjTZfgxm+gj2wAjvgMfZWjhiScZ19p3UexA2cmufDykXHdDjfgq
         fp3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZd7gJkzQnXCScqrBxXQC1gzVd/h1VEABDSvpfmNldDvV7ppZAqEZNCdibbZJuWc9Bybg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkc0vBsy3uRkN614+CFKnVSeq51P4DUb6uF2SQG3DLAUWi2iKK
	WdzAdJeolr2H8tCy8IR7iJtivFk6ZzAaU5RKGvq5tHDUVC+6tWgqPRZG
X-Gm-Gg: ASbGnctsYhMtT5W1H+7v1w1KK0KpB+hZg+ZGX9xrTEz9GAWnDzDsQTGfKuD8afE1o32
	AJe57bP4UKm6aDQW/XDg1wEvYqMMCkK7WwAzb1CcS4aHg5W0y8RrtrAnofldf4fQDrXE3D8YaAK
	ItdYJgXag4qKrnJI43aSlu1hGOri+XO02kaY+UjjBy8V2erOFbXBPH28c2HgPl9X71iwVkrvbuC
	W2Qsq/Z+cL+jo/FMCoFMkNKYUAo6PLx0ilnogU2kOKgmtteeQf72E/QKsSGX1G2KkEQehoUFKV7
	ceJLc+OWWFmo9M8LZZZAhLFMPganYLYFN/FNHz0Cfg6AWSlMhZyR/W6WC5wqDr/n8/mVfJ4vdrp
	UDP9GQz5x
X-Google-Smtp-Source: AGHT+IErgHS5snsVnZ//qcUNKvfllIsynXPhb7js8d1BuZtiwj0gMVWZpcbDBi6UEa1UGSsp0FKEfg==
X-Received: by 2002:a17:90b:268f:b0:311:a314:c2d9 with SMTP id 98e67ed59e1d1-31250357f1bmr19303166a91.9.1748870391611;
        Mon, 02 Jun 2025 06:19:51 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b67bcsm6130983a91.8.2025.06.02.06.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:19:50 -0700 (PDT)
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
Subject: [PATCH v4 1/3] pmdomain: core: introduce dev_pm_genpd_is_on
Date: Mon,  2 Jun 2025 10:19:03 -0300
Message-Id: <20250602131906.25751-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602131906.25751-1-hiagofranco@gmail.com>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
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
v4: New patch.
---
 drivers/pmdomain/core.c   | 27 +++++++++++++++++++++++++++
 include/linux/pm_domain.h |  6 ++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index ff5c7f2b69ce..bcb74d10960c 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -758,6 +758,33 @@ int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
 }
 EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
 
+/**
+ * dev_pm_genpd_is_on - Get device's power status
+ *
+ * @dev: Device to get the current power status
+ *
+ * This function checks whether the generic power domain is on or not by
+ * verifying if genpd_status_on equals GENPD_STATE_ON.
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


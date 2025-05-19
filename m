Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8E6288C13
	for <imx@lists.linux.dev>; Mon, 19 May 2025 17:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747674990; cv=none; b=Nm3I16vK+WJ12IGkxptygnmfVAbqrEMgogfvEei1tthFRCI5jU6vdyR6CFcrjhoX4PncTicq2n8NUih7+N7JFLPwyxi1uLeUkrW0rCzmu42CUwWpAKQI7toy/sKGRhNxx/DixAWWDdeXzpCHPx8NolhCWSj5pA3Nw+VrRcT0FHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747674990; c=relaxed/simple;
	bh=guaS0IJYrKBzUQ7n6cApSVOAkZpGRn7ZgmTQXkQpvxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fiZnoZTdrYHRA5Ko+sGIbNSYCPt+YtSSdpptHX5SMMjJn2vTvZ2PcuYaxTqFPbO5SAvwE++pvkJeNLLxEmZF2f7iObOoFnj53h9IsOlrZiT8MtuLyAh+1kXk6uofSnYy1O+y78JIj4U/79XBP/WqBxZR+NzxbYnlZtfx8k5BhNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2ROBu/T; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2ROBu/T"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85dac9729c3so517760739f.2
        for <imx@lists.linux.dev>; Mon, 19 May 2025 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747674987; x=1748279787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1uDXUypTxPVrOjDkyW8a3QEFjfv2DCfH/Ibxzs5fII=;
        b=B2ROBu/THJUEzk1X7bUYSQAhI82SR6iRcKdazsr7AG3R5EmLqoJHfGGXU4xK4LtMGS
         6uhNosAdXz80WP79vSoI5A6YBNULU5Z72etmAZqUHZKFMYOELni+NC2f2EQ3X1vPOpjb
         wKXCiGVYiSKV4swuwn6Dj5KVwR1lu3ADH+CCdV0X+Ery3SoGU15j8e4LxOk7tAMezdkp
         zVqVMWP0by2VFnBzQXz3HVTwALcF5BfLfGSZVIGubEAFz777A+NQ2YctEJE/L6YNK2kn
         rDdL1fZZaWLUjd5hauXlZ3yJ3HzYkwpktXxxIzpvi0U8VzA9vShpLI1cW5xGswV7sYez
         FTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747674987; x=1748279787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1uDXUypTxPVrOjDkyW8a3QEFjfv2DCfH/Ibxzs5fII=;
        b=bbITHEZNP99CPdrjHBrsMz9vRuIQaCVDc7HB8goFzbekNbTOXKUUZYDbc2YjIk5W4P
         VR1k/bazLhLyCTRcFVF4ap4WQH9YnPZsYeeijvmIBXPSXrdYU30XM/0j56JmAprwxsPi
         CFGp7+c9s2oOti/xuloEuYjyK7KwGTby3rWCVam6VSjqJorQzygGRI4mItuGgUrT6/gv
         75XkG+S1A46+gvp+wbsTJo2QoKrKM4Jwm9cuPYRm51RrNLWeN6lxudlDl571mul+rilj
         Hobz7NTXR9hVKiiBixm2ZP38/aEi8hPxVKYY5M6sdSqI40HSWeQavjr4FPLdTDo5gNZZ
         zY3g==
X-Forwarded-Encrypted: i=1; AJvYcCXj1oFNvxLHDQwL0KNjsGZlEkh0s0lRCTiIqLxhVafxlfbpV/aobTTNnuEekItNaoHCK5g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPav6eRQjmTIySeUTYS2cEoUWIozuoqeTliZ6mx39VB1PCCck6
	E766P0oteqjrK2jlVVnm9pk1z0ceoRc/gnekpoRO83g04t4F/sKflRufTTDKKSTnB2U=
X-Gm-Gg: ASbGncsRFKvossUFHXi6nw2sJnWqEiWtrsrG4ohcVdbPSmQHrMpOvGHaXCah4FzPt8+
	S62wNPowar7uzsfu6YVxeob1BxfoLalkWGZSQ/U8Y5RImoca8ceMO7OHIaF6uJ2wgmNjUJpdHFl
	EwOwJBjSWQJOr3dPligtlkBbidy2mcqDaJn8VlB41ybK+4AKwveSYuAFh8N5r6h96Dwt47iO9v6
	M+l6ll1nCgkIqLa5QhyKIsV+6s+pAGl0514ZpAwtTx6FlmBmr/gpsCuB9Glwj0mjVa4d5Ha6iiV
	EwKYDNUaY+V8zqyZpOX0C1lx2a1xEF0sQmOPafmtWodWKWb+VIKid/CN3DZ4VYKGKFf61aTZcw=
	=
X-Google-Smtp-Source: AGHT+IGcPhmxLm05zfOvv98rT+S8AoJqTq1ZTmACNFyaA4DcN6+SVqyHcTRF8Wm1vE2yc2bqeR6yjA==
X-Received: by 2002:a05:6122:310f:b0:528:bd71:8932 with SMTP id 71dfb90a1353d-52dba9513ddmr11512958e0c.11.1747674976187;
        Mon, 19 May 2025 10:16:16 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e983sm7003647e0c.31.2025.05.19.10.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:16:15 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 1/3] firmware: imx: introduce imx_sc_pm_get_resource_power_mode()
Date: Mon, 19 May 2025 14:15:12 -0300
Message-Id: <20250519171514.61974-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519171514.61974-1-hiagofranco@gmail.com>
References: <20250519171514.61974-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

This SCU API returns the power mode of a given resource.

As example, remoteproc/imx_rproc.c can now use this function to check
the power mode of the remote core to properly set "attached" or
"offline" modes.

Since there is no proper firmware/imx file to place this function, also
introduce firmware/imx/power.c file to keep all the PM functions inside.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Suggested-by: Peng Fan <peng.fan@nxp.com>
---
v3: New patch.
---
 drivers/firmware/imx/Makefile       |  2 +-
 drivers/firmware/imx/power.c        | 52 +++++++++++++++++++++++++++++
 include/linux/firmware/imx/svc/pm.h |  9 +++++
 3 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 drivers/firmware/imx/power.c

diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 8d046c341be8..5f5548e34459 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
-obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
+obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o power.o
 obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
diff --git a/drivers/firmware/imx/power.c b/drivers/firmware/imx/power.c
new file mode 100644
index 000000000000..b982cebba72a
--- /dev/null
+++ b/drivers/firmware/imx/power.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * File containing client-side RPC functions for the PM (Power Management)
+ * service. These function are ported to clients that communicate to the SC.
+ */
+
+#include <linux/firmware/imx/svc/pm.h>
+
+struct imx_sc_msg_req_get_resource_power_mode {
+	struct imx_sc_rpc_msg hdr;
+	union {
+		struct {
+			u16 resource;
+		} req;
+		struct {
+			u8 mode;
+		} resp;
+	} data;
+} __packed __aligned(4);
+
+/**
+ * imx_sc_pm_get_resource_power_mode - Get power mode from a given resource.
+ * @ipc: IPC handle.
+ * @resource: Resource to check the power mode.
+ *
+ * Return: Returns < 0 for errors or the following for success:
+ * * %IMX_SC_PM_PW_MODE_OFF	- Power off
+ * * %IMX_SC_PM_PW_MODE_STBY	- Power in standby
+ * * %IMX_SC_PM_PW_MODE_LP	- Power in low-power
+ * * %IMX_SC_PM_PW_MODE_ON	- Power on
+ *
+ */
+int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc, u32 resource)
+{
+	struct imx_sc_msg_req_get_resource_power_mode msg;
+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+	int ret;
+
+	hdr->ver = IMX_SC_RPC_VERSION;
+	hdr->svc = IMX_SC_RPC_SVC_PM;
+	hdr->func = IMX_SC_PM_FUNC_GET_RESOURCE_POWER_MODE;
+	hdr->size = 2;
+
+	msg.data.req.resource = resource;
+
+	ret = imx_scu_call_rpc(ipc, &msg, true);
+	if (ret)
+		return ret;
+
+	return msg.data.resp.mode;
+}
+EXPORT_SYMBOL(imx_sc_pm_get_resource_power_mode);
diff --git a/include/linux/firmware/imx/svc/pm.h b/include/linux/firmware/imx/svc/pm.h
index 1f6975dd37b0..56e93a953295 100644
--- a/include/linux/firmware/imx/svc/pm.h
+++ b/include/linux/firmware/imx/svc/pm.h
@@ -82,4 +82,13 @@ enum imx_sc_pm_func {
 #define IMX_SC_PM_PARENT_PLL2	3	/* Parent in PLL2 or PLL0/4 */
 #define IMX_SC_PM_PARENT_BYPS	4	/* Parent is a bypass clock. */
 
+#if IS_ENABLED(CONFIG_IMX_SCU)
+int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc, u32 resource);
+#else
+static inline int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc,
+						    u32 resource)
+{
+	return -EOPNOTSUPP;
+}
+#endif
 #endif /* _SC_PM_API_H */
-- 
2.39.5


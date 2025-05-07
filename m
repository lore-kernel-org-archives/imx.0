Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2F628C2B2
	for <imx@lists.linux.dev>; Wed,  7 May 2025 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633715; cv=none; b=SvR3TVFlBhvfkpMHVMeVWj/XoqYyT/yjY1N/rEOhhEMHANUCry4COZV3KXTBqZcoLd9JvpDNa5Wsce+yIyqJ/hds4ic5npcvujPka0mmgpRnzJ/5SKXa5GJq6A98HK9uJNy2woFNwiMUlb7oOahrB68kaRd9BOeq4O3WAH2fNHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633715; c=relaxed/simple;
	bh=8mXQzXNqnbCrAuQs9VZHxL7V2QX1630cK3yU69peHzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CA00eTWKprp5Bvui/gtqF3CBPeGTgujF1C3nwJx3rchTNeA1G8U31PSubZK7qmF7SX7O9z+tXPCihT6Li05DjL2yA+5EGESzSMUK+suIYNSvrIpB2uVZse/Zb9lL+8aRwjXgI3QW45tFZJfFgZSW6oQ3oboi4J+js54htV4hFQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S59qeeOG; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S59qeeOG"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b0b2ce7cc81so6340139a12.3
        for <imx@lists.linux.dev>; Wed, 07 May 2025 09:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633713; x=1747238513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FatHGE4VIxz/uHqMMNdNrLoSBEdfAr4ZgsRcgU3Gsk=;
        b=S59qeeOGsdsDe3ELaI/VGMlmE2J05413k5a48FL8ZnIsYixYIwFVynp6Khu4AZUZQQ
         e3miYl2AZmkyX/1eO8FayIVqHbZpzLwNuuyr6ZXhqrxjyYG0pzxUqmiCufSfegmEaotK
         5AEpDf60LOUNNTX5PaA34OXpG6Y/mMiec7oQpZR1G8hgh6196iLjbRqgIfj6dQy8d+Ly
         iFCs7KOem2sjINLXJGK9o5NUSPaJO2/2MHI9gER3T/riSHmf/4hIXWEd1Gqtxp8bc+sh
         j9bpb8gDJ9xoaMZNAFwNocl+EHN6RVzkmLyYSHKrEZgXBPZ/6p+mdvUIBCDyR7TIev6j
         +5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633713; x=1747238513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FatHGE4VIxz/uHqMMNdNrLoSBEdfAr4ZgsRcgU3Gsk=;
        b=RY9+HBC2hDEce/uGq1a2Wuk+FVouOnOkI1+XjNFkpDP50+jqmgQoXpAnZV34ZXUtz+
         T4EZUFac3YPCI323L9S16GQfQN9oCjpnvoCE834a/zXAn+xskFBMyYNT0mfVQm2iVB8+
         LLnyIhg1yCAPl+ZKv3vjgGQSbiKfWn/gbM4MNaydXYlPHAp4HiejIEkteYyh3FvT+wJo
         mKEcpLD7yPs/4WRiUoWc3Khi5rUWV6kDfS0xaLe33lq14oIr4sZSLL01l9yf6+AnFZXO
         RKjumIuupR4To/1FYbtQz+AAzE4oL9NbGcvf0HTyjDdEujrnYhD/ksL/ijLxUWfPMvqY
         Afbw==
X-Forwarded-Encrypted: i=1; AJvYcCXPEYetKmWiV6vRoRIMqKLVFjPR5y25P2TAT2fTFkt3PBs9osoW/RHLhlZArvx73X5lkRk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyriZI1Emjgx74Usl+CdW3jfyL8OGxjqtDGXsNlPMdrCnnpMW5r
	ueZUl/32hU93Jr8hR/uSatmiiNbzzidyJFIaHBfjNRS1KXNNx8rZ
X-Gm-Gg: ASbGncvSMQxRVn0NjnpwWHv8ft3jdrcRStq5piNUl/s6LIPCP3B7+UBYZcD5D0Odg6I
	FUc8b6kRla+ep3nhpVynYoFhPmMYLLQCkOrw2tgwsUdgzsBnoqwvFZzn/yGYt0kfi6adWISLMKa
	bNAAIh/OrhDNhgrzhQQsOXaMjjes/8J6MCJRF7PQeI69vhysKhsTBdKiEqPFUJY5hQmJvLPCh9k
	7ddewq8LqnntsdDXHIG1N3xhV0JwP24GovoIfUgug8CyNyU2dA+Ldc761IBhteAvNA+XLU7UcyQ
	2MgcKMbU8MEbTP+F8IGwok+3CouP+vz+SDp+xj/L+YG15kwhTgFmP3w77n+yvns=
X-Google-Smtp-Source: AGHT+IElN0mEQWXnntlpRZoPMaa3u2Zy25YDRR9cYt9Rbr4v3uf0PKx7X6rpO9MYHkvEDDFPthmmXQ==
X-Received: by 2002:a17:90a:d2c8:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-30aac19d0c4mr5773367a91.21.1746633712887;
        Wed, 07 May 2025 09:01:52 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4f82b86sm327242a91.44.2025.05.07.09.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:01:52 -0700 (PDT)
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
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 1/3] firmware: imx: move get power mode function from scu-pd.c to misc.c
Date: Wed,  7 May 2025 13:00:54 -0300
Message-Id: <20250507160056.11876-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250507160056.11876-1-hiagofranco@gmail.com>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Move imx_sc_get_pd_power() from pmdomain/imx/scu-pd.c to
firmware/imx/misc.c and rename it to imx_sc_pm_get_resource_power_mode()
to maintain the same naming logic with other functions in misc.c.

This makes the API available for other use cases. For example,
remoteproc/imx_rproc.c can now use this function to check the power mode
of the remote core.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v2: moved this patch to be the first one
---
 drivers/firmware/imx/misc.c           | 47 +++++++++++++++++++++++++++
 drivers/pmdomain/imx/scu-pd.c         | 29 ++++-------------
 include/linux/firmware/imx/svc/misc.h |  8 +++++
 3 files changed, 62 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/imx/misc.c b/drivers/firmware/imx/misc.c
index d073cb3ce699..61fcb0066ec9 100644
--- a/drivers/firmware/imx/misc.c
+++ b/drivers/firmware/imx/misc.c
@@ -37,6 +37,18 @@ struct imx_sc_msg_resp_misc_get_ctrl {
 	u32 val;
 } __packed __aligned(4);
 
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
 /*
  * This function sets a miscellaneous control value.
  *
@@ -135,3 +147,38 @@ int imx_sc_pm_cpu_start(struct imx_sc_ipc *ipc, u32 resource,
 	return imx_scu_call_rpc(ipc, &msg, true);
 }
 EXPORT_SYMBOL(imx_sc_pm_cpu_start);
+
+/*
+ * This function gets the power mode from a given @resource
+ *
+ * @param[in]     ipc         IPC handle
+ * @param[in]     resource    resource to check the power mode
+ *
+ * @return Returns < 0 for errors or the following for success:
+ * IMX_SC_PM_PW_MODE_OFF  0	Power off
+ * IMX_SC_PM_PW_MODE_STBY 1	Power in standby
+ * IMX_SC_PM_PW_MODE_LP   2	Power in low-power
+ * IMX_SC_PM_PW_MODE_ON   3	Power on
+ *
+ * These are defined under firmware/imx/svc/pm.h
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
diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
index 01d465d88f60..945f972e636f 100644
--- a/drivers/pmdomain/imx/scu-pd.c
+++ b/drivers/pmdomain/imx/scu-pd.c
@@ -54,6 +54,7 @@
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include <linux/console.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/firmware/imx/svc/misc.h>
 #include <linux/firmware/imx/svc/rm.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -328,27 +329,6 @@ static void imx_sc_pd_get_console_rsrc(void)
 	imx_con_rsrc = specs.args[0];
 }
 
-static int imx_sc_get_pd_power(struct device *dev, u32 rsrc)
-{
-	struct imx_sc_msg_req_get_resource_power_mode msg;
-	struct imx_sc_rpc_msg *hdr = &msg.hdr;
-	int ret;
-
-	hdr->ver = IMX_SC_RPC_VERSION;
-	hdr->svc = IMX_SC_RPC_SVC_PM;
-	hdr->func = IMX_SC_PM_FUNC_GET_RESOURCE_POWER_MODE;
-	hdr->size = 2;
-
-	msg.data.req.resource = rsrc;
-
-	ret = imx_scu_call_rpc(pm_ipc_handle, &msg, true);
-	if (ret)
-		dev_err(dev, "failed to get power resource %d mode, ret %d\n",
-			rsrc, ret);
-
-	return msg.data.resp.mode;
-}
-
 static int imx_sc_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct imx_sc_msg_req_set_resource_power_mode msg;
@@ -438,7 +418,12 @@ imx_scu_add_pm_domain(struct device *dev, int idx,
 	if (imx_con_rsrc == sc_pd->rsrc)
 		sc_pd->pd.flags = GENPD_FLAG_RPM_ALWAYS_ON;
 
-	mode = imx_sc_get_pd_power(dev, pd_ranges->rsrc + idx);
+	mode = imx_sc_pm_get_resource_power_mode(pm_ipc_handle,
+						 pd_ranges->rsrc + idx);
+	if (mode < 0)
+		dev_err(dev, "failed to get power resource %d mode, ret %d\n",
+			pd_ranges->rsrc + idx, mode);
+
 	if (mode == IMX_SC_PM_PW_MODE_ON)
 		is_off = false;
 	else
diff --git a/include/linux/firmware/imx/svc/misc.h b/include/linux/firmware/imx/svc/misc.h
index 760db08a67fc..376c800a88d0 100644
--- a/include/linux/firmware/imx/svc/misc.h
+++ b/include/linux/firmware/imx/svc/misc.h
@@ -55,6 +55,8 @@ int imx_sc_misc_get_control(struct imx_sc_ipc *ipc, u32 resource,
 
 int imx_sc_pm_cpu_start(struct imx_sc_ipc *ipc, u32 resource,
 			bool enable, u64 phys_addr);
+
+int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc, u32 resource);
 #else
 static inline int imx_sc_misc_set_control(struct imx_sc_ipc *ipc,
 					  u32 resource, u8 ctrl, u32 val)
@@ -73,5 +75,11 @@ static inline int imx_sc_pm_cpu_start(struct imx_sc_ipc *ipc, u32 resource,
 {
 	return -ENOTSUPP;
 }
+
+static inline int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc,
+						    u32 resource)
+{
+	return -ENOTSUPP;
+}
 #endif
 #endif /* _SC_MISC_API_H */
-- 
2.39.5


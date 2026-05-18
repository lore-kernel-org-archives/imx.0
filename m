Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAF91C860A
	for <imx@lists.linux.dev>; Mon, 18 May 2026 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097192; cv=none; b=PSxtvulRN74Rn4bWpPph65ohsMyf3Cf4Wb7y81mgNR45/1j8KlviU3+rEvrt2CU9rxw3ANIkK3KuM+1Xky5SGJnFrSPbIJE6zK5Rwa5Y+mzzaxVgjfSwMOVdlKOYXKeCQm0gqSnzXBGAC1b9gpbQ+8WHRauJ9AOSuLAomLvDNlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097192; c=relaxed/simple;
	bh=d9VWM5r7b8HFxhB2mnvl/vovRf4IFGuHWik9LcA6YJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DIH532RywWnA2Fsr71hLmiTmC6kLFw2ruuvFs4CTzMs8l3l51yp+Ve4g6IHMbRkgNkZvsTgt9iNr9QFSWD6FERIzOMkYZK41JMTQyYw4a5ACp6dvMxOr/rURfsPltxXLk3chNulC4Gcg7CBjmrwZH5fr8HwR2DUah2PbUQ7Cn0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FenXvdDy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FenXvdDy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48e69e60063so1410955e9.1
        for <imx@lists.linux.dev>; Mon, 18 May 2026 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779097190; x=1779701990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxdjSCoSHRAw2soZ2duKpNm8mf0V8MJVumP3dJOuQ34=;
        b=FenXvdDy27i5Vcpls/5v8fbHzBt1Ei6IhrDD/Nw9FybQRPFLJMGSpo/I0zkuD9Rgv+
         Yw87qf4KbBGgnfCsKHv99d3UXDHE0oqA8Nzny7vNx+N5WnT3GYea397rCBuUwH9WtK/M
         9rKAHY+oRsVrSC1+uH46+kSb0sC/ha1YQ57W1hJ+VS5oRrh5etfcta8p/OuyN1jBZbat
         jx8Vsi19MtC2t4Pn/oaV1eMUrWT5bGaZtUWVCSmkO2uUSpNh2iS9YcOlnyhvp3f/5/hs
         dVeQJ75rg2anxzEozXjJ8mtylJaF/VOcTMfrYiiT5JqzktE+AP+5gJ7wNzBFW/79AfiX
         riSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097190; x=1779701990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GxdjSCoSHRAw2soZ2duKpNm8mf0V8MJVumP3dJOuQ34=;
        b=rMz63IMqbA5J71fxyplAlpRiBGPWIL6mcFdDJ7qXLMwu2NpO8SFkXA3yfMf08rAjUA
         Bzj6f6H0y+EgzHwjibJwC7apLbCpI5yUZ1iQM3CRLKn91qXdhRbK/A+82/tyGB5pXL72
         U6yc4lvw5vcMsA4Q9ZJ2uL5anuwXqlENX0hF8NSEz1qK0I/8oCG5uJaQOjuJrnLwzI8+
         HK43uiVwBtAlb2P7ekb7mSoq9uiac+L28+NbxK6FrBPPpV4IQj7fs1PpxVE+Mf8VwB49
         1NxIVKznVZxvcUd4/t9FVMmLRK6HeeTdgDim4vhmxIgxkIoh4EX/C+lbfV3SrP3d7cYl
         GVAw==
X-Forwarded-Encrypted: i=1; AFNElJ+AGff5Nng7KPxG8DQ4B22RgkXhhYXC3BvumQLFsZfAaVFnFX/J0R2vgWBpueItxZ0cZ6U=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc6gw6Y9HPDkmzOKF44hQ1Y37jZjEV5zurzT4TrS8JzIBZ+9d1
	QpqvFTSDieSs6JYorJGQ/m8apkjUrD0C4x8ARJseotCchrUckGDGsEhK
X-Gm-Gg: Acq92OF/efpM002bLjU1zjSRhSgCBWLTGQAk1CDO0t43U0MMzxFWmhS+wR9r4okj1Nj
	2kLf5zGRHJUZJhwC4MeTjcHfblko17TH5k3EWdC7wttwCm60NRZu9L/Nug0ZidGkBVuLlqerJZW
	WaqCMw1DfZv50zRHQISz1TJgZ/sWsA6H6sO76LNDLnv0YrJUBmbwTREaPYrZveKMKQ+4RiCZUbh
	WXsMXlnj/Hjilz7UUI6b24ofZXBKRyPAPZFWsD7KdasglC9uLw/zEVyWwTjiQ8ZLyJY2d2Nfh3z
	bd0Lu1zcqL+bbKcIBfCv5HdyVcI6R697U2Dm/YRyOP+2pDYeks5gWxEy8isRAkJko9rHTMrbpwc
	6gvzrpZAquJVcz+0MCBXrUoFVWPLJT2tcQqoGLxEvUTyZC7Fa7tl5oGlBammS6MjWWj81bmFNtQ
	hzI4I3SEz5xudaCzcGsDO7Dk8IlEftjaj3NYk3LMfOxGoe
X-Received: by 2002:a05:600c:3594:b0:490:502:8422 with SMTP id 5b1f17b1804b1-4900d55ec74mr24159285e9.6.1779097189418;
        Mon, 18 May 2026 02:39:49 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4862209sm245408615e9.0.2026.05.18.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:39:48 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: Frank.Li@nxp.com
Cc: peng.fan@oss.nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	gregkh@linuxfoundation.org,
	hcazarim@yahoo.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH v2] firmware: imx: scu-irq: drop wakeup_src sysfs file, log via dev_dbg()
Date: Mon, 18 May 2026 14:39:33 +0500
Message-Id: <20260518093934.1910-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260515175002.34853-1-sozdayvek@gmail.com>
References: <20260515175002.34853-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wakeup_source_show() walks all IMX_SC_IRQ_NUM_GROUP groups and
rewrites buf from offset 0 each iteration, so userspace reading
/sys/firmware/scu_wakeup_source/wakeup_src only ever sees the last
group reported, and the trailing strlen(buf) reports only that
line length. sprintf() is also unbounded against the sysfs
PAGE_SIZE buffer.

The attribute is not documented under Documentation/ABI/ and a code
search across GitHub and Debian found no out-of-tree consumers.
Peng Fan (NXP) confirmed it is safe to drop.

Remove the attribute, the supporting kobject and the per-group
valid/wakeup_src state used only to feed it. Log the same wakeup
information via dev_dbg() from imx_scu_irq_work_handler() so it
can be enabled dynamically when needed.

Fixes: c081197a33a2 ("firmware: imx: scu-irq: support identifying SCU wakeup source from sysfs")
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/all/2026051656-corral-edgy-290c@gregkh/
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
v2:
- Drop the sysfs file entirely instead of patching it (Greg)
- Log wakeup info via dev_dbg() in the IRQ work handler (Greg)
- Peng Fan (NXP) confirmed no out-of-tree consumers

v1: https://lore.kernel.org/all/20260515175002.34853-1-sozdayvek@gmail.com/

 drivers/firmware/imx/imx-scu-irq.c | 84 ++++++------------------------
 1 file changed, 16 insertions(+), 68 deletions(-)

diff --git a/drivers/firmware/imx/imx-scu-irq.c b/drivers/firmware/imx/imx-scu-irq.c
index a68d38f89..5969460ba 100644
--- a/drivers/firmware/imx/imx-scu-irq.c
+++ b/drivers/firmware/imx/imx-scu-irq.c
@@ -9,11 +9,9 @@
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include <linux/firmware/imx/ipc.h>
 #include <linux/firmware/imx/sci.h>
-#include <linux/kobject.h>
 #include <linux/mailbox_client.h>
 #include <linux/of.h>
 #include <linux/suspend.h>
-#include <linux/sysfs.h>
 
 #define IMX_SC_IRQ_FUNC_ENABLE	1
 #define IMX_SC_IRQ_FUNC_STATUS	2
@@ -43,19 +41,8 @@ struct imx_sc_msg_irq_enable {
 	u8 enable;
 } __packed;
 
-struct scu_wakeup {
-	u32 mask;
-	u32 wakeup_src;
-	bool valid;
-};
-
-/* Sysfs functions */
-static struct kobject *wakeup_obj;
-static ssize_t wakeup_source_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf);
-static struct kobj_attribute wakeup_source_attr =
-		__ATTR(wakeup_src, 0660, wakeup_source_show, NULL);
-
-static struct scu_wakeup scu_irq_wakeup[IMX_SC_IRQ_NUM_GROUP];
+static u32 scu_irq_wakeup_mask[IMX_SC_IRQ_NUM_GROUP];
+static struct device *imx_sc_irq_dev;
 
 static struct imx_sc_ipc *imx_sc_irq_ipc_handle;
 static struct work_struct imx_sc_irq_work;
@@ -88,11 +75,6 @@ static void imx_scu_irq_work_handler(struct work_struct *work)
 	u8 i;
 
 	for (i = 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {
-		if (scu_irq_wakeup[i].mask) {
-			scu_irq_wakeup[i].valid = false;
-			scu_irq_wakeup[i].wakeup_src = 0;
-		}
-
 		ret = imx_scu_irq_get_status(i, &irq_status);
 		if (ret) {
 			pr_err("get irq group %d status failed, ret %d\n",
@@ -102,12 +84,15 @@ static void imx_scu_irq_work_handler(struct work_struct *work)
 
 		if (!irq_status)
 			continue;
-		if (scu_irq_wakeup[i].mask & irq_status) {
-			scu_irq_wakeup[i].valid = true;
-			scu_irq_wakeup[i].wakeup_src = irq_status & scu_irq_wakeup[i].mask;
-		} else {
-			scu_irq_wakeup[i].wakeup_src = irq_status;
-		}
+
+		if (scu_irq_wakeup_mask[i] & irq_status)
+			dev_dbg(imx_sc_irq_dev,
+				"Wakeup source group = %d, irq = 0x%x\n",
+				i, irq_status & scu_irq_wakeup_mask[i]);
+		else
+			dev_dbg(imx_sc_irq_dev,
+				"Spurious SCU wakeup, group = %d, irq = 0x%x\n",
+				i, irq_status);
 
 		pm_system_wakeup();
 		imx_scu_irq_notifier_call_chain(irq_status, &i);
@@ -164,9 +149,9 @@ int imx_scu_irq_group_enable(u8 group, u32 mask, u8 enable)
 			group, mask, ret);
 
 	if (enable)
-		scu_irq_wakeup[group].mask |= mask;
+		scu_irq_wakeup_mask[group] |= mask;
 	else
-		scu_irq_wakeup[group].mask &= ~mask;
+		scu_irq_wakeup_mask[group] &= ~mask;
 
 	return ret;
 }
@@ -177,25 +162,6 @@ static void imx_scu_irq_callback(struct mbox_client *c, void *msg)
 	schedule_work(&imx_sc_irq_work);
 }
 
-static ssize_t wakeup_source_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
-{
-	int i;
-
-	for (i = 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {
-		if (!scu_irq_wakeup[i].wakeup_src)
-			continue;
-
-		if (scu_irq_wakeup[i].valid)
-			sprintf(buf, "Wakeup source group = %d, irq = 0x%x\n",
-				i, scu_irq_wakeup[i].wakeup_src);
-		else
-			sprintf(buf, "Spurious SCU wakeup, group = %d, irq = 0x%x\n",
-				i, scu_irq_wakeup[i].wakeup_src);
-	}
-
-	return strlen(buf);
-}
-
 int imx_scu_enable_general_irq_channel(struct device *dev)
 {
 	struct of_phandle_args spec;
@@ -233,29 +199,11 @@ int imx_scu_enable_general_irq_channel(struct device *dev)
 	if (IS_ERR(ch)) {
 		ret = PTR_ERR(ch);
 		dev_err(dev, "failed to request mbox chan gip3, ret %d\n", ret);
-		goto free_cl;
-	}
-
-	/* Create directory under /sysfs/firmware */
-	wakeup_obj = kobject_create_and_add("scu_wakeup_source", firmware_kobj);
-	if (!wakeup_obj) {
-		ret = -ENOMEM;
-		goto free_ch;
+		devm_kfree(dev, cl);
+		return ret;
 	}
 
-	ret = sysfs_create_file(wakeup_obj, &wakeup_source_attr.attr);
-	if (ret) {
-		dev_err(dev, "Cannot create wakeup source src file......\n");
-		kobject_put(wakeup_obj);
-		goto free_ch;
-	}
+	imx_sc_irq_dev = dev;
 
 	return 0;
-
-free_ch:
-	mbox_free_channel(ch);
-free_cl:
-	devm_kfree(dev, cl);
-
-	return ret;
 }
-- 
2.43.0


Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4723F8ED3
	for <imx@lists.linux.dev>; Fri, 15 May 2026 17:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778867425; cv=none; b=PaKfWCNg0mKN+YjF8jEBbjAmG2ZIgGC9xYkn0G0ELRqfp68vbQOO5A8KwgDfKOqVoW6B1LiFSeS4HaNM6GTxnWUuoge/PovojkZPXDxb1eycLWMqxI5KUFkdiVfgls9qh0hT9Uv9WyhZiskP6c4eu1hphCmppVU8oh2AbI7Ahy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778867425; c=relaxed/simple;
	bh=cqhfhRNm8fIbvRAhW2EZ01B9hd88gAhg5UM+n3jAEPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uS+BDjsuJsbhHVQAv1xsAZfP60aGvZvPEnXOEDJoG+eF61ZgH38c6VzdJFixBVXvEqZf4M87J0KGPwe+gdACV/nyyxzxBCCHHOyDHL+bXwxrwuII1H2UenvN9bwm0bb2Fi7pzwRfBUk/4FnAkmyUCOU1Ya4iOWZuGzNfgaMn/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLrAphxe; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLrAphxe"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48e69e60063so185575e9.1
        for <imx@lists.linux.dev>; Fri, 15 May 2026 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778867422; x=1779472222; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aGYyBWo+9+yOvNuFGsYyiFsCMkaC4YR5bjaqf1qoRjE=;
        b=FLrAphxeyCzf+SMLSF0pHSQETnr1z0UVg1SJdmzn5xjrJywg9YKU8IlWA9A4f7C4WW
         aHlHizLaeUWN+/kvGb7UTWzUVMo/zTkZ3y28Qi+2i8y8Ch6EZoTjOTFFE+ZuZWZXDA9K
         9M4EYaeODcO8cG6TPHig4pZYsvmqmHvqGW/DU1BxkGKx3BJvYCu9B/uvNyN1fOkuRihD
         BHWN9AYvOb/Lam3k/dD+5gtskuB7Xqcnd5St+ebmM5TyZzfOG9D1wpB4kyicdROafIZ3
         Cpq22ZNlhNX9bnEGqEFKQ9g9ZAmX8Cy7ERdBBVwCge1VuqHE28t7mmcUxvcASbS1Jnd6
         CgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778867422; x=1779472222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGYyBWo+9+yOvNuFGsYyiFsCMkaC4YR5bjaqf1qoRjE=;
        b=lIbIAJ/OYtJWBOna0mmLy5w6Uta1D8ffVqs/g2NsnbSBaykzEHDCYYrHn8FSfHxfdq
         VmimOelOYj1B379Y04Ed05vqXv+OqJdNAHZC/zZg++VI/QBbAlvYNgUvYr9pyo2+abVv
         hLsnOiMcWXsx61h3aHc2H8yXQZo9go4DrPf3oH80jBK0gXX6oSLq/ixlMrUrpS9ARGMf
         jXMJImODPkd+LzZX+I4BBkqECpf2CQ2ITJMFGq1W5yJ+Xu8shZxGXrcotTitKeq5jPZZ
         F6eyehtqAJbvesDu/RJ5+ST2G9UtM93WOPebWXx6Z5ZGF4nuwL9Ff8zf+OvYnCy7DYRr
         8u6g==
X-Forwarded-Encrypted: i=1; AFNElJ+e6dJMO5zLzNrJ0IjrYQuy6bQ5/V5ezrHRmS7dX+AytWJGMKmme1AXLOsoZPDWGMEIgbg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqQ73IKg3vMLGb2IzZA4eDcd6Zlp0ymjTQSd3IEoTIGI7gnXYa
	kk4DhWvKdVcdX/I43FMtHnKKz0b+gHTt9r+ywDYEUy2bMnUP9H56Xp6c
X-Gm-Gg: Acq92OHHekI86wse3gL3QfJViKhuuXdsPZCRpCek5hr8d+Awv1N5lgVg19btv3LzYYy
	y4a8+4jtTa7Vt89dKtkFxdoONgnuLDcLWx+wQajfgbMyHJy6I+JqDcpOcJjmcmxqH2KGeaCPW9/
	hyYEiC8bFjRVIfaZyROt6Vv/RPLTkNskuwcklomw5NOsgPgeq377ocf9XKYm1lPQkllgO0oOEi7
	/AfNyf4bSCeUAaoOL1JJSEO02ptuRpu68BVhNHw8oCPLeuXFU8bEsxoGj+9jWBr2R0C4YBXLXei
	fHNvSpIEuv+JkvHLUEW1CsNAllv24HHq4Gm+HjHivEO5AsUSAXHQYZNHqqKo44jLSk0d0qm8HaC
	Nrvq1qk8JBQfeKUaZYu0WKfpCZ9vgdwXqqkbPVH1tMACopQlgHF0OX0AS2xNjDS5VieRIYD/G3p
	SDc+9J72KEHh+HFDyu+ZDx6D8oxY1kriA0IMYwbsLUuwij
X-Received: by 2002:a05:600c:45d0:b0:488:a797:f099 with SMTP id 5b1f17b1804b1-48fe61f0787mr36281325e9.3.1778867422082;
        Fri, 15 May 2026 10:50:22 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fcasm66713435e9.5.2026.05.15.10.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 10:50:21 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: Frank.Li@nxp.com
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	gregkh@linuxfoundation.org,
	hcazarim@yahoo.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] firmware: imx: scu-irq: accumulate wakeup sources via sysfs_emit_at()
Date: Fri, 15 May 2026 22:50:01 +0500
Message-Id: <20260515175002.34853-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wakeup_source_show() walks all IMX_SC_IRQ_NUM_GROUP groups and, for
every group with a wakeup_src set, writes a line into the sysfs
output buffer:

	for (i = 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {
		if (!scu_irq_wakeup[i].wakeup_src)
			continue;

		if (scu_irq_wakeup[i].valid)
			sprintf(buf, "Wakeup source group = %d, ...", ...);
		else
			sprintf(buf, "Spurious SCU wakeup, group = %d, ...", ...);
	}

	return strlen(buf);

Each iteration calls sprintf(buf, ...) starting at buf[0], so the
previous group's line is overwritten. When several groups have
wakeup_src set simultaneously, userspace reading
/sys/.../wakeup_src sees only the last group reported, not the full
set. The trailing return strlen(buf) reports only that last line's
length for the same reason.

sprintf() also has no buffer length argument; sysfs callbacks must
not write past PAGE_SIZE.

Convert to sysfs_emit_at() with a running offset so each group's
line is appended after the previous one, and bound the writes to
the PAGE_SIZE sysfs limit. Return the accumulated length directly
instead of strlen(buf).

Fixes: c081197a33a2 ("firmware: imx: scu-irq: support identifying SCU wakeup source from sysfs")
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/firmware/imx/imx-scu-irq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/imx/imx-scu-irq.c b/drivers/firmware/imx/imx-scu-irq.c
index a68d38f89..d1fb20d95 100644
--- a/drivers/firmware/imx/imx-scu-irq.c
+++ b/drivers/firmware/imx/imx-scu-irq.c
@@ -179,6 +179,7 @@ static void imx_scu_irq_callback(struct mbox_client *c, void *msg)
 
 static ssize_t wakeup_source_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
+	ssize_t len = 0;
 	int i;
 
 	for (i = 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {
@@ -186,14 +187,16 @@ static ssize_t wakeup_source_show(struct kobject *kobj, struct kobj_attribute *a
 			continue;
 
 		if (scu_irq_wakeup[i].valid)
-			sprintf(buf, "Wakeup source group = %d, irq = 0x%x\n",
+			len += sysfs_emit_at(buf, len,
+				"Wakeup source group = %d, irq = 0x%x\n",
 				i, scu_irq_wakeup[i].wakeup_src);
 		else
-			sprintf(buf, "Spurious SCU wakeup, group = %d, irq = 0x%x\n",
+			len += sysfs_emit_at(buf, len,
+				"Spurious SCU wakeup, group = %d, irq = 0x%x\n",
 				i, scu_irq_wakeup[i].wakeup_src);
 	}
 
-	return strlen(buf);
+	return len;
 }
 
 int imx_scu_enable_general_irq_channel(struct device *dev)
-- 
2.43.0


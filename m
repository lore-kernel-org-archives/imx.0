Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAF81DE4F8
	for <imx@lists.linux.dev>; Sun,  9 Mar 2025 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741538623; cv=none; b=qRZRhf71KjwXkbu3rIlfyD6eDlG0fPFIEg1RedQWGf4qtz3G09C/4wxEdUbfYS5zKu+AVDmO5DD6ky+H4dNx9t2xG6zdQ+4ti9wRx+5/fw6w1zgjTfXA1UfsOzWLA/Zc+roh6ElubxbD1jRMxWH7Jh1LlZI48Wl7K+P78QUqI7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741538623; c=relaxed/simple;
	bh=u3lFbDaSfxLs5RBx2vryQP0crfJJodis+bKxzLi1MLA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Z02OG43u2uGt+P/+l9IY/sLRsJpXGc+H1TzX1MuafHbCgsaGizlOA5/BY5zsNmgJnZtC85cSMu1GJtBPpqomWIIOssNTwQv3xmUR0PQBS6ikf1wyUd2jbR5c2KGGW0GWbLhpALf24i+FcbIP5+W1NgxO7gotuX7mP/ulHeGZ6G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hmt5eUSq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hmt5eUSq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3913958ebf2so1397358f8f.3
        for <imx@lists.linux.dev>; Sun, 09 Mar 2025 09:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741538620; x=1742143420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHXkBuZmZFlrGfeJ/m4uYp0lVYdhSJImm8UniMvvnLw=;
        b=Hmt5eUSqLPa9yQTUPyljFGf1IHhcuk3tgFHqYvYpAqih5O2tloavMlswjX9bMfknnq
         x2AL0XMfu2qCF4OSPvV931bkOK3YI64vl0PhoQQGCkK0IToWV3IkEgMmr9/39rW9G2RW
         0JK9zKSHI7+erIUrKyALZWcyYKSzRn/iK/jMlEtf6yHekDh2Sb2LVlLa5FSVBr/kZofK
         iNI+fm5OdChXF20SwsZ+YKlVNZm2vMX1hpw5ap0163WmSLWonyNHuck6Ktmy3s3VVF2d
         MI/3CCMKJBEsC6lQhUUNL70SZcqpZc9tbzTBB4Zk2WUq0VjETJ42UVyfN6e6rTi6NQfq
         KVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741538620; x=1742143420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHXkBuZmZFlrGfeJ/m4uYp0lVYdhSJImm8UniMvvnLw=;
        b=hR9N0GR8sPen1uVJbaknb3RVXgeEeVImqD0plm0ewXwPAatTfbHyWSHTn6JDN7Awiy
         kknw6/oj/nVLnTlymq39rpn/lCT4a9h0hFhdLV1bmwzPUX1X9x33k1V0Mat5bqVCDcsS
         p7vsLI/xcJB5AcoYUts3x6SpNvO/HwvGaelBx+e69Q5YLZ++PczYANfAsqSyyuk9DEHG
         9zmQhD6l+1EtIDIs1KGec2hdEdeSuDapmlLxGTMhG53za0WvkksmsIff/FwLdBD0hMZR
         /LpBToOjYJGxYL3YPVv1I06zCBLphHenQYuudwJ/p7CqnS8LuksnnWgqdbn17c+Mkz0W
         7apw==
X-Forwarded-Encrypted: i=1; AJvYcCUnDnWTnMGDf3ZUBgQnUPiiNc8ZEom2jU5ClcFgZ+GwMpggwoVYMp7QHdhq5IUtX8dpQGE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwowAyF9l3FW8vdJcCgrWhwbHeIfSezpoCHBVK+exOcoNFbe7t6
	QB+yGRnNbgx8iyNuVO+2QrCixq59z3KLpLbs8wLXmqw+AFenriv/
X-Gm-Gg: ASbGncv6gywc3jIhhHHEkNWnKdUSWe5j8YEk/PxsF88X0gOAjCHt1m2eSH5hgpFni/a
	hE6aWwrQrvCp3XSxKcW1UQPdJ5sHJKvhTzM3B7AxGQIgSgyztpgDSVfLAvBGAUAkX3Kf7KyITIo
	AjAYIp95WYzq5WAMxUsxaz0sXFUDanj5S4bHKOWjwimXCh2mD2PDhPFqLLRmBR05wvohMYbX7tj
	rY4H07LzVTfy41KeHJryowEH7J1P0pXORXqI+vKohBhpoJj5Mn8/3Wq5vvaDd9sS4IrHgeNAxuz
	dM06Y3rhzEgAVC1q+6GsGdbtVCSEJ1ScVLUggqB+iyJo8w==
X-Google-Smtp-Source: AGHT+IFyKUxBLZUDgMFG2/EF/TMdarKQbkjcYBNMq1ME6vdXSZxz5Pi5uDoQh4n16DYoLNiBrcSuZA==
X-Received: by 2002:a05:6000:18ac:b0:390:f1b5:e619 with SMTP id ffacd0b85a97d-39132d5ae53mr9107933f8f.31.1741538619822;
        Sun, 09 Mar 2025 09:43:39 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:64b2:9f80:ccfa:15da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ceef2fb8dsm36719485e9.18.2025.03.09.09.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 09:43:39 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: svc: fix signed/unsigned mismatch in dynamic address assignment
Date: Sun,  9 Mar 2025 16:43:14 +0000
Message-Id: <20250309164314.15039-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

svc_i3c_master_do_daa_locked() declares dyn_addr as an unsigned int 
however it initialises it with i3c_master_get_free_addr() which 
returns a signed int type and then attempts to check if dyn_addr is 
less than 0. Unsigned integers cannot be less than 0, so the check 
is essentially redundant. Furthermore i3c_master_get_free_addr() 
could return -ENOMEM which an unsigned int cannot store.

Fix this by capturing the return value of i3c_master_get_free_addr() 
in a signed int ‘dyn_addr_ret’. If that value is negative, return 
an error. Otherwise, assign it to the unsigned int ‘dyn_addr’ once 
we know it’s valid.

Fixes: 4008a74e0f9b ("i3c: master: svc: Fix npcm845 FIFO empty issue")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/i3c/master/svc-i3c-master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index f22fb9e75142..eea08f00d7ce 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -998,9 +998,11 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 			 * filling within a few hundred nanoseconds, which is significantly
 			 * faster compared to the 64 SCL clock cycles.
 			 */
-			dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
-			if (dyn_addr < 0)
+			int dyn_addr_ret = i3c_master_get_free_addr(&master->base, last_addr + 1);
+
+			if (dyn_addr_ret < 0)
 				return -ENOSPC;
+			dyn_addr = dyn_addr_ret;
 
 			writel(dyn_addr, master->regs + SVC_I3C_MWDATAB);
 
-- 
2.39.5


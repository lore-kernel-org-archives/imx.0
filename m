Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0B725A2DD
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 05:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785992572; cv=none; b=ScQ/wdCKGzI/WyM/oL+alvO1GOvdcXQ1Pwwl1lGWYTv4U8xQs8Za8JlLVTl3GWeJQOR1OYVEqZ9vt8zBDg2AFop1Qc6pZ/nibnTSz5RAnOVywe0sPUwbuiB7ZLcZK6B3y2svelK0QvTSIMfApsM1OMLcAVWyCQD9zaQcM8BcOWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785992572; c=relaxed/simple;
	bh=LTb8xXo2KUfF4VA80ur2+SUFFwdU7A/Bw0G1URC5w+E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cPRc57IXdD2uehovsExwOO5oPYHuIgiYEji7IRmRnSinG4p5iHw0t193I1J6d2Bd7MLPPrDvOWq2x8S5xhMc14VfLEXOuwBfsetFwGATKaKxyynNqTOrFQzWVlP764xQZY9jmHyV33+pXPYe6yzX5iKahGWDHIsoGmwgxFtARo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCeeQgAN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCeeQgAN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-496b7622a83so13998295e9.2
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 22:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785992567; x=1786597367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QvgfMTGid+rMciEFA6IcKQ8hr90StVRwt8iU/v0xqIw=;
        b=YCeeQgANpHJgBfTrnHv5Ev/2ctyZFjn7+C+qzKTxF4LU+2KzVV33oJYaFdJR9JGpQe
         xcjfXEl4DhiC0TphCu/w1M02blFHbzeCaW9j7d5kAQctuM14EXva41qKiZ9TmLi2kRG/
         JrG4UJmJatuce3LcJhT4s0Eg9IemVC/BkFITJLkQgcQ8z3vC3XrQd1ny9Gobpz5PFova
         phT5FjPMvXNzpXxiR8oTWx9RRJkv92m3dagNdfMTnG3CBNhr1aarqty0jS5MdHu5h2rK
         XQTT0ThY7SnVjkEOt4XoJpKqxUOCBRYWRuz7Xs/ok/yZJk7aiYFe3OA/PMAjuOfl4vPo
         CfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785992567; x=1786597367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QvgfMTGid+rMciEFA6IcKQ8hr90StVRwt8iU/v0xqIw=;
        b=hmhZOxPtmrrzfDK/zrWntq4rnbNv2Lvh2c//lXVU8eGTocsU7cQ/JwxiizD6FgAHx4
         31ofHqIL5WCqP99hJcy3Fqa+wbCkGc98g0XRG8RmL3P2OpD7EnBTHl0sWFtz/JNk9p4S
         F6GcTO33Z6M++r0ErT/WuzGHquoVOVM7nnx/jakwBJx4inlyzUwcKBkl0jTkdQ0VsiNW
         BN+QPVAZFS0P9nIdVVlPRsCaZDVBkjsPagrzqQ7K5dDkDsrgFT/JXpHUjU2GJmYZ2dt+
         BL2xUP320uELIy4seAJ+lSV02ybEPuqIjm5IVGqYhI8q+3t00CqU+1uqCFMgNj8lSmsZ
         U7sg==
X-Forwarded-Encrypted: i=1; AHgh+Rov+UUBUOvF68cl16PBqgtH54P/ZfQjPBsd6FZie/Bc+UGGXiw3uZWBfuELRPvt5VXbaig=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzngr12kYa4vQq21qsw010IBeOLhdt/eqxE/azjn3/mZXCIIPR
	KOqJ221PsV7nq0ce2Mv5QJ895kx9KGBtysefBAphB9PJoGuKxrdnJDU2
X-Gm-Gg: AR+sD11heWybIBRQs82RLAn+VO5DD16YTrWAqb5AqMDAowqfNOZM5CUX3hHOxAlQl3F
	RJkkLoDL1CMyZB8144SbS6y5fr8CyZCMUmxIVVH7I/JuvRilBiCJuqWenFGcfiCooZf6UIJsEuX
	8XVaRH7zqu8shtrRr9E5pIRzZ5gj1ImnMNi5zuIhkWnLwaKGJOjvuFCnbCQ78YsYxKwVfBIdIW+
	BEQBFn2voVWw2PdYp22bgVumprVzPLSvF7hHgclMYZyHVfMZBOk26YrgFV6dkXfJ1vFIXOBEc+H
	25kSE2BN9vAcBXLH9MvJObgo143qH0JeU7K5w3BDKNyzdmP5fIdXfEfjwG9+ZFiDj+zgn/qKtp0
	pRh4jhtp+sVUYvAaLCUAv8lzLaQXYt6XXYtwak620GnEvXirFvXcOfhkZ7E/C/SnwtaqUXbsFuI
	OFrSjpqsYm6CiYsRytjtv5T4fh1sPL4CTfjHBr4DyDx5WwXA0i9NvKEcDdmU+bw44T1WxozGty1
	Uw2Z3AXobAWl3mhP+iOHkNrMwvpChWCFcLY1qoBuVgOJ+LJzCE2gQ46bfXngs+nVKGB0HpO2mKs
	Jo0Q2ZegqrKSNpxtUEjij/a634fUW4p17ihfvvI242EW9ozHCh9mNx/hdqSt/K63cZHoH1PU+WT
	nngNGlM9JUL1ADJlMQLG5
X-Received: by 2002:a05:600c:5694:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-4994e7bab0emr107043945e9.9.1785992567364;
        Wed, 05 Aug 2026 22:02:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-adf9-2301-8c14-6be6-a9e6-a2d4.310.pool.telefonica.de. [2a02:3100:adf9:2301:8c14:6be6:a9e6:a2d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542188easm28834695e9.6.2026.08.05.22.02.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Aug 2026 22:02:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawn.guo@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Anson Huang <b20788@freescale.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: imx6q: fix out-of-bounds write when probed more than once
Date: Thu,  6 Aug 2026 07:02:39 +0200
Message-Id: <20260806050239.90188-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx6_soc_volt is allocated fresh on every probe, sized to the number of
ARM OPPs:

	imx6_soc_volt = devm_kcalloc(cpu_dev, num, sizeof(*imx6_soc_volt),
				     GFP_KERNEL);

but it is filled through soc_opp_count, which has static storage and is
never reset. A second bind after an unbind keeps indexing from where the
first one stopped, and writes past the end of the new array.

Unbinding and rebinding the driver on qemu's mcimx6ul-evk, under KASAN:

  BUG: KASAN: slab-out-of-bounds in imx6q_cpufreq_probe+0x3b0/0xa34
  Write of size 4 at addr c5e90480 by task binder/73
   imx6q_cpufreq_probe from platform_probe+0x88/0xe4
   platform_probe from really_probe+0x108/0x384
   bind_store from kernfs_fop_write_iter+0x1b4/0x28c

The write lands one u32 past the end of the allocation.

soc_opp_count is only read a few lines below the loop that fills it, so it
never needed static storage. Make it a local.

Fixes: b4573d1d657a ("cpufreq: imx6q: correct VDDSOC/PU voltage scaling when cpufreq is changed")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/cpufreq/imx6q-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index e93697d3edfd9..fe0453c9623fb 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -55,7 +55,6 @@ static unsigned int max_freq;
 static unsigned int transition_latency;
 
 static u32 *imx6_soc_volt;
-static u32 soc_opp_count;
 
 static int imx6q_set_target(struct cpufreq_policy *policy, unsigned int index)
 {
@@ -330,6 +329,7 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 	const struct property *prop;
 	const __be32 *val;
 	u32 nr, i, j;
+	u32 soc_opp_count = 0;
 
 	cpu_dev = get_cpu_device(0);
 	if (!cpu_dev) {
-- 
2.53.0


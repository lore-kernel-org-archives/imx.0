Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610E1417D97
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375326; cv=none; b=bcFMBLqzq1JLmS3tvqA7jpVeZMIm/jDIIU06dR6NSSHmMrCzQfJWTa8aF8Eyi5km2HPLFwqgH0tFfKg+mdCBQQly82TFRJQfWN5voL3Gdz6rWDkaGgkeCxrHfQQ3mhlNROCXnqozOciUQ4vx4tCMoZCH8gA/Y55XZdIk+CqHoWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375326; c=relaxed/simple;
	bh=Rx5Z9281VmqPEElsytrSVtNHldYWbp/Xg08yI3mJiMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J3kRcgRtRuWiDA8EAn8PSE8VljIYrffg7rjgxIcaL4y18nJe5R7UH0di60Drxp2EqHJTzqe1kN4z8B+/KNuqTq4gSN+IQFo1A4AVLTVqJ+H/TOj5+zryTebCoKZhgBfIb/mMmW3IYU86T9b3fRmEJU4dQyjJwWQZWorfikZjGA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPyHtlnw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPyHtlnw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49954b88fffso21753385e9.0
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 08:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786375322; x=1786980122; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=svU6xwFGf/9QtbbQSKtklx6ByIpuWbpg6lXD+wNFaQY=;
        b=jPyHtlnwIaXBzd/TxYpHijxjYR6c7wQ3TpQGIeHXMnBnkLzL796ndL9CqmWQq6SEx5
         m7IK6OW1xa8LQxMh3mF/5GJ80xnLA7XKUja/JJwFUGouZKBa5v1cm4oTzcld/YIlxJm2
         psZl/1lw9PQVLdksS4JayY1Q8LcfEzIa1ZXQqkvKghBOYowGAUHySTrfQmoXor9URBi4
         jlSfsO9/awpYQ0xWLP6tIEzap8m0k5sEyaOhB3QG0PQkhuz2AuXTS4WQDYJCimvePgdA
         iw6JbEAah64Z02fONUGm8Xm2t3u5ChY8uB6CPpzUNhuuh1Xf39vxEqzEMceJNZR+oHXv
         vIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375322; x=1786980122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svU6xwFGf/9QtbbQSKtklx6ByIpuWbpg6lXD+wNFaQY=;
        b=BQsBgz4G7Pr68WoqTYf2E6srnvwqQthgV2WblZ0nKeN63CgnqXblZuK/S8EGj418pW
         FSfjc6YNx6ZR6mrEO+tnJz1EFZj4SRrCtLHHNmFpTU2lU6w5CqtOYcZ4ACx+Gi/endKt
         pR6stWlJURQOEOhVIJJ/S/LJ72H3NsL77NulQBfu9dpyyl289FS/M4pjntd5h/pl+BPI
         iGwKcYaE0ftBbpFgV6bg94nEeb0sE6YGoyiJJ4BTw5+eP9Dc3sQHR9Agi1mLTg993+Ir
         snlQtZx5n8w4egdPHRhduAXqzJBLPL7WbaBOLLuxSZ/pSJBto0hBdd7BixW/9JU2l9u4
         OdDw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3/YNeKkNmGNqlqagjw3L6JhGGKiMtluDTuk1dbUECcYZqA31f9GTVo72KPk1kGGDZ1lY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwR7T30EHkh1pUVbzp2U+r64fH8hPOOU6fSazkVugcEJ16HZBN
	f9Ikgc+nDptuS92K5SQ6NlUxOT/1nNH9whmkxBkQZrIrMtyXN8yjuu6T
X-Gm-Gg: AR+sD12dTNpyMQkT2zBUb0gPcBOVLr9kX6KvX0afxM5GvUkilKW2w+P3u4maNKFQvfJ
	DFyoCHvYMl+7cVylajYWbEGz+glG/LuJbN3t7r590BNquli8AqLOykH4y7pIURzJn8Fvt/gUuco
	+GSb0xa/6nD2l74FC72BFsTGfOI3CBnP+l2yuDMmLv7X9T3Kjtl4lwjWYlW5s9dXId2Sgiu6mpr
	GDszu1WLMRhOhPofNlr59jNvWEtyxB+oa1M1/AiGmfLFX9gg80DRRgta6dJU5H70DpdidhHi3dU
	pJQzaFtP6CNi7v8LhGMo3nBWFsbBVCL4Ek+LEhJEQdZgoHyb2Wo1r+oFOTPMlYJECmWZAbcEq1k
	+sDNZOKiBlVCfXzJTeFyLpEsAidTdJKc4ZQ5JjC9c7I+bEFJo4Db8/eJ1u1JUmIjeqCA6mXgEQ3
	iKMrWZrePqAxGzljiIE2ivi1CWD4nQJruPMZULprTb5yZDKlJa4TItLADjvSfIHzIGrnY=
X-Received: by 2002:a05:600c:4e93:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-4996193f165mr287140375e9.3.1786375321792;
        Mon, 10 Aug 2026 08:22:01 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499740a70c3sm99255e9.3.2026.08.10.08.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:22:01 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: vf500: describe the Cortex-A5 L1 caches
Date: Mon, 10 Aug 2026 17:22:00 +0200
Message-ID: <20260810152200.3230971-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The cpu node carries no cache properties, so cacheinfo has nothing to
build the hierarchy from and gives up at boot:

  cacheinfo: Unable to detect cache hierarchy for CPU 0

The level and the type of the two L1 caches come from CLIDR and CCSIDR,
but the geometry does not, so /sys/devices/system/cpu/cpu0/cache is left
without a size, a line size or a set count.

Fill them in from the Vybrid reference manual (NXP VFXXXRM), table 2-4
"Platform modules": the A5 has a 2 way set associative 32 KB instruction
cache and a 4 way set associative 32 KB data cache, both with a 32 byte
line, so 512 and 256 sets.

Tested on a Colibri VF50. The warning is gone and sysfs now reports both
caches with the geometry above.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf500.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf500.dtsi b/arch/arm/boot/dts/nxp/vf/vf500.dtsi
index 71ccdaa..a73e9a8 100644
--- a/arch/arm/boot/dts/nxp/vf/vf500.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf500.dtsi
@@ -18,6 +18,12 @@
 		a5_cpu: cpu@0 {
 			compatible = "arm,cortex-a5";
 			device_type = "cpu";
+			d-cache-line-size = <32>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			i-cache-line-size = <32>;
+			i-cache-sets = <512>;
+			i-cache-size = <0x8000>;
 			reg = <0x0>;
 		};
 	};
-- 
2.54.0


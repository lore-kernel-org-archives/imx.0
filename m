Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B6A414A17
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375806; cv=none; b=HGIP0gM/S6RntUaEETSZil+PScHko1S9tyCR+w/iiY82TsHpHNMVXtaHimEOs2WbAIu8Zyhr0DO0keG+N6n3NmDX1K+kqlZw42ctKihQcPg/zYIl6K3uskZcYzEvcrvJB6itPO1t5TTIKx/mCkkgdWmZplSBGqJAqSKj1A5DX30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375806; c=relaxed/simple;
	bh=i4AaGw/MRkkuftYKL7z1QtMjlTX6+i61kt14X/nX0QU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLc2caYYEQJU1E88fc3NJlzzK7zKk3kEv/1O5Kyl9NObeowBfIW6Ln064lTjfyv3DU0K1T3Ku0klnBQG7EtZlwwVzjOsZiP0o6ZgxWEIKl0MX5EXA8z6wS3Eb3zxSHbNQYy1pLFLNyQLFdIUv9E/mZtGx6pVjK6ouYF0yxIFess=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAcLYQs6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAcLYQs6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4994c49f588so158265e9.0
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786375803; x=1786980603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9IWB+vcmjIl6Izb/aUu3HlRiPRfJwGm+QVMLMZIBpoE=;
        b=BAcLYQs6h2JmbumJoEZOt5LMFalas3mlDrCo9ODvuSOK0TmRm0Q1oP66TgOrhYhz5I
         SiQhTC+PdzO8vbFua0NmqWmNEGkjwKfatoOx22yq/RL/78QLGvpYJRCP2n6abTMaKQtV
         3mkz9UQA9zR5YSrun/rSmpieOa82sOt8DEVeN+zsx6bto3eGKsjYhczC+v8b/MnVDmX2
         R/YnTbSYFRgn4YT0J1Ylv+BLPzaV05rt3pN2ZImZ+tDRroZwpJd22x1UR+5x7pjix84j
         KWnq1T8PLXSYOcauxV5PBRQG4XCIYspFIQnJ6OwnHyTiilBIi0SsBvr6zi4JM06kVR+c
         ruvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375803; x=1786980603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9IWB+vcmjIl6Izb/aUu3HlRiPRfJwGm+QVMLMZIBpoE=;
        b=hNVQAUSIKJadVqprkHrCb6bDqax0wQi+xgpmaFWqdBPaZaJsFlRDyt4oA9pkFomNqm
         jf6B8ye5o0KNArFka7gW6BbLq92jgbkXxDzJ9kStR0gMLPjdsvw+x7bZzU1uwOhkCpPD
         Uptpt5Lh0Bl3fHbR/isc1mlA2xxz7q7Rtme3fMtpPshwftW2EVuagpjJlukvSebgHrmc
         fxTVmqQyWzPLF94KwNnCxYNYL6EInCXyTXoBDoZkoYr+7NmT7T5MgMmnA5sMBAeiPsg3
         +kHWRJpbShiJXF/aNnJjD4s3n9XcMYqcwPKwNdML2k+Xf/36jibbae3H+Fj5zvXqUgCl
         16Zw==
X-Forwarded-Encrypted: i=1; AHgh+RqS1Jd7dPpamrHo3uol/T46QXNL/l9rcJOkWgL/mZIekY9L7LiEkQsU/sMj8o0yGqoBHq8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXzFydtclHLmkd1YC9Pspjt3lniyHmP7eq7HLPNp3ClA7maScH
	9VUT7j9TRR/KTQx00M4Eu8uWjZvyByBALvXSG9Frns4o0PO8zvzqjnwA+yxWLCGn
X-Gm-Gg: AR+sD12s9HEXaXNvDfmmx0d7zh536GydA58NJFd2FMOPkVC8k5tOuWedwIWat6ScnYX
	wyd4vSwgQGGC47U7tOmpI8/gDrgkYfdIoVUZykJxvsNeZ17TrKnh7zqeMQeVaTpebvzw965bFby
	aCBB13e9lxSzDh49g5kPQqKbNX7AZpEJehfUhWsAhn4WpPt+NQna/N+NlFyF+Er91fqBsOuDLPy
	rrzhVnOK1vNvdFmxX0ZqW5WmxQ14+1nUESNVjNXGlfzwns0VFLJcBlBg9kZ38zx6FvRB3WkDRoj
	qYaudCiMwqHRXVdMAv0usGjNiXx2EluXDeK5h7GHroFeAeH/nBQMkrAPfaUjl7053F4ey5+bViP
	6PF6llgoNhQLAMKCfYgkzrvW9knYDiw/T6OTCG5/jwgYFoNkWrqn+3I+9JORvICYDlDwWLX72vD
	NL7pFMRZurt2MuDJ47PVXl10gV9YmPfHHmBgKcfQ5p8QI+/2QT/YbXUzQpTc/4fM6fxfLJmZUmQ
	FL7Zw==
X-Received: by 2002:a05:600c:8a6:b0:498:1577:e11a with SMTP id 5b1f17b1804b1-499624840d3mr182391815e9.5.1786375802737;
        Mon, 10 Aug 2026 08:30:02 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480020be8f3sm33917464f8f.0.2026.08.10.08.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:30:02 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: vf610: describe the L2 cache geometry
Date: Mon, 10 Aug 2026 17:30:01 +0200
Message-ID: <20260810153001.3236085-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The L2 node names the controller and its level, but not its size, line
size or set count, so cacheinfo cannot describe the last level of the
hierarchy even though the cpu node already points at it.

Fill them in from the Vybrid reference manual (NXP VFXXXRM), section
3.2.3: 8 way set associative, 512 KB, 32 byte line, so 2048 sets.

Not tested on VF610 silicon, the values come from the manual. The
matching change for the L1 caches was tested on a VF500.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf610.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf610.dtsi b/arch/arm/boot/dts/nxp/vf/vf610.dtsi
index 2fba923..ea59e3d 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf610.dtsi
@@ -14,6 +14,9 @@
 		reg = <0x40006000 0x1000>;
 		cache-unified;
 		cache-level = <2>;
+		cache-line-size = <32>;
+		cache-sets = <2048>;
+		cache-size = <0x80000>;
 		arm,data-latency = <3 3 3>;
 		arm,tag-latency = <2 2 2>;
 	};
-- 
2.54.0


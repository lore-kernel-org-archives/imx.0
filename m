Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E42FD7D7
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200556; cv=none; b=mralp0Gxu5KuupksgdlrThjfvnfEce/DO5TV9BhWHDfVswxyzbcC58gW7pfRdqnqzexbvhiXX+vj1Ze4awi5BtmOD7VL/3bEefnqG6cNiFKa1nL+r6D8MrXNH9OncX65C8DeJMrUGkyzgFkdIFQi1B6NvLjPSwYpHpOV1ihARTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200556; c=relaxed/simple;
	bh=c8PjhPCCnTgJeUpJFTJS59xt6J9KPnPZPyUlPHKDLhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=Z8SNg9Hh1e/GlH2I+JziGotDezLib1HELXS+Ni+cEt04PbWKeVxmBHtXBNjnr6DcYm3k5lUWojMQUlZP3BWDJrip6h2nokajqtuKkQZ4vz9GNxqqMjlSOh8i1STA4IERVW5fcM31dt9KmFPKNFA8OG9vPNlHmXJzBfVxu1Lqkrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M1O3mPqV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M1O3mPqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756200553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ibjPTMAiwCSgwdvKGbpBfuqA/Z8D2h5jZa+FGc831mU=;
	b=M1O3mPqVNfEyh5lMwQR9N/xIrmATq5+QVbptCcND3PSlvSz7T2P8eoRLg2f4rYshIBWt/Z
	TewVsTyvlX06eX6e3mXPqoXrw/r8vgHv0LTCrfsNpGZ/EVFm0W7EGPazvOa8JrU5rRLD//
	Wh3Y0pgtKdfG34qeZJh8PUnjPXZQnF8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-KpVnBr-iOqWxnjJNvYbDSA-1; Tue, 26 Aug 2025 05:29:08 -0400
X-MC-Unique: KpVnBr-iOqWxnjJNvYbDSA-1
X-Mimecast-MFC-AGG-ID: KpVnBr-iOqWxnjJNvYbDSA_1756200548
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e86499748cso1641280485a.1
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 02:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200548; x=1756805348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibjPTMAiwCSgwdvKGbpBfuqA/Z8D2h5jZa+FGc831mU=;
        b=dkUba6UwqboxmUpmzv3ujiMbBAlpWDgzSI3GAGu0KD02UOeteLBMz2iHIEWBQD+VSn
         52fSvUVvi9gpiDD/Q/Kiu3oi/ltFFMG8OaoePt4a1yJOnNaJB47hg6bsgHSVEGIKQJbu
         EFxGCvwYnY7pcJyXfkwI5y4+OtCVSl4R5HNSJUubScsB7K9+TIOdijSFELVvg+ef1ANJ
         2x3CHwS0F1a3DoLajMwQILLBmW6dv4SPkhqqwfwZksbFw+pkxc+rHEn6LS96l09FQ0hx
         krmwG1wzx2OzxVlVtV1QOXo9fwHBQz5MEUD0QAT5IW8QSqyOr4Pf5EH0dgc6nrfZYBKb
         YG3w==
X-Forwarded-Encrypted: i=1; AJvYcCV+VZt3uzfzYDm9OqADP6TZMyILh4J/svbdwikQJ83Y1LmFI0rSAxCCn82xXeRCgPuRzow=@lists.linux.dev
X-Gm-Message-State: AOJu0YyF0BXav2ilw9FQiGzCsZ+QGKovV1yBPQhRM3PXi9U+G55m0yAR
	6Jy7Y/lG+whn6hrgf6TqA7t3DYJblq1HaL80ybuZsI4W+htfQODqOKnlklv+20zBoFPKHk0IKFY
	hRhZEKHEDs4v6id674RPjUJt0xW2rBX0FuKE1zKyH64e/jQ6LbiF2SA==
X-Gm-Gg: ASbGncvq4VuzWcFWfrflsvNcpgeAvN+QG5gjuFnwAJiNgsEkVSWm21Argdf7S8vTsMf
	2QSNXMgfeQUQpPf9k9Wcvwe+/EcwAEYL5GCr6tY/qa9hGav5OsKrcd91a3wHWnxSuCxcquz+k4Z
	jv3kNWIA1nkfn2QZCbpsTNwu2E9i6Y9Fc1KCmpHAC1nDYqYqf22Ij1Q2ktgSsk9plLsUqNL/D7/
	kX0PmRKO4QZr/6YXGGoEqWqlFQpvzw/nfVHiu3w4IZfxjpAZrGJfP2RM5GjELO4s69dkyysV/wf
	rw3/l+D1BgSqTbWQ9ArBvdWcZGQoWSOvSX1YHhBwrw5QklG1TSM+bBSa4psD1R7Q2EN5pTfFz7Q
	iJdxXM9H/mA==
X-Received: by 2002:a05:620a:471e:b0:7e7:f2a2:251 with SMTP id af79cd13be357-7f58d942015mr57564785a.27.1756200548180;
        Tue, 26 Aug 2025 02:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpr7ArFXT7ZO1WWZDThLtmtRC02lQO9+8IZq21Q57x0kWr/JgXF3wJtr0chhDvtcW8744jFg==
X-Received: by 2002:a05:620a:471e:b0:7e7:f2a2:251 with SMTP id af79cd13be357-7f58d942015mr57563285a.27.1756200547767;
        Tue, 26 Aug 2025 02:29:07 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebeca23e3csm660193285a.4.2025.08.26.02.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:29:07 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] ARM: imx: Kconfig: Adjust select after renamed config option
Date: Tue, 26 Aug 2025 11:29:01 +0200
Message-ID: <20250826092901.43141-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QPxGWHckKb9-2cVU3UK25F3ZSxmH9j03-HBxelxMyC4_1756200548
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 3f490a74a8a1 ("clocksource/drivers/vf-pit: Rename the VF PIT to NXP
PIT") renames the config VF_PIT_TIMER to NXP_PIT_TIMER, but it misses
adjusting a reference to VF_PIT_TIMER in arch/arm/mach-imx/Kconfig.

Adjust the config reference to the new name.

Fixes: 3f490a74a8a1 ("clocksource/drivers/vf-pit: Rename the VF PIT to NXP PIT")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/arm/mach-imx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index dc47b2312127..6ea1bd55acf8 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -242,7 +242,7 @@ choice
 
 	config VF_USE_PIT_TIMER
 		bool "Use PIT timer"
-		select VF_PIT_TIMER
+		select NXP_PIT_TIMER
 		help
 		  Use SoC Periodic Interrupt Timer (PIT) as clocksource
 
-- 
2.50.1


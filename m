Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E08248893
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750698786; cv=none; b=Su/lAJii3UDKdT30rnpWLu2ibdsT8ZxF8ujT0ohivxlX2eSX5FyzXBH9p38CMPPnRa0O3dfQOhjgpCQO3G/9Fs3kD0znJsEyXaWWU80RTjIz5KbzjFPetqJ7qwhjOp4B1is+Pyz1uv+JOVvQV3hyOiGEacrk5OLvSqCsnsnJmDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750698786; c=relaxed/simple;
	bh=wv9r1Nau37bZDlcKTni8vX3dpCtckh8QUn8ksWrvjzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BdkFHvbzMhjxjqmiRFJ2zhGsQvI5L5Pg9/MvvHolimcvelS/rORC/sFGoUW4S2NgS0Ws0TdUIYxd6GlDo5DeVd1SsUwIpNd+u6H9Vl6EMK1POkEgNakP9CWAmF7GVTa7dEljhH7JH5iVaQ6pLz/qKVL5xGoXamj2L4ZqXi6yM8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de; spf=pass smtp.mailfrom=innosonix.de; dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b=eHhbx9jw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innosonix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b="eHhbx9jw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4533fbbd21bso2133575e9.2
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=innosonix.de; s=google; t=1750698783; x=1751303583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFVerlv1rup6mF5IH5Ew1KKnD+3iU06ke4X3UNXN3IU=;
        b=eHhbx9jwtdnuVaYcWg8D9+iiN9zjI6O3hED1nhi2GYf/zBL4vIpJtPl4dSYQk6oxxC
         oBkhHxSQj38vb5cz/QkfiGJp9Np3Vps1aIzSeYXq4H9R8foFQgYhB+A/hx0J/BeJPfzP
         SYlvkSzIZ24RXcpIkchPHdPt9qGP/u2bevEzrXxoui8Qixv2b2hQN7VCPAJwcoNvdIex
         UgCvTAfF+t7mgVTTWpixib65LunE7UsxwqAHXMIxBYJ5ZaGrkBLDu+x6gv5LC90dti53
         JnZE9mqxhsOCUYN9gj94AIv9KhaDIH1BP0me7a1JYFtMe1dmCDxTee8WF2o/zs0sT3/4
         N5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750698783; x=1751303583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFVerlv1rup6mF5IH5Ew1KKnD+3iU06ke4X3UNXN3IU=;
        b=G/P0KSSzu0KlfGhnLUywJcl+INw0ZWjhUsqJhOT6OvdM3eSWbzeI/WhTvPFKPEeCul
         pnezqWhwhV0vx5fpQCtD5lxIqLBJNBcUagSkAAgS5WvvFHSVthoNN2504vyV+qfikRwt
         cEQWShxe7fJ69MuEx+8tPy4Anc4Ymy3C6HWVhF4HyEhgvu8hPhKf3yUDYUZezD111qUB
         2zv5r3EiXAnk2MbHYHQT+w0u0IC5lqqBWzKN35MhlQkWLAS4ouvpud8GtTte/KDkN4zt
         f792h+2Grxbt66lhDVbZa51gvS9Pk+CvTHEtMDGIotpxLJHBT03e/il8ozF9bvQCtcMZ
         nWbg==
X-Forwarded-Encrypted: i=1; AJvYcCWB/UhN7r5lMd/P8K0UIGXD/dQ/IEXpEmcV80XWaAIbczQ41EciDdi28cFD2e2LsChM4jI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1pW3ladQ3DReUJRz5lXDdgBwDqs4OoGhKtfnb1Hi943M0hMLF
	GOWt2a4CQ7zyHVIRXIITdAdfqb9+C6qNPeTYfNGp6/JzODvTsCmBDfR995wQDb34PSuqy5EXW7w
	ZepI5DNkV54Y1GlPYISrFTbHFLvDWASQWRoq+Jk4H6QKq37pOplPhHJfWaLYs6r0ZUA==
X-Gm-Gg: ASbGncucV4Z2ZzHVDmOEOhF7mI98ByY1dXJM4qXwuvJkFu7zTkMAretHWxbAmwhujf9
	82DTVwxhrwRHRj2LmiTrYKqvJ+51zFV0qKR1mTKV3mtqgdIWdVJ1NvtySLTnZ9bxjGi4jkTRLT6
	Uo7DDp0UiXGDB1npfY0k0+Q4WgXCnMtRzuxlzAsFHGAZWd/9Lr+kjF89dJl92fmroTeyHnzoS1P
	hPXyjdvzbiyMOyOzpaPT/xyleVQECMiwGyC3HlXhpte0ipP2nFoOEga1VNv4lxWKSXlbK//2Gd6
	ouBlza+0WB/SWmwsskEuZ5/sketxTlSTyBiwc6S/hjDFShgn45C5PwTYOkvTKITViBQ=
X-Google-Smtp-Source: AGHT+IErer93kOXokwq6+DGSfC4ugUszBo78NJco3EFwM9G1wiRi3El8E+vg0RKm5OXQE67tFwgtNQ==
X-Received: by 2002:a05:600c:5494:b0:453:590b:d392 with SMTP id 5b1f17b1804b1-453657bf79cmr45941935e9.2.1750698783204;
        Mon, 23 Jun 2025 10:13:03 -0700 (PDT)
Received: from steffen-linux.. ([24.134.20.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb57fsm118001245e9.1.2025.06.23.10.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:13:02 -0700 (PDT)
From: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>
To: 
Cc: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>,
	stable@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] nvmem: imx-ocotp: fix MAC address byte length
Date: Mon, 23 Jun 2025 19:09:55 +0200
Message-ID: <20250623171003.1875027-1-steffen@innosonix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The commit "13bcd440f2ff nvmem: core: verify cell's raw_len" caused an
extension of the "mac-address" cell from 6 to 8 bytes due to word_size
of 4 bytes.

Thus, the required byte swap for the mac-address of the full buffer length,
caused an trucation of the read mac-address.
From the original address 70:B3:D5:14:E9:0E to 00:00:70:B3:D5:14

After swapping only the first 6 bytes, the mac-address is correctly passed
to the upper layers.

Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
Cc: stable@vger.kernel.org
Signed-off-by: Steffen B=C3=A4tz <steffen@innosonix.de>
---
v3:
- replace magic number 6 with ETH_ALEN
- Fix misleading indentation and properly group 'mac-address' statements
v2:
- Add Cc: stable@vger.kernel.org as requested by Greg KH's patch bot
 drivers/nvmem/imx-ocotp-ele.c | 6 +++++-
 drivers/nvmem/imx-ocotp.c     | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e..9ef01c91dfa6 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/if_ether.h>	/* ETH_ALEN */
=20
 enum fuse_type {
 	FUSE_FSB =3D BIT(0),
@@ -118,9 +119,12 @@ static int imx_ocotp_cell_pp(void *context, const char=
 *id, int index,
 	int i;
=20
 	/* Deal with some post processing of nvmem cell data */
-	if (id && !strcmp(id, "mac-address"))
+	if (id && !strcmp(id, "mac-address")) {
+		if (bytes > ETH_ALEN)
+			bytes =3D ETH_ALEN;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
+	}
=20
 	return 0;
 }
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda0329..1343cafc37cc 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/if_ether.h>	/* ETH_ALEN */
=20
 #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
 					       * OTP Bank0 Word0
@@ -227,9 +228,12 @@ static int imx_ocotp_cell_pp(void *context, const char=
 *id, int index,
 	int i;
=20
 	/* Deal with some post processing of nvmem cell data */
-	if (id && !strcmp(id, "mac-address"))
+	if (id && !strcmp(id, "mac-address")) {
+		if (bytes > ETH_ALEN)
+			bytes =3D ETH_ALEN;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
+	}
=20
 	return 0;
 }
--=20
2.43.0


--=20


*innosonix GmbH*
Hauptstr. 35
96482 Ahorn
central: +49 9561 7459980
www.innosonix.de <http://www.innosonix.de>

innosonix GmbH
Gesch=C3=A4ftsf=C3=BChrer:=20
Markus B=C3=A4tz, Steffen B=C3=A4tz
USt.-IdNr / VAT-Nr.: DE266020313
EORI-Nr.:=20
DE240121536680271
HRB 5192 Coburg
WEEE-Reg.-Nr. DE88021242

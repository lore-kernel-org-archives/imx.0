Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5965C1DF75A
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 08:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668265; cv=none; b=mGdJF4Lwgaj5osfux1V8FB8twIYkGQTfGiIkMsCAyidATnRq6zof2+Mt4d+feA/rWLPWLFP43hSTZcQ4Qru27TsLmm1q6RKE9Ywqt6C8k732n7JlfLTCmgBr4UgUQkoW/ideknGsV/+hL8vu9z9n9ESFRlixiCD5Snp3eLWLry8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668265; c=relaxed/simple;
	bh=gI1ErGb0vQdrPAGEAUZHDjNpr3h9UEqh+5lgNTiM3h8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cOhWFZ5Du7t5LKE1D+au9ao2drAGh1027LFy2v3EPn7WYn98yLA5sSGZupWv8/mNQ90JMHwqolOjac2RJA3Oz+QMLcooiI9pTqR3qo0/m2kHK2dCpe8St/At+kMTjBlU/NsKY/2mV6G7ZWJjOi6pQW0MHPuEP7d7ROU1IhLBm4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de; spf=pass smtp.mailfrom=innosonix.de; dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b=TgCbKCce; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innosonix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b="TgCbKCce"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so736919f8f.0
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 01:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=innosonix.de; s=google; t=1750668261; x=1751273061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/wEOD3FOK1XNyQ/YyTEnECjOhDUHmpEcYDOM9V4Bw4Y=;
        b=TgCbKCcerm0j1ZaGAGYgKe7jHcfU2KMTgy7Ui+y3UC6OMqG1rkLUZBX5BzFb9bInR8
         7bEvPZnCMS7cW5apwrmkBVIFB6k+WKAjmdetBbAyoNucuBQxgHKYFMWT/2wscA42hudA
         J4sEiIeSn24Mgt0OaUwZ4UXGRDQk2ODdwlRCdlWla5k5ZTyYmLPI9cGEeXoJZkW+E5V2
         63Z49ePtTQCYJycRCHwcL4cJH8cVXr1C132carCQBuMJftQlYRU6XJuJc5vS5FeIcVpR
         iUqATEhRtFPeNXXsKq5H/GFzw56LyMayJz5NyTUEopOKxWxlvlZV6Rwj56jac4WQwixc
         jG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668261; x=1751273061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wEOD3FOK1XNyQ/YyTEnECjOhDUHmpEcYDOM9V4Bw4Y=;
        b=wmAlsQ7fzndP6qmKoLVvPTHK2rFhiRxmfoN1uCxVlj/gpNGRXfOrPikmS1UWVqVn+g
         3wsJSlK14rHMLkZRGYaAYP4v4Nw7x9rbYQAF1sVciECkmzPi0viMF1FJ4+LVg2BfpicP
         +7Nvm70t189uqYtv/gScYX2yPzXEMYgiKk5BvFP55kiiPvTw1EhQ2Uy5qkV9+IHzw88D
         mQuXO8TPOf4oGZY4fWHhZnE6Hg4OsbuoJ6WiwKRrBjyaxGRAvTJaIcU4rbAemeSU1BUz
         3xgkfZM6I3vCiFoopbSAGhRjEyQOGlyBf4/VPlidYXaEXeW3AEiUxdu662Iq1E1dKwrv
         2rBg==
X-Forwarded-Encrypted: i=1; AJvYcCWdrhXhN9sTJXaB1Qn2+6VFxlUyZqod6lm2t5Wx5YUJ0ZBc2T3sQEl78Ph/2L3s2e7K9RU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ0Lgv40jY6r6qIU/+koSszFJlNzeQ0Y75KkZ2V74waMM527L4
	piTqg8GZPixzRxOUyCRV+0xIATbRRkCEU8HG4JQ55U2TPwV8iN+qrSLB3nBAzofjbbi1UH52ykt
	VwhnhvhqPUOJi3uyIXKwIKL5yPaxiNUmGfhOf7TJAenr6H5c=
X-Gm-Gg: ASbGnctSt7YU9CbNpv/RyBNAnSxaGxMWx3OnNgLO/HgV3EygVJPbGKGe+WgLFCDH9sz
	dW37qAM9JPxOdgbbvYmGfTYeOEPl+cyPSk74dCxVqQ0NsutW4LkXD+mTm/P3/Zcplkg5/apJm/H
	Y9znV5wEWCJRKyn5+fTmp9L2lLAC3kulftOAQu/5CG1fnalTSosqTEwzIkcNgb+LF6jaMasQHj3
	eQrQl9ULEnLljPaa0PW++I/ZuD9YDx4DjhEua6jit2H3Jvwt2+VhIXvBhgtXgs22ReV05MJmxO+
	P45Qa6JJcY/swCIo2+YnJrw7qgut2dVtdqo9ACNge1ZzdLBy7PfxKFAGKjte3ClSj4z06cMXKmx
	th/roedDLuwT17RFX1N6Oag==
X-Google-Smtp-Source: AGHT+IEWhvT9kJ4u3LtaSyEodBMjwnY5987G/5eQkLBt7VVzz2bNjSEBbmFEI7Y+I6ci+DYcirb26g==
X-Received: by 2002:a05:6000:220e:b0:3a5:1306:3c30 with SMTP id ffacd0b85a97d-3a6d112f3a6mr3539913f8f.0.1750668260596;
        Mon, 23 Jun 2025 01:44:20 -0700 (PDT)
Received: from steffen-linux.. (p57b79c3d.dip0.t-ipconnect.de. [87.183.156.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1057esm8987316f8f.10.2025.06.23.01.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:44:19 -0700 (PDT)
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
Subject: [PATCH v2] nvmem: imx-ocotp: fix MAC address byte length
Date: Mon, 23 Jun 2025 10:43:45 +0200
Message-ID: <20250623084351.1734037-1-steffen@innosonix.de>
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
v2:
- Add Cc: stable@vger.kernel.org as requested by Greg KH's patch bot
 drivers/nvmem/imx-ocotp-ele.c | 2 ++
 drivers/nvmem/imx-ocotp.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e..3af7968f5a34 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -119,6 +119,8 @@ static int imx_ocotp_cell_pp(void *context, const char =
*id, int index,
=20
 	/* Deal with some post processing of nvmem cell data */
 	if (id && !strcmp(id, "mac-address"))
+		if (bytes > 6)
+			bytes =3D 6;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
=20
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda0329..63e9974d9618 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -228,6 +228,8 @@ static int imx_ocotp_cell_pp(void *context, const char =
*id, int index,
=20
 	/* Deal with some post processing of nvmem cell data */
 	if (id && !strcmp(id, "mac-address"))
+		if (bytes > 6)
+			bytes =3D 6;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
=20
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

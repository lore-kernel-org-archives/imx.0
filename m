Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6904E267732
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969561; cv=none; b=eP2wd4r8aNH+HZcVQ7HrNLUUzriFYNNkmsGwGohAfs7PA4Lpz2Ic4HMQqBVn+0HqwdULUX+5xi2t08Wf0W/O0jtAiEZHDJXN6WzEW7Is1DK8HbgTTksC4KcuIOGsZr2F9ZhjSay9X/poK8tAcuQ+FZZcz/aQ55cs3+miWTIhfdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969561; c=relaxed/simple;
	bh=lIdIuh0O/t3n7LtVB2cUksJC30jNSXA/jpebYB6unRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tpgQR8LNxA5+ns3HQAE5RCEykcohxdCMSrEby2aM51/J+Hir6DSl3fS4YlSjBHdkChJDs9+1xiW6tnUkCg2/ptMpAG7T9jiMOrv0/IBU3G3wTBVyQThxRfxUFBfe9PGUGdT6ib62u4G5LWDWLvpBQRfkAfRksNrSgN2OtRL2p9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de; spf=pass smtp.mailfrom=innosonix.de; dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b=HhZgq5mZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innosonix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b="HhZgq5mZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a524caf77eso582061f8f.3
        for <imx@lists.linux.dev>; Tue, 08 Jul 2025 03:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=innosonix.de; s=google; t=1751969557; x=1752574357; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmX1zBN33lB4gzLUkNPqUBTAn0Dd9jMDbw1KtlNeu0A=;
        b=HhZgq5mZU7HzKsWbf0mktwIKe9ZC60dbRFrI6Z5e0NzbF8AepyQ4njPpdXnr2+Obpz
         cza7k+6VrB+hsCFI3cysPaSR2Etajz9hbe8Mvk31ZAPg2SqlHBZf2szC1mU8abj6clet
         a7Z1A2sqUbfc08t9hNkTrDenja8Y+GhayTEolf34hEUBzrL2FWXpE1zEZKcJFbhtzl7+
         DpqQauRwxGu/xkLE0XfV0Ki9JnI9+rpWtf+apCqbFGXxvy3QKA2ZP0mDvWLfa91oQev2
         d+P8VXbQGovQKulDb22AsCTtD99NtURObuhsbTslV+eWSTG8RfJArUNQMdVK/F8gbIeU
         Sgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969557; x=1752574357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmX1zBN33lB4gzLUkNPqUBTAn0Dd9jMDbw1KtlNeu0A=;
        b=V949mlSgl7VxrhmSNmTEzA+GFuoMSSPVSdLNg2vEbpq3oHRAFY2XeCoQ9DzP33EwuM
         8oMk68DDGrTlCHQvrk2HNpSpZrW8uKM9a825EGBWrUbd8X1tpSaqeeZH5kRSezBpRi1a
         dm2i+qkYrbJvx1m/dyAYUVOLfeG3PnZCjbIgXhHbqUCIHFDhG6w3KCRmoGfiHKphq5Bh
         WwMOxv5uNS1D7nm8gk+VCQY8gg+HmJ1p2eZJko2s2R3sogPdA1YrftyfYzqVJCc2Hbtd
         w1dYkuZtFW4Nwz/pYNgYxRrSj8brMcMMsRzxXD2ANOXhh3fSYVTLGZ+/hHZ1PwaNX/1c
         Fw8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZIlyZWIKP6cyS/Qfy+tBZX0S0cEiPtwEZIWnd96pjInoYqKtDLfbQgT5OmYjAewoR9VI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0wWZnla/FBU1xacMn7DAT65xT7LEKuILNVfv2ebDCzfkSU+aJ
	gp7Vqs13eiFriOJQ/kFOtkgx73SGhVgINx88dF/3Fe1MtalI7pTHeDsNA92VjUI2i1zFT71CXZ2
	SO0JcRTxwHiP27KqrSBvE+IeAu6beU960bk9mzyNv8JY+uHc=
X-Gm-Gg: ASbGnctnU29BQWVKqQp0S/+WgM20IZzjozf9RVLVGIWrKtpSm/CBWjqXNaxsCr3RRY/
	6eKkSIkQ/6MuNYPBfeeISlBnrVHWmXKJdwBahCQBQYHUUsf/8GK1cwjPCQtm35w4fen2dSs2p9b
	SYuK2Y0TB5XRMfFLg7t0C2oVzW3HR49X5yblDvxtJDLtJHXukjQQgBAjXIWSpEiiCCF+ciQhieV
	zlYaNAD4AYQR4MuiN58WwcbwsSOMYLZehWkkPYkkFtwt+6nIi9zFfWynQdun1Vx4dikwd8/1d6J
	ZN98QgbpCpXwfYfz3b7lmBI+HCyNbp+Qzey4NPp2BLOuB9ef0tOXusyFySijbcvJOSDgD4fN67Z
	n/0v580t+VKufjP28wjh5pw==
X-Google-Smtp-Source: AGHT+IED26y+n9j+5pBqdocpELjkLG6eOq39ZrvJ+qRhatVN4TQ5wRzgtBzDH16tDXGPwRZX5wMJRA==
X-Received: by 2002:a05:6000:310a:b0:3a6:d30e:6fd3 with SMTP id ffacd0b85a97d-3b4965ffca6mr4118923f8f.10.1751969556510;
        Tue, 08 Jul 2025 03:12:36 -0700 (PDT)
Received: from steffen-linux.. (p57b79c3d.dip0.t-ipconnect.de. [87.183.156.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225a2e8sm12558121f8f.75.2025.07.08.03.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:12:35 -0700 (PDT)
From: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>
To: 
Cc: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>,
	stable@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
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
Subject: [PATCH v4] nvmem: imx-ocotp: fix MAC address byte length
Date: Tue,  8 Jul 2025 12:12:00 +0200
Message-ID: <20250708101206.70793-1-steffen@innosonix.de>
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
of 4 bytes. This led to a required byte swap of the full buffer length,
which caused truncation of the mac-address when read.

Previously, the mac-address was incorrectly truncated from=20
70:B3:D5:14:E9:0E to 00:00:70:B3:D5:14.

Fix the issue by swapping only the first 6 bytes to correctly pass the
mac-address to the upper layers.

Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
Cc: stable@vger.kernel.org
Signed-off-by: Steffen B=C3=A4tz <steffen@innosonix.de>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
v4:
- Adopted the commit message wording recommended by=20
Frank.li@nxp.com to improve clarity.
- Simplified byte count determination by using min() instead of an=20
explicit conditional statement.
- Kept the Tested-by tag from the previous patch as the change=20
remains trivial but tested.
v3:
- replace magic number 6 with ETH_ALEN
- Fix misleading indentation and properly group 'mac-address' statements
v2:
- Add Cc: stable@vger.kernel.org as requested by Greg KH's patch bot
 drivers/nvmem/imx-ocotp-ele.c | 5 ++++-
 drivers/nvmem/imx-ocotp.c     | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e..7807ec0e2d18 100644
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
@@ -118,9 +119,11 @@ static int imx_ocotp_cell_pp(void *context, const char=
 *id, int index,
 	int i;
=20
 	/* Deal with some post processing of nvmem cell data */
-	if (id && !strcmp(id, "mac-address"))
+	if (id && !strcmp(id, "mac-address")) {
+		bytes =3D min(bytes, ETH_ALEN);
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
+	}
=20
 	return 0;
 }
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda0329..7bf7656d4f96 100644
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
@@ -227,9 +228,11 @@ static int imx_ocotp_cell_pp(void *context, const char=
 *id, int index,
 	int i;
=20
 	/* Deal with some post processing of nvmem cell data */
-	if (id && !strcmp(id, "mac-address"))
+	if (id && !strcmp(id, "mac-address")) {
+		bytes =3D min(bytes, ETH_ALEN);
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

Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DA027A460
	for <imx@lists.linux.dev>; Wed,  9 Jul 2025 06:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043528; cv=none; b=g8uA0s5vA/P2GkfZfj5aOtjgdYbPuvKZPZ2u8VLXottTXKTJ3eyuazkB7DoE87hgqozcqv9/x/bntqRr3MpOngj6WnvDqd/5ZnlSqP26v1oWjJEfYkX7Kas9+N8GEizNOwnuNoUP2qedjSzlU1R1BRJDPw7ev0riYKOSBPejyWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043528; c=relaxed/simple;
	bh=ZOBAf6YE3mIRz7Xx6Z3dIEF7AWhG7MSYmvxlD7q8rt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i5pTO8cl36UQv2oNnR0YhrQoBDZyhNYrEdiwmce8wSwlVfLV58NZdhvX6G4n+36wGLz9Le9FeF80jHDoC5XnqvmVidQuEPgE/DlwGl1UDfYwlq2KdFZzpi6TRDb3r7KqgpSjYQdaxrBXEXjP5bnV41eQ+DYWJMuJVHNlayyXRDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan-david-voelkel@web.de header.b=uJLtVsfg; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan-david-voelkel@web.de header.b="uJLtVsfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752043507; x=1752648307;
	i=jan-david-voelkel@web.de;
	bh=zBUzUdqctRS3Kbs4jrLWahG8PDR6KJCN1AYI/hbRo98=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uJLtVsfgqP/0Rry2GlsWZrHzpY8SGaXFT6+DsZGBThmeuxFP2CDzAkZ0pWNLl37X
	 yQqpA1rnUQYkv5ma26BrJUq8Lb13kGpwLzpsanGN+UN3NMNP6QcBRnGNKt2QdR0Wd
	 Z50PvKpQ7MDSQwG8v55oXg0+Q+m8IqYvlwZglzYAesju6BQMSM+t1nRHtboJ/1848
	 8EpcoPbQ7HxKvQRs4YVxNMnWI92IZDxtWTCHk8sdx4V/DFAJW89LaEkF0FrFWED2U
	 pas140B61Isd54lrYFMSDkpyBT2AsdMpKHVa4a2yOP0otP40QEBfpV6pRmyuMhsnR
	 Ulj2N7ZEAivpoYGrcg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from MXODN22542.mvad.local ([95.112.233.210]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1N8Vsx-1un7tU42jZ-00xBwN; Wed, 09 Jul 2025 08:39:18 +0200
From: Jan-David Voelkel <jan-david-voelkel@web.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Janitawa <jan-david-voelkel@web.de>
Subject: [PATCH] i2c-imx: fix broken GPIO bus recovery due to missing recover_bus assignment
Date: Wed,  9 Jul 2025 08:39:04 +0200
Message-ID: <20250709063904.22055-1-jan-david-voelkel@web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XMtQhkgR34XjXAIEt/rXiyq2mhaNPCH75KNk+Ughr00A9KFjees
 Ce50fH9fo1DwIP1M6CCfq0B3+iQJUIzjhVP2il73nTIp7WMp2G7kRJQVox4xQApm6jFw4jP
 mH9X7GVe/+t3AbNwkugL4h5JXugu3E1xGSY8kO2c6laqOlDw3P3b6P7PqEtjXwiUjglHNwf
 k5GtLVTFuNBzA5cfiWiWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RyxrFlYYnGo=;f46kV/X6pWBqIvjgQRPoA4L4Rav
 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
 y7nQIQwnDWNv8yRGXYxJYWtHCoLXlcTY=

From: Janitawa <jan-david-voelkel@web.de>

The transition to generic GPIO recovery support removed the
driver-specific bus recovery logic but failed to assign the
required recover_bus callback. This prevented the core from enabling
recovery, effectively disabling the feature.

This commit restores the assignment to ensure proper recovery
initialization.

Signed-off-by: Janitawa <jan-david-voelkel@web.de>
=2D--
 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index c5224d43eea4..421f6da61f00 100644
=2D-- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1375,6 +1375,8 @@ static int i2c_imx_init_recovery_info(struct imx_i2c=
_struct *i2c_imx,
 	if (IS_ERR(bri->pinctrl))
 		return PTR_ERR(bri->pinctrl);
=20
+	bri->recover_bus =3D i2c_generic_scl_recovery;
+
 	i2c_imx->adapter.bus_recovery_info =3D bri;
=20
 	return 0;
=2D-=20
2.43.0


Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C09135AC20
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090211; cv=none; b=Jk4v6IsGWjGUhxOEfAxEfPgcZdePYXSC4CbSI/plaZlvq8obIa5lOZEbSPmYdzmlU7rRrVNJUv5i34yExKiqJ7GkKIZVC7xdO2GkQsn+etmqDYIlvMavNC+lRjrCeyiWGlX463E107d4i+JOLnCd3R1R0fWZZ7GLZbkLRIoRRCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090211; c=relaxed/simple;
	bh=H0fA7UXVvTZNMGM0szq2vnWgiH9jWNQNaiQNMYqM7dY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jt63Hyy7h3VBzD3Gc5GA32krNawFnA1xGBVe1VcHV6SEKiloa5XYMoqed0hmrvYy9vKPUEROAhp/QwaablEzdUWnsdeDJ560gW5tYFUm5eF1IcKSsQN/8g58E9mXe/ukXrUsIx+tKKiv0YweXY0h9N3qBkIojAKpFifzbVyb79U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSpUeYNe; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSpUeYNe"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47488efcf30so436517f8f.3
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 07:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783090208; x=1783695008; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yv5c3aAX22MotkI1huu0Usc8fAYg0ktXennCOkB+608=;
        b=aSpUeYNes7gkqVeMujkUNkVtAFIno0P3aBQNUU34V7rRofmP9pXRhOcrR1dJpbmQjl
         TNi4lZ01xv1ez3xzxtDxzAh5hOsqtLqs0Pc4QLgpmFh7SALdJQvYWx3KdMaK+ME/dBnH
         0PG787+lbrqy+KjoGPObqV/wsdp8LoY19SF9UQAh5OPpG/LU3HTZUxHiEHH5dV/Uxx6l
         1Kcu94nVVsFUzInpy0OM7IeGt6ktxrPluVy2HwPkmyOXrothuRym0zaaPZYqMEY6P6B6
         7H+9MXY+nY28Or2qw6KcrjzFwWYhwQmPdtMPByGuv6vsBB8dYgFAw7zXZY4Unyh1yW/M
         145A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783090208; x=1783695008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv5c3aAX22MotkI1huu0Usc8fAYg0ktXennCOkB+608=;
        b=necbdTN2lTvH/avZsvRjtiYnMz9+C0+3Z1aDXPoTTYndVUed57u63i/yXnwX5DEOKZ
         o44NIM+SKfIDyzv41R8+Q2xGdgYhOo5doMrrwsAi5Si8iiJgh6t8F1GbPsEcbeeWEAYk
         eUJiZHwSHDMEUt39BKOGs2mR4v8YiqV5smOwMyUSHpXbHpvw3PVjiSXCnZbUPjNhDZ+E
         uCXag8BDAGo2S4j2H6SKUk1Y0IiU5zLBN+bz0NGkrvLIYdRyFRAjeZZzBQ5A99sMzBXo
         fvvqAokjJiKhj2LwQ22MoiIatRwxJPgl5XYU08/zZXLCOnJrFAaqaTwS8+xodFE7CDvN
         HPsA==
X-Forwarded-Encrypted: i=1; AHgh+Rpn7zCjzH6Xc3Qnj7NIU7fj386XCtrrIhCb5J3cH9t0k9HcfAKG+pszNxQBHkE9oHm44WM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMV6kXqgVXi6keQHhXFml94NV/swdtfomrwGGL/0m8MSxQmCRn
	NOO08Sh0jISO0SZ/8eU4TBAS1viLF5ZeKVe8Cpn3hwQKG/iOO/yP1vBa
X-Gm-Gg: AfdE7clNyipEV06g+DKrJPE74ZLmcjxmjbC+YN2Devop+vCUUaW7/fDc1OVvYhLK7qD
	tE4GOgXJtoF4LahJj6hY/3esLh0ONH07Ds1bDVT6FeZzAteEpUNaTOrXoERyi+xwYly2nUbonjC
	YYlGAVBANejhbq4KbOyibDil+NbuzwLxjm8UYbVoLk9+Ml5vAf86DyRqvJYtUFCdSGXe7kFXtjs
	TyEVwA1Uiw2QFpSNfkwZ5FP77rkDy2GnW46x4Fwsq5mBqoeQuozcpLFfAG7VmcEcWtmPAviy3+k
	Zl50IZYBGId1bfKZrJtIrLoo3cnNSsWA6856WEkYnwgy7KPQiOgEAVgDskhnTovDuAMJ4nIfSVM
	JUDvHK5spswZXXC3io2o6r5zXmRKr4AbLN7Ht/hUrQUNz5V5UT0GIqJa0G7U/a0Rv9KRsjk4c4m
	FPPmsg1+tpF4HHKCEHw4UabaRen1QIXFmjaiZo+guYe5KZTa3XliKPlFZu1rs/kS19XKOpHufmP
	Q9e7odew/XadqPLMIeqHpDcXY8=
X-Received: by 2002:a5d:5f42:0:b0:46b:cab9:f697 with SMTP id ffacd0b85a97d-47758bca818mr13901139f8f.24.1783090208322;
        Fri, 03 Jul 2026 07:50:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4ad4sm20087616f8f.11.2026.07.03.07.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:50:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx95-var-dart: enable NETC block control
Date: Fri,  3 Jul 2026 16:49:22 +0200
Message-ID: <20260703144922.231608-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the NETC block control node on the DART-MX95 SoM.

This is required for the NETC Ethernet ports to be enabled and used.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index d43270a1d907..174ded589d6f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -178,6 +178,10 @@ &mu7 {
 	status = "okay";
 };
 
+&netc_blk_ctrl {
+	status = "okay";
+};
+
 &netc_emdio {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_emdio>, <&pinctrl_phy0res>;
-- 
2.47.3


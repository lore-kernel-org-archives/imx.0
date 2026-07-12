Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5003A8384
	for <imx@lists.linux.dev>; Sun, 12 Jul 2026 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857156; cv=none; b=aJ3iOE1OXd9A+5hInkaq1vtoY62uLeWDjrEzkwsA8u9s/x/VTrwUUafVncYtwQhe5xpzZ3syE4tyZyoRpcQZYHUk6vZRS3U1gHgVpC2181KoW1uEwFt9y3SFLIZ2Jkl3PnyUyDKCKVEmZCBZ+HsJSJpY/B28erzjF+3ZKOCKQxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857156; c=relaxed/simple;
	bh=Px5tTQrrJPVZPpjYyuk0e+sO++K6EkDLnfAUJ2HiA8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODJiM4rgdg4AfneDDEKSyRcca96AqAjQWx49UIWGPjag4JtTkLGP17Wi7ON9bjGdQ+o3lL03VYksl74XwnEUYPfz871LwsVdqbFnYIlAt4rzYgkZTEFoKpZyoE/K78BEycel/1QIy1nC/RpCs7i/PoOqk41rXbjcXJG8kKlWafY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbZvuQT/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbZvuQT/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceaf8a1265so7699885ad.2
        for <imx@lists.linux.dev>; Sun, 12 Jul 2026 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857154; x=1784461954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPtgQI3XYwQPKh88ieAfFq0tWd9+g3Yu9Pr17lmgPPI=;
        b=gbZvuQT/x9dJ2ZFnJatAbkP0MhihN+WGS9K/cGGSyStrKpHkRKUltQ15fu4M61zhg2
         iDxQu/NXjHyMnJNFzGSSXNjY3MnFFjxyOKkkY1PKGcg9GfEPhisugzNz8h3KA8mx/PLE
         yIOpjtsoJtPY2roON5i9IVyqQ/a5qzdg5uitJXR+ayboiuboODDnM+73/HPo49MZoa9N
         6eGnkfq/5iukmajv5fpUwhU0b6ZkPNfeODqSSVErU9488Agcr4c0OoIezTvYZ/CcBFY6
         VF7In7oKByY+CqwSis6RRu+wsy/CFwAkiH1kjRsMiwwVSUF0ojpEaFx22HZWoEjYi+st
         U4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857154; x=1784461954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPtgQI3XYwQPKh88ieAfFq0tWd9+g3Yu9Pr17lmgPPI=;
        b=dwjMd5KqP50pQ7Urnh9niHDqmv6+ZK6S3AZj0L6EvHjSsbZQ8LYNnLG/AeY1QPH8Xp
         6S4EhMFipASqo6VzYfF7I0kZaHlxCT9+XpaaR0kGl4Vk0mKqEPtX/3Gxvbu53iB6Pkpu
         +LEGc3/RHHCjJRkF297bq0JDpR2JauteNnk9ex5vKhzN5fR6AY0zRffxnrO9KsPmuu5+
         4iL7Y6RHQ2BHA+xc/P9NHBRAt8I0+LkC5GE8FiUVnt5o9Y9b5Tc6pO9TDwy/h9/QcLdV
         sEEEn5hveXpTrX633SplQZm9qrmdk1ro+GYzgHFQGEZ1tDToRffbi1nmrkmYdVUJLulw
         UnuQ==
X-Forwarded-Encrypted: i=1; AHgh+RogJ762CaZgZdL8soIW9VovQvONhg6o9idBuxenb6h9AXpxT3sPIx6KQ+fFhSj7fiqd5XU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNd00bEb2nU+vJWWmOyMTi2ZIEvdvnBcnvAmBbNYvn3FClZ0RU
	t6qwMOyr/lDkGKwMn+xfeCe16GpmBXtg/HaAOYm8BM99ah5WKxzb47gu
X-Gm-Gg: AfdE7cm4/kEHYxGe5G2e/iJH/F/+4A3fMHb9XRrvKo+jxYDb/XvEc1rj0zhvsV9XmxR
	cCYb6h3KTUOhCXBjj9U+Bk0tn5LYo5CuzR+YRLdmbKWrFQJDcrCJbyH9VdGG5U5VYUwlFDe6aHD
	cMJsMzwccPLuuSN8LEiG9eJScCpnExH8KN1FJwWNTSA2xJyl7nRe6oF7pehK2q6QV+FWtNWmASV
	5/+gnXgAHQup4A9/wKaY2b3lc3DRbnJtpR6jPNdubpO8dOvkm/cLFclKBXl44deJuT05unG/sVG
	ZiGxYQXk9SyxjriAYzkvlPsJoaL5WjL4ZB/l8MDx5xXirgtSQf1tQHkQaLXnN68Y1TseFdReW7P
	vIfaXPugJVCZWlUBAUXXfKLJkD5t+TxrnMgRVsgYkv4E4kh3N02ZrxITGTj+RBi16rMikX642ez
	GDb7ENQkYtkuVhEY53VeoF7JJER0NcSybBSxSBJb017zuTtoyJRA==
X-Received: by 2002:a17:902:dac6:b0:2ca:73aa:b48f with SMTP id d9443c01a7336-2ce9f154527mr49451065ad.35.1783857154348;
        Sun, 12 Jul 2026 04:52:34 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm84538295ad.31.2026.07.12.04.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:52:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v5 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Sun, 12 Jul 2026 19:50:12 +0800
Message-ID: <20260712115012.91600-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712115012.91600-1-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / mipi_clk_div1 / mipi_clk_div2 =
25Mhz / 3 * 90 / 2 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.54.0


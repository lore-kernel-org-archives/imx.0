Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B89C8CE
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784915842; cv=none; b=gYqJmd//t8Ln7aDAiTE96Askafd1vhsKXbfIH6XtcCFpl/raSvZCnPyYnwj2schFVAI1kzZAzKIODK2Y2QpKukHvnypKPXB3nJE/8xoTFmdh0pc7Flg3vcIyz6JeveiizOY+0dZtJsyBPS2NUYjsMQClrxkjrwtQdBL/eqCg4LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784915842; c=relaxed/simple;
	bh=uDT8c16DbSxqZZxjBdoIWbaQXcOOTJ3hZmkYntw8ZgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ft5ubHaUMjm8lqtDoQTzQooEGYcaotofXJnZRjlpx4pZkL+EJwkz9cLEkzSkFALOfc4f9SgODXSq0TRYifnuaz8qkNJFePGOlZZU6uhBdT+29/AA9rjsbesfxtf52gM9o9MsDUEgMLo8hl4hLn7tnVdzCrK8DQ3/rRfhePmVX20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlLdOr+S; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlLdOr+S"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-963a722ed59so221753241.1
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784915840; x=1785520640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+Fn7OJixxGTLDuh6Ch6+xz5tIbqmhVuP/LIxpPEqJQ=;
        b=GlLdOr+S6VrVDKfXOnC1j5H9Lcmp6BxB0hzUUyRRqt9Rqv0kDn9Ivl+YO9sINnc4JM
         foybpHJoBGac2NCYJ42I8m60j3OFkjkV3YdAPegXQrHBYqErCNMe2rzoEa5GTdJGopL8
         cb+ILj9JVLzSrdeOV4xYzd0PvwLD8wVBy2iOjDuyU1UdICIYhklxdzdUCAUY6Dtoj0BT
         OU0nIUt474VDScsFOuN0rlcJdT5xdLpRqgXvOkUh74Cu5NrCYxDpCKOA4wDqyIvP47RO
         xMGgKo9n+r6CglogdSbIsKTOy5a4e7x3jZ0+tsA2/F6s6D9cyG1lpgCjz/93hzJGwCaY
         RO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784915840; x=1785520640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+Fn7OJixxGTLDuh6Ch6+xz5tIbqmhVuP/LIxpPEqJQ=;
        b=aTF1A3Xp1l5pnyTJra+rFU4+xtaUtexJD+mGeXWBqUiG/oL3nDGSuuxhwdJllR4zg1
         fwc2TktFSzZ0aAsOE+reQ4OIUzxNdBRplVHvr5amhytQlIfSzCRrsOtyHZ3cEBuFv269
         sH0D5KQEEOGzaKGQCOx5RvsnmtJP9uUpr6PwDZvLQB+/j8/eVB2YLHP7M2SqGZPLTFQS
         Be0xwENoT62xZgxGJk/oGKev5N/T6KxEgfwORnYNvb+LInBG0zsEj3y/mkGnILO6XiYM
         Gy+fjyxyu4ffRg05JG1ODWLmYagSJnmr1fqrl+mxlU3ZJeSlCbevDQOySnSd311/DmtU
         FJrA==
X-Gm-Message-State: AOJu0Yw1/eziC0QnR+qQYp4GWWLsfxBd+5WiUCdZHF7MY3GkK3wHP4mm
	Ib7+RBCwOMc4TZfktCz4Hoh9/KNaGPWYU1ScfJwlvNNjNCOHnzNARn/P
X-Gm-Gg: AR+sD118I1ohsHiHygL0vYkcrXOpCAaaLrBEJsYCQVZXkSuAdi6hLWh2a7z7CoguH2o
	75pb4vCx/an6GDvJbMTHbIT4po2AEIT+iNFpWTEU5g1Z61WuZM1xYafgtXl/5PjsB8dqruPOgIb
	cvumQ6Vydp90/th3XuvFFSuuYClQc8ZyoZOGFtonFY70EabIoFSD3d7YA+F2xmfsJMkHQOffzO2
	dMNtuEYXfj4ADHCeQZHrZcoxRhizjsZmXBsT8kHOGBToEZwjpA+9udviY7AD82pDO17n8jgbF2J
	eD9W1IIxVZRPD+lkh+4uwnmJmxP/3dcjqsGf8p2FJZdDP72MQ+B8c347TuHJzkmKDIrWZQCJLWg
	QL1ALEsgqwbUVHJXeoVyS36Rb1FJkZKcp+TzWlHt1YJ4rW7oFAuTXwpQm1XmHdLzuFWCk291jo4
	qIM84IbCpi1g==
X-Received: by 2002:a05:6102:6a85:b0:738:20f:10de with SMTP id ada2fe7eead31-74d5fdcd898mr3880056137.17.1784915839620;
        Fri, 24 Jul 2026 10:57:19 -0700 (PDT)
Received: from leonardoc-nb ([2804:1b3:a700:4ed8:4d0f:883e:31be:d914])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97774c901f5sm368376241.6.2026.07.24.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:57:19 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	leonardo.costa@toradex.com
Subject: [PATCH 0/1] Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Fri, 24 Jul 2026 14:56:33 -0300
Message-ID: <20260724175657.15398-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

This patch adds the device tree overlay for the Toradex Capacitive Touch Display
10.1" LVDS V2 through the DSI to LVDS bridge on the Verdin iMX8M Mini.

This change depends on two other patch series, and should be applied after them:

- https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#t
    
    Adds the Toradex Capacitive Touch Display 10.1" LVDS V2 overlays for the
    Verdin AM62. This series is required because it adds the panel bindings for
    the display. It is currently in linux-next.

- https://lore.kernel.org/all/20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com/T/#t

    Adds the other device tree overlays for the Verdin iMX8M Mini.

Leonardo Costa (1):
  arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter
    with the 10.1" V2 display

 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 133 ++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso


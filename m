Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CA32EF9CE
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 15:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680899; cv=none; b=YsHT+5XJJX+Kl8EVq0V6Za6P0gtDEHAZXelQB3tn+3avjZX6XMYijZGu1olidP1u6oJmf2Xo8JjjeA/6memQAGvCQy2PkVSWaXSGuYNyABjoTFofbPgdRZkNGmxF2K9fshlxEDNq8bezRbEtiMvJo2zGvKt881kyxpg1u/d/OCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680899; c=relaxed/simple;
	bh=KPPLhBl4MQOOqUtzFDuqHAu4KG2FSZigpCahI9GPht0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTaVXV+5KwfuJhB2Pn3Aknx/g0lX4G7k9folVkliF0cyjwGq8Qr7o8/n8U0U43J/VCqWPb8LA2TiAnLPdG31ZrxRrUMxZze7E5sM3EQQynI97ZrSR5slPVtF1i+vFDGwHZfuYkvjRKNhorqRES5YhKaZZlvjoGsXK1GXLMBNxX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zz0W0inI; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zz0W0inI"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so9269607a12.0
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 08:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752680895; x=1753285695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrltEk6+3hF6VsUp3/raIH9c76LdjZyg5wwwr6SNNp4=;
        b=Zz0W0inIDNtOg4cCw8MgxpjraO4mE/d7VtM90+wvZMjdTIrycLu1xI83LImkLpAY6r
         Sk/Pdab4sreOe6TQ94OhaSe13fBdDBsK2pwCbC7DCJq6k6ltk3i8cetNzsdxKTF9wI7f
         7dr/VFOl0Vqm6O5lHdhVHP+LjsQn4PTMl+5Mg8WG5T4wcfampQgC14yE0xvXfnM4r31f
         wMVFEPXb63x553MOJ8n984DlKfeFlC99loFSGLeHQJZCkwHqcX+VoNVPKfYHjHSnRUAT
         x+Y1zUcIf1ZRZibzLVQPWx75K7ZXwiIMF/lMudD6W0mPQYkB4x8g7NKfKaT0ELZQ8u1n
         Lvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680895; x=1753285695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrltEk6+3hF6VsUp3/raIH9c76LdjZyg5wwwr6SNNp4=;
        b=Q0CKNjEAGkhAUT+0KV0D382FxRwac/2sj355IbL6kttdSxPWJU6/B1stUeoZRt8Vmo
         /b2SlMfDOvYelVj5Ic+Zwn5zgGEfGtaAcXELm4Gh8tPzdC2Y+9wMcXx3AS3T7/Rd2jjP
         Z9M9f6jmCJpwIdm+mdRjkhXch5viQqQBQKVKYfBiirRbqqQ2LQ0/enHtU4g7OGBN3fI7
         cY7fAiiJbL2QLuLYTkAuzXeKadIf10NQYxMcnDFOgnH8dSVGY2nno0Rinqd4frmB/pBB
         rBi+/X641VNPO9xZyazCMiABlUaK7eFIEK3ET45PYf8W13NxusJDVZHZ9MsoyV0SsQuu
         Fx3w==
X-Forwarded-Encrypted: i=1; AJvYcCU+g9OqjDnJIWSW0AKoCWpiKhOPoJnupjUqHazSBMUDn4+URfeLMbtdCEPZUnUjH/kr8Ko=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXkVMTR2QbKmmDXN8vrpVhj41oihpWi9wwXxGDvt3XFP2Z59tw
	Fcx1gqEkoYTMVVfYY1iKTj3/LaWMnNM9RcrhHXE8mntNQgtppJNrd1vY
X-Gm-Gg: ASbGncuYkwhkXOaHmnRiomH5aOWBy/yFmYHt5ee+9Um+KqwYTX2rBTgV1Fo3yhLfNbD
	fi+dnnctrWf6I5i9CTPUFfM3/RXKHrX/ohyUbOtBvJmpGswSorNAIwgHOlwAHOpN6rxAM76DADf
	L9Bxl6tHqhZtZSYIyExLUgrPXLdJPLZ/zSeOrE4G4y26CRKeURbhYuqyyeTjZbxdz1RGYqCTTz1
	1aJ+/MSeuYrvrXHnJLlyixqsQjV271jNfuZ1OLrx0/r/2go0xTlhkzx4xPVqxQNRmXKsxcfcwK0
	9jCPjUB11KDjIHNsQ5WBPjF3Tnf3xo4vJTa5bpVnn/ikcJcaw/jY/b9/jVbSJsgRXY07fuX+06e
	5ImkFbEhuRdwXLyEgK+82/Xrjv4AzdWy+NK9L
X-Google-Smtp-Source: AGHT+IE8vN8iDrpEck2ZL8pFvrdx9RHifPaHz77OU0YQTwxeYuEHRH4jGkcTFVSWayZ6ccRSNRHHTA==
X-Received: by 2002:a17:907:cb81:b0:ae9:c494:1ade with SMTP id a640c23a62f3a-ae9ce199db0mr319557666b.53.1752680895141;
        Wed, 16 Jul 2025 08:48:15 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8293fe7sm1196705266b.123.2025.07.16.08.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:48:14 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/3] MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
Date: Wed, 16 Jul 2025 17:48:04 +0200
Message-ID: <20250716154808.335138-2-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716154808.335138-1-goran.radni@gmail.com>
References: <20250716154808.335138-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The i.MX8MP-based Ultra-MACH SBC is supported by Ultratronik, and its
device tree has been added under arch/arm64/boot/dts/freescale/.

To ensure proper maintainer coverage and notification of relevant
changes, add the imx8mp-ultra-mach-sbc.dts file to the existing
ULTRATRONIK BOARD SUPPORT section.

This follows the established pattern already used for the STM32MP157C-
based Ultra-FLY SBC.

Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 60bba48f5479..0ab09226e0aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25450,6 +25450,7 @@ M:	Goran Rađenović <goran.radni@gmail.com>
 M:	Börge Strümpfel <boerge.struempfel@gmail.com>
 S:	Maintained
 F:	arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
+F:	arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
 
 UNICODE SUBSYSTEM
 M:	Gabriel Krisman Bertazi <krisman@kernel.org>
-- 
2.43.0


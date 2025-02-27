Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A846C1BD000
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 17:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675975; cv=none; b=ZO3B35yRyBZuZlx0TOe3GODK86ZfWOSxD5C2bwPXnvfQDxqN4PD6UbGviJWrDq6eAPeYYoQTdsFB6UKP2JHwKM3EpN63Qx+PPwcp58AV8OrUT/8SJzPp00olN05FUGamiaRVJDBsLnKmSgSY0i3JJNmuuSy8QXupGcb9BjNNF5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675975; c=relaxed/simple;
	bh=TkEK4S2m3kpoLQQipeT7J847hl/h6o+fCAe8yfTLOfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NBo1A/R149mysivXZZNIYhtho2YSCEfsh7Jx7tlLUO/LqJwbcux7uNqgsKaI13CRS0E+OAJwy+2SwHAn1lRRHcYHU/bnHSxaYmPQ9rrXEEbTcOSGtr9ZUHElhSqUAlbPWQpyJ4PAn+lHZ24O0dT7j/2Ie5XJOAVL/ybfnB4sZBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i51zrKXG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i51zrKXG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f406e9f80so978264f8f.2
        for <imx@lists.linux.dev>; Thu, 27 Feb 2025 09:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740675972; x=1741280772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO53KeG1WPUYrsia7l0Tb9ExCzbXGMl2yOXGdu7Dqdk=;
        b=i51zrKXG7j8iLZArniGxAPCJREKxcD30mjMnjGUrGM1jRi23GGcGWHberec4a3wJ/d
         wxL74JJNtlHXOGkfNntR8AP9Ngmrl5Ebo0QIsm9oAma2ZL2OwxoC42yOyyoqG6sXMmXB
         Sn+VFmrM/0+3MGBHzEH0xY3CJMSAy+B5adcssphxc7Xn8yBrSI//g3sI8C3ZW8P18SVC
         JKynVbvGgMTFsn1ZT9MFyiCAGc4e7pi48+o9MUS8m5enf6d6roz9PoPRCcgaERs9ae0L
         3gvPVDoCkuKJn3ro9WBdtJMTzAGdnRLXEgtB8/fpBNCTSgHuSr6Jtn8o6SJkM11T/n/r
         L4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740675972; x=1741280772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gO53KeG1WPUYrsia7l0Tb9ExCzbXGMl2yOXGdu7Dqdk=;
        b=RVSGqJJreQVzVW3zq+B1RvIgveizlkS1d9Ea5BDsxMumsb0weTAPM+hAxbuZ9q57iv
         Mrz4cMavcHDRAaaHEKbYeN1gCHZ6PZv/8qBNFn2AnKvz7XwRfdDhiyx2bELmOWnaW9+D
         MM3w9pNIX86RpRIePmHc4BZWxAQr5TM2gHNbraNsp74sUSjiPiy+wb37je7ymuMs+jGl
         PrZfpF2wVJSzVB/7smYJWkw1jxwq1dFBAolUW2WEvugmXols/P7q4BzepEcJ+++Cgmcu
         K96U4dXLlNkII0XdxHOkjdWrsywMyIg4ROTXOFxTReafQ36tKKtDHWOdvfVPYxmzu3uH
         pq6A==
X-Forwarded-Encrypted: i=1; AJvYcCWoOtG14ZJ11JtmMHenDmTZVRAUsnwgBQpZleQkhN0/0KtYcEiErsc49ml5ZGAO6mqXqak=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs7x6oWwqvMeVZM8lDw7mk091wHDYjaDrAsozPspu5T3CHJwv/
	w0tH4PtMOlldID+9I/mNtonKVDtI8RSly7CDiwezP2PBcmzXoXgC
X-Gm-Gg: ASbGncvkyq6BToht9cW1G+vztINrR8nQHCAglviM7t73ehOf4d3Rm4OlEiUpNvNV8LK
	7I9hv0fm99n9unMeP90CwLP+7PrxAvr2KStPEPFbO+uVxSZs/Wid1vItc1wHr4+0B0jIyRQNs15
	0EQHkWT634u0XmTgs8KNxTDWOgGQlbjUY/B5O2KYNJ6smkavSFZO+57StlZ0S4+Q3fbYyj1J0n0
	q28MyLHcJ5gI4oYVotWb4zOvdnDfdPpVS/HDigAxoGfHWXHoDrnqmP/TGAifEdOE9kSAOIksFdM
	TL7gityOiUwEoWLbmT3ymrzz6+4CWwXD/BCvOO1AZqo/YToo4T8nKQbCAPGj6DgYyAAypJhUF3/
	uwxRr
X-Google-Smtp-Source: AGHT+IERDIu0iZ+hBFIiIkbbbpaVVGZ6G37IX9OWfYQr1SknQHLsuZbyaI8TcO5g3Sxx15wY0R6sRw==
X-Received: by 2002:a5d:47c4:0:b0:390:e311:a8c7 with SMTP id ffacd0b85a97d-390e311acb3mr3600237f8f.5.1740675971592;
        Thu, 27 Feb 2025 09:06:11 -0800 (PST)
Received: from ernest.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485dbe7sm2613138f8f.93.2025.02.27.09.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:06:11 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
X-Google-Original-From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
Date: Thu, 27 Feb 2025 18:04:52 +0100
Message-ID: <20250227170556.589668-2-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
References: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the STMPE811 touchscreen in the SOM dtsi files. The STMPE811 is
part of the SOM. It's self contained within it, therefore, disabling it
is not the correct default behavior.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi  | 1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index dffab5aa8b9c..23913f18586c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -664,7 +664,6 @@ stmpe_ts: stmpe_touchscreen {
 			st,settling = <3>;
 			/* 5 ms touch detect interrupt delay */
 			st,touch-det-delay = <5>;
-			status = "disabled";
 		};
 
 		stmpe_adc: stmpe_adc {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index 9f33419c260b..9a9f9764dc65 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -588,7 +588,6 @@ stmpe_ts: stmpe_touchscreen {
 			st,settling = <3>;
 			/* 5 ms touch detect interrupt delay */
 			st,touch-det-delay = <5>;
-			status = "disabled";
 		};
 
 		stmpe_adc: stmpe_adc {
-- 
2.43.0


Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B26A25335D
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 19:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165599; cv=none; b=SQGM1fbC82Ee8Mw1vIgRoZ5VX58WOJLqHMi5BAKSknieiFPTqsC5COg9mQOq5wk9nBr7elzh0oj4YsYrONzP+xduDxYpo9MdnQRt9V8EWYM9XplVLUBhgXIGUlxbsqW12CI8egfoUygJKpamOedHZxlkspYmcjagytImTXNWDb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165599; c=relaxed/simple;
	bh=wMVxyLYxdUH+NfOdC4YAZCVPaLUE6SupMeq+EC0HtRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BmtzUWbb1Vi2NyY8EeTPfpkaPQLAUVlw3DHe5TCj+4TLPLT/UjUDAmbSoIgaat1iymLbjqnsH5fBAUVZStj0fAGbMhjW1pJkfoj2vy66woiO88i7j6LhQgW7VxYIxba8JSYedpvmzUS9eIiKdFB7PhRPnGPcpEiTEa/vYWsMLSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLRyaS75; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLRyaS75"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abb7a6ee2deso383506666b.0
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 11:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165596; x=1740770396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TKxWTtkSqxwzx6dDc4iUz9ohfHIlpkY7Ca7ccTsz/A=;
        b=VLRyaS75ArjC2obPBlV7t2/7/qW3mfZsDZpL3Yvn9g7EetfUm5z6mqR+dOKmfxF4eM
         6mDm2UbMy2FiywPbtUsMbjjyQOVe/TCeD0Yx7dDbiZOy71LSSyJ87lvqCyAjTwE71GFG
         n5rAKNxyvE5y+9wGER9pJ67zjCOn7yNrEOLWJnmr9fORa/7k3bBWPn1FWGQHDx16jDip
         BnYAjS28XRB6qtkie04vv7sbO9hWbBz5ulfulXMasypoX9t2Bd1yNeZoFpW1OZEb4Wgx
         /MyzUXShwTBjZCFMf7I5hiRTD5aSh3dzhNXGLzDNTGCzewwdcsDMxR3OauEI5dmhWXnf
         BDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165596; x=1740770396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TKxWTtkSqxwzx6dDc4iUz9ohfHIlpkY7Ca7ccTsz/A=;
        b=cJrwRxtzUUgdVKVyqsq0zaI2KwrHOtEE0UFenJPbZ4feQ+lsoZ0rnWOKXfdGNzenhU
         F8siUuQPc8Qgrh9PSiYqYtDDtPDv4e+GjXzgeuO34wH4KIXDYGQp15iTbI0Rx+dXkX0J
         X9sNj1zy1r/U41sVB3B+m9mmPJO15YAKS8++sCbbvhNrN2BGCRtuRty+W0vr3yFJRZNF
         ag1q03rI7UevE/e6TUsSGHByg3ZYr6HjDsQjAFcWh4Dd+1x8MKQbdf3FhMYwb/rTvDHJ
         9AcdxEFjH1XgnHfKDVcBWHDHUqWZN+vtjGL30H9LrcLlPPdUec6buMGWj2/42mLuLfxt
         y88g==
X-Forwarded-Encrypted: i=1; AJvYcCXbvsBRiZzaCF6T2QlXn8hhDwZ4BT+W2lpBhMAEjT/JDSH6jr87iHjTyfVeVsq8oHdIJqM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7cUoM9DiWqaVK3y0N2D2H0TfnrNJo2//fjTs/tsxNo7j04NB0
	q7vCnCS2Gv3pLdJXvxcB4AoR9FfkDmEJclO2PpaGSrEADr8wc3UW
X-Gm-Gg: ASbGnctaifTvSmdqpRSA5Fa3PEKPBQW0HbTvCgODfqKKLozEB8tX3xOGrdw3SdgR+5D
	ZFZdtS1E6uiQwTjKEUNH+XH08H8jH+Wyw2uJUKqWiPqUZ1T+EoHZ+F62AbKEc1Qu3+cMbU6LPq6
	bEKijWUqcYE/LsyqCyrpc2TqEf4orB7i89JMUdWlaWDOU5OJSjFdvLlbnB6dYh1AezPGt9b6hG3
	Dur/OXsx1erFhQOMHOTF8ClXarYzgjK8fKCSght/7kL3XJywooXknZIqoBGFQUW+webEfKH+Sag
	G4szF6hvTtmP+T3soXyi6TrH0qz2pTWPyyUm+77XObpdX0Mp1KOkcLdA48Y=
X-Google-Smtp-Source: AGHT+IFDfbIPVZIMARA0RdhZrJ6UuY0dVTRO1/KxreNJ+xkg/EYBzXyrYM3lqR01Fe4RA0v/JrznqQ==
X-Received: by 2002:a17:907:2d08:b0:ab7:def3:ca1d with SMTP id a640c23a62f3a-abc09e44f67mr482288866b.49.1740165595692;
        Fri, 21 Feb 2025 11:19:55 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm995276266b.129.2025.02.21.11.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:19:55 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Fri, 21 Feb 2025 14:19:08 -0500
Message-Id: <20250221191909.31874-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..a1d9b834d2da 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz", "simple-bus";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			#access-controller-cells = <0>;
 			ranges;
 
 			spba-bus@30c00000 {
-- 
2.34.1


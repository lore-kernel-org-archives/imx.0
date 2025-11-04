Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5EA24A058
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 15:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268827; cv=none; b=AfoKWJImSCvlaGvWBCVGNkoq0/fGtOP1wcmoYXk3pfLwcryDujuNecRaNkRD+eV3ZQM0WxhYsP+f9pg4ePlLYitA8UmD6L3jJFB0oqrpZfP0V+4fwpXZUoe6Vf/JajpXIIwu85TmW2oaCOVjEU0ctDS0QugnszDFbT/tStNzeOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268827; c=relaxed/simple;
	bh=8bivci5cWWAxauLG2MtkB8Tbb/thrZEnVxK7tXLKEU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xp56PHAnQIlC4GWE+s3pIABrSTq+XJQzRdpSlNSiF038Vlsu3nfDZGBBbdjeylAsDg2pvSOGWyIc5aczCRt33zzsoDDxk6ReaqXTASchd2yg0mOQmshfi8yocf3g8h7t3krwC0Q8xRKGHCy7dai2tYhcwfqitiY/f4FbDi926SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYr7o2j8; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYr7o2j8"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so4406108a12.3
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 07:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268823; x=1762873623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJg//KOLtGKSYp8Owm6BTGh3ScE+qyb41BzG67dVSA8=;
        b=JYr7o2j8eVI9yzJJqtCPRNH+SFzR5M2FHGW22tDAG80MWAS+apU0N3q1Ort/rVPpM7
         8EreSZyDFaqolNAlnadm46xExuOfQqQqyxs/rGUmFRjbvlDRfdEDw0KkVbJQ+i4JxWAR
         hP0LHIKTAZrPpXlm2emVl/SO6xTQSP2yDa7hQ8hdJ0Je+KRUo8YmUT8gWRZP9IdaP7tY
         uk2u6Fqhy6eJy1L/93pGzoycNv8P8kqT5RbjosqM+3TvtlVONVk09vdB99oqtCJIparT
         iMS4pH1MTLP1bxwPJUa/7Evq2L+k3xoGLZyufYnFY9zjfuP9UVVV0KytyaqyrAwFaizo
         CyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268823; x=1762873623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJg//KOLtGKSYp8Owm6BTGh3ScE+qyb41BzG67dVSA8=;
        b=vcwWdQdZlrR4Uywon9Q2+q2ts8lP7Ohcavjv7YhEu0dOyl5Bab3pf9/OuPx25yaWEf
         V5tGCWfISzu2LBrkrIYVlCA5D+eXd7HqCKkkNGNybA3oqEbCJAZoCKkjPrT4gzMk+0tX
         fPmxtL8rObIQSJuPAZQ4WoENYjreVuTjATWGVpnOkERtSHH/Uqmw/0JRmobXcK6POIya
         FJ0CfVQFZ+hS3PpieRqryIXDxE99vv77XpmMgb/DLCxmok0kPTa1uoYH1Ut5i7S1jnDR
         OXNnUqKAG6mSiUBFPpvBL+lnrG0O6WmjLlEJCjWSUVqMRP7j+qGGLX5533whATWQlnnn
         0WTA==
X-Forwarded-Encrypted: i=1; AJvYcCVn4XqjtaMgritu3M8JxKuabuJ4YjBrqvgwmrGQa8QJPhEOPoBThQ/lm7J1yIkdrlxFT8I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy1B6s740w+5JNxgrqj7DUVqeOTTJlKtQfdX/KbHUCZ57CcQL8
	giIpq9ZPaciBJ+hGlTvAFl5l2YkV24JvxnFExrZzu3905jQxUvNYSlMc
X-Gm-Gg: ASbGnctjySUOBleykYBLX1SjpvCn2lX9+C9lRpFH1RhsJwM+IdgBgb9YS1JBiotmJ9d
	y9mvVJV0Bef1NCE9oe8JJYFcb93r5iFk+K66owl66KC0H2FB/2RQwRH7nirESsQpI1hjKneeWfB
	F5zhS9nBM/VDSppYYPSWW1JUoKB4dZI2YG75WK/6q7B9vePlJYz5za5aFpjt6S3Rmd5ubQwEj5K
	sdtLhinq0xKYr+V65XWEYXhN0MPxqQxKpKqeM4q+iaHFOWVaM3MrpRwjeBdwplPml11X94VT1k/
	J9//OgMqedBSkCiYrwppt7XBrP8kNmV+G0ez7JYExa5Qt+HBNritZde7N/2+VLRlSyqI1jYjMIO
	opVbqqovWzPtpW0yElkdk4XmSyqFSLieOs5UcnlavxD27DkUMry9UfyeJhFjlC1C9LiQy/4gVWL
	5A0BWjU0nM8UKjOe4wN1R5KB9SVQ==
X-Google-Smtp-Source: AGHT+IHSgCJ70F1XxE5ENSob586eoO57raX+3jUNcbe4Poy+4oAmY2PXokw7lx8dEM+M4PlDYQMzJA==
X-Received: by 2002:a05:6402:4309:b0:640:b1cf:f800 with SMTP id 4fb4d7f45d1cf-640b1cffb38mr8047514a12.4.1762268822882;
        Tue, 04 Nov 2025 07:07:02 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6805da3sm2342014a12.15.2025.11.04.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 07:07:02 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue,  4 Nov 2025 07:06:11 -0800
Message-ID: <20251104150612.1874-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
References: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Change the programming model of the "aips5" node to allow configuring
the security-related registers exposed by the AIPSTZ5 bridge. Without
this, masters such as the HIFI4 DSP will have their access to the
peripherals connected to the bridge denied after power cycling the
AUDIOMIX domain.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 7ab321af9e15..426c11853d84 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1428,12 +1428,14 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			#access-controller-cells = <3>;
+			ranges = <0x30c00000 0x30c00000 0x400000>;
 
 			spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403907;
	b=BzWZjkqQJ2vIThNCw2IIZli5WzN37VGGja7bRfjoD6VUhIhAOFQdlGBfhTFzvtF8MysP
	 33iHYQywEgCgLabBryUi7E7XqkyGLXc3i8DpjVdG96itoTUiNgBbN/eLW79K4puFJWyPt
	 Mo5aYvLTp4ssJLx8Gb7o32I9RPoCDUm0GKIqD+nIEfWC5KIvJLT5pgEsRpkfbG2vbOqi4
	 NqeMJL4DTa/4dzV9fbR6Yk2kfS4RNchAqRlIk38Sc7BsP9GI+lxXOwsbaHsCSVSqPP4eH
	 tCVybjm+2RAkoIQfPokbc5SphrFHc7gMhFwg189T5w9epw472dWaO7n1BaUjwOvYsKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gDkCPzQ/fTCTlPmLlCXyz89P1VioVc68pLa4Q0ahyVc=;
	b=O71u30GyrjCmFQxjehoAqtUNbOrkcqAMYi356ZYTEv22B+8UIww0D2HBKzIc4WqZ0nSK
	 5jyclstYd3RO+s3lR2+4nVZ4EtB0TZDAJoAqMK7poBdDvQV5QiAH4nh7LZmVAD1LD1Wmo
	 hQyyB89OcsGwWI8TMlgaJRWbX0+howUD11FJlNbDSMHRWMfidmHaYbukCIWC0QfFEgOyN
	 S5VYRAWub0IO3CiCtvv8o8f+NK+/CVWWGv4+qfP3n9WkkdE3yaoMPOWnQB9lafJa2hcwy
	 2Bci0wJ3d5TnWXaBrRb+02YwuxGEnDy2UQ7HNNmse+kuM3lVBf6RHepCwbOlXVamcFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oqkbMteR;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E3E606A8B3
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 13:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E3E606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oqkbMteR
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491846221ffso2238616f8f.3
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403906; x=1795008706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDkCPzQ/fTCTlPmLlCXyz89P1VioVc68pLa4Q0ahyVc=;
        b=oqkbMteRKOfNPFbiUBM/4kKlouMaBuAs8aWLCqrbBltdPaDkVrh2IZxj9ADkZQk+95
         3FIZVkEspytJhxcSLAviVl6ga5Mk73R9da/XP5ssq4oOmaozMib1gDwbg66MUPmLMq4G
         uHNUL6BJbFuLwofGRmVEjTaJLYE2uOUqoLHVFuF3GymAJsLSD2CzsuVQciKMxyKKWMqh
         sCJPgWHZTsskXrPPppMFvlZvxKqnqjYhWx5pEFbKJPZVnL8tnglZgi2BpSjkJmhYLk+E
         Ya1e2xuICyF1GO25g9fZvj9K6gUysdov6JTutOyJPoVyjfhhppTj5oMOT/PFNWdCJQJR
         jpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403906; x=1795008706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDkCPzQ/fTCTlPmLlCXyz89P1VioVc68pLa4Q0ahyVc=;
        b=AjiIDX1pKvlGeK6RBIH3oKfMdTtiyXnMsypDpaXPMvDpH4gPeuW6W8eqhipDYPlWon
         dRueFiRwcvGEHMMbMc99Sgavu9exHXcO5avw/heTmeaAnU2kauETUGZccIGtCoRrflQa
         JJlCjaPROC1+4PgBSHrTHt3yKillCBFIINJtBddHfYmyeOG/dY2GPGheuNrBU5uZ/9+s
         OgMCdKvbYTq6acP2DK/dQkS7k0A1jCtURaM0/6r0i8TXiHvANMWdovMgvggxidq2jdpj
         +XyXBjfgDK0xD/G2L2ynUg2MCatQJakoo7QPra4IHDMHiGj9CWl+dDamOYMlmsGfGE22
         YYEw==
X-Forwarded-Encrypted: i=1; AL+hErFDN5EEVq6MHDmy6tSIx77h/rKEzxCO0qXds0kH6qwc3TXhhhV6Mn/kv97OfRseMASJSpU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8k3RaUKKT88I0BLE2ChlM7Qsez8KoEuJEf8H2bbkELewPwMmDs
	agDDrwn4tckNk13DOk19ZrVKGJjDc0u+LfxC7iwDXXz3ExwFgXMAPVDKKZRmrWDDQRo=
X-Gm-Gg: AYBFou2rGBUOmwOxkAEZxI3HSePRTJ3spkd6LFy9GicsxL0u6XPPtWpV75PITUSZKur
	ltxwSs7EUzbgsdGClH3eA+FQEmtrVKtUXr2nWD0c8jwuq6NUsc1Lxw+/2tIRnHtO4aLkY/Y01Lp
	yJ8aUCPGDRfZ9nmevPEJpp3QhvzHLH2oU5GSfWsaCUkXa1MV81eE2K/o0BdZQd6ZtzXPT+WXPcD
	AmlsI+SPbLPITEp/+CBCfyoQIuprCv/A1TiWwhFpOIJ8VOC21dZ3iY7ZP7zVekoSJCH8Lp4YSoo
	tVdWkvHBzWySVHSxT8kXNCMpUz9BUkkU35Z+DOSxyY1scsHotDXCHLpXzVWz2Ui+Au7xKCvgAxb
	Ns/54NjX+TZJ40rtC+onB+BaFOAq91YsXJh8T8o2vNP8PL/hhh2f4JbnXqBm90wvvyNkjBVmu3H
	zu25C5t/de2bXc8CF1mbajhY7G0gOXW1i0igTBlt+tf1DW8TRuBLZHfyTJ6BHGgAbmJ7i5CVOJx
	D9ug1X5d1CUt+RjkPFtAUtKGT9SSvS1bFenOu1koAufjS4WEXLDxSugcAwU4fOxx+JgadFPWSGN
	s1DK+Fn4w8DHgJq1WY1842RMvWCvHdqNMrIbqfusqMo4Q2NnziEvhEYHzIcc1gFKj6VUMMcTzHk
	oadQLzONH3A==
X-Received: by 2002:a05:6000:4688:b0:493:8704:ad42 with SMTP id ffacd0b85a97d-49a90b3a0d6mr1095762f8f.7.1794403905804;
        Wed, 11 Nov 2026 05:31:45 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:44 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v3 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
Date: Wed, 11 Nov 2026 14:31:18 +0100
Message-ID: <20261111133119.1063210-5-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the vendor prefix for bytesatwork AG and add the compatible
strings for the byteENGINE i.MX93 System on Module (SoM) on the
byteDEVKIT carrier board.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 Documentation/devicetree/bindings/arm/fsl.yaml         | 7 +++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..e4be6fdb5808 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1555,6 +1555,13 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with bytesatwork byteENGINE and byteDEVKIT
+        items:
+          - enum:
+              - bytesatwork,bytedevkit-imx93
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
       - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac2f54adde73..95f386db1d01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -285,6 +285,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bytedance,.*":
     description: ByteDance Ltd.
+  "^bytesatwork,.*":
+    description: bytesatwork AG
   "^calamp,.*":
     description: CalAmp Corp.
   "^calao,.*":
-- 
2.47.3


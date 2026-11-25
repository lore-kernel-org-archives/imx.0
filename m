Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606778;
	b=yOz1QxIGLR4HOGa/AT6h1UAoDq3RCHCEEGa6vofmWFpJRc2U4XMlN8BXy7D1Y3xM8j99
	 tRLRTt6T8UVNZq4yAua7qiNkJsAoUl5ZfuZHtdfmYs00XXQh/Z7HK940mE7zvAdWy9o/N
	 LdGKFm34FcCE95k0NuWzQddSLm4I6o0L2z25DzpBOtsowWiqI6+ZghMlU/bJmpdhk/RvS
	 NaJrXFTNWrPmArD9aksuEiH3Qcauqfb0YY1sWdeTZX2fxHrH7g7KG881L0p5LE6d804Ab
	 EFW/2EqeT+llZ3OkcKpvCXaaIyby+hfgzwksLTkTcF4W6fV+qWf5XE2FbyZYxLHUZiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
	b=K4srvDQLMtykEuI+zVVtwhr/iWP8acfcv6GPWrPg543A41koiPF4t4x6UxJUivJMRksG
	 FbNW5wwO1s65c05sgfyhUr1ucnOiv1Xhgn2tHDpVR41P3fI99Wff7fK9nh201PigRuK/o
	 R3duux2NocooSb3RFIkjg2+IyHqK44GKV4iVs+iaP65E0YeIV6qYNBJhhQgHmJ8LP7Qkq
	 QAmZ7kc5cJed4uDYpXxdoHxaC3WgLyhBIOfeqmuQyEb6g5szJV2emEzl44+NOqbV8zinY
	 IjqXH9zB5RVaS+nFhxEJJicFv39YZgTqsX6wu7HiwSUwGiiI7B4GbE9ol+Wq6fNZfBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YIbZ7dsL;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97538606A326
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 11:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97538606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YIbZ7dsL
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so7961032c88.1
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 03:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606777; x=1796211577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
        b=YIbZ7dsLFwv0Sbi/tDrk/bquPxG6f80qMXrL2rorzKruIyfxeb9Ptql4Y5NMPbSYtO
         7Jh4JNecJqGMfY2nbPJqJDmVL95bkAXvpHImrPqAEl0d0ZCbdg9f++dhnRxpMOvFVX6+
         aBPbKt+FH2xQwvmgZHKQonUpkMZsHU4dbtE9BEVfS3iOb11n771llOX+mGqx2s1EIFY3
         0RV9mK+Klh8JQg3o+MuT5XmIeOY87n/cNPlRvXSLRfnH/6ZWWxEJdFdvahOZe2Y0zwHx
         5xLZEEOCJ6FCbqWcbF4FZnfv0QWL5xQyTwhpg1SAaRcW/SjyY7m6jQ2CSXD71N55r/7f
         SXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606777; x=1796211577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
        b=AfUmW2JWKgP+5azo2g1tRMHVnXZz2NawuS/aNvGxUgJu3RBeat7qoufwjmUNgDdLIV
         bpVqqEkWArZTwmozB4uMrTeNA86YvYDPr85eH31zrRscekT7dSDn5yB5v9Jo97Z8mzTr
         iDhZiIogj9JYaJMbVvIiXgmQdM7jiSa+K4I92BpGy2HKK8gg+t45YouoVyq99ykwOw+N
         ySSelzvZqMM4gniP8w+94YjIoYC3ve5YHtIb3Vv76lcAf6qpNGaw82SDI6r0sLw/kLA7
         cl34Xoi+amqgG+gA/balhcInNulWzdHUZl3WDwFjPVhWrkx3oig6uyIQ82ws7fN9GXP6
         9r+w==
X-Gm-Message-State: APuU4Z9UB+2mWnGec3BDHdGU2Z6aoSEr2gnKlbOaWCIjiKszmD4PI+s9
	ZW9I/2UFNouX1uge0oIPARFktcqiVizY3Qctdz+ehrO3POyM7rmGQ4t3
X-Gm-Gg: AZFdTZd75ml3hYFabkdxHusysaN/qw9XKGrWMSUmFlUyVkT2SH7g/AGvqJozwYnajF1
	opUTSaoEAwGOFPWmdFHdL8tCMDJGfl5tuw29OY9e3E0glVrrxB3MXYV4j5NNxezj425OpAdJoaS
	lR4LENoofgkux/KxHOCeb5uZz13tk15tLTVdkerZgLa+eMGMOTp2Otvik9/FnSn+9KFzPMzi4lY
	XWePi0uzuFoEckvnxwXp3xCxi13Tn/5O7D6ObYFp2JFzLVRYGUvvJUXUN9HrhHoWPCIaqeo5F0o
	wW/5RtPhjcEoa6VKHjDv2ZDRHcmG5yjtXnkrPKsLD4zPMBaJ2lXvy4X7e/EWnqOgV4oPWcagtMy
	punW32X+H5pcYxvuCDElJkM/HczekzROWP+vN7YbevHxIomPrjB1+AbR2USgG5CcOjRFf1RClVe
	Z0UCTMWjyyrtgqzDh3lFPLADJFC5Tpimw5Mb+GRGfUo1ZJS5c70hcaHSJ+kf8pVixV9Jealizcn
	rxOimcctZLC+3xmcQmWJlm5Wuul1NaAP2M3GTcWz+1PYJO/T/aEDjqr6FJbmBB6R9Dgh/u7wZyK
	2va6t9zyUVSnZAD5FlW5MfkQASdE+8h23OjPWsklPMSzQgE=
X-Received: by 2002:a05:701a:ccc9:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1b5568b3e73mr17483022c88.15.1795606776639;
        Wed, 25 Nov 2026 03:39:36 -0800 (PST)
Received: from localhost.localdomain ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm47479629c88.13.2026.11.25.03.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:39:36 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Wed, 25 Nov 2026 17:08:44 +0530
Message-Id: <20261125113845.297658-3-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125113845.297658-1-dineshkumarv85@gmail.com>
References: <20261125113845.297658-1-dineshkumarv85@gmail.com>
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

Document the ADLINK LEC-iMX95 board compatibles.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805b..baa96b004c52 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1577,6 +1577,12 @@ properties:
               - fsl,imx952-frdm           # i.MX952 FRDM Board
           - const: fsl,imx952
 
+      - description: ADLINK LEC-iMX95 based Boards
+        items:
+          - const: adlink,lec-imx95-ipi-smarc
+          - const: adlink,lec-imx95
+          - const: fsl,imx95
+
       - description: PHYTEC i.MX 95 FPSC based Boards
         items:
           - enum:
-- 
2.25.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384789;
	b=mLU8QNNfd1iktSFh3n5VxVVJYlpKHhsV/G448xPKAWfssc4g+46lYNzYtTCSQ1/RWA/U
	 Ikjp/EAuzYqbrT9aU2Zq8eXUh2gSZuMycqVpoKTgGn/Dbq808q3eaJVhU3M6PGJ6xw/wC
	 sMSuKN6YCowseg+tBDN6WlJCiaaEslbtJ986UoYs/aY7qfO1Aj6PYf9ILVSuDh+WWte6d
	 Y+RayrOr4vuNKl0gdqYLcJihSKqQRIWosMjBcn1GuYllIhuwS5qWmRvQD8jhvMyVtvIl+
	 YP3vVtjyXkvvTGk7pd4XPhHKujUcOwmGEhNpfI3eSNMng8HKI9df9tEua6JZmt2fqQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y2y9kbz82lKQZudwoFQR8NgKli+kQJ6rKGK4CSSNZVM=;
	b=RPCvMfwDU3RDjh4iYQJdQ377R4NpeKXxq8rK1uO7JJjhpS/LEWKFtehpyMq0q54loVXd
	 3xq9BzyMQEC56RIXo4pLyw5Q6EoCW80htL91Wk5jZP5kZIuTy7gCChwbxTaYzJenwb0hp
	 gQQIv5c0wx7I5gOZ1TGoXRr4YqNh1ZUzEY60Gv13cGn4++PuHdtnfrN77TWuBDEIKVJ03
	 Djz7yFGMjHa0JlMhpx5oNSMiw9JdzFOTfgNLgTGw4qD4jTPMFR9HzHjacYjZ9zQRTm82O
	 B/V8tcAu1pfBeUkWP9LKoDm1qnjX/aZY8Uc59h4ntfGlr57MFl0rOaizcIUpDNWoYGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Gwix/yBI";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF28A606A327
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 08:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF28A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Gwix/yBI
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so26487225e9.1
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 00:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384787; x=1794989587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2y9kbz82lKQZudwoFQR8NgKli+kQJ6rKGK4CSSNZVM=;
        b=Gwix/yBIdXMOa19oe2DVDil+kM6Bjphgye4xHw1V5hXS/NtmvYKL05K8ErP12xbWkC
         A1kym8PX5LdTkoAGKCyllACxnLK+hXZ+3l4xZ8Ys2AnreRiP7O89spHD5cGSmnns0EVc
         RFnHxCkJxDeyIUaJ3usKWXLMw8ZZQW+mGCKtxLStiECPvjXzyMQH61vsMFKpYFiDGp26
         4xYP8b8ZaUbuSx85YjaIGHKzNiaK5zuUhyWjpXNFwpWEKH+RrRt4waJufu0afDz6aBNk
         7h75aSwuuf61TLu74YCNlAg7rutwa1cQcIrSqCTBGlPhtGViqjqAdpfHn0kCYLALDyZt
         wTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384787; x=1794989587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2y9kbz82lKQZudwoFQR8NgKli+kQJ6rKGK4CSSNZVM=;
        b=uxAJN5uLChYdxDlKEWsL6QrF06bWx9nrLnL8UP65G79B5mPtQqkae+GC2gwFNtF6Vc
         YvRrb/1OtAxnXEgv8275B5lq6Ig8n7zTOJxwtDhbJVsvbgFVZxhbBGHfzw598KNe240G
         N2RmCpGcikeFPdG5zbif+Mi7llw1n5jdUeZV/zdia2nKw9079qh1kWkzW3nMxqKkjFV3
         j1US63YLaOPFJ3Ec06MbSwFrzi+FXfkcI8iHDofxYoJfb9QJC3Kjp/fQQpHu8ua02OBh
         JAynMcmYcEMxUF7kNzHa+BqtyfU38zYasIcrhf9WybJ1inFdXcwfiePKFpyRhkM+0AON
         Cqog==
X-Forwarded-Encrypted: i=1; AL+hErFemLqooXjYF1vViogjx9E3HbcAkQLiRaTW/OyA7REPmZcJ2WQ+EnS97e2NJDt2e5iE8jQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/X8QOH2ihzs87tby34hIacVKKvxrsrZSUU8iqumCLs40fZ4nHG
	xKqTAivv4xNXTTuKeCKvMvW80KouVksf5+686R+FBFopx30ziC9q1LZ+Pw8ZD2CkPbc=
X-Gm-Gg: AYBFou1UJVVmq2RFAn2oJi9Y3oICUiSU5W3T5G6toYTTrB3eN60XXNR7eyj1OeAPoFr
	rfXRWrZTLhnA1v2m7xzLqM1SEmRxiO7SRhLvO2dStNpdzljfIzkN8WHwzJd4VmI6NaJTmV+i5ZV
	ytey1tcK0uKlCV8ZuXRjj2RCS3hfIkfOVts+Qv/TMlAeayktI2DBBm4j5SMDLEmNHk5wp0iuydr
	ClZXNRagTHT5nHiuxYOsqv6TwUJgj8GsOlLFlESd0I+oa+6QwbcbEAODZlhxSObmeyOggbEea5J
	ImrtAR2OkktCp9y8zwxbhb0bERkmL4fqIiQUmZv5aF/A1P7Q5GF7+vnboAwq32xpf+QnFBYFKX1
	R9tLJP7EfVEgPVxMjX2K4onL7CR6Pqoh+lyYwb/sZgoiPUNjwIoinLVIVSUZwvE88qImPCwekfs
	RdYP4YhjtZADvLqSnkpvNhcs8TNsJfJaxRmj9zw11tLhPWM63JRLGn++0o3+62pwyAXM+BWoeX8
	JtKIQllBPH+lWHbeeOdFP6kzmAUvkoDlb+VVCqb03nvSKSG5BbmpKEhmVCSKDuBnWWucMlTJYyh
	srWtKMl3i9AYb4oQG2CNiKksebqXAF+RCO+4ISLKbMrFCzEj8wnQijDJy4cKLiv5TZwaZDg/857
	paj0KLxgFqw==
X-Received: by 2002:a05:600c:4f46:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ba0937bce8mr32273765e9.28.1794384787479;
        Wed, 11 Nov 2026 00:13:07 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:07 -0800 (PST)
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
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v2 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
Date: Wed, 11 Nov 2026 09:11:46 +0100
Message-ID: <20261111081150.950272-2-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
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

Document the vendor prefix for Shenzhen Youritech Co., Ltd. and add the
compatible string for the Youritech et050fw01-kt panel.

The Youritech et050fw01-kt is a 480x854 MIPI-DSI LCD panel with
physical dimensions of 68 mm x 122 mm, driven by an Ilitek ILI9806E
display controller.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..c2e442c20c0c 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -19,6 +19,7 @@ properties:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
           - rocktech,rk050hr345-ct106a
+          - youritech,et050fw01-kt
       - const: ilitek,ili9806e
 
   reg:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..ac2f54adde73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1979,6 +1979,8 @@ patternProperties:
     description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
+  "^youritech,.*":
+    description: Shenzhen Youritech Co., Ltd.
   "^youyeetoo,.*":
     description: Hong Kong Cybodev Tech Limited (youyeetoo)
   "^ys,.*":
-- 
2.47.3


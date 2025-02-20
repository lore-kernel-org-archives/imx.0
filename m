Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC50D2673B8
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 23:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092930; cv=none; b=QIce9NA+vQT0JWVA9hDRZuO5G3SCW/1jW0dybx6Q2mxAEV8HVQij1S1+V7QRpUoVYLgoVsuYErzTisPP1uElQVGT9Nrc8R8DT/3byZ4/G8LHGO4KioT2ydgi38dAvzgS1QNfv9Og8Ywzkt7ec0IGlhTrEXCLFHTwF3E8Gx52BoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092930; c=relaxed/simple;
	bh=lg2S49Y/PXrPABJ4Pn2C18lsbCiXukENnnTBnuXF1lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUyLPrubfv0dZnNdmKuAx2sAIYmYV7tiGae+5R8+JoFaV6VUwzk3Z53QHKzkM1aVJbaHB2O6uVdYgvscUGUvaIKlxPL1W1mzR1rmY6ILMhrl6TVUUm9IN401enLvlquhEfJJdGpHYPgzpG2d96iO52lFjSc7U/Pa3ynyqqbw83w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHluE+PQ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHluE+PQ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso289323966b.0
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 15:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092927; x=1740697727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=;
        b=EHluE+PQ1MM5FnEwxf3pO5qmCyRHVT8l9JnYmKU5TXkY3q2vTzVPgQo54Ri/A8ZB/7
         8D/hED2q0gwDd6nsLLf1YV29Kj3zcvdeRchPW+vEFRpJfBYUsLd3UXeKo63tqP1TV8y4
         +AAiXa2KtyQN+52T6U8iI5hB7ElK8B6LdFMLLNnvZbOP4Uwjzwy/I/BuoiCLNLMqn6GG
         dPan96Q5uRYSBox44VBHUAbzntBLyorJnZxA3oB8ePWqj/sznmkXPJ9t/KTX+h0g3fQb
         0j0w/rJUyUbx6RgGDYaaGOLdVaH3OU/Sld0tR3Qu8aDboi8K+9vFgdBCIRb1DN+5b9JC
         xvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092927; x=1740697727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=;
        b=VXsXAIQQZZT12DVHwty9Rz2dpV5gz8G7jI680HJ2T5WypRczTY2e+RW6mr+tBBERSN
         9G636YFeSqhEQJ9fmIiUjYsdwrpZJNG8UyXPnbpzStpN72U0J35J3Zjr2lL13b5Lpdws
         +eKfVXj12Ykf5BN/gTSsRhWSQKC5u/8zVwQlbwj8rB+qq+4oqhh4CrzStV6qLd8yA9qd
         BgN11TXltiK5sjoSasggdp5BYbVttdzaSRoISfTAc1Q2Ate8KcdFSNbdUMGiEeQYCSJt
         YM+Q7byuJBLDJzILHcszDVx6d8ZjMfrbzVRmVRfP969FO1NvxFyLZWIhdSZSaY7wFBNj
         nHjg==
X-Forwarded-Encrypted: i=1; AJvYcCVcu1MJqoD75cVPZuvaVCaV2XKY5r+IbBrYW1o5082mtexgbnD8tqFUWFeLl4IEY7ZBBw0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxslz9am5xzk4QZ+3CW6JbdbUSwsbNh9byx0Kmy0nSqOCAff5ia
	kOBXyM8j+6t8adpzovAU4+Gfap7yE2ct506MH9Accz2ogeUHskGa
X-Gm-Gg: ASbGncsElhKLYytpOAGhid2wpJOJH421XBA4c8b1LLYDgpMdoLfomUDcMOZm3J4qFb7
	SakfasibThYCkC63OUWelqYvYrhbo6PI/qolLPknZv3lbyLcleGZ23Afjw1NKJNyWUfjKVNLSid
	4FakTlD/dtapxXpG56O19GWClbYsAS+x+Reb+ZGkcpPtRDUBUCMpvPl9/Qp20iYUPzXCNDFkAgt
	2BfFa2I9Mlt0SiKVhDkCN5Ebr49v8A+IwYn2A9fLs6eY5SJB1dq3vc4i35xnW/A8myAe2XwzqYv
	BA20/p9ozM/ySNQl/jYbu1JhUy9N
X-Google-Smtp-Source: AGHT+IHxCyp3AmxX9+y1FumuMZ2w71DFr0p5Hi7cNfrmyJDTIG49fuCS7zq2b1FXlJ53fyeJ7aqZdg==
X-Received: by 2002:a17:906:3151:b0:ab6:504a:4c03 with SMTP id a640c23a62f3a-abc0b037859mr72192566b.24.1740092926822;
        Thu, 20 Feb 2025 15:08:46 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:45 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 3/6] dt-bindings: media: imx219: add support for Virtual Channel IDs
Date: Fri, 21 Feb 2025 01:08:11 +0200
Message-ID: <20250220230818.275262-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IMX219 supports configuring the Virtual Channel ID used for image and
embedded data streams.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/imx219.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
index 07d088cf66e0b..766b0e5fedb05 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -66,6 +66,8 @@ properties:
 
           clock-noncontinuous: true
           link-frequencies: true
+          vc-ids:
+            maxItems: 1
 
         required:
           - link-frequencies
-- 
2.48.1


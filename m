Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189741FDE26
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061071; cv=none; b=kSb71Y5XT6CbCnyLA81bo2bgixredtffk1EmCRkNLVccNUQLttbGqMV22rOFtMPkuwb4H927bCWgWGFAPAToBBTDC2mcAlNBC/K9074Ma1mCk4dBG1P9Re00PfrjRxsZD5h9pNCM3jucE2O/75o5Q58apUyUDgetzKGfaR4Eb3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061071; c=relaxed/simple;
	bh=PZ1DnjTFl18o7jkWFg8lWtATbzYcZDhG5/KGRCkkiUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxCB4RphJvYDD2lvr9IVakzfeDg6bi3MPM5HPE22CZJfbClFy4TM8L11uSpBA7FdkJ+uQ7qfWs6CdyelMXBbz4npHdz3wsCEmyUGBB+lNZApwiXaMYec3aGa6+UND33KNgFIkheTOpiBvuJK9AJ2Y0CQqhS4DCsO2Eaf+1SauKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqeSOP/l; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqeSOP/l"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so158641066b.3
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 06:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061067; x=1740665867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=;
        b=iqeSOP/lTx8N5ncshFjbhLwWI1LDhts+SV05Y2lrPyZCmO9lDVFA2ymr6Aduk7jW3m
         nfaPGbaXakIlkbIc2qw9If7N4DgbRyTGzQ1qg72952CU5Fj3wGPJ9R1BXXQ8juLHirau
         e49ckA3iJQXh6mXVBzAt2BrxFiD6+K6eZfoCEeE5s5siK7o3nHDsFFGuglMLUOIwMDRA
         9yBl3VomRXGBqjatcKSkFn2/YFvUpQTW5B2vcIzq4ZGZKtjvk6ETiT6j6cxV/EUocWk6
         e9FDzJ0i3WYCma/OT0Al9UcoG2FnaT4/Dje+81yUMVipIJaACnqYDTQ7+3xEJQkwQovB
         a8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061067; x=1740665867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=;
        b=ih8iQyccKBouOxTl17FAAmmJgRb+WC6uSf0zvX9V3hwj8PIigUYuHe2fRwEKPm5Ch9
         wK5StqulVcGP0qjpeg5Bkd/JeSzcLT3rUlgyv6k9rlbuBX2ePez94KJy0YIxuWOlQSxc
         roaQKwtpm/oZPTpiSyOAo+a4W9T8pAf65uJPfdK6zW4NR8NOtVyEazeaH0QIKgy+ptqH
         Ukd12QEoxjQls63YMoBS6r0q1fwWZTs4jWeJiDeeQFBm7wdwUDXiBZwL39R+N8ljrejh
         QwPZWXn/YF+zMXuhpBFIARs1AnlV8Dv6pNHf2m+NYPgHk4427blZSSNyjpjHta+mnm7b
         tcAA==
X-Forwarded-Encrypted: i=1; AJvYcCVfYrPKl6IOCz9CL1WI4VSOXh9e2nRVXJqJMEOaeykoZrYElbV+yLw3UyGWLIsqoSxhixE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFOLAkYVBWZ+mfrg1tclzYdLfpthIDc6peDy/N11dc2bqBAynP
	dA2ijcgmk9QbCDh/dNS37Wih/gCY3lyBGwa0FpdCVwvb7HLyJIsMx6nJww==
X-Gm-Gg: ASbGnctNnb6JgdnMmi3cgTRxFqcmsh+oDhQEXL/ldBlpb2b/bJhrSJkqVrqlPbXThIC
	J/IV83GCCg93HAtmwm72FQUS3QjGcuFZNctvwGMLSrUv/Pdip7vlnJz8wVkucH+Rib7vs4rfS/1
	QP4t7+rUKQbSSLdIuRPWkMZf/S6GnaX6ybwQ2G+SZ+swVRcGYsvbID/Rtk9rznG1ooYv5ViXD3F
	/VuOo1trK+t8T0PPicTjXs/qssh/D8QLRintQTupPDozTujTdcL/5XXwqOVqrTjenv0iGDq1kd8
	HRc2yagORTtKuWEK2CjFYszeUJ8G
X-Google-Smtp-Source: AGHT+IGbvT+ElwJFSjuG2SgiS1oHKWL2tTnh/dZxsOpA946XGKGKmXCEg6KymAHfaze7tPu7/efmcQ==
X-Received: by 2002:a17:906:dc90:b0:aba:cc21:8b3c with SMTP id a640c23a62f3a-abbcd0491demr861472966b.38.1740061067200;
        Thu, 20 Feb 2025 06:17:47 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:46 -0800 (PST)
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
Subject: [PATCH 1/6] dt-bindings: media: video-interfaces: add support for Virtual Channel IDs
Date: Thu, 20 Feb 2025 16:17:23 +0200
Message-ID: <20250220141739.228714-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multi-camera systems often have issues with receiving video streams
from multiple cameras at the same time because the cameras use the same
Virtual Channel IDs.

CSI bridges might not support remapping the Virtual Channel IDs, making
it impossible to receive the separate video streams at the same
time, while the CSI receiver is able to de-mux streams based on VC IDs.

Cameras sometimes have support for changing the VC IDs they output
themselves.

For a practical example, GMSL2 deserializer chips do not support VC ID
remapping in tunnel mode, and neither do the serializers. Allowing the
cameras to have their VC IDs configured would allow multi-camera setups
to use tunnel mode.

Add support for specifying these Virtual Channel IDs in Video Interface
Endpoints. The supported values are 0 to 3, with a maximum of 4 values.
Although the CSI-2 specification allows for up to 32 virtual channels,
most hardware doesn't support more than 4. This can be extended later
if need be.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/video-interfaces.yaml   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
index 038e85b45befa..414b5fa8f3472 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
+++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
@@ -231,6 +231,17 @@ properties:
       shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
       busses only.
 
+  vc-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    items:
+      maximum: 3
+    description:
+      An array of Virtual Channel IDs. These are unsigned integers that specify
+      the VC IDs used by the device for its data streams. This property is valid
+      for MIPI CSI-2 only.
+
   strobe:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 0, 1 ]
-- 
2.48.1


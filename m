Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087FA264FAF
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 23:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092925; cv=none; b=FJ70GDJHAZwgL7ILGA3cF8hYj4cryIXBtufYFmUDAQQWrNHwkUbunR49TpqKaWlypv8iu/FJbOWmQeAttCMqVLJHSzLmj+wh4bGfq8qKp9osePZ9fy4aOt66bwYY4GHFShFabTGV7zY3OdkXXBaB2T4v6Js8DHClRoKDWiBH9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092925; c=relaxed/simple;
	bh=PZ1DnjTFl18o7jkWFg8lWtATbzYcZDhG5/KGRCkkiUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8PiZi7xEE8bLyFmQTgbV98iylYGO2EVc9ZHmkGFMBmfVyrluDej9bRzrQsU27y7UNHSCw0+D2r5Ok6eEG2nTvT9GnB40oBf6KT8m2PSe+H1u9Xy9FD7uLScEW9dQVA4iVhQYV47BzCI87FkGs+fbC2tU4pBA5L29l29d7iAzcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBD5wJqq; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBD5wJqq"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so2014779a12.0
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 15:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092922; x=1740697722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=;
        b=FBD5wJqqhk3OJxsiZDPIf7arj0mn/Tq/M/yC+d11iCgEp6RPjJsbTyHzPaxXjawlif
         o76zfW5arDT5nJgPUlvDDGfn6A0rMZR1qAjH02N+Y4g0bytprdoQ4lpGiUKybbNyPKt+
         bEP9PWgXqd2B4KhXDhkzznuVJTv9/mUyHw6SqdSyX8/r3jg3SdkDp+rsM6dq1YcKre7r
         Xk3quZTypBCTGC6Ms++QAILG04JsBw/3AvPnsn6jIxiQBaSkufTsf2DuG9qJJwNat5N+
         NLT26kQZAdwNavPfkrvJbgqbKViLSwztSCQLd7xlxdW/5ADwhDqpj9m8p0GmvWhOqiaA
         +zrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092922; x=1740697722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=;
        b=bAZ3W3BFnHZvNxK98wb5GCHNDPzhPRl0TtmPvlKLx7TaMCRzPidtu8ehhxHOjXPYkj
         RmqetppzbJbgdPf/vsamknifD66dOVhiEqTRu8g3WodLS9E0KhmVdw43WF34+dnzMHMS
         O7Mm1DfA0Qod6pJax2Smceek1m/eiv2uSKpkOSW4djoxuhaJBfT4cDu60uswVkBvgy4+
         pMgRyDHDUZTu1RmqZUu5JaIOofB2r9eWug9aSn4hQTe7oiMEi+Hfu8jMAcEyrT14BCl+
         wgs+wQWBbJ/6rFjIcF3w4RAl7gsXCBoHIA3VD0weoBIedVRDQXbXOnuXJksH0DlRtT3k
         5HmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBhRhF3o2gfRBUmr7+9Lc0eG0iNtMbY/qxNsrKqG1IPGsfNbYjzp4uz7fuHv4eYLMwBLY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd3aZKraOoEzQ67lFSIDFW+K2fCxMoGwWOYKytQapSM/NUOOI2
	SpuO5rdMqt94QVwOBNxHznT9XKqBr+8KMEPdnARKOV3ffMzpiBpL
X-Gm-Gg: ASbGncv8J5rXNvdbDcMNq1c6aBUq7Sc3a6GhhOdBp/oov7IRPz93ZqtbfZ0uI3j6xsW
	XH2KrkrCIZt02XPyeGEAh6IbBBXr588ZjDzJrlmliE3U6nKktmBSinRdGK3e++oUVP+rFsOgE15
	MBTAJF0PkVLZTU4g4owxKH0eKRTZSjLrZOL3cE3J7Fp5LCEI0MllkLnsuQu1Jy0j9vSp8sf9TGt
	p0U6kHgS+Y786INFzOGLRdGwHFAArAzaWvKSuVXRsy6wtI9lZiHc/TyXE14jl60BKldDbDRFWiA
	xxNBt5RHGWzy4NB9jx6oC8IFjmt1
X-Google-Smtp-Source: AGHT+IG9EAhYRQtFAS88EjfSpO8anFUAbm7p/IUPqkE3ggwd0qucvdpByol+KZZelROudQA+nudZqQ==
X-Received: by 2002:a17:907:c284:b0:aba:5f48:eda4 with SMTP id a640c23a62f3a-abc09ab9bcfmr86596366b.25.1740092921968;
        Thu, 20 Feb 2025 15:08:41 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:41 -0800 (PST)
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
Subject: [PATCH v2 1/6] dt-bindings: media: video-interfaces: add support for Virtual Channel IDs
Date: Fri, 21 Feb 2025 01:08:09 +0200
Message-ID: <20250220230818.275262-2-demonsingur@gmail.com>
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


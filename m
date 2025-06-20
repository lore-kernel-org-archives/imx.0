Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53D22BFC76
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432907; cv=none; b=P+jebz+7OvOK9AEGTCzJ4Tsg1zMETzhasMtyY4vFtg2p9y1QcT0K9rEylJ+S6aMMymhJMO5gCleZA00V0trPTTTOUezZ75+IGfpnvFPvukBvet/e8ONtvgIWSYat/nQdSAX/GS3wctDtVHqEoSERsdMhhTQGsk7LdeFA10jgvIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432907; c=relaxed/simple;
	bh=NR+UniG5v9OCH+oaD6aiCfy/9gcaEDZGU6BJA3qo0F8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=peddVDLtlzDggmap26GlppvjpmFsUquaGT0HRkin/ett+ppQTRgubgbUg5Hayk0UkusV0BwsAFpPiwEBNNVpR7lf5cw2lK1u3yZCcioTa34bImChMsMVwieJHdCtlLs+RaWbtpxB0EwrqX+lNDFFGrlRjX+oxaVBMYeeKLTWZm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BA8Kqu8W; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BA8Kqu8W"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D34DF42EF2;
	Fri, 20 Jun 2025 15:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750432903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qokwuBMm6huB2lTtorC/MIv/Y6cRg0wgade33/WE9Vc=;
	b=BA8Kqu8WtAJj50BLhl/q9lm1Q2SH1pFyk7JjgDnV+CXfVUfLLzHrH0ccqhB0/c1cluKPdg
	ki2TbOFz0g1pcRTg7yW2BwGjDBMRSMIhhR2TV3ruclIylxwa/evJ+2d5FB+uQ1KotmXHt4
	zQoK9L7QzHPIae8NXpJ+43VqaALUKI46rkZs/HiUY2kKn3SHc2lENl6sUTdUZOYMYBrZrF
	eheGyzW+W+BIVQuJo1D/JlOMfC1FHlZXw+KiYj4Px3Hl1VeF/5WaJ85Yk8jl2nK6+xitma
	V/rXZobsHxoTucuihwCciXyq2+CGCGHvrFrEuWq6lVC2um39/gPpRxYvbn+Gbg==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Fri, 20 Jun 2025 17:21:32 +0200
Subject: [PATCH v4 1/4] dt-bindings: media: ov8858: inherit
 video-interface-devices properties
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-camera-v4-1-0201a8ed5fae@bootlin.com>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
In-Reply-To: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 imx@lists.linux.dev, Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 ~diederik/pine64-discuss@lists.sr.ht
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegueegiedvvdevveevvddufeejvefftdeugfffkeeileehheefieehgfelfeeileenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgduledvrdduieekrddurddvtdgnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopeimughivgguvghrihhksdhpihhnvgeigedqughishgtuhhssheslhhishhtshdrshhrrdhhthdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitghhohhlrghssehrohhth
 hgvmhgrihhlrdhnvghtpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: olivier.benjamin@bootlin.com

Update the OV8858 binding to inherit properties defined in the
video-interface-devices binding.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
index a65f921ec0fd24e449331772e39a16cadd73a868..491f2931e6bcdf5a1ad2cd4f9eb187055c3a7a2d 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
@@ -15,6 +15,8 @@ description: |
   controlled through an I2C-compatible SCCB bus. The sensor transmits images
   on a MIPI CSI-2 output interface with up to 4 data lanes.
 
+$ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     const: ovti,ov8858
@@ -69,7 +71,7 @@ required:
   - clocks
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.49.0


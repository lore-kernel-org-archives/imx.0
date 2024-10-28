Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328251C3F27
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111176; cv=none; b=NaeQpnGR9p3T2x1Zv0Xkb0XsZaEGthTlExuwmyV92VEeINcP5JIwHEPT9x4JYREkvvg1C0yL0+LLkVWoViI3cR14qRnac2nkXpljkjWzKhuB7bPcHaYbGyXocaNsJUj4MWSfI792qk90hebwOhjMTD4x7aPIK51InXwbahE0Ie8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111176; c=relaxed/simple;
	bh=R93VMLohkk+JmS520PXpYqfQBg15NGWIzpjAwA+J2Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iEBsixPFeMSuUXT9DhfiUl1gL7Xs5ECtJCtQv1Sr2/izfEB8LwFETPYpU8+4r53RUBwrfD5Vzz3Vqkq7vhKcCCkYPmh0JtJgy9lIo7iNr0hKUxKlwIQ5a7w1DihEZCxrRIF6r4Fnb5aM9CWqih4iOAmDlEtaSSbKR8hpOOHP9co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=IGywNBIA; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="IGywNBIA"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539e690479cso3921169e87.3
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 03:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730111171; x=1730715971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYexXqsopB/TorltyWtW3DQvmZVEoLO13n0GfiFkuag=;
        b=IGywNBIA22VBL1i1W4pgL4EBT5pFbE3OKpYb7O0MjmO6yvZZPFse+6EhVzj5Z7+6O0
         THaLMOs975lgEsZQrXLrP5EsoD21F/U9FCmn3wzhQV4/AJQHoYjTIpRSOaX0w07XTGMM
         VWBaRGrog2mfeYuqlcrYSvD3PwK2/s7RvNjjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111171; x=1730715971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYexXqsopB/TorltyWtW3DQvmZVEoLO13n0GfiFkuag=;
        b=oOF6hCPHusPg0KdhBKv9IDgUqSdcm5dW/VvA0QnDUR/UI3EKV27SGyMPYwk//QMcIs
         w2RvFW3txwj80XHPVfDAnnxrncxzBetzgO+h8gevZ4gsR7Ebkqo1hTrnJaEfHNH2x9i7
         RDThdZZD9sln8V1Yij4ovpb105s5JHWr8xSFlUz47EN8B116x9KLhZ6j7A1qYmIU3drf
         b7CgCyLSnktIZ2vbErU7xwWAEbpThEaVBN5mmeJmOdTEjndB/nYwfAoehwNmRlwe2Zxn
         5zUB/11d855OsPH3RXCCa2nxU8rH2JKhKoIvV9qlPXNRNumFuOZSOs0uDwv1i/SmXuDE
         QMeA==
X-Forwarded-Encrypted: i=1; AJvYcCUcISTYk0UUdVtwdoVj7ol06JUiXbFumsHbPPnWWdDyrFQ3UrJ5UJX/hG566UX0Z9a/Sa4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhIVJrcejlJHOlJZV2OoAaDiJH1V4cUJznK/i8O4obEFtyaA7k
	P7kwb2SekwwhVyCWEpxhfNXtCoKsoc6Uf831Z43oQHPFWk8Tjf0GA3YdX7na++U=
X-Google-Smtp-Source: AGHT+IFPiWSMUJsvLDsFUQKEPXeJtOq9dyzWbF9cm4SlPeUZQ8cIi4gauJvX3gywzP7yEJIBk1InHA==
X-Received: by 2002:ac2:4c46:0:b0:535:82eb:21d1 with SMTP id 2adb3069b0e04-53b34a3516cmr2517575e87.57.1730111171159;
        Mon, 28 Oct 2024 03:26:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:26:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 01/10] dt-bindings: soc: imx-blk-ctrl: add 'fsl,power-domains-boot-on' property
Date: Mon, 28 Oct 2024 11:25:24 +0100
Message-ID: <20241028102559.1451383-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This property lists the state of the power domains, indicating whether
they have been left on or off by the bootloader/firmware.
This information becomes relevant, for example, in the case of supporting
the simple framebuffer.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
index eeec9965b091..00aa0b8d8ea9 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
@@ -56,6 +56,15 @@ properties:
       - const: csi-aclk
       - const: csi-pclk
 
+  fsl,power-domains-boot-on:
+    description: |
+      Provide the on/off (1/0) status of the power domains. It allows
+      specifying whether one or more power domains have already been
+      initialized and left powered on by the bootloader.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    maxItems: 5
+
 required:
   - compatible
   - reg
-- 
2.43.0


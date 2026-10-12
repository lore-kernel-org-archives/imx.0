Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF425388885
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789946; cv=none; b=HXZ0wrDaXJmqryNMujuVg55SzcEmkqxNcyI5JDVP0W1frV6koZgHriSO8VabAsWLSB8dZCKBxBDSPoZEN0fxMQDzgd3fg73+TzCqHWZxtWdK+6V4NUmlSZ+TYGU0DKdue3YwkT2DP+/CFPbqfYohEYJrNTI97cPDUO0TeMytWyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789946; c=relaxed/simple;
	bh=P3ZmNxoUbI9OvNlf/NE0Ngqab/uhfNYGIV5T1StzbFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRFS36k5h6dk1fIvfTl90iWvj2XEWJMGicANC4qOD7KF1PToO6wccl9y8IVGOuwoJn0AStawu7rfDu27zkZpSlA+osOHTIXbThjsyoVCmrULyH16SUE5bts5QrmzpC2/FQAEcd3jGWaoimYq2QlqqVG+iTt6+kv4UjoSTboRoXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1QwVm0N; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1QwVm0N"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1458059f8f.2
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789943; x=1792394743; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0X2fplabp5QOh4xkFzr/FigCgPmHhH9f7OOGboLoAI=;
        b=K1QwVm0Ni/gFWbQJkpvfr/0/Fu+Z3ETUE4ARZgUBgDa2KkLzfnQblzEVxjHAqB2aME
         CHhwiCvByI4/tJ5ehUh1f4v8MSs8MdhCCKOJXWaZBlanh6hUpmVRBCqbVHgWEDwbVqij
         tzzK8jkudHnQBBaz7OQ7yPbpH4zeexe2R7nmPjjHdsiqZhNO/pQFxE+qXjAb4CMRuCb6
         gjVe8PjstoqAgv6q24IzF8S3o0T+UJ4vYNo7LblO7svBELdzDGavLcj0z7Cz5Iu/VhDe
         6iT+Q6I0J36N3jW3/N7mt+wtou5zm6m+joAbI6JDYWvk22xLOCmVRhFEpSpFO+KLPD7s
         SMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789943; x=1792394743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0X2fplabp5QOh4xkFzr/FigCgPmHhH9f7OOGboLoAI=;
        b=sh5w0O5l6HtFJAWWOuUnF76xj1/ZIfdvHE/bfCGGwcV9wf2mETAHLtD4pQjGFDwBYZ
         QiSVaQwErJdh1SM+cJ+JMTI8fmkZyxXH40nY9FIgZwG12uO7b/KHEjq450xiSy17/HDd
         4i/zuv2nzbfk8avt5qGk7rycgzMhzDK3hGtDciKOTWL06MDm+KtdnQjoI226at3Pmvw7
         1Kk6Sp8G5qlL9DS/nHJIiHUGFYpORIUWuh1oyCo/nxoLtdUo4U5SxDyNXK5AcEkkzbEF
         6q0qIHESTsXyXEVPVq0JurmBBcnI4XVRuVUebC+P3pNWkKJwkw5+3Kb/MLImuxhbNlnM
         gjfw==
X-Forwarded-Encrypted: i=1; AKwUvBxUPaoBD6N1ZVXD/p9+F+xechDPdwWGR+c6ZSZ0QmwwoMqxjw2KkZk7u/E+p3ltl9SvBXA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKN1iCTqW0h00e2O59Gso1npJS3V2IrDyaOwO4NvwwID2RuxGrv
	H0mJ7kkR6dDSwPVCzBoGaJHzcqEvmChlQfLA3p3c8SAeXyrc8MjxrYSc
X-Gm-Gg: AYBFou1s+DFbK1RsBqxL5TJlOGQWvp/ncsiiIwkAAXaUgE3bNepTOoQYcqsNoM/YO0V
	4xKxnqv10weJBQ6TPXEtnGA2Tv6JDN9vVqIStuDBSpyLGDex2dRA131WoigVHOmIBXCppUhA09H
	L+7RBBoinx7j6klcKYDioq6QSzJGHfo+P3JoFrMvzlj7qXdjYUzznMx0qc0ytwK5ZFw+aBfr2sL
	FQGsiTbR4K9Ko7rTOQO395nCm/SBEmRS0jdvvPCvj1MKPqKdUpo/xkBO9TzjSvTfL/qibeF/knT
	ghUCNjXrUs3qcbVmTZQbjNBkXdthxkhPJOgwAxXKoKTNoQsca13Kk8PKbuQMR+rgVb796uiPJet
	1R65726sEIRp6Hu6gof4Sxku0wNbbAvFkvl8kGdoIvRHSx/ANPaKS+qMWTwuKmvzGttMI5WWycP
	5+CArKiR0y18jynHNAxDRB8WQTQYMb/ppzWeWFVOQFPO2qQ2bqXSe+yWgey45Y+2HgLM99oGjzz
	XMfFxbBhxRDZveHdcmWQvk3y/NLnE4lLO7CZnTJPG2NSN2dcUXlX1uzKqYOwLAK
X-Received: by 2002:a5d:43c4:0:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-48dbaae8e33mr12493470f8f.37.1791789942797;
        Mon, 12 Oct 2026 00:25:42 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:42 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 12 Oct 2026 04:25:23 -0300
Subject: [PATCH 1/3] dt-bindings: display: bridge: simple: Add the Toradex
 Apalis iMX6 VGA DAC bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-1-8905d8746504@toradex.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=1045;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=O9xo6x/Vsususv0Ua2eMzb6/yhBucutOa+18ozmEW8s=;
 b=37sR/q4rsvp8/0G2BU7g+IBhwPmrrzyaZ1/VxQrnHcJjiWbLbf2XnbzLTPJEjCxDGsQuZuSjh
 HbRJlB47ZlZCC13TAqoR4wM22Qy2GtPBeeyW86uPQBEWd2NKM0i3WS6
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The VGA bridge on Apalis iMX6 consists of a simple resistor ladder that
converts a digital 16-bit RGB signal to VGA. The VGA output is gated by
an active-low data-enable signal.

Add a dedicated compatible for the bridge, since the generic
dumb-vga-dac doesn't describe a data-enable signal.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 7636c24906ba..a86231a4a908 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -37,6 +37,7 @@ properties:
           - ti,opa362
           - ti,ths8134
           - ti,ths8135
+          - toradex,apalis-imx6-vga-dac
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

-- 
2.43.0


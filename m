Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64684D8D94
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659482; cv=none; b=P4D2J2a6l7Ps+bfoBku2eQexChqDQKkMVkIljHZ8JfG/6vUaS7tHbTZmxxOlOEDKAHkME8jLAaFHta+7VO6+sZibmuFscsUDqkvZRgxtGTcKQzqZFNWni18FPVL3jJBJ+9yq6aRw0n67brkb8CW0lB4KPzR3qqGiA/fPMJtLQYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659482; c=relaxed/simple;
	bh=vsvztABr3U6ZwEr0klxubYysThxRTUKFsfzctGVfq8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2jNfOJLoboucnfVfha/izXJ5qOYOyHrR2wruw6IQji8bwmvmTjLbxANuzFK9oPr8uqX4ThrT7UY3qzLIBKnVIP6Fgif32q6DEwijNV3Q4A8UwPLO2qBcmvWg4GH5GgMMjpPbfVuXJuG+IKeYskm4cTGtakeIz7pwf2PD8JhKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yxc08zEs; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yxc08zEs"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eedc94d37so957407f8f.3
        for <imx@lists.linux.dev>; Fri, 05 Jun 2026 04:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659479; x=1781264279; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZJNSEfz3QG6ZL5qFVwPBISzyfCqVigytPuqEa8Po8M=;
        b=Yxc08zEsgax2zpIY3+1CgTTqyO5+XG3VpxLxB3p1VNDa+Noab9QCvc7wJJUff94WzD
         EvZne/p/1+BO4U6lgG287dMyQ1XfTCroJ5kHUc6MLu2V+eA3L4jUu3Nc0WjyBTcuVCdE
         B/QzqCfBu4wWryiWDTrTjgouy37IaRWz7actcT+hD1b/47tIhv2whiKe4oZMQGttUf/p
         3wpS4pT1CRbLO0yoJaRmtXrOjxZKc2FrbfhZq9/hTN0ymFIPMR4WMz2AvqHW0SJmKWEM
         LPY8UC1NV3vBs8qDEOavsFEdY5A0hb7hdKhlEBYhKNjO0KohXY430e1bGvAlDoQxh4xd
         aStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659479; x=1781264279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wZJNSEfz3QG6ZL5qFVwPBISzyfCqVigytPuqEa8Po8M=;
        b=YmUE3h9yVljrWEQX3pKmd38fgV8E8on71lM0vHu11s1jvxjUAiO/QJrWgJubpsQwmf
         DS06rCMVbtvDqL4JbGvAE+MFCagPnlf+5bOSkDD8oaK4Ij8L2wGFZ2ujiUKwVpLb9YY0
         lv0cpuh27MDjx1FJtFh3zbfdCuTmhpZCBnROr/bnT6sA2hfl3b8WAiJo/fqADRK8s3xc
         Y/1FsXSJWgY2BqhmCeAjqAR8AxcNFsgk2CQrGiaW2BG2wcZrZWAacWhmbSxpllJIjrNc
         bFHuP5nBWhAaGxTCLbWLAX5CNZnlQWw7Mt1ovQX4XO3PyrKRfrcbz+U5j9laJBH4zxTh
         /2Yg==
X-Forwarded-Encrypted: i=1; AFNElJ955EU8g7AazeQIJoj91JhlvsrTza/7eBiSBQCIxWqh2u/ylXl6tr1XJKcONXZpbjw20aU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw92v8GHxkP2A/1cpPVewltHjxzQWdPqteJotedrzdLouY/Layj
	UzH/+niIoxaJ3aanB58feeVbf3UxSGmqXSgopfhfk6OxHXiwa/5fI8xK
X-Gm-Gg: Acq92OGMCUTcpFGWz7qAf8zIBFHmpk4Zx0WCDuQ0qGyvBgc6WFz+2TnnS8VjNYvTCo0
	2pQFfeYvyi+8vHOvvUkm5Nbyi2R8ZdYNfZUDaQGAthg+fomh2+Kwlw+truWFtGig38vkOFd9dMC
	y/TEagUQ3NPam3i1rOg0OSqBbZQcQBowA8A35yaEnR7MbPR9gN01O7FufJtd7nkJCwu+5f4+Ckm
	VOYsoWEX+q3u3WXlNLZTcc+0kt84XDBwNMjQmv2695hTgRWmBxHmhi/xYY2xOv9lA4Kuia+ywcA
	MflpxUokB1pNnKE51Glxfg0Pbv5esO4r1CFvvHPnuSspC4MHHZ1wM8VohIMEn2e9QGTM9UuJL7b
	8OvatVINDlKokdDCTaqbg7SJYAMxmyPxoCQOKlEdWFfaHMJ8cERL9jRq8YZ67Xp1drusogmPECV
	Ch1Lv14knny87loVbR54rKdZcR9ptICSKlJJfXIHQfxF2CZlKuilB61PuTfh4l7MYWUozW498=
X-Received: by 2002:adf:ed0f:0:b0:454:a12c:6cdb with SMTP id ffacd0b85a97d-460304eb55emr3605857f8f.2.1780659478953;
        Fri, 05 Jun 2026 04:37:58 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:37:58 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document optional "memory-region-names"
Date: Fri,  5 Jun 2026 04:36:18 -0700
Message-ID: <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The names of the carveout regions are derived using the names of the
reserved memory devicetree nodes, which are referenced using the
"memory-region" property. This adds a restriction on the names of said
devicetree nodes, often bearing specific names such as: "vdevbuffer",
"vdev0vring0", "rsc-table", etc... This goes against the devicetree
specification's recommendation, which states that the devicetree node
names should be generic.

Fix this by documenting an additional, optional property:
"memory-region-names". This way, the carveout names can use the values
passed via "memory-region-names", while keeping the devicetree node
names of the reserved memory regions generic.

There are no restrictions imposed on the values of the strings passed via
the new property since the software allows any name to be used, with some
names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
special meaning.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..8e3e6676a95e 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,10 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+
   power-domains:
     minItems: 2
     maxItems: 8
-- 
2.43.0


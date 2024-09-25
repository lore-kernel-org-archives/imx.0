Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692BF1A42D3
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727306474; cv=none; b=TN+xjSIeHf+UA58rUUqGapm0CXB4njRWJU58MKyZ1bpoZbvrvqYsEHGYgYJQsKAHImxWz4AJM456xxqflFAeMYlyyGutjXi9aX/hAj8hJktbtwO1JsfFJviAAO0xfO9QWhfi3AGNs+cnpNBDECVlUJ+toZV669/lHo762CzA99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727306474; c=relaxed/simple;
	bh=c2sS4xoizsm3otwYaedSca7IFiwsMvhp6CH09ev/rfw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V1JKfeBsaqEBFCfdeJx5E6s4PfeVD7CLmoId58Xpy455Bm8DxAbUmx8YjNvQfT4KBjhXXzoMbCiZqqjdGj16sVFA53muV4KbRKX9VbCpvUjKlxmeVjei0RIv+TsnqGFxB66YD3s+rFkKGC5As3SnJRHvBXzhvE1bdkTjuvpj928=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckplcKZp; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckplcKZp"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8a7903cb7dso23849766b.3
        for <imx@lists.linux.dev>; Wed, 25 Sep 2024 16:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727306471; x=1727911271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXmHQiif1/lZ9e9bTSFxlQYjcfk8NDtEcw/e34eAG2I=;
        b=ckplcKZppPrhCtTZlj5A7lWa1+hxa8EDT7sbgmQf2W9asSd5toclR8LjJ3C+7AyGkf
         nl+ffKG+5jy4RSuMkP+mKL8zHLpLJeD1m/4s8TZWMm228Q+oQSWNfMBwvOfEt7/YpoNV
         7QSRPcCbVt4cdDh3TOeiU+vBRXdza1PN7vaVrkoYifmsVYkTrJOeu4vXSD4vPHyLYDJa
         u89ORqw8+wnWX3Fz/QdOETbJG21yUQo4m2ypbeT4CxFSbW3vVkg9+SiU/rSQpFlLmIek
         VVlx6VNT75DaGbHPGzFC167DZaBAg9pXPi8zBING3peuUfBSuEylh9/URf1KzqX+6cgp
         +wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727306471; x=1727911271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXmHQiif1/lZ9e9bTSFxlQYjcfk8NDtEcw/e34eAG2I=;
        b=wnmHCNcVBJxb3tFd+aSSTiJOYk3krKi2/gLgBUplgoiWF+oos24Nj7bfNM3uSELo+d
         s9q4ffiBBBDcv9OXnHU2BIVH4rOiEvaouGGJ+ryoJ9KUUuerx9d2Xe0UeS8sg3yonWGh
         s/yMfSzQskIh4puERRD7a2dw5Xm5Quybco8kvdFJlNPdBAAPQtP0600jR8qJ+Ud4pOF9
         JrLZm7b9MzEGVk+WdYV6vPsTQ8I80xp4f0J3pgoBkKDQgT6TElUmL0dpgoy5T/ynHvXZ
         Cd/YYd13CTtFTV7QHK3NKpMPWQRFXqkquoF8pNqVpANxIz3j4Tkr3RSa4ESoImOVgUvS
         QB/g==
X-Forwarded-Encrypted: i=1; AJvYcCVsAUnqPjNgxhkZwJKDMZBLmqtO+E1gCMwqVFPc2whxL8eAC7fmfcMQxhwSk9ubjyK0Fl0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxBSZC1pZAm0Q60lzdPTsSvjcpqGGA8PFuPpWqd8tFQkeX3XP8
	t1TUGdintqekJrqSgqLAsUjp84g9sAvu2SpiWGfBZuknSk1ow6Vq
X-Google-Smtp-Source: AGHT+IFurIPGcn3OINfKpRW1ac8UmQhuz6IAdsY7IhLNLaWRW5DT3OY7ioHFhjittAMJtgpcbCsGUQ==
X-Received: by 2002:a05:6402:4409:b0:5c7:1ed9:aab7 with SMTP id 4fb4d7f45d1cf-5c7206120c4mr4095600a12.7.1727306470374;
        Wed, 25 Sep 2024 16:21:10 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf48c315sm2481026a12.15.2024.09.25.16.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:21:09 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/6] arm64: dts: imx8qm: drop dsp node from audio_subsys bus
Date: Wed, 25 Sep 2024 19:20:06 -0400
Message-Id: <20240925232008.205802-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925232008.205802-1-laurentiumihalcea111@gmail.com>
References: <20240925232008.205802-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

On i.MX8QM, the DSP is in the VPU subsystem, which means that using the
'dsp' node from 'imx8-ss-audio.dtsi' is wrong as it's placed under the
wrong bus. As such, drop it.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 3ee6e2869e3c..f8b577ebdbef 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -603,3 +603,5 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
 #include "imx8qm-ss-audio.dtsi"
 #include "imx8qm-ss-lvds.dtsi"
 #include "imx8qm-ss-mipi.dtsi"
+
+/delete-node/ &dsp;
-- 
2.34.1


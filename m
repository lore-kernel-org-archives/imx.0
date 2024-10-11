Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22BA196C9B
	for <imx@lists.linux.dev>; Fri, 11 Oct 2024 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728659161; cv=none; b=MNV/+tEVIUphHm2hxnUSNTnd3swUHR8krh6UN4nEPu23SaAXVQLtxh4SeIFE0UXTivnBZ6/kw6w9+XmHMGRysXckUyUS6c5SOFgW783aeHdnx0xdBumoAEYSPefamOgqDIVbQrqzboRb+2bgpHCZ99gCE+5HoWe1X4nMmMwz+yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728659161; c=relaxed/simple;
	bh=c2sS4xoizsm3otwYaedSca7IFiwsMvhp6CH09ev/rfw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oNxqE6fEWeWvYGxpJX34/qFLPiGXZ8RkYaa3+UOixHo7oSOkt4EszHHWOM2Hqmifia/Yk1gJeXFRsMSvYg3IlfLdFpTKndHOhVn5ALdyFxI0khhV1w+jMKDrgudy5jMM0dATNP/PKqq5Y9nQXLDHencaK93PVQV45idutqA+OMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnDhVfoU; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnDhVfoU"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a993302fa02so334862666b.0
        for <imx@lists.linux.dev>; Fri, 11 Oct 2024 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728659158; x=1729263958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXmHQiif1/lZ9e9bTSFxlQYjcfk8NDtEcw/e34eAG2I=;
        b=BnDhVfoUkrTQlKEBoSZ7EO5X0QgQVUrTxM+qt6714wN/a+7NwnCTMDulshFLxzn7hY
         suWi/ozaZ7oiZgjk+88WPL4L3kE8Z0HEU4Siv6WZLItfLADUq7pcHyKEdmV1uerXOyOE
         ZhKiyR5vLBW528wFpUZtMLXW+RKIkAmTaOfYoYIZ7/A+JP8y0YDvV6nlEmJsiDgz9af+
         QymbdEsM56rIDKzDUEkLFMLiVtfZF5DWyeRDKmr1/UI26MtFJOxUOD65bFFTGHuCy4eM
         wk7PZiJ7i0hP1e5fK8skjh/5D/4qJPkZdFAcmDGm9KResH+wP6QwyEbS334Ps76S8G9j
         ptuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728659158; x=1729263958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXmHQiif1/lZ9e9bTSFxlQYjcfk8NDtEcw/e34eAG2I=;
        b=szk3WKFppz1/oqaBigDWKp5mBX3eYeu3AA4zy5VafDLeaD5uN+wgs86Tk5juqxDU1E
         OlDbvULpCYNIwXtpmOi3XSofNpSKT5aZmJdUD0Zm2E2uiBDo78pnd8nQojJu+yuYfzJk
         /xUn+iejNqzTLESXMm849WJH0/FRlmgHIyFcYYe7o3TQROIliRsBXbSyI+4EtUyVguNt
         8IJCk2eRYPD/JhQcXUW9u6WRKFZgMCEzFrikopsEzPdBr26y/fKGiTx1QFGuNqHJp1YK
         cYtNMJeb3AhKYYVJ0pLCGYgDU+1qFYB2Bz7NEF4JdXhDjNVyz0oM9+OrCMXHZOf/JpdC
         QIpw==
X-Forwarded-Encrypted: i=1; AJvYcCXVdv+A7WICVaEM38bFakf5TXi0JyJNGfyo1+ypp6e1kpJhdlosZucgw7nQ/TaP1xC6kwU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa0fpQyLs9c+uWxFqgmNPkBPrqZ+57JpZ0J/dlzM3vZny0dqow
	bGWvkKEzWdIJS/TlI9Nt83hvy8H6IVskmvE8WYs5XF8HUqyCn/Wi
X-Google-Smtp-Source: AGHT+IE8XXFizK2sYPaN1979Tdw2qPZdoWcRjlcOePrjnUpkAGWIvpzDhatpjh6L+W1+ZGUR6lY0Og==
X-Received: by 2002:a17:907:6e8b:b0:a99:a48d:4470 with SMTP id a640c23a62f3a-a99b95af2ffmr202294866b.54.1728659158136;
        Fri, 11 Oct 2024 08:05:58 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5b0b5sm220879366b.94.2024.10.11.08.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:05:57 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/6] arm64: dts: imx8qm: drop dsp node from audio_subsys bus
Date: Fri, 11 Oct 2024 11:04:37 -0400
Message-Id: <20241011150439.4027-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011150439.4027-1-laurentiumihalcea111@gmail.com>
References: <20241011150439.4027-1-laurentiumihalcea111@gmail.com>
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


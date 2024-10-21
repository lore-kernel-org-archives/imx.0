Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7BA1CDA31
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525990; cv=none; b=P4z7XV2HEU7z6ulJxgzI8FEJ/aJfbT6/u2KGZQJIufc3wGpVmoI88CofGCFuPAAbsz3xNAt4A+Q5mxjiDLTzishGWYkIMk1G/JqIpWYbSnp7KsO9yYgi2db3XL0uU8GzgD2lJ+FpK07ZBf/Hvl9jtTv1UoMjafh+6wPVm1GT9Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525990; c=relaxed/simple;
	bh=8R+zVYCQ0RWA8+jdszP1DwcyZb/7p5o1Bnpx7gy7wsE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ejpeBE6xvONAwoNv2pqNcaJt7vQCyLYSHQqyGNCl6wuCxmVAEO+TYLAI0j+p2mgwdI+ddnPg+imQJkDnvbwwxNjdIREhJG5ZLRp7fCdRUpCTNDPTrKHRDP45ZxOtWPleEbyh53h9SH9cb6JAQBeyPbnZktgzJ/gQN514bBMNyDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQSg4bmk; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQSg4bmk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c99be0a4bbso6273630a12.2
        for <imx@lists.linux.dev>; Mon, 21 Oct 2024 08:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729525987; x=1730130787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTflBq6Wu+WzGzt/MtvhqqnQ6l51cdQmFA1c3BjJmYU=;
        b=NQSg4bmklCoNaAaEn2UjJtQu6qoBTVhobKD16dlzswRgxFEcsAach2gjFIY1fCfaaG
         shfgKNRIPL/5uDg2Zvxfs+zEbzBK8f3oCX0tKjPHw370ZVBdtf/+CPwzEacmJFe5XVKv
         4gHbdNqd6jUW4OkXbIa7RUqsMJwo68wjXJd511iEWD0wkWvTaJxAm6+l1jtPSZfUZEeC
         q3r8Dcgzy9EfSu1shNS7TGGYWhdfoE1/Zm8ZZgMGGjOu27723PlDjhI3ydVJn6xQLSpg
         tX/qB1dxgm5uUGP4a9muAY3Hy3uVfMxj6M1f92nD25gHXh+QUS1hfcoaElysq7ecP49Q
         DDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525987; x=1730130787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTflBq6Wu+WzGzt/MtvhqqnQ6l51cdQmFA1c3BjJmYU=;
        b=ak2py5RT6LHC8FppyM8HYkLBnkm4YmzdQ76ukWpgvjd9fKkGFgi+jdBjBu/s5QgjQ4
         9HXsxkx8oC4Xn+CmZVzrin4IB19DV+s6cRebzLjF2w44nnzm2gKoAaVKU+9hXSN5zc72
         njEnjfDeZEj0qOaQIJWoFyj7RLUwOv6AcZtvHGSiTu/ZNWDuyNb+5LohXxPoS8zaJaII
         /4X+dRrzV9Ud9vhZ9190dg9vyddj+c3iA044CPSVz9T4v+PwJNUYrI+aOyyX/67J18wz
         fpT5N5AP+g2VoFYn85PJ05ddwVqKXtDwIKPhCqAyATTdzUGQ6sU0hAsnw3TzkHiu4Upr
         2Log==
X-Forwarded-Encrypted: i=1; AJvYcCXvcRHSi/kw71AuX83pCQU9okQGn953f28GXxStGFK5Q5vvHr9GpaZ+OjhXCYcTsHlGBJg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvFT/iAtDKKQcCDmA5r7wUqqfSQf0M0J7hTzn6CD6WCAQdcElF
	bAQZf/hfDyUAZ//kNuhG0BQNlo+q2gRnKI5sGv9AWaNNUU6ykquK
X-Google-Smtp-Source: AGHT+IEChIjZGjoCGqr943QI0nBxeCsGg66mphofROWuAzvsijseO6Jj5mGOXrTZJY/QOqHKNBN/6A==
X-Received: by 2002:a17:907:9725:b0:a9a:3dc0:8911 with SMTP id a640c23a62f3a-a9aa890a26fmr53497966b.16.1729525987013;
        Mon, 21 Oct 2024 08:53:07 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912edfd0sm218614366b.67.2024.10.21.08.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 08:53:06 -0700 (PDT)
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
Subject: [PATCH v4 4/6] arm64: dts: imx8qm: drop dsp node from audio_subsys bus
Date: Mon, 21 Oct 2024 11:52:19 -0400
Message-Id: <20241021155221.112073-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
References: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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


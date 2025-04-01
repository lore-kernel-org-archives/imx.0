Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7287B7DA93
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522786; cv=none; b=q8bHIADxFtly5D7tgoO8RvPC+nS8wc4+jf4A7bkHQtMy4+ew8tKvBoH6dpop+aVjPYj0uGg7+vFkzWr0bsHnhPDBLTmnbOShAui7h54vzP2Yfn6Q79mJcmaY4EjoL8QozmTJ9tTE6tFj+2OHiSxgUaOJ+wJAAFYNmoS0sXss3T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522786; c=relaxed/simple;
	bh=q8Uj41nPJAfO4cLbFQrSRc9hjdT/n0weZ8jWM/s+Oa4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i+F3725rZCP/rWsC8OmbxboySwOCq0gjSzJScXhU/wU5dok57DpnSVInKrnG2nPu/0YyIrluhsxrUpevewKRhKrXrQ7x0zTIs7PV/UDlypj8TQDEe8DSHvTREaHsL1FqHEaquurhU2HXo5xR0rcHuZ1RM4WllhMhWqv5t30BsUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E18FqEc9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E18FqEc9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so41410045e9.1
        for <imx@lists.linux.dev>; Tue, 01 Apr 2025 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522783; x=1744127583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kITiRQQrnD33DOiE+C+JBAjD6rrVk5TPx/ro5x/mJl0=;
        b=E18FqEc9XfmxnXQ5x+vB/M+Vqb7c25vRfZf0/1PNiieK/sTQcAWYefOhhgXJq81nX1
         urU1iizj39eLvMW/3dadEV3hyMPx02pDyqMfjxwxwaumM3bosPHdnmn5Rtejb0nZOFIH
         nLqZ8VnOf9kTMMlRWgdjWhvYXrDtCeUzvV/D165i3zT4WJlPzpma7mrIYGtPJdB17uD6
         jtg61Qeqt8c1TRDLJry8txiAAxU0c4iI/vMwpBu5BlbtoDR3+GOFh8Icl7FfOhC3kQ8H
         DZcwoFztujlrhMXyCMTkH5wiTCwJp1/gaZL97bLDXct9NY3OJd04HVHVm34Lyge7I4C7
         oM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522783; x=1744127583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kITiRQQrnD33DOiE+C+JBAjD6rrVk5TPx/ro5x/mJl0=;
        b=wR9cQrMTtNGPB1hpoDn/2vu8XjL5hX0omXdUggxgR+08slZqBdD+dQT2MeDToD0KYM
         Giowa2lgOPitTyguxK+lTOwKGXwAfVWPU72bcT/ILQqayXu6U9i1FN2gK+fBhSQV37w3
         AHI7iyuQu2RlOPc4DwU1EoRN1kOU0VALFdxYfoNlEg5PEpi870f4/nHPGCzMpBHesRMl
         r20jx63AY+bIu9q1we/lTrXWpaHKJSKgxXe+gNaRgj77LywQWFNZFNWdJ6a7aiIB2vSi
         1oJuuT1yF2PhbkvuVYYiIMVAuqzAILKVhj0cobRMzzNE+W+hM+ntavT3WP8l9Rj9kDgk
         06Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXjvy205dr2P0MP65/xZt6S8qydNE42qB/PPF7FqeUY2xT70BbSZRxCdLRjpypf2ZlfC64=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnsla/Ba6ZTIze4ZJsQM9inygFhZr2o1al1NKEPgIV43TueyUL
	IWtK3dgSpNzdBaZSXWYokY2jBn12Or6pTlv2tnZNzdDmiEbmoqFP
X-Gm-Gg: ASbGnctKciGeFzpFnQ6TeGMA40tUMMtP0QfJimaOfYZSlwXKr8nERjMwxFkW8FStehc
	cJJ2h3Kd3zFfsY9JC+y1CWrybdElPSDxWVn3L20eMbsnKSjHihAtNRYCrOSpzsOzXohdaJGUMYh
	aEyEMwmK7OljqHabJ5Dzx5TdllsEGhDM/E526inSPhX//nhgUU5L381pnM7AX6VrVr77emTuxwr
	K1tVQo4glNmqdWK4jZhDnHbDD2g252Pxif9G+jwMqmdwIcbMQKqB5zWQlhDYMrG13NPqB8+cksf
	XXTMvc41KIS1dIVDgiMk7C9ZtdtKhGk14WicnlXiJv2wfgRr3Y4+09G34Sii+N3Lv2+w3rDowmp
	xfA3Dd24=
X-Google-Smtp-Source: AGHT+IE+beBF8OgJ1mJr6OkCFfzKqGsQqpmFHMqJYTzDl+77IV2PROx2yo8oGc/N6za9BEbNxq9Krw==
X-Received: by 2002:a05:600c:4e12:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43db628c48bmr110750555e9.21.1743522782395;
        Tue, 01 Apr 2025 08:53:02 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66363fsm14938762f8f.36.2025.04.01.08.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:53:02 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8qxp: shrink dsp reserved memory
Date: Tue,  1 Apr 2025 11:52:44 -0400
Message-Id: <20250401155244.46239-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Shrink the size of the memory reserved for the dsp to half of its original
size to avoid an overlap with the 'dsp_vdev0vring0' memory region. 16MB of
reserved memory should be enough anyways.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 05138326f0a5..a65c5a2c4a81 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -185,7 +185,7 @@ decoder_rpc: decoder-rpc@92000000 {
 		};
 
 		dsp_reserved: dsp@92400000 {
-			reg = <0 0x92400000 0 0x2000000>;
+			reg = <0 0x92400000 0 0x1000000>;
 			no-map;
 			status = "disabled";
 		};
-- 
2.34.1


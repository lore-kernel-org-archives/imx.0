Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACC7419FB2
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140057; cv=none; b=UCEjcr+n9YJ2tgx5cJ9bv6DYQY57BY+mI/xQqJwj5QqBftd74JcqoUkVhIIfy9KT1DhjtRS+9wXGy/gppcqcVIEFK/LYmRJm2zbNhaxmJKpQVBR7bY0zgX/nvrpcX/GTndNpn32YpKcw04RMcJgY91gnsN0qC0X8+y128wfSGAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140057; c=relaxed/simple;
	bh=/RSt/Z9l08XWGAu8OiD6FhRMw0al1LqO9ERAn5dwGqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnWDdQnNW7WAWZ+hPiipbt7Psp0/BHyaD72RAiTEOrScjbl9qcYWb9oCPaoN2LkGxoCTMMXEYqs3Wo308gfaL1i13ZK2aXNr9JI8Dkm7jDQ60COwgc9B7zvsuzmrxn2TQikS5eOIpFd3kyES2pU7UYZg1P8QGHON4v9vWttsv8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+9piyVl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+9piyVl"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c45111bebso3931342f8f.0
        for <imx@lists.linux.dev>; Fri, 16 Oct 2026 01:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140054; x=1792744854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZnpEzPR/fOj0NYp4YjGjICk3vVhGUGABaDpW1zvNrI=;
        b=S+9piyVlIer6yDlRRiZvcxTW1092ac9uw+z+BrIzyeO+pwdgLr5BJapM1awwbuhICb
         IHPERMiFQ3AsYtdcvIfeKTjcpQCUDX+WyHeAMbwN5okcgxye8k+GhaB1ee8oiRmHbxA2
         hXMLR9XJWkZ+3lEFjjPF2JYUIwNDL9GJOtFHNW9WNpHepzj9LUbrRo//i+Mq0sd0DMjL
         Or1W5AyoeOtN9T/n4FmoGKQ9cZ5qNO67XjhyIwk3rOBh0Z64g84WV+dzhye/aUAl+ebH
         R5SJp7qd3Y8DeanBGhmGbohDCc3eCn/xubvcnEZj/DpBwQ2XOGU8B8gywkixrRHH8Aol
         7R9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140054; x=1792744854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZnpEzPR/fOj0NYp4YjGjICk3vVhGUGABaDpW1zvNrI=;
        b=kA4ChOj+xPwXk4/stYR1NTYX2MJXYCZspSUaHltYVg6Po6LlL10ewTGoHhm6PxMkVY
         MnQ4SHb3iql6kVkv7aAW7pRAlc4Qm5oB78V6dXw3fVNtnXGl8GXcHQRHLcGANOFpnWj3
         h0dloAkJJEmAupV6XcZwfS3oNl8EJdbAuDSfKuKnb2cW3Nx7fSXexJ1EmTf8F9iJaSEx
         MHM3tRb+AOdHyEhObydhMktvRhEMKqnP+TK5TWKFdMwYcg1GoXREf+CvO8EplbXUeb1m
         E5GxhLQQNaO4exeVxprCrvBYVaTbJtjbshc/dK97IM0sXSuqWz0UDvSRNZJ6ApXR1Mcf
         aAEA==
X-Forwarded-Encrypted: i=1; AKwUvBz9rr6Gz9HTrA86wGj7MywG5RuebXFGdgWIvmoyIurcwAU1y5FTIDfe2ZqFSYpICDfxlzo=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ8yj/cUap1dgIIDwLbWJfEBf2jqg/MgklUE9gJWB85E5GHTGT7
	4ekxjKog4Psv8lLGdn9/GgZ3a7AVyoAv9aSqPQK1YbTlkqAXEgIiVxwC
X-Gm-Gg: AYBFou3nZsJoQtD5rbQI47sxRAUEzG9E9sIGkrAXfXTcvQrZjsjALyvEDL+0igCeGJF
	4yoTrD738h9GxO+i+3VUhyOY9xX158dCbBtKBBWMH6pdYKE4syNIC808IUR5uL4lFoYGUfKNLfv
	1MysP/nw3LUEEpkdMvgA5sZErDL1WnCZBXG150QSD1axbw0uhmH6Cz/5NWophNsgDg35yWOd9nj
	r1Hnn2vXEizC/Eh6wVMIwWFogxEDR8yfQzIDkVYwWmCm1oHISKnlwpLpzTVElSHWMLzLmP+t7+k
	YNPKL7hWuoL7cF9KQX1Afl3t+Ue9Xpp8YA3y9KAhyhh3fexshi09xZDKinzMSc6xC2SaEMjbJi6
	phaqXO393r2zZifJewlV23AGewo+o4bLK2U6DVY6q8mbowHq5szhJvTV1RErtxzNejhBO44ONfb
	2BD/dNzLh5FCPzhNkMdxyOt4/xVTGs8WzgaHkBUWSxGACIQxyd1sdM4hEYejjvneJqoZ/Kls6oO
	sHP3mIfv5CxbMYNULBKbGqpq4ISi4on6H+jCCVrl6qfmVtEjxXFDQ+5r1SmY+OxfcfF94gfJ7q7
	VM0upvPmTsUCZGuEXT0OPQ==
X-Received: by 2002:adf:fc09:0:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48dbacfddb5mr33079053f8f.51.1792140054238;
        Fri, 16 Oct 2026 01:40:54 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm3715233f8f.45.2026.10.16.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:40:53 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/2] arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC input
Date: Fri, 16 Oct 2026 10:40:10 +0200
Message-ID: <5309337578f99886c804c8e4ee82643574f1c19c.1792139809.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792139809.git.stefano.r@variscite.com>
References: <cover.1792139809.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The digital microphone data line is connected to the WM8904 IN1L pin,
but this connection is not described in the device tree.

Configure IN1L as DMICDAT1 to enable the digital microphone capture
path.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c5f0e22f549b..183b4f7af009 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -300,6 +300,8 @@ wm8904: audio-codec@1a {
 				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
 		/* GPIO1 = DMIC_CLK, don't touch others */
 		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
 	};
 };
 
-- 
2.47.3


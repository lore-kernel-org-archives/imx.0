Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FAC227B93
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739811653; cv=none; b=u0fgBvgMIxACe8V5AuSHNAPv8tec2uES00tDgeaD/AJtB4h1nBAujEMtezdEqDsBZwblfABNyAY/kl7oebQS+2pKGIL31uF4GHTUfFMcKtKL3nnmyLQN9nkcvig5qLvBQ0Uhgtuam88mjpk2iK29VamSbHsi5UrBb8ol+/OfyQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739811653; c=relaxed/simple;
	bh=8lvI2yFnrYJRTGggEjXBozhmoglcaIO42lmecjx/Qgg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B2Rt12QFrWTjQrtW4Z92ugmk15ZYeZeOD5PhLGlM7CrDnv/uYRJfbWZWAhp1Y1WJLA3wP6z1A/UJXwTmgOQC7GFX8Vg1lDoiASH/0uEandOygFscbyiIIV8CpvXFM8pK65i1nLjueXJifFgQvHS+guLrrpp0FijysgGuF9iDfC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEdYlSJj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEdYlSJj"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaecf50578eso898236566b.2
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 09:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739811650; x=1740416450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgtGSdqBANC5sTmLJ1PkHCo8fVQkG15TwN1atvXCByo=;
        b=UEdYlSJjFkbHtQdcrFib/ncFRybDPrWJAeMVfnwOjjzLdIFgonfuWj4TruPjZ6oEsb
         t2ADUUhgODAIxXAK1YGwi8HI8TJOGMcU3zxMoNocxhClh+Be2pvtjbcFwuwoe0Ewvc8G
         Xt9XNS81lbysuMMUkyhx9YX3Ot5TA5tYP2CmBbDlQzTBfJpqKnu1TtvDlJ7aWNVFRXwc
         1fySEOAJMZQAK3UPVzdiw9HxFzbMVojgxfrxc3Khb7jIEoD1E4F3x+eaN0WT3dZJ/Y6u
         MnwiTBYop086A0YpFV7wUlPxx2QsKN58vQL7dHXylPinDQ5U0mc7sHGDLhDcDeRWJBCU
         lUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811650; x=1740416450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgtGSdqBANC5sTmLJ1PkHCo8fVQkG15TwN1atvXCByo=;
        b=Ov/PCWzqR8NJEqmB22p7Gfbgy7Aa64/e9C4LQ2qX2sjksIlxKHpJ6uKdD7ub0YF3Jc
         VVuWRxx0112IL0Op9MOjAvzED6kzOTzCWPFpeSQ4VcGF06iiCGU6slFBslc05LjLxI+s
         vBNUjt974UVdNJ5M67BR/04ALXTxEe5HGn6RLphEGrbDRpBQW+pRoPedh321WuQ3dZ+m
         ChvhHqGp8qAMwXOnIwFEB4NMLbyFSqC9/1hE0rymKUrqcPaRuhQmOkaE3hcakXmv6F9Q
         GfYpNvV/jidqGH10epgsClNt2Y0kYnL5cDbij3IKEtV4EBgCfNFak6PWXGvyiIprUzsD
         CEAA==
X-Forwarded-Encrypted: i=1; AJvYcCXNl5KKu125G69vDKqMPSqa9ck4IfHxxd/k97/D6OUVblNoTc7KukYrmbzI2+i/O26sYLc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzM1IU1lrtC0R+BzbhuGKiMarqNosw4Hh6N05CumYPRD9lhKTMo
	0FVvA1aEuztpSr6WVAJht3e0fUQFWMu3Hz62BB/qjpw2rriT1noG
X-Gm-Gg: ASbGncuyVRmVTzMWr5CWrGxjXf4nkBhlustrENOVxrK3Hwnh3gm5bHT08J5RE6GdBZr
	ZLcQtOCddAK0fOifqNf3ZQauLa85TDERTpfTsOjLPBPyuME0xxL8eh8k6+Ecu/xhXAX4sYCRw/w
	YrjxLNb3WsJGW1Der4021vvShG58MCnjFyJJp1QnboNqiN6JuVEIYjEazLdA3YGb+ASlQet0Z0i
	OPtMDcjLYnSJJikGOZ7CdDnpz4Qbt68hanqTkoLjCCuTpAjCSOsWkb9VcR14KfxlCIAXLg719oB
	qs2NS6is3cihYai6JIRuVEgewLx+UBNAdfBzxxWFpaB6fFt6T1zn7A==
X-Google-Smtp-Source: AGHT+IFdMA0w4kBmGqa/9HtjcxpzNaH63DP3PJYieRpyn4W6ybrBgVCEnM5tX1Pgqn/wqOOzj45jOA==
X-Received: by 2002:a17:906:f0c9:b0:abb:a88d:ddaf with SMTP id a640c23a62f3a-abba88dde9cmr269033066b.55.1739811650253;
        Mon, 17 Feb 2025 09:00:50 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376aa2sm920570766b.103.2025.02.17.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:00:49 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
Date: Mon, 17 Feb 2025 11:57:17 -0500
Message-Id: <20250217165718.74619-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
References: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Needed because the DSP and OCRAM_A components from AUDIOMIX are clocked
by AUDIO_AXI_CLK_ROOT instead of AUDIO_AHB_CLK_ROOT.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..86c3055789ba 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1619,10 +1619,11 @@ audio_blk_ctrl: clock-controller@30e20000 {
 					 <&clk IMX8MP_CLK_SAI3>,
 					 <&clk IMX8MP_CLK_SAI5>,
 					 <&clk IMX8MP_CLK_SAI6>,
-					 <&clk IMX8MP_CLK_SAI7>;
+					 <&clk IMX8MP_CLK_SAI7>,
+					 <&clk IMX8MP_CLK_AUDIO_AXI_ROOT>;
 				clock-names = "ahb",
 					      "sai1", "sai2", "sai3",
-					      "sai5", "sai6", "sai7";
+					      "sai5", "sai6", "sai7", "axi";
 				power-domains = <&pgc_audio>;
 				assigned-clocks = <&clk IMX8MP_AUDIO_PLL1>,
 						  <&clk IMX8MP_AUDIO_PLL2>;
-- 
2.34.1


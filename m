Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DB9350D41
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700124; cv=none; b=suv/ZVl2q/DE2vIS5XhFfjvcpgDSRtqX3uxmamMvJklynVHVxBPfxnAW3EEN/ZFU8VGwJkL3Pnwg5lMHyY3nYZzP2NyrcMxlni3Xwv/z8y1a+GXL9T5Le0Hop7wpxCzQ09/C76Hs/gvCn0TanIB3XO9K8NugvkH9Bd5ji8UsKGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700124; c=relaxed/simple;
	bh=y613Fibuye7rvTibD+68qb4oNwl+ydXU9k6h+6Dna6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xz3DAS+fd3ER5yOohTE8wRb9u2YM906iXh0CPjsY5ziWAOePTUkxusP4xVGpJusZz4KP+3OJ4EYgs7QmlxTEzBMKjyMMqJF84qW8L4MaWQ3FHDT5IExqvKaXnu8PICPRmS3ZXckqTPZAzaZ+MMs4enjQPFlXTbC/5j2e50Z4wyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKLahOs3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKLahOs3"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3c2db014easo398813066b.0
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700121; x=1761304921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07Toi2vUIU+MWGlot8kMIQ1ee07JBmL9YfZNkL4sfI0=;
        b=NKLahOs3//rZMuJgszjUBIh7CqeSac5RMOQkzEVxHQ9xxeTbAfGsn06+E7QQqeUopV
         yGmn/DwwkCdM1L6/LwRtQIXUzryIK51jb9OjtRdDnpTk1ebJIdc1JLhThahgQUvdweaW
         2/JwpSNt2YVFFWUeah5g+oQnrTFqK83k58s7gDpVL3LQdv6SXwU3bs8KelzIhx3pKrHm
         jnZ6GcYMmrqUG8Zv7YG8UNJ5uX5O3uhzKMQoztRS8yXT48+XmdUJMbidXGZv3p/2wpMy
         jKWEFPYpjbeuhJJerrrKFE2LSEPuvrt+z+9/AWK4S+jghY9jg5h4D/Rr1+6A/YOTA/T0
         54pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700121; x=1761304921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07Toi2vUIU+MWGlot8kMIQ1ee07JBmL9YfZNkL4sfI0=;
        b=OEq2pcXnYFCMBcXx59Qx0Aor3JL2nzMvOKqrghX+S2aZ+FZyDIPIHxCMfQsTAYYIH/
         MsEtqD/29BVFndyLmAEk30TbAUb2nP6XzSmmxLspRm+LxrAR9fBOyJ8RUpSrmvMyBMFa
         mtO8C2iGmLMP5pswlzy+8wfgKAr28EmMTzIALfbBPaH5a8lbzHGw38eyURsxigIg3pTg
         6hUUTpEAB4fSFwRyAfyRuriWlzmgY0JDJGuAhQ+c1Pu8J2vzctkwAGU/+9AdHKCqJATX
         d+d1Madj0hEqERFt8mMTeIBdRPQ7waslzaSQDhd/QnQ0TIoWl1Q+7sUcms/eqG4maKWI
         vRsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6JKC5hJwSfEFdNncAIzvFAJCSsGb5ctih5eddoSiKXJ57MZRXMSWzHayFhVhmSocScf0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxT0/FN8MwtsehhYc+VU3trbcPb6RiYsrJ/loLvjD+hzmOY/bto
	4qSxt/qMymr1zF0on+5JTPloaLR0TDHYo4XEUFAAnkG8xr5QcKzrM9P5
X-Gm-Gg: ASbGncui/+JcV3hSQ5nC6ZrrTSIIZFdJ2D1VtW5w8DrnAW/Z9Z/Z4acv/AoYqqZu6RE
	UCedm6BDOZTwexJRrKrcTZl28VmDuHkiwHWhBsOaQHSVrXPxZxL/xp/1EniyNXewG4wdR9Tlg3P
	HNcSNkykg+e1LAjT49l+ag/kfvP6NM3kEt9CnQOS5KB7zi8wNHBABgvaEBAe3qTcK56nfP6ZuBC
	+fNi/SEL1TOoRop3VQlSkjtuf1vkYy97OViZwi4SWe2NiqSlJpNgpF9ouAioyNaLY5Ma8an8L85
	+18guusTVgPbcrb8tgrubokMp9cgGt5KGNHYqd45adGzRrJTKIGqpiStubjKIddVXlxltwOV5Ez
	mcc+wa7BUN4veT0g3Q6K2RDlRyZMiVsHXE5du0Er52VVTQNQqmdiCKSEvzkO3NyhXmZEMCsmlpo
	wolA46INNnpcOEBsZWCg4JKRewPhj/3nYP8GfuMg==
X-Google-Smtp-Source: AGHT+IFm4WIQFISVomrAFV51FZBLIpyrii3K7EFFJhRI3QtwYUrQCPmRYno3c3emRFDyrsQdPdKFXw==
X-Received: by 2002:a17:907:7ea3:b0:b41:873d:e220 with SMTP id a640c23a62f3a-b6474f18597mr313933066b.50.1760700121004;
        Fri, 17 Oct 2025 04:22:01 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:22:00 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 8/8] arm64: dts: imx8ulp: add sim lpav node
Date: Fri, 17 Oct 2025 04:20:25 -0700
Message-ID: <20251017112025.11997-9-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for the SIM LPAV module.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..676535c3fc84 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -776,6 +776,23 @@ edma2: dma-controller@2d800000 {
 						"ch28", "ch29", "ch30", "ch31";
 			};
 
+			sim_lpav: clock-controller@2da50000 {
+				compatible = "fsl,imx8ulp-sim-lpav";
+				reg = <0x2da50000 0x10000>;
+				clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+				clock-names = "lpav_bus", "hifi_core", "hifi_plat";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+
+				sim_lpav_mux: mux-controller {
+					compatible = "reg-mux";
+					#mux-control-cells = <1>;
+					mux-reg-masks = <0x8 0x00000200>;
+				};
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.43.0


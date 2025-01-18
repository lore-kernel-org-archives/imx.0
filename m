Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3A21B041C
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204080; cv=none; b=p/M7hlZvAk8on4c+WINvNc/ivTH+T7/LLcDkt5SFDZcaeCysYr4YX+MuWweafQZwXtCIgRecbd+TpsWFuBEx8IOpWASmDw20/qRoLi+fPsQr224xhDSn0eRt6lFQy43ZjlxvUIhb99WEX78s4bCjeaNJ0+7+2OGMExJ1tzZNGw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204080; c=relaxed/simple;
	bh=PC1buv5hYG2W3S8/eU+2VA2jywMzm7Vv3xQppQcKsGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tHLuEG3GiElXDL2LsJTKmbZKm7Q29R5oWCs5MCtFCmXx490FoiUYH9V6O8Zj1ZGa3j+8hpzoEwYaD3u163kkfPQTrTPuBomETL0oWB7CYfbC4dGMtDVFDgP0q3QIJPuetX9gx3JpBkt9+FGyMmvkIY/+z9N0zleD9+yyTn3g8n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=gHAzilEe; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gHAzilEe"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso5832609a12.0
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204077; x=1737808877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KTPitaOd10kqEMh4mWJPB1Bs0wTX2XDIfABV6gUcV0=;
        b=gHAzilEey7PQqYbrx0ea6qXiB/UFdJO7O41er3VWsuxid403sGW7NxZh5jHL6mZtWK
         rTiXop6Gjs/EkuasdcrhFfScy/p01uFF9nxmgOGlrQnQvp9iS+i7HSMb+9Rp0Qitk5Z6
         dAp9FTflc/lN98Q6OsfjiYyIRjSufx8dyYDRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204077; x=1737808877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KTPitaOd10kqEMh4mWJPB1Bs0wTX2XDIfABV6gUcV0=;
        b=PeC8HwKquMdkhu+UEdxTLgifLWn9isL3qcUA+t/Ug5d2yF2UNeQCvBSY04+ag2QYSd
         /iuA7bmdqOeGu3HZ/kj/yenKxSxbzJYCWfQ+u71l/CcBt7AjEsgW5QwYX8fa7g8sdQqa
         bH/OGlYYmsrEiL0CSOpiv8KEmJ8MptzOgZ4vbpPuhiy6xzd3j2v3RwHfAYkVZu64q+kb
         QmlC05WIXD7Nt++gGFMNFFE0d+N1VqPVxOH5gycRiMlaIQydKpaU2Oavu5p0bQ0ELrzY
         +mLL37e/OCI0z8GXMw02D5oPKCIKooAT09ns56LGhhMXIba1nK+N0H6678VBSnDSjC+B
         3tlA==
X-Forwarded-Encrypted: i=1; AJvYcCVf6+4IPzbpJcWCekDL1xz/+51LgA+Rbm6JByqjyQARUKpfOhGK7P1ovimh3x0ah8hzE2s=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr29CKA1zAHig8fpLFpk5jNOlZEqw6ODJ4yDEthUqnMKb2a/Ps
	a2ikmSyKFZaNYzVzWvR3vR1WAHiWD2scFQQyExVgiW0wugyve0qZZhufB42SmdU=
X-Gm-Gg: ASbGncsPNM7738Xr7nq9mGS6jpIAEzlPYcGqa0bnaQu84tCwf/VyFO6/UQ05gnBhEcJ
	sVSrWifpeSl9iNb4iDglmXS43wWxBhmWu0UHnMrAf1dVo//vqgdDvF4P6lQYdMwzs5Jvko6fqq5
	SA9K49Hb19283hlOotu5uNTF5YNjCejfAyk9HOZUwu4+NnH1rYR9slgQdjXgqrolXrmpVElkXEw
	xq0ORKDf1IH9uQpNqWbSqnjU3viWVIHgFJEYqZaHTVjbinx2HBni+0IoCLBifKNBcSKD6toVPUm
	4ou6tldXFM7PazyINzLMOejJn1QJTvgxCJpwCQclkE5Kmw8rtxV79x+S1jgdbp8Bps1/+POZvl1
	PKO8ofXxUblupDdqB4+oEozV3qByh+LfB62/O
X-Google-Smtp-Source: AGHT+IGvRuBDTrgB3PprQD6w2u9+mzwWfpkPjZcj1dwHV6lzx8agn+y3iE8FE3Y65FW5ji3NNLG1Xw==
X-Received: by 2002:a17:907:3da4:b0:aa6:7933:8b31 with SMTP id a640c23a62f3a-ab38b3707bdmr608638566b.46.1737204077049;
        Sat, 18 Jan 2025 04:41:17 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 15/23] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Sat, 18 Jan 2025 13:39:58 +0100
Message-ID: <20250118124044.157308-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 0b928e173f29..eab05170442d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -751,9 +751,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MP_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MP_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
 						  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0


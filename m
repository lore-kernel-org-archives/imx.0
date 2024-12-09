Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F621990AE
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 20:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733776856; cv=none; b=oTlpJ2pdcheVy9tcIevzgeijg+p5YK+ws0TOcm5+8j0/CrIOvNyB1rYCke7mL+Zo8cdGWfhSINtB2cHCVC+X/21b0OfX/IoioVOgsdsyloqK/rSyFz2pGjlQRYr4yE+Vl0GINVb2Hxq07ygw2fiIPu2gIjA6+EjlzhMYMoIvgfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733776856; c=relaxed/simple;
	bh=4X0/FJeZRsS29fIel6f0Xm9+siRALH2A7R3wSkvdgQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QRaC5qNnRXvfAPjZgPELVCiP64IcEBUlSVg8p2GCRckuSCA4Pna6YOZgSiVxoToI0b7VQnUecHPvSLqO/NT/omdmGHYhC9SXRz2VJMfYibB1Q03By7TIaIKX735XOkLdAe3cywK/WlfmFWKMORSzW5bAK5xoBHGYDeaKJzEVU/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6UaR/7o; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6UaR/7o"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so3366255a12.0
        for <imx@lists.linux.dev>; Mon, 09 Dec 2024 12:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733776855; x=1734381655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFk/8lTOXAJBBD0iMswUxwnGCPazYsTsiH7Y9OBU+PA=;
        b=R6UaR/7oPd6RE+QWJhaO+6AnoP6BpXtIAr5xzciZgOibJjkKc/eqTbhiQweHQ3lSWI
         6ZuwNskKsCuCSMCOB1L2aExIpB3uruyBat4+/HVRXDsppVEx3ZcYMs1G4t09H2WPwltz
         icp0F4DcsC+bwJycUnl26VuTTFPqg8d8BZ57rrFLk2F2ucVcFPP/gOP29+G6o3Ex04MR
         o6cRJQMbtrBjWZ7bTbsq2sN6lrLyhahZhDE+PfNi5kxAnuHmCdDTGNJbD7MPHQCaqva1
         7lzkvzG9afpLGz0MlwQsmTqsTXvRRm4s0TJLjPNlDq9xZSioBKEn++J69SrBYfgYMIdN
         CoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733776855; x=1734381655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFk/8lTOXAJBBD0iMswUxwnGCPazYsTsiH7Y9OBU+PA=;
        b=rgqOKceuIiZ18lzNDQO8eo1dX1vSS3DkaPrriAfJb7EXLOLBGta0wxqx6Q9jXJjk35
         t0AY0BQvq7mP9MxsXqjT/i4amDVtY1G/XsA5QO/dnVV5zFsEy00Ck/KKHBxBE8/KSUp0
         65vvlv9iQ8fND7uF7ODrNe7LQ06zrq9EPJXRVkOODMBiNLKqjp4zYE3orVySPOg8U75s
         153PLfJ5lu626jPB5f72p7VTm1gqwx9AeSulGs2Q80X4O/CK+UdUY1a/1w3RnInbUKsZ
         nDguAXn1PVnLuQMLA9KGCGp774QrtoLjViAPwZg0cJn0C6TBaC5xi65PhHCF0f7IpKrX
         xoJg==
X-Forwarded-Encrypted: i=1; AJvYcCVgiNMvClU1C7CSlvUX7/QR8ikzGjpSJILr2swnuSfV6vLqjT55CygUa3lVGKH3Ow61moM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkQVCaSEECA28L7uvadQFgBCVc9T752hGVPzF8OUnD/gNw+TVE
	Ylen15Xyjt3WoxLpkyFm6ZTc32IQCHdLk+5UXTogETCKiDUx4EAG
X-Gm-Gg: ASbGnctEhBxYceB4s7JpLtjiHZhDLYWSdSfYVkzWeZ3JP9XHhBxDEtnOTj0OWj2xvIE
	6bXYuOqHwIxBB3vml6Hm7DXA8Umyi4hO4yhelkiY2iPPekIgJMs5hgWOYTP71NgSATJ9rtrwK/C
	Lvjm13+ztfLuotiUhN6dlYuQgTDNz70/MBHvHcxpejKInKDZbxk6jKp8OcgbsR2WnTzIKIkKPXD
	HLC/iM/4UkEtn7fDuZUataRXCiJSCNexdKGgCGBOfMP6M5aH9txWkqtMOCUGf4=
X-Google-Smtp-Source: AGHT+IGkseJIUwCnXZApvQxM0FacDoY5qnz7kx/Zk4ZEw+I0M4KgH3VzNxAAY/RYu9/pFD3vDsUdGg==
X-Received: by 2002:a17:90b:1f85:b0:2ee:b6c5:1def with SMTP id 98e67ed59e1d1-2efcf10d3fdmr2974170a91.8.1733776854833;
        Mon, 09 Dec 2024 12:40:54 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d7c4:c4a9:e35:ccbf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd5207528csm1707219a12.36.2024.12.09.12.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 12:40:54 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] arm64: dts: imx8mm-phg: Add LVDS compatible string
Date: Mon,  9 Dec 2024 17:40:03 -0300
Message-Id: <20241209204003.1295503-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209204003.1295503-1-festevam@gmail.com>
References: <20241209204003.1295503-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The imx8mm-phg board has an AUO G084SN05 V9 8.4" 800x600 LVDS panel.

Improve the devicetree description by passing the LVDS compatible
string to fix the following dt-schema warning:

imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of
['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05',
'chunghwa,claa070wp03xg','edt,etml0700z9ndha', 'hannstar,hsd101pww2',
'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
...

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-phg.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
index 75bbedc6164c..a134b1833649 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
@@ -82,7 +82,7 @@ reg_usdhc2_vmmc: regulator-vmmc {
 	};
 
 	panel {
-		compatible = "panel-lvds";
+		compatible = "auo,g084sn05", "panel-lvds";
 		width-mm = <170>;
 		height-mm = <28>;
 		data-mapping = "jeida-18";
-- 
2.34.1

